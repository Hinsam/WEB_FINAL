<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="KR">
<head>
	<meta charset="UTF-8">
	<title>추가 확인</title>
	<script>
		function SubmitForm() {
			let UserId = document.getElementById('UserId').value;
			let SaleId = document.getElementById('SaleId').value;
			let Comment = document.getElementById('Comment').value;
			let RequestDate = document.getElementById('RequestDate').value;
			let RentalStartDate = document.getElementById('RentalStartDate').value;
			let RentalEndDate = document.getElementById('RentalEndDate').value;

			let newWindow = window.open("", "_blank");
			let xmlhttp = new XMLHttpRequest();

			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					newWindow.document.body.innerHTML = xmlhttp.responseText; // 응답을 새 창에 표시

				}
			};
			var url = "SubmitFrom_Check.jsp?UserId=" + UserId + "&SaleId=" + SaleId +
					"&Comment=" + Comment + "&RequestDate=" + RequestDate +
					"&RentalStartDate=" + RentalStartDate + "&RentalEndDate=" + RentalEndDate;

			xmlhttp.open("GET", url, true);
			xmlhttp.send();
		}
	</script>
</head>
<body>
<h3>물품요청서</h3>
<hr>
<form action="SubmitFrom_check.jsp" method="post" target="_blank">
	본인 아이디 <input name="UserId" type="text" id="UserId">
	<br>
	희망 대여번호  <input name="SaleId" type="text" id="SaleId">
	<br>
	요청사항 <input name="Comment" type="textarea" value="요청합니다." id="Comment">
	<br>
	작성자 요청일 <input name="RequestDate" type="date" id="RequestDate">
	<br>
	시작대여일 <input name="RentalStartDate" type="date" id="RentalStartDate">
	<br>
	종료대여일 <input name="RentalEndDate" type="date" id="RentalEndDate">
	<br>
	<input name="submit" id="submit" type="submit" value="요청하기">
</form>
</body>
<div id="result">
</div>
</html>
