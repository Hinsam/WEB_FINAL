<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시글 목록</title>
</head>
<body>
	<form action="post_read.jsp" method="get">
		<h1>게시글 목록</h1>
		<%
			try
			{
				//JDBC 드라이버 연결
				Class.forName("com.mysql.jdbc.Driver");
				String db_address = "jdbc:mysql://localhost:3306/test";
				String db_username = "root";
				String db_pwd = "1234";
				
				Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
				
				//MYSQL로 전송하기 위한 쿼리문 선언
				String insertQuery = "SELECT * FROM sales ORDER BY SaleId DESC";
				PreparedStatement psmt = connection.prepareStatement(insertQuery);
				ResultSet result = psmt.executeQuery();%>
				
				<table border="1">
					<tr>
						<td colspan="5">
							<h3>게시글 제목 클릭시 상세 열람 가능</h3>
						</td>
					</tr>
					<tr>
					    <td colspan="5">
					        <button type="button" value="신규 글 작성" onClick="location.href='post_new.jsp'">신규 글 작성</button>
					    </td>
					</tr>
					<tr>
						<td>판매번호</td>
						<td>판매품</td>
						<td>ID</td>
						<td>설명</td>
						<td>기한</td>
						<td>가격</td>
					</tr>
					<%
					//받아온 정보 입력후, 하나씩 커서를 다음으로 옮김
					while (result.next())
					{%>
						<tr>
							<!-- db에서 받아온 사용자 아이디 입력 -->
							<td><%=result.getInt("SaleId") %></td>
							<td><a href="post_read.jsp?SaleId=<%=result.getString("SaleId") %>"><%=result.getString("ItemName") %></td>
							<!-- db에서 받아온 물품 입력 -->
							<td><%=result.getString("UserId") %></td>
							<td><%=result.getString("ItemDescription") %></a></td>
							<td><%=result.getString("SaleDate") %></td>
							<td><%=result.getString("SalePrice") %></td>
							<td>
								<button type="button" value="수정" onClick="location.href='post_modify.jsp?SaleId=<%=result.getString("SaleId") %>'">수정</button>
								<button type="button" value="삭제" onClick="location.href='post_delete_send.jsp?SaleId=<%=result.getString("SaleId") %>'">삭제</button>
							</td>
						</tr>
					<%
					}%>
				</table>
			<%
			}
			catch (Exception ex)
			{
				out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
			}%>
	</form>
</body>
</html>