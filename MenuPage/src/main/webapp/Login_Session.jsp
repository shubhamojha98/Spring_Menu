<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="RegisterStyle.css">
</head>
<body>

    <div class="container">
    <div class="title">Registration</div>
    <div class="content">
      <form action="LoginSession" method="post">
        <div class="user-details">
          
          <div class="input-box">
            <span class="details">User Name</span>
            <input type="text" placeholder="Enter your User Name" name="username" required>
          </div>
     
          <div class="input-box">
            <span class="details">Password</span>
            <input type="text" placeholder="Enter employee password" name="password" required>
          </div>         
        
        <div class="button">
          <input type="submit" value="Register">          
        </div>
        
        <%if(request.getAttribute("msg")!=null){
        	out.println(request.getAttribute("msg"));
        }        
        %>
      </form>
    </div>
  </div>
 <%
             session=request.getSession(false);
             if(session==null){
            	 
            	// out.println("This is dell");
             }
             else{
            	 
            	 Object usertype=session.getAttribute("usertype");
            	// out.println("Result is "+usertype);
            	 
            	 if(usertype!=null && usertype.toString().equals("admin")){
            		 
            		 response.sendRedirect("ShowStudentResult.jsp");
            	 }
            	 else if(usertype!=null){
            		 response.sendRedirect("Login_Session.jsp");
            		 
            	 }
             }
             
             %>
</body>
 
</html>