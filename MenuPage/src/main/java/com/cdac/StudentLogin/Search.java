package com.cdac.StudentLogin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cdac.db.DBService;

@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Connection conn=DBService.getConnection();
			String searchtype=req.getParameter("searchtype");	
			RequestDispatcher rd=req.getRequestDispatcher("Search.jsp");
			
			if(searchtype.equals("na"))
			{
				String msg="<center><font color=red>Select Search Type First</font></center>";
				req.setAttribute("msg", msg);
				rd.forward(req, resp);
			}
			else if (searchtype.equals("byid")) {
				PreparedStatement pst=conn.prepareStatement("select * from student where stu_id=?");
				int sid=Integer.parseInt(req.getParameter("search"));
				pst.setInt(1, sid);
				ResultSet rs=pst.executeQuery();
				if (rs.next()) {
					String msg="<center><font color=Green>Record Found</font></center>";
					req.setAttribute("msg", msg);
					req.setAttribute("rs", rs);
					rd.forward(req, resp);
				}else {
					String msg="<center><font color=Red>Record Not Found</font></center>";
					req.setAttribute("msg", msg);
					rd.forward(req, resp);
				}
				
			}
			else {
				PreparedStatement pst=conn.prepareStatement("select * from student where course=?");
				String course=req.getParameter("search");
				pst.setString(1, course);
				ResultSet rs=pst.executeQuery();
				if (rs.next()) {
					String msg="<center><font color=Green>Record Found</font></center>";
					req.setAttribute("msg", msg);
					req.setAttribute("rs", rs);
					rd.forward(req, resp);
				}else {
					String msg="<center><font color=Red>Record Not Found</font></center>";
					req.setAttribute("msg", msg);
					rd.forward(req, resp);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
