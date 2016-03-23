package com.candidjava.servlet.download;



import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class aspnet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String filename = "asp.net_tutorial.zip";
		String filepath = "C:\\Users\\DEEPIKA REDDY\\Desktop\\new J2ee\\jsp files\\";
		response.setContentType("APPLICATION/OCTET-STREAM");
		response.setHeader("Content-Disposition", "attachment; filename=\""
				+ filename + "\"");
 
		// use inline if you want to view the content in browser, helpful for
		// pdf file
		// response.setHeader("Content-Disposition","inline; filename=\"" +
		// filename + "\"");
		FileInputStream fileInputStream = new FileInputStream(filepath
				+ filename);
 
		int i;
		while ((i = fileInputStream.read()) != -1) {
			out.write(i);
		}
		fileInputStream.close();
		out.close();
	}
}
