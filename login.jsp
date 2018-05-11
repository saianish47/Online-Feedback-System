<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String userid=request.getParameter("user");  
String pwd=request.getParameter("pwd"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/survey","root","");<!-- username is 'root' and there is no password for my database so its empty string-->
Statement st1= con.createStatement(); 
ResultSet rs=st1.executeQuery("select * from users where user_id='"+userid+"' ");
Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery("select * from usrsur where user_id='"+userid+"'");
if(rs2.next())
{
	session.invalidate();
	%>
	<p style="color:red" align="center">User has taken the Survey</p>
<jsp:include page="index.html"></jsp:include>
<%}
else
{
if(rs.next()) 
{ 
if(rs.getString(2).equals(pwd)) 
{
session.setAttribute("userid",userid);
response.sendRedirect("http://localhost:8080/Survey/sur1.jsp");
out.println("welcome"+userid); 
}
else 
{ %>
<p style="color:red" align="center">wrong password<p>
<jsp:include page="index.html"></jsp:include>
<%
} 
}
else 
{ %>
<p style="color:red" align="center">wrong username or password<p>
<jsp:include page="index.html"></jsp:include>
<%
}
} 
%>

