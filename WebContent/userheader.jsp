<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>userheader page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/user_menu_style.css">
	

  </head>
  
  <body>
    <div id="menu" style="position: absolute; top: 152px; left: 195px; width: 814px; height: 42px;">
  <ul>
    <li><a href="MainPage.jsp" title="Home"><span>Home</span></a></li>
    <li><a href="userprofile.jsp" title="My Profile"><span>My Profile</span></a></li>
    <li><a href="page.jsp" title="TimeTable"><span>TimeTable<br></span></a></li>
    <li><a href="courseregister.jsp" title="Courses"><span>Courses<br></span></a></li>
    <li><a href="calendar.jsp" title="tutorials"><span>Calendar<br></span></a></li>
    <li><a href="home.jsp" title="Test"><span>Quiz</span></a></li>
    
   
    </ul>
    
</div>
     
  </body>
</html>
