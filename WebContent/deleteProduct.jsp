<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	String productId = request.getParameter("id");

	PreparedStatement pstmt = null;	
	ResultSet rs = null;

	String sql = "SELECT * FROM wm_product";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		sql = "DELETE FROM wm_product WHERE p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.executeUpdate();
	} else
		out.println("一致する商品がありません。");
	
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("editProduct.jsp?edit=delete");
%>