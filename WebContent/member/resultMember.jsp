<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>会員情報</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">会員情報</h1>
		</div>
	</div>
	<div class="container" align="center">
		<%
			String msg = request.getParameter("msg");

			if (msg != null) {
				if (msg.equals("0"))
					out.println(" <h2 class='alert alert-danger'>会員情報を修正しました。</h2>");
				else if (msg.equals("1"))
					out.println(" <h2 class='alert alert-danger'>ようこそ、WebMarketへ</h2>");
				else if (msg.equals("2")) {
					String loginId = (String) session.getAttribute("sessionId");
					out.println(" <h2 class='alert alert-danger'>" + loginId + "様 歓迎します。</h2>");
				}				
			} else {
				out.println("<h2 class='alert alert-danger'>会員情報を削除しました。</h2>");
			}
		%>
	</div>	
</body>
</html>