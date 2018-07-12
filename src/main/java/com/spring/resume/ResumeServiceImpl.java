package com.spring.resume;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.resume.dao.CommonDAO;
import com.spring.resume.util.FileManager;

@Service
public class ResumeServiceImpl implements ResumeService {
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
/****************************************************************************/
/**이력서 등록**/
/****************************************************************************/
	// 이력서 등록
	@Override
	// throw 로 Exception 을 던질 때 메서드에 throws Exception 을 선언해 줘야 한다.
	// Exception, ArithmeticException, SQLException 등
	public void insertResume(Resume dto, String pathname) throws Exception {
		
		try{
			// 이전 데이터 삭제
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				// 이전 파일 지우기
				if(!StringUtils.isEmpty(dto.getSaveFilename()) && dto.getUpload() != null) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			dao.deleteData("resume.deleteProfile", dto);
			dao.deleteData("resume.deleteHope", dto);
			dao.deleteData("resume.deleteEducation", dto);
			dao.deleteData("resume.deleteCareer", dto);
			dao.deleteData("resume.deleteLicense", dto);
			
			// 데이터 등록
			// 파일매니저
			if(dto.getUpload() != null && !dto.getUpload().isEmpty()) { // 업로드 파일이 null 이 아니면
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname); // upload 된 파일 이름과 경로를 saveFilename에 저장
				dto.setSaveFilename(saveFilename); // dto에 저장
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename()); // upload 된 파일 이름을 originalFilename 을 저장
			}
			dao.insertData("resume.insertProfile", dto);
			dao.insertData("resume.insertHope", dto);
			
			// 각 항목 있을 경우 받아 온 데이터 사이즈 만큼 각 VO에 넣어주기
			if(dto.getEducationVO() != null) {
			List<EducationVO> eduList = dto.getEducationVO();
				int size = eduList.size();
				for (int i = 0; i < size; i++) {
					EducationVO eduVO = eduList.get(i);
					dao.insertData("resume.insertEducation", eduVO);
				}
			}
			
			if(dto.getCareerVO() != null) {
			List<CareerVO> careerList = dto.getCareerVO();
				int size1 = careerList.size();
				for(int i = 0; i < size1; i++) {
					CareerVO careerVO = careerList.get(i);
					dao.insertData("resume.insertCareer", careerVO);
				}
			}
			
			if(dto.getLicenseVO() != null) {
			List<LicenseVO> LicenseList = dto.getLicenseVO();
				int size2 = LicenseList.size();
				for(int i = 0; i < size2 ; i++) {
					LicenseVO licenseVO = LicenseList.get(i);
					dao.insertData("resume.insertLicense", licenseVO);
				}
			}
		} catch (Exception e) {
			e.printStackTrace(); 
			throw e; // 이 메서드를 호출한 컨트롤러에 Exception 을 던져 준다.
		}
	}

/****************************************************************************/


	
/****************************************************************************/
/**나의 이력서 불러오기**/
/****************************************************************************/
	// 유저정보, 프로파일, 희망근무조건
	@Override
	public Resume readResume(String userId) {
		Resume dto = null;
		
		try {
			dto = dao.selectOne("resume.readResume", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	// 학력
	@Override
	public List<EducationVO> readEducation(String userId) {
		List<EducationVO> list = null;
		
		try {
			list = dao.selectList("resume.readEducation", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 경력
	@Override
	public List<CareerVO> readCareer(String userId) {
		List<CareerVO> list = null;
		
		try {
			list = dao.selectList("resume.readCareer", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 자격증
	@Override
	public List<LicenseVO> readLicense(String userId) {
		List<LicenseVO> list = null;
		
		try {
			list = dao.selectList("resume.readLicense", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 공통코드(대분류) 가져오기
	@Override
	public List<Resume> listdetail1() {
		List<Resume> list = null;
		
		try {
			list = dao.selectList("resume.detail1List");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 공통코드(중분류) 가져오기
	@Override
	public List<Resume> listdetail2(String detail1Code) {
		List<Resume> list = null;
		
		try {
			list = dao.selectList("resume.detail2List", detail1Code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
/****************************************************************************/
	
	
/****************************************************************************/
/**이력서 리스트**/
/****************************************************************************/
	// 전체 이력서 리스트 불러오기
	@Override
	public List<Resume> listResume(Map<String, Object> map) {
		List<Resume> list = null;
		
		try {
			list = dao.selectList("resume.listResume", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 전체 이력서 개수
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try{
			result=dao.selectOne("resume.dataCount", map);			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
/****************************************************************************/
	
	
	
/****************************************************************************/
/**이력서 상세보기**/
/****************************************************************************/	
	// 유저정보
	@Override
	public Resume detailUser(int resumeNum) {
		Resume dto = null;
		
		try {
			dto = dao.selectOne("resume.detailUser", resumeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	// 프로파일
	@Override
	public Resume detailProfile(int resumeNum) {
		Resume dto = null;
		
		try {
			dto = dao.selectOne("resume.detailProfile", resumeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	// 희망근무조건
	@Override
	public Resume detailHope(int resumeNum) {
		Resume dto = null;
		
		try {
			dto = dao.selectOne("resume.detailHope", resumeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	// 학력
	@Override
	public List<EducationVO> detailEducation(int resumeNum) {
		List<EducationVO> list = null;
		
		try {
			list = dao.selectList("resume.detailEducation", resumeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 경력
	@Override
	public List<CareerVO> detailCareer(int resumeNum) {
		List<CareerVO> list = null;
		
		try {
			list = dao.selectList("resume.detailCareer", resumeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 자격증
	@Override
	public List<LicenseVO> detailLicense(int resumeNum) {
		List<LicenseVO> list = null;
		
		try {
			list = dao.selectList("resume.detailLicense", resumeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
/****************************************************************************/

	
}
