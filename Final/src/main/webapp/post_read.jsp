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
        <style>
        body {
            font-family: Arial, sans-serif;
            color: #000000;
            background-color: #F19759;
            padding: 20px;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        h1 {
            margin-bottom: 20px;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            max-width: 800px;
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #F19759;
            color: #ffffff;
        }

        tr:nth-child(even) {
            background-color: rgba(0, 0, 0, 0.05);
        }

        tr:hover {
            background-color: rgba(0, 0, 0, 0.1);
        }

        button {
            padding: 8px 16px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: #ffffff;
            background-color: #F19759;
            transition: background-color 0.3s ease-in-out;
        }

        button:hover {
            background-color: #ffffff;
            color: #F19759;
        }
    </style>
</head>
<body>
    <h1>게시글 상세 열람</h1>
    <%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String db_address = "jdbc:mysql://localhost:3306/test";
        String db_username = "root";
        String db_pwd = "0000";
        Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);

        request.setCharacterEncoding("UTF-8");

        String SaleId = request.getParameter("SaleId");

        String insertQuery = "SELECT * FROM sales WHERE SaleId=" + SaleId;

        PreparedStatement psmt = connection.prepareStatement(insertQuery);

        ResultSet result = psmt.executeQuery();
        %>

        <table>
            <%
            while(result.next()) {
                %>
                <tr>
                    <th>목록</th>
                    <th>내용</th>
                </tr>
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
            }
            %>
        </table>
        <%
    } catch (Exception ex) {
        out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
    }
    %>
</body>
</html>
