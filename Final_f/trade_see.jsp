<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>신청 데이터 조회 및 삭제</title>
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
<h2>데이터 조회 및 삭제</h2>
<%
  Connection con = null;
  PreparedStatement pstmt = null;
  Statement stmt = null;
  String driverName = "com.mysql.cj.jdbc.Driver";
  String dbURL = "jdbc:mysql://localhost:3306/test";
  try {
    Class.forName(driverName);
    con = DriverManager.getConnection(dbURL, "root", "1234");

    // 삭제 로직
    String userIdToDelete = request.getParameter("UserId");
    String saleIdToDelete = request.getParameter("SaleId");
    if (userIdToDelete != null && saleIdToDelete != null) {
      String deleteQuery = "DELETE FROM trade_requests WHERE UserId = ? AND SaleId = ?";
      pstmt = con.prepareStatement(deleteQuery);
      pstmt.setString(1, userIdToDelete);
      pstmt.setString(2, saleIdToDelete);
      int deleteResult = pstmt.executeUpdate();
      if (deleteResult > 0) {
    	  
    	  out.println("<script type='text/javascript'>");
          out.println("alert('레코드 삭제에 성공하였습니다.');");
          out.println("</script>");
      } else {
    	  
    	  out.println("<script type='text/javascript'>");
    	  out.println("alert('레코드 삭제에 실패하였습니다.');");
          out.println("</script>");
      }
    }

    // 조회 로직
     stmt = con.createStatement();
	String loggedInUserId = (String) session.getAttribute("User");

	// Assuming "user_id" is the column name for the user identifier
	String query = "SELECT * FROM trade_requests WHERE UserId = '" + loggedInUserId + "'";
	ResultSet result = stmt.executeQuery(query);
%>
<table width=100% border=2 cellpadding=1>
  <tr>
    <td align=center><b>유저아이디</b></td>
    <td align=center><b>판매번호</b></td>
    <td align=center><b>코멘트</b></td>
    <td align=center><b>글 올린 작성시간</b></td>
    <td align=center><b>시작대여일</b></td>
    <td align=center><b>종료대여일</b></td>
    <td align=center><b>삭제</b></td>
  </tr>
  <% while (result.next()) { %>
  <tr>
    <td align=center><%= result.getString("UserId") %></td>
    <td align=center><%= result.getString("SaleId") %></td>
    <td align=center><%= result.getString("Comment") %></td>
    <td align=center><%= result.getString("RequestDate") %></td>
    <td align=center><%= result.getString("RentalStartDate") %></td>
    <td align=center><%= result.getString("RentalEndDate") %></td>
    <td align=center>
      <a href="trade_see.jsp?UserId=<%= result.getString("UserId") %>&SaleId=<%= result.getString("SaleId") %>">삭제</a>
    </td>
  </tr>
  <% }
    result.close();
  } catch(Exception e) {
    out.println("<p>데이터베이스 처리 중 오류가 발생했습니다.</p>");
    out.println("<p>" + e + "</p>");
    e.printStackTrace();
  } finally {
    if (pstmt != null) pstmt.close();
    if (stmt != null) stmt.close();
    if (con != null) con.close();
  }
  %>
</table>
</body>
</html>
