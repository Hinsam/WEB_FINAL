<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>신청 데이터 조회 및 삭제</title>
  <style>
  * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
	}
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

<h2>신청 데이터 조회</h2>

<%
  Connection con = null;
  Connection conn = null;
  PreparedStatement pstmt = null;
  Statement stmt = null;
  String driverName = "com.mysql.cj.jdbc.Driver";
  String dbURL = "jdbc:mysql://localhost:3306/test";
  try {
    Class.forName(driverName);
    con = DriverManager.getConnection(dbURL, "root", "1234");
    conn = DriverManager.getConnection(dbURL, "root", "1234");
    
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
<section class="main-content">
<table width=100% border=2 cellpadding=1>
  <tr>
    <td align=center><b>판매번호</b></td>
    <td align=center><b>코멘트</b></td>
    <td align=center><b>글 올린 작성시간</b></td>
    <td align=center><b>시작대여일</b></td>
    <td align=center><b>종료대여일</b></td>
    <td align=center><b>승인여부</b></td>
    <td align=center><b>삭제</b></td>
  </tr>
  <% while (result.next()) { %>
  <tr>
  	<% String sale = result.getString("SaleId"); %>
    <td align=center><a href="post_read.jsp?SaleId=<%=result.getString("SaleId") %>"  target="_blank"><%= sale%></a></td>
    <td align=center><%= result.getString("Comment") %></td>
    <td align=center><%= result.getString("RequestDate") %></td>
    <td align=center><%= result.getString("RentalStartDate") %></td>
    <td align=center><%= result.getString("RentalEndDate") %></td>
    <% String approve = result.getString("approval");
   	   if ("승인".equals(approve)) {
   			PreparedStatement tmt;
   			String qu = "SELECT u.phone FROM user u JOIN trade_requests tr ON u.Id = tr.UserId JOIN sales s ON tr.SaleId = s.SaleId WHERE tr.SaleId = ?";
   	      	tmt = conn.prepareStatement(qu);
   	      	tmt.setString(1, sale);
   	     
   	     	String resultPhone = null;

   	    	ResultSet resultSet = tmt.executeQuery();
   	    
   	   		 // 결과가 있다면 첫 번째 행의 값을 얻어옴
   	   		if (resultSet.next()) {
   	      	  resultPhone = resultSet.getString("phone");
   	  		  }
   	    
   	   		// 결과를 String 변수에 저장
   	   		String resultString = resultPhone;

   	 		// 사용이 끝난 자원을 정리
   	   		resultSet.close();
   	    	tmt.close();
   	    	
   	    	approve = resultPhone;
   	   }
    %>
    <td align=center><%= approve %></td>
    
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
</section>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
