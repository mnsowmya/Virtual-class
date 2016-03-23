<%@ page import="com.main.code.Month,java.util.*,java.io.*,java.sql.*" errorPage="error.jsp" %>
<%-- TODO: CLEAN UP THE PAGE TAG ABOVE --%>


<%
String url = "jdbc:mysql://localhost:3306/";
String dbName = "course";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String pass = "root";
Connection con = null;
int numdays=0;
int startdate=0;
int month=0; 

try {
	Class.forName(driver).newInstance();
	con = DriverManager
			.getConnection(url + dbName, userName, pass);


	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from calen");
	String psw;
if(rs.next()){
//System.out.println(rs.getString(1));
//System.out.println(rs.getString(2));
//System.out.println(rs.getString(3));
numdays=Integer.parseInt(rs.getString(1));
startdate=Integer.parseInt(rs.getString(2));
month=Integer.parseInt(rs.getString(3));
}
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
  int count=0;
int flag=35;
count++;
//System.out.println(count);
  // get the current year/month/day
  Calendar theCal = Calendar.getInstance();
  int currentYearInt  = theCal.get(Calendar.YEAR);
  int currentMonthInt = month;//theCal.get(Calendar.MONTH);
  int currentDayInt   = theCal.get(Calendar.DATE);
  String currentYearString  = new Integer(currentYearInt).toString();
  String currentMonthString = new Integer(currentMonthInt).toString();

  // get parameters the user might have sent by clicking fwd or back
  String newMonth = request.getParameter("month");
  String newYear  = request.getParameter("year");

  // reset the month and year if necessary
  if ( newMonth != null )
  {
    currentMonthString = newMonth;
  }
  if ( newYear != null )
  {
    currentYearString = newYear;
  }

  // determine the next/previous month and year
  int intMonth = new Integer(currentMonthString).intValue();
  int intYear  = new Integer(currentYearString).intValue();

  // determine the name of the current intMonth
  String monthNames[] = {"January",
                         "February",
                         "March",
                         "April",
                         "May",
                         "June",
                         "July",
                         "August",
                         "September",
                         "October",
                         "November",
                         "December" };

  String monthName = monthNames[intMonth];

  // determine the next/previous month and year.
  // this is really only needed by calendar.jsp, but i moved it here
  // to simplify calendar.jsp.
  int nextYear = intYear;
  int prevYear = intYear;
  int prevMonth = intMonth-1;
  if ( prevMonth==-1 )
  {
    prevMonth=11;
    prevYear--;
  }
  int nextMonth = intMonth+1;
  if ( nextMonth==12 )
  {
    nextMonth = 0;
    nextYear++;
  }

%>


 


<html>
<head>
  <title>devdaily.com calendar</title>
  <link rel="StyleSheet" href="/blog/calendar.css" type="text/css" media="screen" />
</head>

<body id="regular_page">

<div id="calendar_main_div">
<table border="1" cellspacing="0" cellpadding="4" id="calendar_table">
  <tr>
    <td width="100%" colspan="7" class="month_year_header">
      <%=monthName%>, <%=intYear%>
    </td>
  </tr>
  <tr class="week_header_row">
    <th width="14%" class="th_day_cell day">Sun</th>
    <th width="14%" class="th_day_cell day">Mon</th>
    <th width="14%" class="th_day_cell day">Tue</th>
    <th width="14%" class="th_day_cell day">Wed</th>
    <th width="14%" class="th_day_cell day">Thu</th>
    <th width="15%" class="th_day_cell day">Fri</th>
    <th width="15%" class="th_day_cell day">Sat</th>
  </tr>
<%
{
  Month aMonth = Month.getMonth( Integer.parseInt(currentMonthString), Integer.parseInt(currentYearString) );
  int [][] days = aMonth.getDays();
  for( int i=0; i<aMonth.getNumberOfWeeks(); i++ )
  {
    %><tr class="week_data_row"><%
    for( int j=0; j<7; j++ )
    {
      if( days[i][j] == 0 )
      {
        %><td class="empty_day_cell">&nbsp;</td><%
      }
      else
      {
        // this is "today"
        //currentDayInt >= days[i][j]
        //		System.out.println("currentday int: "+currentDayInt);
        if(currentDayInt>=startdate && currentDayInt>20  && currentMonthInt == aMonth.getMonth() && currentYearInt == aMonth.getYear() )
        {
        	if(days[i][j]>=startdate && days[i][j]<20){
    		System.out.println("currentday int: "+days[i][j]);
          %><td class="today_cell" bgcolor="#81F781"><%=days[i][j]%></td><%}
        	else {
        		System.out.println("currentday int: "+days[i][j]); %>
        		<td class="today_cell" bgcolor="#F4FA58"><%=days[i][j]%></td>
        		<%
        	}
        }
        else
        {
          %><td class="day_cell" bgcolor="#F4FA58"><%=days[i][j]%></td><%
        }
      } // end outer if
    } // end for
    %>
    </tr>
  <%}
}
%>
</table>

<%-- end of "calendar_div" --%>
</div>

<!-- navigation links -->
<%-- sorry, i don't know how to get this look without a table --%>
<table id="calendar_nav_table" border="0">
  <tr>
    <td id="prev_link">
      <form method="post">
        <input type="submit" name="PREV" value=" << ">
        <input type="hidden" name="month" value="<%=prevMonth%>">
        <input type="hidden" name="year" value="<%=prevYear%>">
      </form>
    </td>
    <td id="link_to_month_view">
      <form action="calendarMonthPrintView.jsp" method="post">
        <input type="submit" value="  Full-Screen Print View  " class="submit_button">
        <input type="hidden" name="month" value="<%=intMonth%>">
        <input type="hidden" name="year"  value="<%=intYear%>">
      </form>
    </td>
    <td id="next_link">
      <form method="post">
        <input type="submit" name="NEXT" value=" >> ">
        <input type="hidden" name="month" value="<%=nextMonth%>">
        <input type="hidden" name="year" value="<%=nextYear%>">
      </form>
    </td>
  </tr>
</table>
  <!-- navigation links end -->

</body>
</html>


