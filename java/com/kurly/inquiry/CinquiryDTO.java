package com.kurly.inquiry;

public class CinquiryDTO {

	private int idx; 
	private String about; 
	private int orderidx;
	private String userid; 
	private String title; 
	private String content; 
	private String filename; 
	private String filepath; 
	private String inquirydate; 
	private String reply; 
	private String replydate; 
	private String isreply;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public int getOrderidx() {
		return orderidx;
	}
	public void setOrderidx(int orderidx) {
		this.orderidx = orderidx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getInquirydate() {
		return inquirydate;
	}
	public void setInquirydate(String inquirydate) {
		this.inquirydate = inquirydate;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getReplydate() {
		return replydate;
	}
	public void setReplydate(String replydate) {
		this.replydate = replydate;
	}
	public String getIsreply() {
		return isreply;
	}
	public void setIsreply(String isreply) {
		this.isreply = isreply;
	}
	@Override
	public String toString() {
		return "CinquiryDTO [idx=" + idx + ", about=" + about + ", orderidx=" + orderidx + ", userid=" + userid
				+ ", title=" + title + ", content=" + content + ", filename=" + filename + ", filepath=" + filepath
				+ ", inquirydate=" + inquirydate + ", reply=" + reply + ", replydate=" + replydate + ", isreply="
				+ isreply + "]";
	}
	
	
	
	
	
	
}





