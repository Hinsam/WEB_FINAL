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
<title>�Խñ� ���</title>
</head>
<body>
	<form action="post_read.jsp" method="get">
		<h1>�Խñ� ���</h1>
		<%
			try
			{
				//JDBC ����̹� ����
				Class.forName("com.mysql.jdbc.Driver");
				String db_address = "jdbc:mysql://localhost:3306/test";
				String db_username = "root";
				String db_pwd = "1234";
				
				Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
				
				//MYSQL�� �����ϱ� ���� ������ ����
				String insertQuery = "SELECT * FROM sales ORDER BY SaleId DESC";
				PreparedStatement psmt = connection.prepareStatement(insertQuery);
				ResultSet result = psmt.executeQuery();%>
				
				<table border="1">
					<tr>
						<td colspan="5">
							<h3>�Խñ� ���� Ŭ���� �� ���� ����</h3>
						</td>
					</tr>
					<tr>
					    <td colspan="5">
					        <button type="button" value="�ű� �� �ۼ�" onClick="location.href='post_new.jsp'">�ű� �� �ۼ�</button>
					    </td>
					</tr>
					<tr>
						<td>�ǸŹ�ȣ</td>
						<td>�Ǹ�ǰ</td>
						<td>ID</td>
						<td>����</td>
						<td>����</td>
						<td>����</td>
					</tr>
					<%
					//�޾ƿ� ���� �Է���, �ϳ��� Ŀ���� �������� �ű�
					while (result.next())
					{%>
						<tr>
							<!-- db���� �޾ƿ� ����� ���̵� �Է� -->
							<td><%=result.getInt("SaleId") %></td>
							<td><a href="post_read.jsp?SaleId=<%=result.getString("SaleId") %>"><%=result.getString("ItemName") %></td>
							<!-- db���� �޾ƿ� ��ǰ �Է� -->
							<td><%=result.getString("UserId") %></td>
							<td><%=result.getString("ItemDescription") %></a></td>
							<td><%=result.getString("SaleDate") %></td>
							<td><%=result.getString("SalePrice") %></td>
							<td>
								<button type="button" value="����" onClick="location.href='post_modify.jsp?SaleId=<%=result.getString("SaleId") %>'">����</button>
								<button type="button" value="����" onClick="location.href='post_delete_send.jsp?SaleId=<%=result.getString("SaleId") %>'">����</button>
							</td>
						</tr>
					<%
					}%>
				</table>
			<%
			}
			catch (Exception ex)
			{
				out.println("������ �߻��߽��ϴ�. ���� �޽��� : " + ex.getMessage());
			}%>
	</form>
</body>
</html>