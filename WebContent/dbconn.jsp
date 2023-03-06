<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%> 

<%
	Connection conn = null;	

	try {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "HR";
		String password = "1234";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
		
	} catch (SQLException ex) {
		out.println("データベースの連結に失敗しました。<br>");
		out.println("SQLException: " + ex.getMessage());
	}
		
%>