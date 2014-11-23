package com.dao;

import java.sql.Connection;
//import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.db.ConnectionFactory;
import com.model.Customer;
import com.model.Message;
import com.model.Offer;

public class BlueCommerceDao {

	static Connection con;
	static Statement stmt;
	private static String VCAP_SERVICES;
	
	/*public BlueCommerceDao()
	{
		System.out.println("Constructor initialized");
		VCAP_SERVICES = System.getenv("VCAP_SERVICES"); 
		
	}*/

	public static boolean checkLoginAdmin(String uname, String password) {
		
		int count = 0;
		try {
			/*
			VCAP_SERVICES = System.getenv("VCAP_SERVICES");
			System.out.println("Vcap services"+VCAP_SERVICES);*/
			
			con = ConnectionFactory.getInstance().getConnection();
			stmt = con.createStatement();
			String query = "select * from DB2ADMIN.userdetails where username='"
					+ uname
					+ "' and password='"
					+ password
					+ "' and urole='admin'";
			System.out.println("Query===>>" +query);
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
				count++;
			}
			rs.close();
			if (count == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;

	}

	public static boolean checkLoginUser(String uname, String password) {

		//TwilioTest.sms();
		int count = 0;
		try {
			con = ConnectionFactory.getInstance().getConnection();
			stmt = con.createStatement();
			String query = "select * from DB2ADMIN.userdetails where username='"
					+ uname
					+ "' and password='"
					+ password
					+ "' and urole='mis'";
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
				count++;
			}
			rs.close();
			if (count == 1) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;

	}

	public static boolean addUser(String ufname, String ulname, String uemail,
			String uphone, String urole, String uname, String upassword,
			String date) {

		try {
			con = ConnectionFactory.getInstance().getConnection();
			stmt = con.createStatement();

			String sql = null;
			sql = "insert into DB2ADMIN.userdetails (ufname,ulname,uemail,uphone,urole,username,password,dateadd)values(?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ufname);
			pstmt.setString(2, ulname);
			pstmt.setString(3, uemail);
			pstmt.setString(4, uphone);
			pstmt.setString(5, urole);
			pstmt.setString(6, uname);
			pstmt.setString(7, upassword);
			pstmt.setString(8, date);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	public static ArrayList<Customer> getCustomerData(String customerid) {

		ArrayList<Customer> custList = new ArrayList<Customer>();

		int custid = Integer.parseInt(customerid);

		Customer custObj;
		ResultSet rs = null;

		try {

			con = ConnectionFactory.getInstance().getConnection();
			stmt = con.createStatement();

			String sql = null;

			String QueryString = "select * from db2admin.customer_details c join db2admin.transaction_details t on t.transaction_id=c.transaction_id where c.customer_id="
					+ custid + "";

			System.out.println("Customer details"+QueryString);
			
			rs = stmt.executeQuery(QueryString);

			while (rs.next()) {
				Customer c = new Customer();
				c.setCustomerid(rs.getString("customer_id"));
				c.setCustomername(rs.getString("customer_name"));
				c.setCustomeraddress(rs.getString("customer_address"));
				c.setCustomermob(rs.getString("customer_mobno"));
				c.setCustomeremail(rs.getString("customer_email"));
				c.setCustomercardtype(rs.getString("customer_cardtype"));
				c.setCustomercardno(rs.getString("customer_cardno"));
				c.setCustomerclass(rs.getString("customer_customerclass"));
				c.setTransaction_id(rs.getString("transaction_id"));
				c.setTransactiondate(rs.getString("transaction_date").toString());
				c.setAmount(rs.getString("transaction_amount"));

				custList.add(c);
			}

		}

		catch (Exception ex) {

			System.out.println("Unable to connect to database." + ex);

		}
		return custList;

	}

	public static boolean addMisDetails(String customerid, String customermobno,
			String transactiondate, String msg) {

		try {
			con = ConnectionFactory.getInstance().getConnection();
			stmt = con.createStatement();

			String sql = null;

			sql = "insert into DB2ADMIN.mis_details (customer_id,customer_mobno,transaction_date,message,offer_date)values(?,?,?,?,CURRENT DATE)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customerid);
			pstmt.setString(2, customermobno);
			pstmt.setString(3, transactiondate);
			pstmt.setString(4, msg);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	public static ArrayList<Offer> getOfferData(String offerLocation) {

		ArrayList<Offer> offertList = new ArrayList<Offer>();

		// int offloc=Integer.parseInt(offerLocation);

		ResultSet rs = null;

		try {

			con = ConnectionFactory.getInstance().getConnection();
			stmt = con.createStatement();

			String sql = null;

			String QueryString = "select * from DB2ADMIN.offer_details where lower(location_name)=lower('"
					+ offerLocation + "')";

			rs = stmt.executeQuery(QueryString);

			while (rs.next()) {
				Offer o = new Offer();
				o.setOfferid(rs.getInt("offer_id"));
				o.setHotelclassa(rs.getString("hotel_classa"));
				o.setHotelclassb(rs.getString("hotel_classb"));
				o.setHotelclassc(rs.getString("hotel_classc"));
				o.setLocation(rs.getString("location_name"));
				o.setTravelclassa(rs.getString("travel_classa"));
				o.setTravelclassb(rs.getString("travel_classb"));
				o.setHelpline(rs.getString("helpline_no"));
				o.setDiscount(rs.getString("discount"));

				offertList.add(o);
			}
		} catch (Exception e) {
			System.out.println("unable to fetch records from db" + e);
		}
		return offertList;
	}

	public static ArrayList getLocation() {

		ArrayList <String> arloc = new ArrayList <String>();		

		ResultSet rs = null;

		try {

			con = ConnectionFactory.getInstance().getConnection();
			stmt = con.createStatement();

			String sql = null;

			String QueryString = "select * from DB2ADMIN.offer_details";

			rs = stmt.executeQuery(QueryString);

			while (rs.next()) {
			
				String loc = rs.getString("location_name");
		
				arloc.add(loc);
			}
		} catch (Exception e) {
			System.out.println("unable to fetch records from db" + e);
		}
		return arloc;
	}
	
	public static boolean addLocation(String locnmtext, String hotelaname, String hotelbname,
			String hotelcname, String travaname, String travbname, String adddetails) {

		String helplineno="1800-1234-5678";
		String discount="10";

		try {
			con = ConnectionFactory.getInstance().getConnection();
			stmt = con.createStatement();

			String sql = null;
			sql = "insert into DB2ADMIN.offer_details (LOCATION_NAME,HOTEL_CLASSA,HOTEL_CLASSB,HOTEL_CLASSC,TRAVEL_CLASSA,TRAVEL_CLASSB,HELPLINE_NO,DISCOUNT,ADDITIONAL_OFFER)values(?,?,?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, locnmtext);
			pstmt.setString(2, hotelaname);
			pstmt.setString(3, hotelbname);
			pstmt.setString(4, hotelcname);
			pstmt.setString(5, travaname);
			pstmt.setString(6, travbname);
			pstmt.setString(7, helplineno);
			pstmt.setString(8, discount);
			pstmt.setString(9, adddetails);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}
	
	public static boolean updateLocation(String hotelaname, String hotelbname, String hotelcname,String travaname,String travbname,String adddetails,String locnmtext) {
		try {
			con = ConnectionFactory.getInstance().getConnection();
			stmt = con.createStatement();

			String sql = null;
			sql = "Update DB2ADMIN.offer_details  set HOTEL_CLASSA='" + hotelaname + "', HOTEL_CLASSB='" + hotelbname + "',HOTEL_CLASSC='" + hotelcname + "', TRAVEL_CLASSA='" + travaname + "', TRAVEL_CLASSB='" + travbname + "', ADDITIONAL_OFFER='" + adddetails + "' where LOCATION_NAME='"+locnmtext+"'";
					
			Statement stmtUpdate = con.createStatement();
			stmtUpdate.executeUpdate(sql);

		}

		catch (Exception e) {
			e.printStackTrace();
			return false;

		}
		return true;
	}
	
	
	public static ArrayList<Message> getMisData(String todate,String fromdate) {

		ArrayList<Message> misList = new ArrayList<Message>();
		
/*		
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
		//String expectedPattern = "MM/dd/yyyy";
	//	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MMM-dd");
		String todatec = todate;
		String fromdatec = fromdate;
		Date to_date, from_date;
	//	Date to_date1, from_date1;
		System.out.println("here1=> "+todatec);
		System.out.println("here2=> "+fromdatec);
		try {
	 
			to_date = formatter.parse(todatec);
		//	to_date1=formatter1.(to_date);
			System.out.println(to_date);
			System.out.println(formatter.format(to_date));
	 
		} catch (ParseException e) {
			e.printStackTrace();
		}
		

		try {
	 
			from_date = formatter.parse(fromdatec);
			System.out.println(from_date);
			System.out.println(formatter.format(from_date));
	 
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// int offloc=Integer.parseInt(offerLocation);
*/
		
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
		Date to_date = null, from_date =null;
		try {
			 
		to_date = formatter.parse(todate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		try {
			 
			from_date = formatter.parse(fromdate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		
		ResultSet rs = null;

		try {

			con = ConnectionFactory.getInstance().getConnection();
			stmt = con.createStatement();

			String sql = null;

			String QueryString = "select * from DB2ADMIN.MIS_DETAILS where offer_date between '"+formatter.format(to_date)+"' and '"+formatter.format(from_date)+"'";
			System.out.println("Query==> "+QueryString);
			rs = stmt.executeQuery(QueryString);

			while (rs.next()) {
				Message o = new Message();
				
				o.setMis_id(rs.getInt("mis_id"));
				o.setCustomerid(rs.getInt("customer_id"));
				o.setCustomermob(rs.getString("customer_mobno"));
				o.setTransactiondate(rs.getString("transaction_date"));
			//	o.setTransactiondate(rs.getDate("transaction_date").toString());
				o.setDescription(rs.getString("message"));
				
				misList.add(o);
			}
		} catch (Exception e) {
			System.out.println("unable to fetch records from db" + e);
		}
		return misList;
	}
	
	public static boolean addCustomer(String cname,String cmob,
			String cemail, String cardtype, String cardno, String address, String cclass,String tamount,
			String date,String msg) {
		ResultSet rs = null;
		String finalstrtransactionid="";
		String finalstrcustomerid="";
		
		try {
			con = ConnectionFactory.getInstance().getConnection();
			stmt = con.createStatement();
			
			String QueryString = "select max(DB2ADMIN.CUSTOMER_DETAILS.CUSTOMER_ID) from DB2ADMIN.CUSTOMER_DETAILS";
			System.out.println("Query==> "+QueryString);
			rs = stmt.executeQuery(QueryString);

			while (rs.next()) {
			String customer_id=rs.getString(1);
			
			int a=Integer.parseInt(customer_id);
			int finalcustomerid=a+1;
			
			 finalstrcustomerid = Integer.toString(finalcustomerid);
			//String customer_id1=customer_id +1;
			}
			
			
			//////////////////////////////////////////////////////////////////////////////
			
			ResultSet rs2 = null;
			String QueryString1 = "select max(DB2ADMIN.TRANSACTION_DETAILS.transaction_id) from DB2ADMIN.TRANSACTION_DETAILS";
			System.out.println("Query==> "+QueryString1);
			rs2 = stmt.executeQuery(QueryString1);

			while (rs2.next()) {
			String transaction_id=rs2.getString(1);
			
			int b=Integer.parseInt(transaction_id);
			int finaltransaction_id=b+1;
			
			finalstrtransactionid = Integer.toString(finaltransaction_id);
			//String customer_id1=customer_id +1;
			}

			String sql = null;
			sql = "insert into DB2ADMIN.customer_details (customer_id,customer_name,customer_mobno,customer_email,customer_cardtype,customer_cardno,customer_address,customer_customerclass,transaction_id)values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, finalstrcustomerid);
			pstmt.setString(2, cname);
			pstmt.setString(3, cmob);
			pstmt.setString(4, cemail);
			pstmt.setString(5, cardtype);
			pstmt.setString(6, cardno);
			pstmt.setString(7, address);
			pstmt.setString(8, cclass);
			pstmt.setString(9, finalstrtransactionid);
			
			pstmt.execute();
			
			//// insert into transaction table
			
			
			String sql1 = null;
			sql1 = "insert into DB2ADMIN.transaction_details (transaction_id,customer_id,transaction_date,transaction_type,transaction_amount,tran_message)values(?,?,?,?,?,?)";
			PreparedStatement pstmt1 = con.prepareStatement(sql1);
			pstmt1.setString(1, finalstrtransactionid);
			pstmt1.setString(2, finalstrcustomerid);
			pstmt1.setString(3, date);
			pstmt1.setString(4, cardtype);
			pstmt1.setString(5, tamount);
			pstmt1.setString(6, msg);		
			pstmt1.execute();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	
	public static ArrayList<Offer> getOffer(String cmob,String address) {

		ArrayList<Offer> offerList = new ArrayList<Offer>();
		
		ResultSet rs3 = null;

		try {

			con = ConnectionFactory.getInstance().getConnection();
			stmt = con.createStatement();

			//ResultSet rs3 = null;
			String QueryString3 = "select * from DB2ADMIN.OFFER_DETAILS OD join DB2ADMIN.CUSTOMER_DETAILS CD ON OD.LOCATION_NAME=CD.CUSTOMER_ADDRESS WHERE CD.CUSTOMER_ADDRESS='"+address+"' and CD.CUSTOMER_MOBNO='"+cmob+"'";
			System.out.println("Query==> "+QueryString3);
			rs3 = stmt.executeQuery(QueryString3);
			Offer o=new Offer();
			if (rs3.next()) {
			o.setHotelclassa(rs3.getString("HOTEL_CLASSA"));
			o.setDiscount(rs3.getString("DISCOUNT"));
			o.setHelpline(rs3.getString("HELPLINE_NO"));
			
			offerList.add(o);
			}
				
			
		} catch (Exception e) {
			System.out.println("unable to fetch records from db" + e);
		}
		return offerList;
	}
	
}
