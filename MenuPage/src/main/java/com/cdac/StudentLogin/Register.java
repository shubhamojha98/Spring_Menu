package com.cdac.StudentLogin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cdac.db.DBService;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out=resp.getWriter();
		resp.setContentType("text/html");
		
		String name=req.getParameter("name");
		int age=Integer.parseInt(req.getParameter("age"));
		String city=req.getParameter("city");
		String state=req.getParameter("state");
		String mobile=req.getParameter("mobile");
		String course=req.getParameter("course");
		
		try {
			Connection conn=DBService.getConnection();
//			Statement st=conn.createStatement();
//			String sql="insert into student (name,age,city,state,mobile,course) values('"+name+"',"+age+",'"+city+"','"+state+"','"+mobile+"','"+course+"')";
			PreparedStatement pst=conn.prepareStatement("insert into student (name,age,city,state,mobile,course) values(?,?,?,?,?,?)");
            pst.setString(1, name);
            pst.setInt(2, age);
            pst.setString(3, city);
            pst.setString(4, state);
            pst.setString(5, mobile);
            pst.setString(6, course);
	    
            int u=pst.executeUpdate();
//		int u=st.executeUpdate(sql);
		
		if(u>0) {
			out.println("<center><font color=green>Record Added...</font></center>");
			RequestDispatcher rd=req.getRequestDispatcher("ShowStudentResult.jsp");
			rd.include(req, resp);
//			out.println("Record Added....");
//			out.println("<br><a href=register.html>Add more</a>");
		}
		else {
			resp.sendRedirect("register.jsp");
		}
					
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	}
}
