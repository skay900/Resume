package com.spring.resume;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.member.SessionInfo;
import com.spring.member.Member;
import com.spring.resume.util.MyUtil;

@Controller
public class ResumeController {
	
	@Autowired
	private ResumeService service;
	
	@Autowired
	private MyUtil util;
	
	Logger logger = LoggerFactory.getLogger(ResumeController.class);
	
	// 메인
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(
			
			) {
		
		return "/resume_main";
	}
	
	// 등록
	@RequestMapping(value = "/resume_myResume", method = RequestMethod.GET)
	public ModelAndView createForm(
			Resume dto,
			HttpSession session
			) {
		
		// 세션 정보
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		// 각 항목의 등록된 데이터 불러오기
		dto = service.readResume(userId);
		List<Resume> list = service.listdetail1();
		List<EducationVO> eduVO = service.readEducation(userId);
		List<CareerVO> careerVO = service.readCareer(userId);
		List<LicenseVO> licenVO = service.readLicense(userId);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("dto", dto);
		mv.addObject("eduVO", eduVO);
		mv.addObject("careerVO", careerVO);
		mv.addObject("licenVO", licenVO);
		
		mv.setViewName("/resume_myResume");

		return mv;
	}
	
	@RequestMapping(value = "/resume_myResume/do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createSubmit(
			Resume dto,
			Member user,
			HttpSession session
			) {
		
		// 파일 저장 경로
		String pathname = session.getServletContext().getRealPath("uploads");
		
		// 세션 정보
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		user.setUserId(info.getUserId());

		// dto의 각 List<VO>가 Null이 아닐 경우 유저아이디 가져와서 List<> 크기만큼 각 VO 클래스에 넣어주고 각 항목 데이터 등록
		if(dto.getEducationVO() != null) {
			List<EducationVO> eduList = dto.getEducationVO();
			for(EducationVO eduTemp : eduList) {
				eduTemp.setUserId(info.getUserId());
			}
		}
		
		if(dto.getCareerVO() != null) {
			List<CareerVO> careerList = dto.getCareerVO();
			for(CareerVO careerTemp : careerList) {
				careerTemp.setUserId(info.getUserId());
			}
		}
		
		if(dto.getLicenseVO() != null) {
			List<LicenseVO> licenseList = dto.getLicenseVO();
			for(LicenseVO licenseTemp : licenseList) { 
				licenseTemp.setUserId(info.getUserId());
			}
		}
		
		Map<String, Object> model = new HashMap<>();
		try {
			// 이전 데이터 삭제 및 등록
			service.insertResume(dto, pathname);
			model.put("state", true);
		} catch (Exception e) {
			e.printStackTrace();
			model.put("state", false);
		}
		return model;
	}
	
	// 중분류값 Ajax
	@RequestMapping(value = "/resume_myResume", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> detailAjax(
			String detail1Code
			) {
		
		// 대분류 값에 맞는 중분류 값 불러오기
		List<Resume> list = service.listdetail2(detail1Code);
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		return model;
	}
	
	// 이력서 보기
	@RequestMapping(value = "/resume_article", method = RequestMethod.GET)
	public String resumeArticle(
			@RequestParam(value="resumeNum") int resumeNum,
			HttpServletRequest req,
			Model model
			) {
		
		// 각 항목 데이터 불러오기
		Resume dtoUser = service.detailUser(resumeNum);
		Resume dtoProfile = service.detailProfile(resumeNum);
		Resume dtoHope = service.detailHope(resumeNum);
		List<EducationVO> eduVO = service.detailEducation(resumeNum);
		List<CareerVO> careerVO = service.detailCareer(resumeNum);
		List<LicenseVO> licenVO = service.detailLicense(resumeNum);
		
		// 해당 이력서의 필수 항목의 데이터가 없을 경우 리스트로
		if(dtoUser==null || dtoProfile==null || dtoHope==null) 
			return "redirect:/resume_list?";
		
		model.addAttribute("dtoUser", dtoUser);
		model.addAttribute("dtoProfile", dtoProfile);
		model.addAttribute("dtoHope", dtoHope);
		model.addAttribute("eduVO", eduVO);
		model.addAttribute("careerVO", careerVO);
		model.addAttribute("licenVO", licenVO);
		
		return "/resume_article";
	}
	
	// 이력서 리스트
	@RequestMapping(value = "/resume_list")
	public String resumeList(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) {

		int rows = 10;  // 한 화면에 보여주는 게시물 수
		int total_page = 0; // 전체 페이지 수
		int dataCount = 0; // 전체 이력서 개수

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);

        // 검색 결과 개수 
        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = util.pageCount(rows, dataCount) ;

        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화된 경우
        if(total_page < current_page) 
            current_page = total_page;

        // 리스트에 출력할 데이터를 가져오기
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);

        // 리스트 불러오기
        List<Resume> list = service.listResume(map);

        // 리스트의 번호
        int listNum, n = 0;
        Iterator<Resume> it=list.iterator();
        while(it.hasNext()) {
        	Resume data = it.next();
            listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            n++;
        }
        
        // 한 화면 게시물 개수, 현재 페이지의 쿼리 생성
        String articleUrl;
        String cp = req.getContextPath();
        articleUrl = cp + "/resume_article?" + "rows=" + rows + "&page=" + current_page;
        
        // 페이징 불러오기
        String paging = util.paging(current_page, total_page);

        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("total_page", total_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("paging", paging);
        model.addAttribute("articleUrl", articleUrl);
        
		
        return "/resume_list";
	}
	
	// 이력서 리스트 페이징, 검색 AJAX
	@RequestMapping(value = "/resume_listAjax", method=RequestMethod.POST)
	public String resumeListAjax(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) {

		int rows = 10;  // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;

        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);

        // 전체 이력서 개수 계산하여 전체 페이지 수 구하기
        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = util.pageCount(rows, dataCount) ;

        // 리스트에 출력할 데이터
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);
    	
        // 리스트 불러오기
        List<Resume> list = service.listResume(map);
        
        // 한 화면 게시물 개수, 현재 페이지의 쿼리
        String articleUrl;
        String cp = req.getContextPath();
        articleUrl = cp + "/resume_article?" + "rows=" + rows + "&page=" + current_page;
        
        // 페이징 불러오기
        String paging = util.paging(current_page, total_page);

        model.addAttribute("list", list);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("paging", paging);
        model.addAttribute("articleUrl", articleUrl);
        
		
        return "/Ajax/resume_Ajax";
	}

}
