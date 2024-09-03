package com.cdac.StudentLogin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cdac.db.DBService;


@WebServlet("/LoginSession")
public class Login_Session extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Login_Session() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	PrintWriter out=resp.getWriter();
    	resp.setContentType("test/html");
    	 try {
    		Connection conn=DBService.getConnection();
    		PreparedStatement pst=conn.prepareStatement("select * from login where user_id=? and password=?");
    		String uid=req.getParameter("username");
    		String pass=req.getParameter("password");
    		pst.setString(1, uid);
    		pst.setString(2, pass);
    		ResultSet rs=pst.executeQuery();
    		
    		if(rs.next()){
    			if(rs.getString("usertype").equals("admin")) {
    				HttpSession hs=req.getSession();
    				
    				hs.setAttribute("usertype", rs.getString("usertype"));
    				hs.setAttribute("user", rs.getString("user_id"));
    				RequestDispatcher rd=req.getRequestDispatcher("HomePage.jsp");
    				rd.forward(req, resp);
    			}
    			else {
    				resp.sendRedirect("WellcomeStudent.jsp");
    			}
    		}else {
    			RequestDispatcher rd=req.getRequestDispatcher("Login_Session.jsp");
    			String msg="<center><font color=red>Inalid UserId</font></center>";
    			req.setAttribute("msg", msg);
    			rd.forward(req, resp);
    		}
    	} catch (Exception e) {
    		out.println(e.getMessage());
    	}
    	 
    }
}
