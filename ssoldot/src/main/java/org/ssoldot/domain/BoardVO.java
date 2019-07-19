package org.ssoldot.domain;

import java.util.Date;

public class BoardVO {
	
	private Integer b_id;
	private String b_title;
	private Date b_regdate; 
	private int b_cnt;
	private String b_content;
	private String member_id;
	private int file_gid;
	
	public Integer getB_id() {
		return b_id;
	}
	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public Date getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}
	public int getB_cnt() {
		return b_cnt;
	}
	public void setB_cnt(int b_cnt) {
		this.b_cnt = b_cnt;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getFile_gid() {
		return file_gid;
	}
	public void setFile_gid(int file_gid) {
		this.file_gid = file_gid;
	}
	
	
	
	
	

}
