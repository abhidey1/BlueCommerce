<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    
pageEncoding="ISO-8859-1"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"        
"http://www.w3.org/TR/html4/loose.dtd"> 
 <html> 
 <head> 
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
 <title>Employees</title> 
 
 
 <script type="text/javascript">
function submitform()
{
 if(document.displayEmployee.onsubmit())
 {//this check triggers the validations
    document.displayEmployee.submit();
 }
}
</script>
 
 </head> 
 <body>     

<form name="displayEmployee" action= "processAddEmployee.jsp"  method="post">
Edit data
  </form>
    
  </body> 
  </html>