<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>신규 게시글 작성</title>
</head>
<body>
    <h1>신규 게시글 작성</h1>
    <form action="post_new_send.jsp" method="post">
        <table>
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
                    <button type="submit">저장</button>
                    <button type="button" onclick="location.href='post_list.jsp'">목록으로</button>
                    <button type="reset">초기화</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>