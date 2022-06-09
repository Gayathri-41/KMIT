<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.Driver.*" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.lang.Class" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="java.sql.Statement" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post">
UserName<input type="text" name="un"><br>
Password<input type="text" name="p">
<input type="submit"></form>
<%String un=request.getParameter("un");
String p=request.getParameter("p");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/books","root","Gayathri@16");
Statement stmt=con.createStatement();
stmt=con.createStatement();
ResultSet rs;
rs=stmt.executeQuery("select accno,title from book");

String uname="",pwd="";
int flag=0;

if(un!=null)
{
  while(rs.next())
  {
    uname=rs.getString("accno");
    pwd=rs.getString("title");
    if(un.equals(uname) && p.equals(pwd))
    {
     out.print("Record Found");
     flag=1;
     break;
     }
    }
  }
  if(un!=null && flag==0)
  {
  out.print("Username or password is incorrect!"+"<a href='login.jsp'> Retry</a>"); 
  }
  con.close();
  }
  catch(SQLException e)
  {
  out.print(e); 
  }
  catch(Exception e)
  {
  out.println(e);
  }
  %>
  
</body>
</html>