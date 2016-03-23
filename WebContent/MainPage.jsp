<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String ss=(String)session.getAttribute("sUser"); 

%>

<%
/*Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/ocp?"+"user=root&password=root";
Connection con=DriverManager.getConnection(url);
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select * from login where email ='"+ss+"'");
*/
	String url = "jdbc:mysql://localhost:3306/";
			String dbName = "course";
			String driver = "com.mysql.jdbc.Driver";
			String userName = "root";
			String pass = "root";
		
Connection con = null;
try {
	Class.forName(driver).newInstance();
	con = DriverManager
			.getConnection(url + dbName, userName, pass);


	Statement stmt = con.createStatement();
	

ResultSet rs1 = stmt.executeQuery("select * from coursedetails where id= '"+ss+"'");
request.setAttribute("user1",rs1);
System.out.println("rs1"+rs1);

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Home</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="menu_style.css">
	
     </head>
  
   <div style="position: absolute;"><jsp:include page="movingtest.jsp"></jsp:include></div>
 
   
 <body style="background: #99CCFF;">
  
   <div style="position: absolute; top: 15px; left: 901px; width: 254px;">  
  welcome &nbsp;   
  <a href="logout.jsp">logout</a>
  </div>
  <div style="position: absolute; top: 160px; left: -4px; width: 938px; height: 36px;">
 <jsp:include page="userheader.jsp"></jsp:include>    
 
  
  <div style="border-bottom: medium solid; position: absolute; top: 201px; left: 195px; width: 812px; height: 1px;">
  </div>
  
  
  
  <div style="position:absolute;top: 212px; left: 197px; width: 809px; height: 508px;"><br>
 <h3>Your Registered Courses Are:</h3>
 <%
  while(rs1.next())
  {
	  String s=rs1.getString(2);
  
 String jspname=s+".jsp";
	
 	 %>
  <a href="<%=jspname%>"><%= s %> :</a>
 <br><br>  
    
 
   &nbsp;&nbsp; 
   <%} %>
   
   </div>
  </div>
  </body>
  
  <%
}
catch(Exception e)
{
	System.out.println("Error ***" + e);
}
   %>
</html>
