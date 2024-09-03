
<%@page import="com.cdac.db.DBService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn=DBService.getConnection();
PreparedStatement pst=conn.prepareStatement("select * from student");
ResultSet rs=pst.executeQuery();
%>
<%
try{
	session =request.getSession(false);
	
	if(!(session!=null && session.getAttribute("usertype").equals("admin"))){
		  RequestDispatcher rd=request.getRequestDispatcher("Login_Session.jsp");
		  String msg="<center><font color=red>Login First</font></center>";
		  request.setAttribute("msg", msg);
		  rd.forward(request, response);
}

}catch(Exception e){
	response.sendRedirect("Login_Session.jsp");
}
%>

<a href="Logout">Logout</a>

<a href="register.jsp">Add New</a>

<table border=1>
    <tr>
       <th>ID</th>
       <th>NAME</th>
       <th>AGE</th>
       <th>CITY</th>
       <th>STATE</th>
       <th>CONTACT</th>
       <th>COURSE</th>
       <th>DELETE</th>
    </tr>
    <% while(rs.next()){ %>
    <tr>
       <td><%= rs.getInt(1) %></td>
       <td><%= rs.getString(2) %></td>
       <td><%= rs.getInt(3) %></td>
       <td><%= rs.getString(4) %></td>
       <td><%= rs.getString(5) %></td>
       <td><%= rs.getString(6) %></td>
       <td><%= rs.getString(7) %></td>
       <td><a href=DeleteRecord?sid=<%= rs.getInt(1)%>>Delete</a></td></td>
    </tr>    
    <%}%>
</table>
</body>
</html>