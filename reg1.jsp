<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String userid=request.getParameter("userid");  
String pwd=request.getParameter("pwd");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname"); 
String email=request.getParameter("email");

Class.forName("com.mysql.jdbc.Driver");
 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/survey","root",""); 
Statement st1= con.createStatement();
String s="INSERT INTO users (user_id,password,fname,lname,email) VALUES ('"+userid+"','"+pwd+"','"+fname+"','"+lname+"','"+email+"')";
try{
st1.executeUpdate(s);
response.sendRedirect("http://localhost:8080/Survey/index.html");
}
catch(SQLException e)
{%>
<jsp:include page="reg.html"></jsp:include>
<p style="color:red" align="center">user already exists<p>
<%
}
%>