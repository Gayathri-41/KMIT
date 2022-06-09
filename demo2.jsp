<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border=2 bgcolor="grey">
<%
 int n=3;
 for(int i=0;i<n;i++)
 {
 %>
 <tr>
 <td>Number</td>
 <td><%= i+1 %></td>
 <td width=300>
 <select name="country">
 <option value=1>India</option>
 <option value=2>USA</option>
 <option value=3>UK</option>
 </select>
 </td>
 </tr>
 <%
 }
 %>
 </table>

</body>
</html>