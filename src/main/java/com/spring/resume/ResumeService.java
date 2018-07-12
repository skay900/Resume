package com.spring.resume;

import java.util.List;
import java.util.Map;

public interface ResumeService {
	
	// 이력서 등록
	public void insertResume(Resume dto, String pathname) throws Exception;
	
	// 공통코드(대분류) 가져오기
	public List<Resume> listdetail1();
	
	// 공통코드(중분류) 가져오기
	public List<Resume> listdetail2(String detail1Code);

	// 나의 이력서 불러오기
	public Resume readResume(String userId);
	public List<EducationVO> readEducation(String userId);
	public List<CareerVO> readCareer(String userId);
	public List<LicenseVO> readLicense(String userId);
	
	// 전체 이력서 개수
	public int dataCount(Map<String, Object> map);
	
	// 리스트
	public List<Resume> listResume(Map<String, Object> map);
	
	// 이력서 상세보기
	public Resume detailUser(int resumeNum);
	public Resume detailProfile(int resumeNum);
	public Resume detailHope(int resumeNum);
	public List<EducationVO> detailEducation(int resumeNum);
	public List<CareerVO> detailCareer(int resumeNum);
	public List<LicenseVO> detailLicense(int resumeNum);

	
}
