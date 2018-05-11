import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

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


public class sur1 extends HttpServlet {
 
  private String message;

  public void init() throws ServletException
  {

  }
  
  public void doGet(HttpServletRequest request, HttpServletResponse response)
throws IOException{
	response.setContentType("text/html");

   
    
}

  public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
  {
	
  
      response.setContentType("text/html");

   
      PrintWriter out = response.getWriter();
	  HttpSession session=request.getSession();
	  try{
		  if((String)session.getAttribute("userid")==null)
		  response.sendRedirect("http://localhost:8080/Survey/index.html");
	  }
	  catch(Exception e)
	  {
		  response.sendRedirect("http://localhost:8080/Survey/index.html");
	  }
	  String userid=(String)session.getAttribute("userid");
	  
	  
	  out.println("<html>");
	  out.println("<body>");
      out.println("<center>");
	  out.println("<h1>"+"Survey successful"+"</h1>");
	int count=0;
	
	String a=request.getParameter("a");
	String b=request.getParameter("b");
	String c=request.getParameter("c");
	String d=request.getParameter("d");
	String e=request.getParameter("e");
	  
	if(session.getAttribute("userid")==null)
        {
            response.sendRedirect("http://localhost:8080/Survey/index.html");
        }
	else
	{
        try
        {
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/survey","root",""); 
		Statement st1= con.createStatement();
		String s="INSERT INTO usrsur (user_id,a,b,c,d,e) VALUES ('"+userid+"','"+a+"','"+b+"','"+c+"','"+d+"','"+e+"')";//make sure to create the database and number of questions must be equal to those alphabets 
		try{
		st1.executeUpdate(s);
		session.invalidate();
		}
		catch(Exception es)
		{
			out.println(es+"abc");
		}
		
		
		}
        catch(Exception es)
        {
			out.println(es+"def");
        }
	} 
  }
  
  public void destroy()
  {
  }
}