package com.root.idme.dto;

import java.sql.Timestamp;

public class Members {
	public int mNo;
	public String mNickname;
	public String mBday;
	public String mId;
	public String mPwd;
	public String mName;
	public String mEmail;
	public String mPhone;
	public String mAddress;
	public Timestamp mEnrollDate;
	public String mType;
	public String errMsg;

	public Members() {}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmNickname() {
		return mNickname;
	}

	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}

	public String getmBday() {
		return mBday;
	}

	public void setmBday(String mBday) {
		this.mBday = mBday;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmAddress() {
		return mAddress;
	}

	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}

	public Timestamp getmEnrollDate() {
		return mEnrollDate;
	}

	public void setmEnrollDate(Timestamp mEnrollDate) {
		this.mEnrollDate = mEnrollDate;
	}

	public String getmType() {
		return mType;
	}

	public void setmType(String mType) {
		this.mType = mType;
	}
	
	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	
}
