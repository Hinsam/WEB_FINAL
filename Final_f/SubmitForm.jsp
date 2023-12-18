<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %> 
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="KR">
<head>
	<meta charset="UTF-8">
	<title>추가 확인</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f4f4f4;
			margin: 0;
			padding: 20px;
			color: #333;
		}

		h3 {
			color: #333;
		}

		form {
			background-color: #fff;
			padding: 20px;
			border-radius: 8px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}

		input[type="text"],  input[type="tel"],
		input[type="date"], input[type="textarea"] {
			width: 100%;
			padding: 10px;
			margin: 10px 0;
			border: 1px solid #ddd;
			border-radius: 4px;
			box-sizing: border-box;
		}

		input[type="textarea"] {
			height: 100px;
			resize: vertical;
		}

		input[type="submit"] {
			background-color: #F19759;
			color: white;
			padding: 12px 20px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}

		input[type="submit"]:hover {
			background-color: #F19759;
		}

		form > br {
			display: none;
		}
	</style>
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
<hr>
<%
	boolean isPost = "POST".equalsIgnoreCase(request.getMethod());
	if (isPost) {
		Connection con = null;
		PreparedStatement insertPstmt = null;
		String driverName = "com.mysql.cj.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/test";
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(dbURL, "root", "1234");

			String userId = request.getParameter("UserId");
			String saleId = request.getParameter("SaleId");
			String comment = request.getParameter("Comment");
			String requestDate = request.getParameter("RequestDate");
			String rentalStartDate = request.getParameter("RentalStartDate");
			String rentalEndDate = request.getParameter("RentalEndDate");

			String insertQuery = "INSERT INTO trade_requests (UserId, SaleId, Comment, RequestDate, RentalStartDate, RentalEndDate) VALUES (?, ?, ?, ?, ?, ?)";
			insertPstmt = con.prepareStatement(insertQuery);
			insertPstmt.setString(1, userId);
			insertPstmt.setString(2, saleId);
			insertPstmt.setString(3, comment);
			insertPstmt.setString(4, requestDate);
			insertPstmt.setString(5, rentalStartDate);
			insertPstmt.setString(6, rentalEndDate);

			int result = insertPstmt.executeUpdate();
			if (result > 0) {
				response.sendRedirect("trade_see.jsp"); // 성공 시 리다이렉트
			} else {
				out.println("<p>데이터 추가에 실패했습니다.</p>"); // 실패 시 메시지 출력
			}
		} catch (Exception e) {
			out.println("<p>데이터 추가 중 오류가 발생했습니다.</p>");
			out.println("<p>" + e + "</p>");
			e.printStackTrace();
		} finally {
			if (insertPstmt != null) insertPstmt.close();
			if (con != null) con.close();
		}
	} else {
%>

<H2> 요청서 페이지 </H2>
<form action="" method="post">
	본인 아이디 <input name="UserId" type="text" id="UserId" value="<%= (String) session.getAttribute("User")%>" readonly>
	<br>
	대여번호 <input name="SaleId" type="text" id="SaleId" value="<%= request.getParameter("SaleId")%>" readonly>
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
<%
	}
%>
</body>
</html>
