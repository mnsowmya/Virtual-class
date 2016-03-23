<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" %>
<%@ page import="org.w3c.dom.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%
    DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
    DocumentBuilder db =dbf.newDocumentBuilder();
    Document doc=db.parse("C:\\Users\\DEEPIKA REDDY\\Desktop\\new J2ee\\Quizzes\\linux-quiz-1.xml");
    NodeList nl = doc.getElementsByTagName("question");
    
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.*" %>
<%@ page import="com.main.code.*" %>
<%Integer counter = (Integer)session.getAttribute("counter");
String heading = null;
if (counter == null || counter<0) {
 counter = new Integer(0);
 session.setAttribute("counter", counter);
}
  System.out.println("counter in jsp"+counter);

%>
<%
  // ArrayList<String> list = new ArrayList<String>();
   //for(int i = 0; i < 35; i++){
       //list.add("item" + i);
   //}
   
 /*  int totalCount =4;
   int perPage = 1;
   int pageStart = 0; 
   String start = request.getParameter("start");
   if(start != null)pageStart = Integer.parseInt(start);
   if(pageStart < 0)pageStart = 0;
   if(pageStart >totalCount)pageStart = pageStart - perPage;
   System.out.print(pageStart);System.out.print(start);*/
   //session.setAttribute("counter", counter);
%>
<%
int i=counter.intValue();

store l=new store();
l.getAll(i);
String q=l.question;
String s[]=l.a;
String correct=l.ans;
%>

<FORM NAME="form1" action="mediator" METHOD="POST">
<table>
<tr>
<td>
<h4><%= q %></h4>
</td>
</tr>
<tr>
<td>
<input type="radio" name="answer" value="1" ><%= s[0] %><br/>
</td>
</tr>
<tr>
<td>
<input type="radio" name="answer" value="2" ><%= s[1] %> <br/>
</td>
</tr>
<tr>
<td>
<input type="radio" name="answer" value="3" ><%= s[2] %> <br/>
</td>
</tr>
<tr>
<td>
<input type="radio" name="answer" value="4" ><%= s[3] %> <br/>
</td>
</tr>
<tr>
<td>
<input type="radio" name="answer" value="4" ><%= correct %> <br/>
</td>
</tr>
</table>
<INPUT TYPE="HIDDEN" NAME="buttonName">
<INPUT TYPE="BUTTON" VALUE="Next" ONCLICK="button3()">
<INPUT TYPE="BUTTON" VALUE="Prev" ONCLICK="button4()">
<br/>
<INPUT TYPE="BUTTON" VALUE="Finish Exam" ONCLICK="button5()">
</form>
 <SCRIPT LANGUAGE="JavaScript">
            
               function button3()
               {
                   document.form1.buttonName.value = "button1"
                   form1.submit()
               }
               function button4()
               {
                   document.form1.buttonName.value = "button2"
                   form1.submit()
               }
               function button5()
               {
                   document.form1.buttonName.value = "button3"
                   form1.submit()
               }
       </SCRIPT>
</body>
</html>

