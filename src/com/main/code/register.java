package com.main.code;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
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
		
		String country=request.getParameter("country");
		if(Course=="" || email=="" || password=="" || password2=="" || fname==""|| mname==""&&
				lname=="" || sex=="" || mobile=="" || currently=="" || city=="" || state=="")
		{
			System.out.println("hey error ");
			request.getRequestDispatcher("reg.jsp").forward(request, response);
		}
		else
		{
			String url = "jdbc:mysql://localhost:3306/";
			String dbName = "course";
			String driver = "com.mysql.jdbc.Driver";
			String userName = "root";
			String pass = "root";
			PreparedStatement pst = null;
			PreparedStatement pst1 = null;
			PreparedStatement pst2 = null;
			Connection con = null;
			int rs;
			int status;
			
			try {
				Class.forName(driver).newInstance();
				con = DriverManager
						.getConnection(url + dbName, userName, pass);


				pst = con
						.prepareStatement("insert into register values(?,?,?,?,?,?,?,?,?,?,?,?) ");
				pst1=con.prepareStatement("insert into login values(?,?)");
				pst2=con.prepareStatement("insert into studentdetails values(?,?,?,?,?,?,?,?,?,?)");
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
				
				pst.setString(1, Course);
				pst.setString(2, email);
				pst.setString(3, password);
				pst.setString(4, password2);
				pst.setString(5, fname);
				pst.setString(6, mname);
				pst.setString(7, lname);
				pst.setString(8, sex);
				pst.setString(9, mobile);
				pst.setString(10, currently);
				pst.setString(11, city);
				pst.setString(12, state);
				rs = pst.executeUpdate();
				
				if(rs==1){	
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
				
			}}
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
		    request.getRequestDispatcher("Success.jsp").forward(request, response);

		}
			
	}

}
