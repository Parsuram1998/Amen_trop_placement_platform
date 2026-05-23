<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Set Your Password</title>
</head>
<body>

<h2>Set Your Password</h2>

<form action="/tpo/set-password" method="post">

    <input type="hidden" name="token" value="${token}" />

    New Password:
    <input type="password" name="password"/><br><br>

    <button type="submit">Set Password</button>

</form>

</body>
</html>