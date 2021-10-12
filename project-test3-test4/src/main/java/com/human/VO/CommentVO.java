package com.human.VO;

public class CommentVO {
	private String bbscommno;
	private String id;	//아이디
	private String memo;	//댓글내용
	private String day;		//날짜
	private String no;		//게시글번호
	
	
	
	public String getBbscommno() {
		return bbscommno;
	}
	public void setBbscommno(String bbscommno) {
		this.bbscommno = bbscommno;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	private String date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	/*
	 create table bbscomment(
bbscomno number,
id varchar2(20),
pass varchar2(8),
memo varchar2(100),
no number,
day TIMESTAMP default sysdate,
foreign key (no) references bbs(no));
	 */
}
