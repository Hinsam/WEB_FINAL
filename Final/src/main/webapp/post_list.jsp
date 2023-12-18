<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시글 목록</title>
<style>
  body {
  	color: #574438;
  }
  table {
    border-collapse: collapse;
    width: 100%;
  }
  th, td {
    text-align: left;
    padding: 8px;
  }
  th {
    background-color: #F19759;
    color: #ffffff;
  }
  tr:nth-child(even) {
    background-color: #f2f2f2;
  }
  button {
    color: #ffffff;
    background-color: #F19759;
    border: 1px solid #F19759;
    border-radius: 5px;
    padding: 5px 10px;
    cursor: pointer;
  }
  button:hover {
    background-color: #ffffff;
    color: #F19759;
  }
</style>
</head>
<body>
<h1 style="text-align: center;">게시글 목록</h1>
<button type="button" onClick="location.href='post_new.jsp'">신규 글 작성</button>
<table border="1">
    <thead>
        <tr>
            <th>판매번호</th>
            <th>판매품</th>
            <th>ID</th>
            <th>설명</th>
            <th>기한</th>
            <th>가격</th>
            <th>액션</th>
        </tr>
    </thead>
    <tbody>
        <% 
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String db_address = "jdbc:mysql://localhost:3306/test";
                String db_username = "root";
                String db_pwd = "0000";
                
                Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
                
                String insertQuery = "SELECT * FROM sales ORDER BY SaleId DESC";
                PreparedStatement psmt = connection.prepareStatement(insertQuery);
                ResultSet result = psmt.executeQuery();
                
                while (result.next()) {
        %>
        <tr>
            <td><%=result.getInt("SaleId") %></td>
            <td><a href="post_read.jsp?SaleId=<%=result.getString("SaleId") %>"><%=result.getString("ItemName") %></a></td>
            <td><%=result.getString("UserId") %></td>
            <td><%=result.getString("ItemDescription") %></td>
            <td><%=result.getString("SaleDate") %></td>
            <td><%=result.getString("SalePrice") %></td>
            <td>
                <form action="post_modify.jsp" method="get">
                    <input type="hidden" name="SaleId" value="<%=result.getString("SaleId") %>">
                    <button type="submit">수정</button>
                </form>
                <form action="post_delete_send.jsp" method="get">
                    <input type="hidden" name="SaleId" value="<%=result.getString("SaleId") %>">
                    <button type="submit">삭제</button>
                </form>
            </td>
        </tr>
        <% 
                }
            } catch (Exception ex) {
                out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
            }
        %>
    </tbody>
</table>
</body>
</html>
