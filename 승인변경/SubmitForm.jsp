<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>데이터 조회 및 삭제</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f4f4f4;
			color: #333;
			margin: 0;
			padding: 0;
		}

		.container {
			width: 90%;
			margin: auto;
			overflow: hidden;
		}

		h2 {
			background-color: #F19759;
			color: #fff;
			text-align: center;
			padding: 10px 0;
			margin: 10px auto;
			border-radius: 25px;
			width: 700px;
		}
		table {
			width: 100%;
			border-collapse: collapse;
			margin: 20px 0;
		}
		table, th, td {
			border: 1px solid #ddd;
			padding: 10px;
		}
		th {
			background-color: #F19759;
			color: #fff;
		}
		td {
			text-align: center;
			background-color: #fff;
			color: #333;
		}
		a {
			color: #F19759;
			text-decoration: none;
		}
		a:hover {
			text-decoration: underline;
		}

	</style>
</head>
<body>
<h2>승인 상태 변경</h2>
<%
	Connection con = null;
	Statement stmt = null;
	String driverName = "com.mysql.cj.jdbc.Driver";
	String dbURL = "jdbc:mysql://localhost:3309/test";
	try {
		Class.forName(driverName);
		con = DriverManager.getConnection(dbURL, "root", "1234");

		// 조회 로직
		stmt = con.createStatement();
		ResultSet result = stmt.executeQuery("SELECT * FROM trade_requests;");
%>
<table width=100% border=3 cellpadding=1>
	<tr>
		<th>유저아이디</th>
		<th>판매번호</th>
		<th>코멘트</th>
		<th>시작대여일</th>
		<th>종료대여일</th>
		<th>승인요청</th>
	</tr>
	<% while (result.next()) { %>
	<tr>
		<td><%= result.getString("UserId") %></td>
		<td><%= result.getString("SaleId") %></td>
		<td><%= result.getString("Comment") %></td>
		<td><%= result.getString("RentalStartDate") %></td>
		<td><%= result.getString("approval") %></td>
		<td>
			<form action="SubmitForm_check.jsp" method="post">
				<input type="hidden" name="UserIdToApprove" value="<%= result.getString("UserId") %>">
				<input type="hidden" name="SaleIdToApprove" value="<%= result.getString("SaleId") %>">
				<select name="type_form">
					<option value="승인">승인</option>
					<option value="대기중">대기 중</option>
					<option value="거부">거부</option>
				</select>
				<input type="submit" value="변경">
			</form>
		</td>
	</tr>
	<% }
		result.close();
	} catch(Exception e) {
		out.println("<p>데이터베이스 처리 중 오류가 발생했습니다.</p>");
		out.println(e);
		e.printStackTrace();
	} finally {
		if (stmt != null) stmt.close();
		if (con != null) con.close();
	}
	%>
</table>
</body>
</html>
</html>
