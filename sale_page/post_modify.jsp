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
<title>글 수정</title>
</head>
<body>
    <h1>글 수정</h1>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String db_address = "jdbc:mysql://localhost:3306/test";
        String db_username = "root";
        String db_pwd = "0000";
        Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
        request.setCharacterEncoding("UTF-8");
        
        String SaleId = request.getParameter("SaleId");
        
        String insertQuery = "SELECT * FROM test WHERE SaleId=" + SaleId;
        
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        ResultSet result = psmt.executeQuery();
        
        while(result.next())
        {%>
            <form action="post_modify_send.jsp" method="post">
            <input type="hidden" name="SaleId" value="<%=result.getInt("SaleId") %>">
            <table border="1">
            <tr>
                <td>판매품</td>
                <td><input type="text" name="ItemName"></td>
            </tr>
            <tr>
                <td>ID</td>
                <td><input type="text" name="UserId"></td>
            </tr>
            <tr>
                <td>설명</td>
                <td><textarea rows="10" cols="20" name="ItemDescription"></textarea></td>
            </tr>
            <tr>
                <td>기한</td>
                <td><input type="date" name="SaleDate"></td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input type="text" name="SalePrice"></td>
            </tr>
            <tr>
                    <td colspan="2">
                        <button type="submit">수정</button>
                        <button type="button" onclick="location.href='post_list.jsp'">목록으로</button>
                        <button type="reset">원상복구</button>
                    </td>
                </tr>
            </table>
            </form>
    <%
        }
    }
    catch (Exception ex)
    {
    	out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
    }%>
</body>
</html>