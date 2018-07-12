package com.spring.resume;

public class LicenseVO {
	
	// s_license 테이블
	private String userId;  	   // 유저아이디
	private int licenseNum;        // 자격증번호
	private String licenseName;    // 자격증명
	private String licensePublish; // 발행처
	private String licenseDate;    // 취득년월

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	@Override
	public String toString() {
		return "LicenseVO [userId=" + userId + ", licenseNum=" + licenseNum + ", licenseName=" + licenseName
				+ ", licensePublish=" + licensePublish + ", licenseDate=" + licenseDate + "]";
	}
	
}
