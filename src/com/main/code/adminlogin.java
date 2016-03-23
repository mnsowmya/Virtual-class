package com.main.code;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class adminlogin extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Map<String, String> message;
		boolean status = false;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		
if(email==""||password==""){
	response.sendRedirect("adminlogin.jsp");	
}
else if(!email.matches("^[^\\d].*")){

	response.sendRedirect("adminlogin.jsp");
}
else{	
	try{

			/*Class.forName("com.mysql.jdbc.Driver");
			String connectionUrl = "jdbc:mysql://localhost/ocp?"+"user=root&password=root";
			Connection con=DriverManager.getConnection(connectionUrl);*/
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "course";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String pass = "root";
		
			Class.forName(driver).newInstance();
			conn = DriverManager
					.getConnection(url + dbName, userName, pass);

			//Statement stmt = conn.createStatement();
			pst = conn
					.prepareStatement("select * from adminlogin where email = '"+email+"'");
			 //rs = stmt.executeQuery("select * from adminlogin where email = '"+email+"'");
			rs = pst.executeQuery();
			String psw;		
			if(rs.next())
			{
			
				psw = rs.getString(3);
				if(password.equals(psw)){		
					RequestDispatcher dispatcher=request.getRequestDispatcher("AdminPage.jsp");
					dispatcher.forward(request, response);	
				}
				else{
					System.out.println("check username and password");
					response.sendRedirect("adminlogin.jsp");
				}
			}
			else{
				System.out.println("no user exists");
				response.sendRedirect("adminlogin.jsp");
		}
		}catch(Exception e){
			System.out.println("Error ***" + e);
		}finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
      }

	}

}
