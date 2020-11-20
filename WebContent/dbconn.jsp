<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%> 

<%
	Connection conn = null;	

	try {
		String url = "jdbc:mysql://localhost:3306/HRDB?useUnicode=true&characterEncoding=utf8";
		String user = "root";
		String password = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		
	} catch (SQLException ex) {
		out.println("データベースの連結に失敗しました。<br>");
		out.println("SQLException: " + ex.getMessage());
	}
		
%>