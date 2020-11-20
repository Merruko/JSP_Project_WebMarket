<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page errorPage="exceptionNoProductId.jsp"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>商品詳細</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("商品をショッピングカートに入れますか？")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">商品詳細</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="resources\images\<%=product.getFilename()%>" style="width: 100%" />
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%>
				<p><b>商品コード：</b><span class="badge badge-danger"> <%=product.getProductId()%></span>
				<p><b>メーカー</b>：<%=product.getManufacturer()%>
				<p><b>カテゴリー</b>：<%=product.getCategory()%>
				<p><b>在庫量</b>：<%=product.getUnitsInStock()%>
				<h4><%=product.getUnitPrice()%>円</h4>
				<p><form name="addForm" action="./addCart.jsp?id=<%=product.getProductId()%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> 商品注文 &raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning"> ショッピングカート &raquo;</a> 
					<a href="./products.jsp" class="btn btn-secondary"> 商品リストへ &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>