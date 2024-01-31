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
  
* {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
}
  .sidebar {
  			position: fixed;
            width: 60px;
            height: 100vh; 
            background: #ffffff;
            overflow: hidden;
            transition: 0.5s;

        }

        .sidebar:hover {
            width: 300px;
        }

        .sidebar ul {
            position: relative;
            height: 100vh;
        }

        .sidebar ul li {
            list-style: none;
        }

        .sidebar ul li:hover {
            background: #f3f3f3;
        }

        .sidebar ul li a {
            position: relative;
            display: flex;
            white-space: none;
            text-decoration: none; /* 링크 밑줄 제거 */
        }

        .sidebar ul li a .icon {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            min-width: 60px;
            height: 60px;
            font-size: 1.5em;
            color: #333333;
        }

        .sidebar ul li.logo {
            margin-bottom: 50px;
        }

        .sidebar ul li.logo .icon {
            font-size: 2em;
        }

        .sidebar ul li.logo .text {
            font-size: 1.2em;
            font-width: 500;
        }

        .sidebar ul li.logo:hover {
            background: #ffffff;
        }

        .sidebar ul li:hover a .text {
            color: #007bff;
            font-size: 110%;
        }

        .sidebar ul li a .text {
            position: relative;
            height: 60px;
            display: flex;
            align-items: center;
            font-size: 1em;
            color: #333;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .bottom {
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        .bottom .imgBox {
            position: relative;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            overflow: hidden;
        }

        .bottom .imgBox img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
  
  .main-content {
      margin-left: 60px;
      padding: 40px;
    }
  
  
</style>
</head>
<body>
<nav class="sidebar">
    <ul>
        <li class="logo">
            <a href="sale_main.html">
                <span class="icon"><ion-icon name="home-outline"></ion-icon></span>
                <span class="text">홈</span>
            </a>
        </li>
        <li>
            <a href="post_list.jsp">
                <span class="icon"><ion-icon name="mail-open-outline"></ion-icon></span>
                <span class="text">리스트</span>
            </a>
        </li>
        <li>
            <a href="approval.jsp ">
                <span class="icon"><ion-icon name="checkbox-outline"></ion-icon></span>
                <span class="text">승인 관리</span>
            </a>
        </li>

        <li>
            <a href="trade_see.jsp">
                <span class="icon"><ion-icon name="checkmark-done-circle-outline"></ion-icon></span>
                <span class="text">대여 신청</span>
            </a>
        </li>

        <section class="bottom">       
            <li>
            	<a>
          		    <span class="icon"><ion-icon name="toggle-outline"></ion-icon></span>
                    <span class="text"><%= (String) session.getAttribute("User")%></span>
            	</a>
            </li>
            
            <li>
                <a href="sale_main.html">
                    <span class="icon"><ion-icon name="log-out-outline"></ion-icon></span>
                    <span class="text">로그아웃</span>
                </a>
            </li>
        </section>
    </ul>

</nav>



<section class="main-content">
<h1 style="text-align: center;">게시글 목록</h1>
<button type="button" onClick="location.href='post_new.jsp'">신규 글 작성</button>
<table border="1">
    <thead>
        <tr>
            <th>판매번호</th>
            <th>대여품</th>
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
                String db_pwd = "1234";
                
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
</section>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
