<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
 <link rel="stylesheet" href="RegisterStyle.css">
</head>
<body>
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
<div class="container">
    <div class="title">Registration</div>
    <div class="content">
      <form action="Register" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Name</span>
            <input type="text" placeholder="Enter your name" name="name" required>
          </div>
          <div class="input-box">
            <span class="details">Age</span>
            <input type="text" placeholder="Enter your Age" name="age" required>
          </div>
          <div class="input-box">
            <span class="details">state</span>
	            <select name="state">
	                <option>--Select State--</option>
	                <option value="Bihar">Bihar</option>
	                <option value="Maharastra">Maharashtra</option>
	                <option value="Delhi">Delhi</option>
	                <option value="up">up</option>
	                <option value="MP">MP</option>
	            </select>
          </div>
          
          <div class="input-box">
            <span class="details">City</span>
               <select name="city">
                   <option>--Select City--</option>
                  <option value="Patna">Patna</option>
                  <option value="Mumbai">Mumbai</option>
                  <option value="Gurgaon">Gurgaon</option>
                  <option value="pune">pune</option>
                  <option value="Bhopal">Bhopal</option>
               </select>
          </div>
          
          <div class="input-box">
            <span class="details">Mobile Number</span>
            <input type="text" placeholder="Enter your Mobile Number" name="mobile" required>
          </div>
          
          <div class="input-box">
            <span class="details">Course</span>
             <select name="course">
                <option>--select course--</option>
                <option value="PGDAC">PGDAC</option>
                <option value="MBA">MBA</option>
                <option value="BE">BE</option>
             </select>
          </div>
        </div>
        
        
        <div class="button">
          <input type="submit" value="Register">
        </div>
      </form>
    </div>
  </div>
</body>
</html>