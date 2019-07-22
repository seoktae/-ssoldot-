package org.ssoldot.domain;

import java.util.Date;

public class BoardReplyVO {
	
	private Integer br_id;
	private String br_content;
	private Date br_regdate;
	private Integer br_like;
	private Integer br_ref;
	private Integer br_step;
	private Integer br_depth;
	private Integer b_id;
	private String member_id;
	
	public Integer getBr_id() {
		return br_id;
	}
	public void setBr_id(Integer br_id) {
		this.br_id = br_id;
	}
	public String getBr_content() {
		return br_content;
	}
	public void setBr_content(String br_content) {
		this.br_content = br_content;
	}
	public Date getBr_regdate() {
		return br_regdate;
	}
	public void setBr_regdate(Date br_regdate) {
		this.br_regdate = br_regdate;
	}
	public Integer getBr_like() {
		return br_like;
	}
	public void setBr_like(Integer br_like) {
		this.br_like = br_like;
	}
	public Integer getBr_ref() {
		return br_ref;
	}
	public void setBr_ref(Integer br_ref) {
		this.br_ref = br_ref;
	}
	public Integer getBr_step() {
		return br_step;
	}
	public void setBr_step(Integer br_step) {
		this.br_step = br_step;
	}
	public Integer getBr_depth() {
		return br_depth;
	}
	public void setBr_depth(Integer br_depth) {
		this.br_depth = br_depth;
	}
	public Integer getB_id() {
		return b_id;
	}
	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
