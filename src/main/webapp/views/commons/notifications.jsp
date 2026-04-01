<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notifications</title>
</head>
<body>
<h2>Notifications</h2>

<c:forEach items="${notifications}" var="n">

<div style="border:1px solid #ccc; padding:10px; margin:10px;">
    ${n.message}
    <br>
    <small>${n.createdAt}</small>
</div>

</c:forEach>
</body>
</html>