package com.model;

public class Message {

	private int messageid;
	private int customerid;
	private String customermob;
	private String description;
	
	private int mis_id;
	private String transactiondate;
	
	
	public int getMis_id() {
		return mis_id;
	}
	public void setMis_id(int mis_id) {
		this.mis_id = mis_id;
	}
	public String getTransactiondate() {
		return transactiondate;
	}
	public void setTransactiondate(String transactiondate) {
		this.transactiondate = transactiondate;
	}
	public int getMessageid() {
		return messageid;
	}
	public void setMessageid(int messageid) {
		this.messageid =messageid;
	}
	
	public int getCustomerid() {
		return customerid;
	}
	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	
	}
	public String getCustomermob() {
		return customermob;
	}
	public void setCustomermob(String customermob) {
		this.customermob = customermob;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}
