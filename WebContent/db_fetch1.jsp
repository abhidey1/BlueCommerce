<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.model.Offer"%>
<%@ page import="com.dao.BlueCommerceDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%-- <%

response.setContentType("text/xml");
String sn=request.getParameter("ok");
System.out.println(sn);
//int i=Integer.parseInt(sn);
//System.out.println("here" +i);

Class.forName("com.ibm.db2.jcc.DB2Driver");
Connection con =DriverManager.getConnection("jdbc:db2://localhost:50000/BCom","db2admin","db2admin");
Statement st=con.createStatement();
ResultSet rs = st.executeQuery("select * from offer_details where location_name='"+sn+"'");
if(rs.next())
{
	
		/* out.println(rs.getInt(1));
		out.println(rs.getString(2));
		out.println(rs.getString(3));	
		out.println(rs.getString(5)); */	
 out.println("<loc>");
//out.println("<offerid>"+rs.getString("offer_id")+"</offerid>");		
out.println("<locname>"+rs.getString("location_name")+"</locname>");
out.println("<hca>"+rs.getString("hotel_classa")+"</hca>");
out.println("<hcb>"+rs.getString("hotel_classb")+"</hcb>");
out.println("<hcc>"+rs.getString("hotel_classc")+"</hcc>");
out.println("<tca>"+rs.getString("travel_classa")+"</tca>");
out.println("<tcb>"+rs.getString("travel_classb")+"</tcb>");
out.println("</loc>"); 

} 


rs.close();
st.close();
con.close();

%> --%>

 <%
 
 response.setContentType("text/xml");
 String sn=request.getParameter("ok");
 System.out.println(sn);

ArrayList<Offer> list=BlueCommerceDao.getOfferData(sn);
//request.setAttribute("offerdetails", list);
//List list1 = (List) request.getAttribute("offerdetails");
for (int i = 0; i < list.size(); i++) { 
  Offer offerdtls = (Offer) list.get(i); 
  
out.println("<loc>"); 
out.println("<locname>"+offerdtls.getLocation()+"</locname>");
out.println("<hca>"+offerdtls.getHotelclassa() +"</hca>");
out.println("<hcb>"+offerdtls.getHotelclassb()+"</hcb>");
out.println("<hcc>"+offerdtls.getHotelclassc()+"</hcc>");
out.println("<tca>"+offerdtls.getTravelclassa()+"</tca>");
out.println("<tcb>"+offerdtls.getTravelclassb()+"</tcb>");
out.println("</loc>");

}
%>





