<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Verified Professionals</title>
</head>

<body>

<h2>Verified Professionals</h2>

<table border="1">

<tr>
<th>Name</th>
<th>Email</th>
<th>Phone</th>
<th>Experience</th>
<th>Current Role</th>
<th>Skills</th>
<th>Resume</th>
</tr>

<c:forEach items="${professionals}" var="p">

<tr>

<td>${p.user.fullName}</td>

<td>${p.user.email}</td>

<td>${p.user.phone}</td>

<td>${p.experienceYears}</td>

<td>${p.currentRole}</td>

<td>${p.skillSet}</td>

<td>

<a target="_blank"
href="${pageContext.request.contextPath}/files/${p.resumePath}">
Download Resume
</a>

</td>

</tr>

</c:forEach>

</table>

</body>
</html>