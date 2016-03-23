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


public class store extends HttpServlet{
	public static HashMap<String,String> hm=new HashMap<String,String>();//for ques and its correct ans
	public static HashMap<String,String> um=new HashMap<String,String>();// for ques and user ans
	public int num;
	   public String question;
	    public String a[];
	    public String ans;
	    private static int result=0;
	    int c=0;
	    PrintWriter out;
	 
public void put(String ques,String ans)
{
	
	//HashMap<String, String> userDetails = (HashMap) session .getAttribute("user"); 
	if(hm.get(ques)==null)
	{
		hm.put(ques, ans);
	}
	else 
	{
		for(Map.Entry<String, String> e:hm.entrySet())
		{
			if(e.getKey().equals(ques))
			{
				e.setValue(ans);
			}
		}
	}
	System.out.print("instore:"+hm);
}
public void getAll(int i) throws ParserConfigurationException, SAXException, IOException
{
	num=i;
	a=new String[4];
    hm=new HashMap<String,String>();	
	DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
    DocumentBuilder db =dbf.newDocumentBuilder();
    Document doc=db.parse("C:\\Users\\DEEPIKA REDDY\\Desktop\\new J2ee\\Quizzes\\linux-quiz-1.xml");
    NodeList nl = doc.getElementsByTagName("question");
    
	NodeList question1=    doc.getElementsByTagName("quizquestion");
	Element qElements=(Element)question1.item(i);
	question=qElements.getChildNodes().item(0).getNodeValue();


	NodeList ans1=    doc.getElementsByTagName("ansone");
	Element ansElements1=(Element)ans1.item(i);
	a[c]=ansElements1.getChildNodes().item(0).getNodeValue();c++;

	NodeList ans2=    doc.getElementsByTagName("anstwo");
	Element ansElements2=(Element)ans2.item(i);
	 a[c]=ansElements2.getChildNodes().item(0).getNodeValue();c++;

	NodeList ans3=    doc.getElementsByTagName("anstre");
	Element ansElements3=(Element)ans3.item(i);
	a[c]=ansElements3.getChildNodes().item(0).getNodeValue();c++;

	NodeList ans4=    doc.getElementsByTagName("ansfor");
	Element ansElements4=(Element)ans4.item(i);
	a[c]=ansElements4.getChildNodes().item(0).getNodeValue();c++;
	//onclick="document.location.href='javaquiz1.jsp'">
	NodeList c=    doc.getElementsByTagName("correct");
	Element cElements=(Element)c.item(i);
	ans=cElements.getChildNodes().item(0).getNodeValue();
      System.out.print("answer fetchede from store:"+ans);
 //     return ans;
}

}
