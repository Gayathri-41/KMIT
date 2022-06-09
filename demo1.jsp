<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Driver" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import=java.sql.SQLException %>
<%@ page import=javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.Class" %>
<%@ page import="java.sql.Statement" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post">
Accno=<input type="text" name="un"><br>
Title=<input type="text" name="p">
<input type="submit">
</form>
<%
String un=request.getParameter("un");
String p=request.getParameter("P");
try{
Class.forName("com.mysql.cj.jdbc.Driver");
//Establish connection to databse server
Connection com=DriverManager.getConnection("jdbc:mysql://localhost:3306/const","root","Gayathri@16");
Statement stmt=com.createStatement();
stmt=com.createStatement();
ResultSet rs;
rs=stmt.executeQuery("select accno,title from book");
String accn="",tit="";
int flag=0;
if(un!=null)
{
	while(rs.next())
	{
		accn=rs.getString("accno");
		tit=rs.getString("title");
		if(un.equals(accn) && p.equals(tit))
		{
			out.print("Record Found");
			flag=1;
			break;
		}
	}
}
if(un!=null && flag==0)
{
	out.println("Book accno title is incorrect!"+"<a href='project.jsp'>Retry</a>");
}
com.close();
}
catch(SQLException e){
	out.println(e);
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>
