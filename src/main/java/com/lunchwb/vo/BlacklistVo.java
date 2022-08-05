package com.lunchwb.vo;

public class BlacklistVo {
	
	//////////////////// blacklist table ////////////////////
	private int blackNo;
	private int storeNo;
	private int groupNo;
	private String regDate;
	
	
	//생성자
	public BlacklistVo() {
		
	};
	
	public BlacklistVo(int blackNo, int storeNo, int groupNo, String regDate) {
		this.blackNo = blackNo;
		this.storeNo = storeNo;
		this.groupNo = groupNo;
		this.regDate = regDate;
	}
	

	//메소드 - gs
	public int getBlackNo() {
		return blackNo;
	}

	public void setBlackNo(int blackNo) {
		this.blackNo = blackNo;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "BlacklistVo [blackNo=" + blackNo + ", storeNo=" + storeNo + ", groupNo=" + groupNo + ", regDate="
				+ regDate + "]";
	};
	
	
	
	

}
