<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.cdac.db.DBService"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update database</title>
</head>
<body>

<s:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/cdacjan" user="root" var="mydb" password="syso"/>

<c:if test="${param.sid!=null}">
<s:query var="rs" dataSource="${mydb}">select * from student where stu_id=${param.sid};</s:query>

<fieldset>
<legend>update data</legend>
<pre>
<c:forEach var="row" items="${rs.rows}">
	<form action="Form.jsp" method="post">
	                       <input type="hidden" name="sid" value="${row.stu_id}">
	     Student Name : <input type="text" readonly="readonly" name="name" value="${row.name}">
	     Student Age  : <input type="text" readonly="readonly" name="age" value="${row.age}">
	     Student City : <input type="text" name="city" value="${row.city}">
	     Student state: <input type="text" name="state" value="${row.state}">
	     Mobile : <input type="text" name="mobile" value="${row.mobile}">
	     
	      <input type="submit" value="update" name="update">
	</form>
</c:forEach>
</pre>
</fieldset>
</c:if>

<c:if test="${param.update!=null}">
<s:update dataSource="${mydb}" var="u">
update student set mobile=?,city=?,state=? where stu_id=?;
<s:param value="${param.mobile}"/>
<s:param value="${param.city}"/>
<s:param value="${param.state}"/>
<s:param value="${param.sid}"/>
</s:update>

<% response.sendRedirect(request.getServletContext().getContextPath()+"/JSTLdemo/ShowStudentbyJSTL.jsp");%>
</c:if>

<%--
<c:if test="${param.update!=null}">
<%
Connection conn=DBService.getConnection();
PreparedStatement pst=conn.prepareStatement("update student set mobile=?,city=?,state=? where stu_id=?"); 
pst.setString(1, request.getParameter("mobile"));
pst.setString(2, request.getParameter("city"));
pst.setString(3,request.getParameter("state"));
pst.setInt(4, Integer.parseInt(request.getParameter("sid")));

int i=pst.executeUpdate();
if(i>0)
{
	response.sendRedirect(request.getServletContext().getContextPath()+"/JSTLdemo/ShowStudentbyJSTL.jsp");
}
%>
</c:if>
--%>
</body>
</html>