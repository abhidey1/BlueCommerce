package com.db;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ConnectionDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public String VCAP_SERVICES;
    public ConnectionDB() {
        super();
        
    }

	public void init(ServletConfig config) throws ServletException {
		
		VCAP_SERVICES = System.getenv("VCAP_SERVICES");
		System.out.println("Init method called"+VCAP_SERVICES);
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
