<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.Date" import="java.text.SimpleDateFormat" import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String ss=(String)session.getAttribute("sUser"); 

%>


<HTML>
    <HEAD>
        <TITLE>Filling a Table</TITLE>
        <style>
table {
    border-collapse: collapse;
    width: 100%;
}

td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #000;
    font-size: 200%;
    
}
th{
font-size: 225%;
 padding: 8px;
    text-align: left;
    border-bottom: 1px solid #000;
}

tr:hover{background-color:#f5f5f5}
</style>
    </HEAD>

    <BODY  style=background-image:url("sky.jpg"); >
        <H1>TimeTable</H1>

       <TABLE >
                <TR>
                    <TH>Courses names</TH>
                    <TH >Tasks names and detailsName</TH>
                </TR>
                </TABLE>
       
        <%  
        String cname;
                int nooftasks;
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                
            Date d[]=new Date[8];
            int count=0;
            
               
            Connection connection = null;
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/course", "root", "root");

            Statement statement = connection.createStatement();

           
            ResultSet resultset = 
                statement.executeQuery("select * from coursedetails where id= '"+ss+"'");

            while(resultset.next()){ 
        %>
            <TABLE >
               <TR>
                   
                     <%cname=resultset.getString(2); %> 
                     <TD> <%=cname %> </TD>
                      <% Date date=resultset.getDate(3);
                    
                    		for(int i=1;i<5;i++)
                    		{
                    			Date startdate=date;
                    			 Calendar c = Calendar.getInstance();    
                                 c.setTime(date);
                                 c.add(Calendar.DATE,6);
                                 System.out.println(dateFormat.format(c.getTime()));
                    			
                    			%><TD> <%="Task"+i %></TD>
                    			<TD><%= dateFormat.format(startdate) %></TD>
                    			<TD> <%=dateFormat.format(c.getTime()) %></TD>
                    			
                    		<% date=c.getTime();
                    		}%>
                    		<%d[count]=date;
                    		count++; %><%//this d array will contain all the end dates for each course you have registered %>
                    		                     
               
                
                </TR>
            </TABLE>
        <% 
            } 
            
        %>
        
    </BODY>
</HTML>

           
       