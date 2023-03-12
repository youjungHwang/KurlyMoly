package com.kurly.inquiry;

public class PinquiryDTO {

	private int idx;
	private int prodidx;
	private String userid; 
	private String issecret; 
	private String title; 
	private String content; 
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
	public int getProdidx() {
		return prodidx;
	}
	public void setProdidx(int prodidx) {
		this.prodidx = prodidx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getIssecret() {
		return issecret;
	}
	public void setIssecret(String issecret) {
		this.issecret = issecret;
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
		return "PinquiryDTO [idx=" + idx + ", prodidx=" + prodidx + ", userid=" + userid + ", issecret=" + issecret
				+ ", title=" + title + ", content=" + content + ", inquirydate=" + inquirydate + ", reply=" + reply
				+ ", replydate=" + replydate + ", isreply=" + isreply + "]";
	}

}
