<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대여 요청서</title>
</head>
<body>
	<h2>대여 요청서 </h2>
	
	
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="SubmitForm" class="javabean.SubmitForm" scope="page" />

	<jsp:setProperty name="SubmitForm" property="*"/>

	ID: <jsp:getProperty name="SubmitForm" property="id" /><BR>
	이름: <jsp:getProperty name="SubmitForm" property="name" /><BR>
	주소: <jsp:getProperty name="SubmitForm" property="address" /><BR>
	연락처: <jsp:getProperty name="SubmitForm" property="phone" />(<jsp:getProperty name="student" property="year" />)<BR>
	기한: <jsp:getProperty name="SubmitForm" property="date" /><BR>
	요청의 말: <jsp:getProperty name="SubmitForm" property="feedback" /><BR>

	
</body>
</html>