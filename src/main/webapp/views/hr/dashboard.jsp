<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>HR Dashboard</title>
</head>

<body>

<h2>HR Dashboard</h2>

<ul>

<li>
<a href="${pageContext.request.contextPath}/hr/freshers">
View Selected Freshers
</a>
</li>

<li>
<a href="${pageContext.request.contextPath}/hr/professionals">
View Professionals
</a>
</li>
<li>
<a href="${pageContext.request.contextPath}/candidates">
Select Candidates
</a>
</li>
<li>
<a href="${pageContext.request.contextPath}/hr/stats">
View and update candidates
</a>
</li>
<li>
<a href="${pageContext.request.contextPath}/logout">
Logout
</a>
</li>

</ul>

</body>
</html>