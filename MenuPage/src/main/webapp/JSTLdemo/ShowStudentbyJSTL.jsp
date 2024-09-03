<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- Setting connection with data base -->
<s:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/cdacjan" user="root" var="mydb" password="syso"/>

<s:query var="rs" dataSource="${mydb}">select * from student;</s:query>

<table border=1>
    <tr>
       <td>ID</td>
       <td>NAME</td>
       <td>AGE</td>
       <td>CITY</td>
       <td>STATE</td>
       <td>MOBILE</td>
       <td>COURSE</td>
       <td>UPDATE</td>
    </tr>
    
    <c:forEach var="row" items="${rs.rows}">
         <tr>
             <td>${row.stu_id}</td><td>${row.name}</td>
             <td>${row.age}</td><td>${row.city}</td>
             <td>${row.state}</td><td>${row.mobile}</td><td>${row.course}</td>
             <td><a href="Form.jsp?sid=${row.stu_id}">edit</a></td>
             
         </tr>
    </c:forEach>
</table>
</body>
</html>