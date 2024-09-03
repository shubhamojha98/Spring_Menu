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


@WebServlet("/DeleteRecord")
public class DeleteRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DeleteRecord() {
        super();
        
    }

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		PrintWriter out=resp.getWriter();
		resp.setContentType("text/html");
		
		try {
			Connection conn=DBService.getConnection();
			PreparedStatement pst=conn.prepareStatement("delete from student where stu_id=?");
			int sid=Integer.parseInt(req.getParameter("sid"));
			pst.setInt(1, sid);
			int i=pst.executeUpdate();
			
			
			if(i>0) {
				out.println("<center><font color=green>Record deleted...</font></center>");
				RequestDispatcher rd=req.getRequestDispatcher("ShowStudentRecord");
				rd.include(req, resp);
//				out.println("Record Added....");
//				out.println("<br><a href=register.html>Add more</a>");
			}
			else {
				out.println("<center><font color=red>Record not deleted...</font></center>");
				RequestDispatcher rd=req.getRequestDispatcher("ShowStudentResult.jsp");
				rd.include(req, resp);
			}
		} catch (Exception e) {
			
		}
		
	}

	
}
