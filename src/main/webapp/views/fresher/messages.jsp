<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Messages</title>
</head>

<body>

<h2>Your Messages</h2>

<c:forEach items="${messages}" var="m">

<div style="border:1px solid #ccc; padding:10px; margin:10px;">

<b>From: ${m.senderName}</b><br><br>

<p>${m.content}</p>

</div>

</c:forEach>

<a href="${pageContext.request.contextPath}/fresher/dashboard">Back</a>

</body>
</html>