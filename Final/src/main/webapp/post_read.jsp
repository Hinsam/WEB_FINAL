<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시글 상세 열람</title>
</head>
<body>
    <h1>게시글 상세 열람</h1>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
		String db_address = "jdbc:mysql://localhost:3306/test";
		String db_username = "root";
		String db_pwd = "1234";
		Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
        request.setCharacterEncoding("UTF-8");
        
        String SaleId = request.getParameter("SaleId");
        
        String insertQuery = "SELECT * FROM sales WHERE SaleId=" + SaleId;
        
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        ResultSet result = psmt.executeQuery(); %>
        
        <table border="1">
            <%
            while(result.next())
            {%>
            	<tr>
            	    <td>판매번호</td>
            	    <td><%=result.getInt("SaleId") %></td>
            	</tr>
            	<tr>
            	    <td>판매품</td>
            	    <td><%=result.getString("ItemName") %></td>
            	</tr>
            	<tr>
            	    <td>ID</td>
            	    <td><%=result.getString("UserId") %></td>
            	</tr>
            	<tr>
            	    <td>설명</td>
            	    <td><%=result.getString("ItemDescription") %></td>
            	</tr>
            	<tr>
            	    <td>기한</td>
            	    <td><%=result.getString("SaleDate") %></td>
            	</tr>
            	<tr>
            	    <td>가격</td>
            	    <td><%=result.getString("SalePrice") %></td>
            	</tr>
            	<tr>
            	    <td colspan="2">
            	        <button type=button onclick="location.href='post_list.jsp'">목록으로</button>
            	        <button type=button onclick="location.href='SubmitForm.jsp'">요청하기</button>
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

</body>
</html>