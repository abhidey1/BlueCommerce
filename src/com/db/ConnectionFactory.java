package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;

import com.ibm.nosql.json.api.BasicDBList;
import com.ibm.nosql.json.api.BasicDBObject;
import com.ibm.nosql.json.util.JSON;


public class ConnectionFactory {

	/*String url = "jdbc:postgresql://localhost:5432/test";
	String user = "postgres";
	String password = "postgres";
	String driverClass = "org.postgresql.Driver";*/

	/*String url = "jdbc:db2://localhost:50000/BCom";
	String user = "db2admin";
	String password = "db2admin";
	String driverClass = "com.ibm.db2.jcc.DB2Driver";
*/



	private static ConnectionFactory instance = new ConnectionFactory(System.getenv("VCAP_SERVICES"));
	String url="";
	String user="";
	String password="";
	String databaseHost="";
	String databaseName="";
	String port="" ;

	private ConnectionFactory(){

	}

	public ConnectionFactory(String VCAP_SERVICES){
		BasicDBObject obj = (BasicDBObject) JSON.parse(VCAP_SERVICES);
		String thekey = null;
		Set<String> keys = obj.keySet();
		// Look for the VCAP key that holds the SQLDB information
		for (String eachkey : keys) {
			System.out.println("each key ="+eachkey);
			// The old name for this service was IRDS
			if (eachkey.contains("IRDS")) {
				thekey = eachkey;
			}
			if (eachkey.contains("SQLDB")) {
				thekey = eachkey;
			}
			if (eachkey.contains("sqldb")) {
				thekey = eachkey;
			}
			if (eachkey.contains("cleardb")) {
				thekey = eachkey;
			}
		}

		BasicDBList list = (BasicDBList) obj.get(thekey);
		System.out.println("basic db list = "+list);
		
		
		obj = (BasicDBObject) list.get("0");
		
		System.out.println(list.get("0"));
		
		//obj = (BasicDBObject) obj.get("name");
		
		/*databaseName = (String) obj.get("name");
		System.out.println("Database Name :"+databaseName);*/
		
		obj = (BasicDBObject) obj.get("credentials");

		databaseHost = (String) obj.get("hostname");
		System.out.println("Host Name :"+databaseHost);
		
		databaseName = (String) obj.get("db");
		System.out.println("Database Name :"+databaseName);
			
		port = (String) obj.get("port").toString();
		System.out.println("Port Number :"+port);
		
		user = (String) obj.get("username");
		System.out.println("Username :"+user);
		
		password = (String) obj.get("password");
		System.out.println("Password :"+password);
		
		url = (String) obj.get("jdbcurl").toString();
		System.out.println("JDBC URL :"+url);

	}


	// private constructor


	public static ConnectionFactory getInstance() {
		return instance;
	}

	public Connection getConnection() throws SQLException,
			ClassNotFoundException {
		System.out.println("Connection ongoing");
		String driverClass = "com.ibm.db2.jcc.DB2Driver";
		Class.forName(driverClass);
		//Connection connection = DriverManager.getConnection("jdbc:db2://"+databaseHost+":"+port+"/"+databaseName,user,password);
		Connection connection = DriverManager.getConnection("jdbc:db2://"+databaseHost+":"+port+"/"+databaseName+":"+"user="+user+";"+"password="+password+";");
		System.out.println("Connection Successful");
		return connection;
	}

}