package com.dao;

import java.util.*; 

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import com.twilio.sdk.*; 
import com.twilio.sdk.resource.factory.*; 
import com.twilio.sdk.resource.instance.*; 
import com.twilio.sdk.resource.list.*; 
 
public class TwilioTest { 
 // Find your Account Sid and Token at twilio.com/user/account 
 public static final String ACCOUNT_SID = "AC4b1213a7e9c9b214523434a81ea83f28"; 
 public static final String AUTH_TOKEN = "2a6e3a62e2beee5e0c4b5f07f2bbf403"; 
 
 
 
 public static void sms()
 {
	 try
	 {
		 
		 System.out.println("checking number");
	TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN); 
 
	 // Build the parameters 
	 List<NameValuePair> params = new ArrayList<NameValuePair>(); 
	 params.add(new BasicNameValuePair("To", "+919674360937"));  
	 params.add(new BasicNameValuePair("From", "+12055824899")); 
	 params.add(new BasicNameValuePair("Body", "Hello Anirban call back!"));   
 
	 MessageFactory messageFactory = client.getAccount().getMessageFactory(); 
	 Message message = messageFactory.create(params); 
	 System.out.println(message.getSid());
	 }
	 catch(TwilioRestException t)
	 {
		 System.out.println(t.getMessage());
	 }
 } 
}