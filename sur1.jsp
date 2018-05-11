<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>


<!DOCTYPE html>

<% 
if(session.getAttribute("userid")==null)
	response.sendRedirect("http://localhost:8080/Survey/index.html");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/survey","root",""); 
Statement st1= con1.createStatement(); 
String userid=(String)session.getAttribute("userid");
ResultSet rs=st1.executeQuery("select * from usrsur where user_id='"+userid+"' ");
if(rs.next())
{
  response.sendRedirect("http://localhost:8080/Survey/index.html");	
}
else{
	%>
<html>
<input type="hidden" id="refreshed" value="no">




<body >
<center>
<h1>CITY FEEDBACK SYSTEM</h1>
<div style="font-weight: bold" id="quiz-time-left"></div>
</center>

<form name="form1" action="sur1" method="post">
            
			
	<h2> 1.	Which city do you live ? </h2><!-- Question 1-->
			<br>
			<input type="radio" name="a" value="Hyderabad">Hyderabad<br>
			<input type="radio" name="a" value="Bangalore">Bangalore<br>
			<input type="radio" name="a" value="Mumbai">Mumbai<br>
			<input type="radio" name="a" value="Other">Other<br>
			
		<hr>	<h2>2.Is your city clean? </h2><!-- Question 2--> 
			<br>
			<input type="radio" name="b" value="Yes">Yes<br>
			<input type="radio" name="b" value="No">No<br>
			<input type="radio" name="b" value="Somewhat">Somewhat<br>
			<input type="radio" name="b" value="Not at all">Not at all<br>
			
		<hr><h2>	3. Are you satisfied with the streets?</h2><!-- Question 3-->
			<br>
			<input type="radio" name="c" value="Yes">Yes <br>
			<input type="radio" name="c" value="No">No<br>
			<input type="radio" name="c" value="Somewhat">Somewhat <br>
			<input type="radio" name="c" value="Not at all">Not at all<br>
			
	<hr>	<h2>	4.	Are your queries being answered?</h2>
			<br>
			
			<input type="radio" name="d" value="Yes">Yes <br>
			<input type="radio" name="d" value="No">No<br>
			<input type="radio" name="d" value="Somewhat">Somewhat <br>
			<input type="radio" name="d" value="Not at all">Not at all<br>
			
	<hr>	<h2>	5.	Please specify if any other query: </h2>
			<br>
			<textarea rows="4" cols="50" name="e"></textarea><br>
			
			
	<hr>
		<center>
		<input type="submit" value="submit" name="sub">
		</center>
    </form>
</body>
<%}%>













</html>