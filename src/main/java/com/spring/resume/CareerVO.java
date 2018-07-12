package com.spring.resume;

public class CareerVO {
	
	// s_career 테이블
	private String userId;   	  // 유저아이디
	private int careerNum;        // 경력번호
	private String compName;      // 회사명
	private String deptName;      // 부서명
	private String rank;          // 직급직책
	private String duty;          // 직무
	private String careerInDate;  // 입사년월
	private String careerOutDate; // 퇴사년월
	private String salary;        // 연봉

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	@Override
	public String toString() {
		return "CareerVO [careerNum=" + careerNum + ", compName=" + compName + ", deptName=" + deptName + ", rank="
				+ rank + ", duty=" + duty + ", careerInDate=" + careerInDate + ", careerOutDate=" + careerOutDate
				+ ", salary=" + salary + "]";
	}
	
}
