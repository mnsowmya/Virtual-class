package com.main.code;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import org.w3c.dom.*;
import javax.xml.parsers.DocumentBuilder;
 import javax.xml.parsers.DocumentBuilderFactory ;
import javax.xml.parsers.ParserConfigurationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 * Servlet implementation class login
 */
@WebServlet(name = "mediator", urlPatterns = { "/mediator" })
public class mediator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public mediator() {
        super();
        // TODO Auto-generated constructor stub
    }
    public String question;
    public String a[];
    public String ans;
    private static int result=0;
    int c=0;
    PrintWriter out;
    int num;
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			HttpSession session=request.getSession(false);
			int totalcount=4;
			/*if(session==null)
			{
				session=request.getSession(true);
				Integer counter=new Integer(0);
				session.setAttribute("counter", counter);
			}
			*/
			store s=new store();
			Integer counter = (Integer)session.getAttribute("counter");
			//System.out.print("counter value inital"+counter.intValue());
			String p="";
			Integer res = (Integer)session.getAttribute("res");
			String heading = null;
			if (res == null) {
			 res = new Integer(0);
			} 
			HashMap<String,String> hm = (HashMap)session.getAttribute("hash");
			if(hm==null)
			{
				hm=new HashMap<String,String>();
			}
			if (res == null) {
			 res = new Integer(0);
			}
			try {
				 s.getAll(counter.intValue());
				 p=s.ans;
			} catch (ParserConfigurationException | SAXException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(session==null)
			{
				session=request.getSession(true);
			}
			String radio=request.getParameter("answer");
			String but= request.getParameter("buttonName") ;
			
				//System.out.print(radio);
			if((but.equals("button1")&&(radio==""||radio==null))||(but.equals("button2")&&(radio==""||radio==null)))
			{
				out=response.getWriter();
				out.println("<html><body><center><b>please select an option</b></center></body></html>");
				request.getRequestDispatcher("java.jsp").include(request, response);	
			
			}
			 if(but.equals("button1")&&(radio!="")&&(radio!=null))
			{
				counter=new Integer(counter.intValue()+1);
				if(counter.intValue()>totalcount)
					counter=new Integer(totalcount);
				if(radio.equals(p))
				{
					res = new Integer(res.intValue()+1);
					
					session.setAttribute("res", res);
						
				}
				if(hm.get(p)==null)
				{
					hm.put(p, radio);
				}
				else
				{
					for(Map.Entry<String, String>e:hm.entrySet())
					{
					if(e.getKey().equals(p))
						e.setValue(radio);
					}
				}
				session.setAttribute("hash", hm);
				System.out.println("\n in button1"+ans);
				session.setAttribute("counter", counter);
				request.getRequestDispatcher("java.jsp").include(request, response);	
			}
			 if(but.equals("button2")&&(radio!="")&&(radio!=null))
			{
				counter=new Integer(counter.intValue()-1);
				if(counter.intValue()<0)
					counter=new Integer(0);
				if(hm.get(p)==null)
				{
					hm.put(p, radio);
				}
				else
				{
					for(Map.Entry<String, String>e:hm.entrySet())
					{
					if(e.getKey().equals(p))
						e.setValue(radio);
					}
				}
				System.out.print("\n"+hm+"\n");
				session.setAttribute("hash", hm);
				
				     session.setAttribute("counter", counter);
				request.getRequestDispatcher("java.jsp").include(request, response);	
			}
	        
	        if(but.equals("button3"))
	        {
	        	
	        	if(hm.get(p)==null)
				{
					hm.put(p, radio);
				}
				else
				{
					for(Map.Entry<String, String>e:hm.entrySet())
					{
					if(e.getKey().equals(p))
						e.setValue(radio);
					}
				}
				session.setAttribute("hash", hm);
				counter=new Integer(0);
				int k=getResult(hm);
	     //   	out.println("<html><body><center><b>YourScore is:"+k+"</b></center></body></html>");
	        	request.getRequestDispatcher("completed.jsp").forward(request, response);	
	        }
			//System.out.println("counter in java"+counter);        
		   session.setAttribute("counter", counter);
			
			System.out.print("button"+but);
			
		}
	private int getResult(HashMap<String, String> hm) {
		// TODO Auto-generated method stub
		int sum=0;
		for(Map.Entry<String, String>e:hm.entrySet())
		{
		
			System.out.println("\n"+e.getKey()+":"+e.getKey()+"\n");
			if(e.getKey().equals(e.getValue()))
			{
				sum++;
			}
		}

		return sum;
	}
}
