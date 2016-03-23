package com.main.code;




import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class register
 */
@WebServlet("/courseselection")
public class courseselection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public courseselection() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("new");
		System.out.print("this is register");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String Course=request.getParameter("course");
		String email=request.getParameter("email");
		String startdate=request.getParameter("startdate");
		
	
		
		String country=request.getParameter("country");
		if(Course=="" && email=="" && startdate=="")
		{
			System.out.println("hey error ");
			request.getRequestDispatcher("Registercourse.jsp").forward(request, response);
		}
		else
		{
			String url = "jdbc:mysql://localhost:3306/";
			String dbName = "course";
			String driver = "com.mysql.jdbc.Driver";
			String userName = "root";
			String pass = "root";
			PreparedStatement pst = null;
			Connection con = null;
			
			int status;
			
			try {
				int rs;
				Class.forName(driver).newInstance();
				con = DriverManager
						.getConnection(url + dbName, userName, pass);


				pst = con
						.prepareStatement("insert into coursedetails values(?,?,?)");
				/*
				 		String Course=request.getParameter("CHKBOX");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String password2=request.getParameter("repass");
		String fname=request.getParameter("fname");
		String mname=request.getParameter("mname");
		String lname=request.getParameter("lname");
		String sex=request.getParameter("sex");
		String mobile=request.getParameter("phone");
		String currently=request.getParameter("currently");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		

				 */
				java.util.Date utilDate=new java.util.Date(startdate);
				java.sql.Date sqldate=new java.sql.Date(utilDate.getTime());
				pst.setString(1,email);
				pst.setString(2,Course);
				pst.setDate(3, sqldate);
	
				rs = pst.executeUpdate();
				
				/*if(rs==1){	
				pst1.setString(1, email);
					pst1.setString(2, password);
					rs = pst1.executeUpdate();
					
					pst2.setString(1, email);
					pst2.setString(2, fname);
					pst2.setString(3, mname);
					pst2.setString(4, lname);
					pst2.setString(5, sex);
					pst2.setString(6, currently);
					pst2.setString(7, mobile);
					pst2.setString(8, city);
					pst2.setString(9, state);
					pst2.setString(10, country);
					rs = pst2.executeUpdate();
				
			}*/}
			catch (Exception e) {
				System.out.println(e);
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		   // request.getRequestDispatcher("Success.jsp").forward(request, response);
			out.write("<html><p>you have registered</p></html>");
		

		}
			
	}

}

