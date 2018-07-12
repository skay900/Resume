package com.spring.resume;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Resume {
	
	// s_user 테이블
	private String userId;   // 유저아이디
	private String password; // 비밀번호
	private String userName; // 유저이름
	private int authority;   // 권한 (구인자 :0, 구직자 : 1, 관리자 : 2)
	private String birth;    // 생년월일
	private String gender;   // 성별
	private String email;    // 이메일
	private String phone;    // 전화번호
	private String address;  // 주소
	
	// s_profile 테이블
	private int listNum;			 // 리스트 번호
	private int resumeNum;           // 이력서번호
	private String subject;          // 제목
	private String saveFilename;     // 저장파일이름
	private String originalFilename; // 원본파일이름
	private String createDate;       // 등록일
	
	private List<EducationVO> educationVO;
	// s_education 테이블
	private int eduNum;           // 학력번호
	private String schoolGrade;   // 학력선택
	private String schoolName;    // 학교이름
	private String major;         // 전공
	private String score;         // 학점
	private String totalScore;    // 총점
	private String eduInDate;     // 입학년월
	private String eduOutDate;    // 졸업년월
	private String graduDivision; // 졸업구분
	
	private List<CareerVO> careerVO;
	// s_career 테이블
	private int careerNum;        // 경력번호
	private String compName;      // 회사명
	private String deptName;      // 부서명
	private String rank;          // 직급직책
	private String duty;          // 직무
	private String careerInDate;  // 입사년월
	private String careerOutDate; // 퇴사년월
	private String salary;        // 연봉
	
	private List<LicenseVO> licenseVO;
	// s_license 테이블
	private int licenseNum;        // 자격증번호
	private String licenseName;    // 자격증명
	private String licensePublish; // 발행처
	private String licenseDate;    // 취득년월

	// s_hope 테이블
	private String gestalt;    // 고용형태
	private String place;      // 희망근무지
	private String wantSalary; // 희망연봉
	private String detail1;    // 직무
	private String detail2;    // 직무상세
	
	// s_category 테이블
	private String detail1Code; // 직무코드
	private String detail1Name; // 직무명
	private String detail2Code; // 직무상세코드
	private String detail2Name; // 직무상세명
	
	// uploadFile
	private MultipartFile upload;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public List<CareerVO> getCareerVO() {
		return careerVO;
	}
	public void setCareerVO(List<CareerVO> careerVO) {
		this.careerVO = careerVO;
	}
	public List<LicenseVO> getLicenseVO() {
		return licenseVO;
	}
	public void setLicenseVO(List<LicenseVO> licenseVO) {
		this.licenseVO = licenseVO;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public List<EducationVO> getEducationVO() {
		return educationVO;
	}
	public void setEducationVO(List<EducationVO> educationVO) {
		this.educationVO = educationVO;
	}
	public int getEduNum() {
		return eduNum;
	}
	public void setEduNum(int eduNum) {
		this.eduNum = eduNum;
	}
	public String getSchoolGrade() {
		return schoolGrade;
	}
	public void setSchoolGrade(String schoolGrade) {
		this.schoolGrade = schoolGrade;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	public String getEduInDate() {
		return eduInDate;
	}
	public void setEduInDate(String eduInDate) {
		this.eduInDate = eduInDate;
	}
	public String getEduOutDate() {
		return eduOutDate;
	}
	public void setEduOutDate(String eduOutDate) {
		this.eduOutDate = eduOutDate;
	}
	public String getGraduDivision() {
		return graduDivision;
	}
	public void setGraduDivision(String graduDivision) {
		this.graduDivision = graduDivision;
	}
	public int getCareerNum() {
		return careerNum;
	}
	public void setCareerNum(int careerNum) {
		this.careerNum = careerNum;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public String getCareerInDate() {
		return careerInDate;
	}
	public void setCareerInDate(String careerInDate) {
		this.careerInDate = careerInDate;
	}
	public String getCareerOutDate() {
		return careerOutDate;
	}
	public void setCareerOutDate(String careerOutDate) {
		this.careerOutDate = careerOutDate;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public int getLicenseNum() {
		return licenseNum;
	}
	public void setLicenseNum(int licenseNum) {
		this.licenseNum = licenseNum;
	}
	public String getLicenseName() {
		return licenseName;
	}
	public void setLicenseName(String licenseName) {
		this.licenseName = licenseName;
	}
	public String getLicensePublish() {
		return licensePublish;
	}
	public void setLicensePublish(String licensePublish) {
		this.licensePublish = licensePublish;
	}
	public String getLicenseDate() {
		return licenseDate;
	}
	public void setLicenseDate(String licenseDate) {
		this.licenseDate = licenseDate;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public int getResumeNum() {
		return resumeNum;
	}
	public void setResumeNum(int resumeNum) {
		this.resumeNum = resumeNum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getGestalt() {
		return gestalt;
	}
	public void setGestalt(String gestalt) {
		this.gestalt = gestalt;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getWantSalary() {
		return wantSalary;
	}
	public void setWantSalary(String wantSalary) {
		this.wantSalary = wantSalary;
	}
	public String getDetail1() {
		return detail1;
	}
	public void setDetail1(String detail1) {
		this.detail1 = detail1;
	}
	public String getDetail2() {
		return detail2;
	}
	public void setDetail2(String detail2) {
		this.detail2 = detail2;
	}
	public String getDetail1Code() {
		return detail1Code;
	}
	public void setDetail1Code(String detail1Code) {
		this.detail1Code = detail1Code;
	}
	public String getDetail1Name() {
		return detail1Name;
	}
	public void setDetail1Name(String detail1Name) {
		this.detail1Name = detail1Name;
	}
	public String getDetail2Code() {
		return detail2Code;
	}
	public void setDetail2Code(String detail2Code) {
		this.detail2Code = detail2Code;
	}
	public String getDetail2Name() {
		return detail2Name;
	}
	public void setDetail2Name(String detail2Name) {
		this.detail2Name = detail2Name;
	}
	@Override
	public String toString() {
		return "Resume [userId=" + userId + ", password=" + password + ", userName=" + userName + ", authority="
				+ authority + ", birth=" + birth + ", gender=" + gender + ", email=" + email + ", phone=" + phone
				+ ", address=" + address + ", listNum=" + listNum + ", resumeNum=" + resumeNum + ", subject=" + subject
				+ ", saveFilename=" + saveFilename + ", originalFilename=" + originalFilename + ", createDate="
				+ createDate + ", educationVO=" + educationVO + ", eduNum=" + eduNum + ", schoolGrade=" + schoolGrade
				+ ", schoolName=" + schoolName + ", major=" + major + ", score=" + score + ", totalScore=" + totalScore
				+ ", eduInDate=" + eduInDate + ", eduOutDate=" + eduOutDate + ", graduDivision=" + graduDivision
				+ ", careerVO=" + careerVO + ", careerNum=" + careerNum + ", compName=" + compName + ", deptName="
				+ deptName + ", rank=" + rank + ", duty=" + duty + ", careerInDate=" + careerInDate + ", careerOutDate="
				+ careerOutDate + ", salary=" + salary + ", licenseVO=" + licenseVO + ", licenseNum=" + licenseNum
				+ ", licenseName=" + licenseName + ", licensePublish=" + licensePublish + ", licenseDate=" + licenseDate
				+ ", gestalt=" + gestalt + ", place=" + place + ", wantSalary=" + wantSalary + ", detail1=" + detail1
				+ ", detail2=" + detail2 + ", detail1Code=" + detail1Code + ", detail1Name=" + detail1Name
				+ ", detail2Code=" + detail2Code + ", detail2Name=" + detail2Name + ", upload=" + upload + "]";
	}
	
}
