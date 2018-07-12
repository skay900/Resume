package com.spring.resume;

public class EducationVO {
	
	// s_education 테이블
	private String userId;   	  // 유저아이디
	private int eduNum;           // 학력번호
	private String schoolGrade;   // 학력선택
	private String schoolName;    // 학교이름
	private String major;         // 전공
	private String score;         // 학점
	private String totalScore;    // 총점
	private String eduInDate;     // 입학년월
	private String eduOutDate;    // 졸업년월
	private String graduDivision; // 졸업구분

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	@Override
	public String toString() {
		return "EducationVO [eduNum=" + eduNum + ", schoolGrade=" + schoolGrade + ", schoolName=" + schoolName
				+ ", major=" + major + ", score=" + score + ", totalScore=" + totalScore + ", eduInDate=" + eduInDate
				+ ", eduOutDate=" + eduOutDate + ", graduDivision=" + graduDivision + "]";
	}
	
}
