package org.ssoldot.domain;

public class FileVO {
	
	private int pic_id;
	private String og_pic_name;
	private String st_pic_name;
	private int file_snum;
	private int file_gid;
	private String file_path;
	private String member_id;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPic_id() {
		return pic_id;
	}
	public void setPic_id(int pic_id) {
		this.pic_id = pic_id;
	}
	public String getOg_pic_name() {
		return og_pic_name;
	}
	public void setOg_pic_name(String og_pic_name) {
		this.og_pic_name = og_pic_name;
	}
	public String getSt_pic_name() {
		return st_pic_name;
	}
	public void setSt_pic_name(String st_pic_name) {
		this.st_pic_name = st_pic_name;
	}
	public int getFile_snum() {
		return file_snum;
	}
	public void setFile_snum(int file_snum) {
		this.file_snum = file_snum;
	}
	public int getFile_gid() {
		return file_gid;
	}
	public void setFile_gid(int file_gid) {
		this.file_gid = file_gid;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	
	
	
	
}
