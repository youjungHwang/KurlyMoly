package com.kurly.member;

public class MemberDTO {
	private int mIdx; // 회원번호
	private String mUserid; // 회원ID	
	private String mPassword; // 비밀번호
	private String mName; // 이름	
	private String mTel; // 전화번호
	private String mEmail; // 이메일
	private String mBirth; // 생년월일
	private String mGender; // 성별
	private String mZipcode; // 우편번호
	private String mAddress1; // 주소	
	private String mAddress2; // 상세주소
	private String mRecomid; // 추천인ID
	private String mRegdate; // 회원가입일시
	private String mMembership; // 멤버십등급
	private String mKurlypass; // 컬리패스여부(가입/비가입)
	private int mState = 1; // 회원상태 (1: 일반, 2: 탈퇴, 9: 관리자)
	private String mWithdrawwhy; // 불편사항선택
	private String mWithdrawwhy2; // 불편사항기타내용
	private String mWithdrawdate; // 탈퇴일시
	
	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	public String getmUserid() {
		return mUserid;
	}
	public void setmUserid(String mUserid) {
		this.mUserid = mUserid;
	}
	public String getmPassword() {
		return mPassword;
	}
	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmTel() {
		return mTel;
	}
	public void setmTel(String mTel) {
		this.mTel = mTel;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmBirth() {
		return mBirth;
	}
	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}
	public String getmGender() {
		return mGender;
	}
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	public String getmZipcode() {
		return mZipcode;
	}
	public void setmZipcode(String mZipcode) {
		this.mZipcode = mZipcode;
	}
	public String getmAddress1() {
		return mAddress1;
	}
	public void setmAddress1(String mAddress1) {
		this.mAddress1 = mAddress1;
	}
	public String getmAddress2() {
		return mAddress2;
	}
	public void setmAddress2(String mAddress2) {
		this.mAddress2 = mAddress2;
	}
	public String getmRecomid() {
		return mRecomid;
	}
	public void setmRecomid(String mRecomid) {
		this.mRecomid = mRecomid;
	}
	public String getmRegdate() {
		return mRegdate;
	}
	public void setmRegdate(String mRegdate) {
		this.mRegdate = mRegdate;
	}
	public String getmMembership() {
		return mMembership;
	}
	public void setmMembership(String mMembership) {
		this.mMembership = mMembership;
	}
	public String getmKurlypass() {
		return mKurlypass;
	}
	public void setmKurlypass(String mKurlypass) {
		this.mKurlypass = mKurlypass;
	}
	public int getmState() {
		return mState;
	}
	public void setmState(int mState) {
		this.mState = mState;
	}
	public String getmWithdrawwhy() {
		return mWithdrawwhy;
	}
	public void setmWithdrawwhy(String mWithdrawwhy) {
		this.mWithdrawwhy = mWithdrawwhy;
	}
	public String getmWithdrawwhy2() {
		return mWithdrawwhy2;
	}
	public void setmWithdrawwhy2(String mWithdrawwhy2) {
		this.mWithdrawwhy2 = mWithdrawwhy2;
	}
	public String getmWithdrawdate() {
		return mWithdrawdate;
	}
	public void setmWithdrawdate(String mWithdrawdate) {
		this.mWithdrawdate = mWithdrawdate;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [mIdx=" + mIdx + ", mUserid=" + mUserid + ", mPassword=" + mPassword + ", mName=" + mName
				+ ", mTel=" + mTel + ", mEmail=" + mEmail + ", mBirth=" + mBirth + ", mGender=" + mGender
				+ ", mZipcode=" + mZipcode + ", mAddress1=" + mAddress1 + ", mAddress2=" + mAddress2 + ", mRecomid="
				+ mRecomid + ", mRegdate=" + mRegdate + ", mMembership=" + mMembership + ", mKurlypass=" + mKurlypass
				+ ", mState=" + mState + ", mWithdrawwhy=" + mWithdrawwhy + ", mWithdrawwhy2=" + mWithdrawwhy2
				+ ", mWithdrawdate=" + mWithdrawdate + "]";
	}
}
