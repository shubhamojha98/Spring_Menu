<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<c:forEach begin="1" end="10" var="i" step="1">
    5x${i} = ${5*i}<br>
</c:forEach>

<select>
<option>Year</option>
<c:forEach begin="1950" end="2023" var="i" step="1">
optio
</c:forEach>
</select>
</body>
</html>