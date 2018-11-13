package com.aaron.babebasket.models;

import java.util.Date;

import org.bson.types.ObjectId;

import io.swagger.annotations.ApiModelProperty;

public class AdvertMessage {
	
	@ApiModelProperty(hidden = true)
	private String id = new ObjectId().toHexString();
	private String subject;
	private String message;
	private Date creationDate  = new Date();;
	private String from;	// user id from
	private String sendTo; // user id to send to
	private String option;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getSendTo() {
		return sendTo;
	}
	public void setSendTo(String sendTo) {
		this.sendTo = sendTo;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	
	@Override
	public String toString() {
		return "AdvertMessage [id=" + id + ", subject=" + subject + ", message=" + message + ", creationDate="
				+ creationDate + ", from=" + from + ", sendTo=" + sendTo + ", option=" + option + "]";
	}
	
	
	
 
	
}
