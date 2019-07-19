package org.ssoldot.domain;

import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class MemberVO {
	//회원 테이블
	private String member_id;
	private String password;
	private String nickname;
	private String st_picname;
	private String or_picname;
	private Date	regdate;
	private String pwd_que;
	private String pwd_ans;
	
	
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSt_picname() {
		return st_picname;
	}
	public void setSt_picname(String st_picname) {
		this.st_picname = st_picname;
	}
	public String getOr_picname() {
		return or_picname;
	}
	public void setOr_picname(String or_picname) {
		this.or_picname = or_picname;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getPwd_que() {
		return pwd_que;
	}
	public void setPwd_que(String pwd_que) {
		this.pwd_que = pwd_que;
	}
	public String getPwd_ans() {
		return pwd_ans;
	}
	public void setPwd_ans(String pwd_ans) {
		this.pwd_ans = pwd_ans;
	}
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", password=" + password + ", nickname=" + nickname
				+ ", st_picname=" + st_picname + ", or_picname=" + or_picname + ", regdate=" + regdate + ", pwd_que="
				+ pwd_que + ", pwd_ans=" + pwd_ans + "]";
	}
	
	

}
