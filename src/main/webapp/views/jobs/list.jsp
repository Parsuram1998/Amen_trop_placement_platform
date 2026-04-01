<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Jobs</title>
</head>

<body>

<h2>Available Jobs</h2>

<table border="1">

<tr>
<th>Title</th>
<th>Company</th>
<th>Location</th>
<th>Action</th>
</tr>

<c:forEach items="${jobs}" var="j">

<tr>

<td>${j.title}</td>
<td>${j.companyName}</td>
<td>${j.location}</td>

<td>

<a href="${pageContext.request.contextPath}/jobs/details?id=${j.id}">
View
</a>

</td>

</tr>

</c:forEach>

</table>

</body>
</html>