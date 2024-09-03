package com.cdac.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBService{

	private static Connection conn=null;
	
	static {
		try {
			String url="jdbc:mysql://localhost:3306/cdacjan";
			String user="root";		
			String password="syso";
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,password);
		if(conn!=null) {
		   System.out.println("Connection is done");
		}
		else {
			System.out.println("Connection is not done");
		}
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			
		}		
	}

	public static Connection getConnection() {
		return conn;
	}
}

