package com.main.code;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class login extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		String email=request.getParameter("email");
		String password=request.getParameter("pword");
		
if(email==""||password==""){
	response.sendRedirect("Login.jsp");
	
	out.println("<h3>Please enter username and password<h3>");
}



else if(!email.matches("^[^\\d].*")){

	response.sendRedirect("Login.jsp");
}

else{
	
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "course";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root";
	String pass = "root";
	Connection con = null;
	try{
			/*Class.forName("com.mysql.jdbc.Driver");
			String connectionUrl = "jdbc:mysql://localhost/ocp?"+"user=root&password=root";
			Connection con=DriverManager.getConnection(connectionUrl);*/
		Class.forName(driver).newInstance();
		con = DriverManager
				.getConnection(url + dbName, userName, pass);


		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from login where email = '"+email+"'");
		String psw;
			

			if(rs.next())
			{
				psw = rs.getString(2);
				if(password.equals(psw)){
								
				    HttpSession httpSession1=request.getSession();
					httpSession1.setAttribute("sUser",rs.getString("email")); 
					
					RequestDispatcher dispatcher=request.getRequestDispatcher("MainPage.jsp");
					dispatcher.forward(request, response);
								
				}
				else{
					System.out.println("check u name and password");
					response.sendRedirect("Login.jsp");
					
				}

			}
			else{
				System.out.println("no user exists");
				response.sendRedirect("Login.jsp");
				
			}
			
		}catch(Exception e){
			System.out.println("Error ***" + e);
		}
		
      }

	}

}
