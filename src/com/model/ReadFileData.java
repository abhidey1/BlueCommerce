package com.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.resource.factory.MessageFactory;

import java.util.*; 


import com.twilio.sdk.*; 
import com.twilio.sdk.resource.factory.*; 
import com.twilio.sdk.resource.instance.*; 
import com.twilio.sdk.resource.list.*; 

public class ReadFileData {
	 
	//Fetching Customer details
	
	   public Map<String,String> getDetails(String customerId)
  {
		 //Location of the File 
		   String txtFileLocation = "/bc_customer_details.txt";
		   		   	      
		   BufferedReader br=null;
		   Map map=new HashMap<String,String>();
		   
		   
		  
		   try {

				String sCurrentLine;
				
				InputStream is=Thread.currentThread().getContextClassLoader().getResourceAsStream(txtFileLocation);
				if (is != null) {
       					InputStreamReader isr = new InputStreamReader(is);
       					 br= new BufferedReader(isr);
     					
       					while ((sCurrentLine = br.readLine()) != null) {
					String[] strarr=sCurrentLine.split("\n");

					for(int i=0;i<strarr.length;i++)
					{
						String str1=strarr[i];
						

						String[] strarr1=str1.split(",");
						
						if(customerId.equals(strarr1[0]))
						{
							    map.put("custid",strarr1[0]);
							    map.put("Name",strarr1[1]);
								map.put("PhNo",strarr1[2]);
								map.put("cardType",strarr1[3]);
								map.put("CardId",strarr1[4]);
								map.put("LastTDate",strarr1[5]);
								map.put("TLoc",strarr1[6]);
								map.put("Amount",strarr1[7]);
								map.put("CustType", strarr1[8]);
								map.put("emailId", strarr1[9]);
								
							
						}//if End
					

					}//for End
				}//while End
   			}//If end 

		}//try End
		   
		   catch (IOException e) {
					e.printStackTrace();
				}
				
				finally {

					try {
							if (br != null)br.close();
						} catch (IOException ex)
						{
							ex.printStackTrace();

						}
				}  
				
				return map;   
	}
	  // Fetching offer details
	   
	   public Map<String,String> getOffer(String offerID)
	   {
	 		 
	 		   //Location of the File 
	 		   String txtFile = "/bc_offers_details.txt";
	 		      
	 		   BufferedReader br = null;
	 		   Map map=new HashMap<String,String>();

	 				try {

	 					String CurrentLine;
	 					 
	 					//br = new BufferedReader(new FileReader(txtFile));
	 					
	 					InputStream is=Thread.currentThread().getContextClassLoader().getResourceAsStream(txtFile);
	 					if (is != null) {
	 	       					InputStreamReader isr = new InputStreamReader(is);
	 	       					 br= new BufferedReader(isr);
	 	     					
	 	       			
	 					while ((CurrentLine = br.readLine()) != null) {
	 						String[] strar=CurrentLine.split("\n");

	 						for(int i=0;i<strar.length;i++)
	 						{
	 							String str1=strar[i];
	 							

	 							String[] strar1=str1.split(",");
	 							
	 													
	 							if(offerID.equals(strar1[1]))
	 							{
	 								    map.put("offrid",strar1[0]);
	 								    map.put("loc",strar1[1]);
	 									map.put("holtel1",strar1[2]);
	 									map.put("holtel2",strar1[3]);
	 									map.put("holtel3",strar1[4]);
	 									map.put("tagent",strar1[5]);
	 									map.put("cab",strar1[6]);
	 									
	 																		
	 								
	 							}//if End
	 						
	 	
	 						}//for End
	 					}//while End
	 					
	 	       					}//If End
	 					
	 				}//try End
	 				catch (IOException e) {
	 					e.printStackTrace();
	 				}
	 				
	 				finally {

	 					try {
	 							if (br != null)br.close();
	 						} catch (IOException ex)
	 						{
	 							ex.printStackTrace();

	 						}
	 				}  
	 				
	 				return map;   
	 	}
	   
	   
	   //Sending email
	   
	   public boolean sendEmail(String recever,String offmsg)
	   {
	      
	      // Recipient's email ID needs to be mentioned.
	      String to = recever;

	      // Sender's email ID needs to be mentioned
	      String from = "abhidey1@in.ibm.com";

	      // Assuming you are sending email from 
	     
	     String host = "na.relay.ibm.com";

	      // Get system properties
	      Properties properties = System.getProperties();

	      // Setup mail server
	      properties.setProperty("mail.smtp.host", host);

	      // Get the default Session object.
	      Session session = Session.getDefaultInstance(properties);

	      try{
	         // Create a default MimeMessage object.
	         MimeMessage message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));

	         // Set To: header field of the header.
	         message.addRecipient(Message.RecipientType.TO,
	                                  new InternetAddress(to));

	         // Set Subject: header field
	         message.setSubject("Some Offer for You!!!");

	         // Send the actual HTML message, as big as you like
	         message.setContent(offmsg,"text/html" );

	         // Send message
	         Transport.send(message);
	         //return true;
	         System.out.println("Sent message successfully....");
	      }catch (MessagingException mex) {
	         mex.printStackTrace();
	         return false;
	      }
	      return true;
	   }
	   
	   //fetching MIS details
	   
	   public Map<String,String> getMISDetails(String misdate)
	   {
	 		 
	 		   //Location of the File 
	 		   String txtFile = "/bc_MIS.txt";
	 		      
	 		   BufferedReader br = null;
	 		   Map map=new HashMap<String,String>();

	 				try {

	 					String CurrentLineMIS;
	 					 
	 					InputStream is=Thread.currentThread().getContextClassLoader().getResourceAsStream(txtFile);
	 					if (is != null) {
	 	       					InputStreamReader isr = new InputStreamReader(is);
	 	       					 br= new BufferedReader(isr);

	 					while ((CurrentLineMIS = br.readLine()) != null) {
	 						String[] strarr=CurrentLineMIS.split("\n");

	 						for(int i=0;i<strarr.length;i++)
	 						{
	 							String str1=strarr[i];
	 							

	 							String[] strarr1=str1.split(",");
	 							
	 							if(misdate.equals(strarr1[3]))
	 							{
	 								    map.put("msgid",strarr1[0]);
	 								    map.put("custid",strarr1[1]);
	 									map.put("phn",strarr1[2]);
	 									map.put("date",strarr1[3]);
	 									map.put("time",strarr1[4]);
	 									map.put("desp",strarr1[5]);
	 										 									
	 								
	 							}//if End
	 						
	 	
	 						}//for End
	 					}//while End
	 					}//if End
	 					
	 				}//try End
	 				catch (IOException e) {
	 					e.printStackTrace();
	 				}
	 				
	 				finally {

	 					try {
	 							if (br != null)br.close();
	 						} catch (IOException ex)
	 						{
	 							ex.printStackTrace();

	 						}
	 				}  
	 				
	 				return map;   
	 	}
	   
	   // send SMS=====================================================================
	   
	   
	   
	   
	   public static final String ACCOUNT_SID = "AC4b1213a7e9c9b214523434a81ea83f28"; 
	   public static final String AUTH_TOKEN = "2a6e3a62e2beee5e0c4b5f07f2bbf403";  
	   public boolean SendSMS(String mobreceiver,String offmsg)
	   {
		   
	  	 try
	  	 {
	  		 
	    System.out.println("checking number");
	  	TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN); 
	   
	  	 // Build the parameters 
	  	 List<NameValuePair> params = new ArrayList<NameValuePair>(); 
	  	 params.add(new BasicNameValuePair("To", mobreceiver));  
	  	 params.add(new BasicNameValuePair("From", "+12055824899")); 
	  	 params.add(new BasicNameValuePair("Body", offmsg));   
	   
	  	 MessageFactory messageFactory = client.getAccount().getMessageFactory(); 
	  	 com.twilio.sdk.resource.instance.Message message = messageFactory.create(params); 
	  	 System.out.println(message.getSid());
	  	 }
	  	 catch(TwilioRestException t)
	  	 {
	  		 System.out.println(t.getMessage());
	  	 }
	  	 return true;
	   }
}
      

