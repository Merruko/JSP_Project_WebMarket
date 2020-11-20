function CheckAddProduct() {

	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	
	// 상품 아이디 체크
	if (!check(/^P[0-9]{4,11}$/, productId,
			"[商品コード]\nPと数字を組み合わせて5~12文字です。\n最初の文字は必ずPにしてください。"))
		return false;
	// 상품명 체크
	if (name.value.length < 4 || name.value.length > 12) {
		alert("[商品名]\n最小4文字から最大50文字までです。");
		name.select();
		name.focus();
		return false;
	}
	// 상품 가격 체크
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[価格]\n数字だけ入力してください。");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}

	if (unitPrice.value < 0) {
		alert("[価格]\n負数は入力できません。");
		unitPrice.select();
		unitPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice,
			"[価格]\n小数点第二位まで入力してください。"))
		return false;

	// 재고 수 체크
	if (isNaN(unitsInStock.value)) {
		alert("[在庫量]\n数字だけ入力してください。");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}

	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	 document.newProduct.submit()
}