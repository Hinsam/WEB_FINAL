<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>신규 게시글 작성</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #F19759;
            margin: 0;
            padding: 40px;
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            color: #574438;
        }

        form {
            background: #ffffff;
            border: 1px solid #F19759;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 80%; /* 폼의 너비를 조정 */
            max-width: 600px; /* 최대 너비 설정 */
        }

        h1 {
            text-align: center;
            color: #574438;
            font-size: 2em;
            margin-top: 0; /* 제목의 위 여백 제거 */
            margin-bottom: 40px; /* 제목의 아래 여백 추가 */
        }

        table {
            width: 100%;
        }

        table td {
            padding: 20px;
        }

        input[type="text"],
        textarea,
        input[type="date"] {
            width: calc(100% - 40px);
            padding: 16px;
            margin-bottom: 20px;
            border: none;
          	border-bottom: 1px solid #cfcfcf;
        }

        button {
            padding: 16px 40px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            margin-right: 20px;
        }

        button[type="submit"] {
            background-color: #F19759;
            color: #fff;
        }

        button[type="button"] {
            background-color: #ddd;
            color: #333;
        }

        button[type="reset"] {
            background-color: #aaa;
            color: #fff;
        }
    </style>
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
