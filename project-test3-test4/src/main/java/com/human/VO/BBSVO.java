package com.human.VO;

public class BBSVO {
	/*
	 * create table bbs(
no number primary key,
title varchar2(100),
id varchar2(20),
pass varchar2(8),
memo varchar2(1000),
day TIMESTAMP default sysdate,
cnt number default 0,
flag number);

create SEQUENCE bbs_seq;
	 */
	private int no = 0;   //글번호  : 기본키
	private String title=null;
	private String id=null;     
	private String pass=null;
	private String memo=null;
	//추가
	private String day=null;   // 게시 날짜
	private int cnt=0;         //  조회
	// 여기까지 
	private int flag=0;
	
	public void prt() {  // 확인용
		System.out.println("title : "+title);
		System.out.println("id : "+id);
		System.out.println("pass : "+pass);
		System.out.println("memo : "+memo);
		System.out.println("flag : "+flag);
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	
	
}
