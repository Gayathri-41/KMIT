<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.Driver" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="javax.sql.*" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.lang.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String euser="",fname="",lname="",age="",edesig="",contact="",mailid=""; %>

<% 
   	euser=request.getParameter("euser");
  	fname=request.getParameter("fname");
   	lname=request.getParameter("lname");
	age=request.getParameter("age");
	edesig=request.getParameter("edesig");
   	contact=request.getParameter("contact");
   	mailid=request.getParameter("mailid");
   	
   %>

<%
try
{
	//"com.mysql.jdbc.Driver"

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/poly", "root", "perk");
Statement st=conn.createStatement();

 st = conn.createStatement();
 String sql ="insert into employees(euser,fname,lname,age,edesig,contact,mailid) values('"+euser+"','"+fname+"','"+lname+"','"+age+"','"+edesig+"','"+contact+"','"+mailid+"')";
 st.executeUpdate(sql);
 
 out.println("Data is successfully inserted!");

}
catch(ClassNotFoundException ex)
{
%><h2>


<% out.println(ex);%>
</h2>
<% ex.printStackTrace();}
	catch(java.sql.SQLIntegrityConstraintViolationException e){
		out.print("Data insertion unsucesssful");
	}
%>
   </body>
</html>