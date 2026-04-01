<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Selected Freshers</title>
</head>

<body>

<h2>Selected Fresher Candidates</h2>

<table border="1">

<tr>
<th>Name</th>
<th>Email</th>
<th>Skill</th>
<th>Domain</th>
<th>Degree %</th>
<th>Resume</th>
</tr>

<c:forEach items="${freshers}" var="f">

<tr>

<td>${f.user.fullName}</td>

<td>${f.user.email}</td>

<td>${f.skillSet}</td>

<td>${f.domainInterested}</td>

<td>${f.degreePercentage}</td>

<td>
<a target="_blank"
href="${pageContext.request.contextPath}/files/${f.resumePath}">
Download Resume
</a>
</td>

<td>
<a href="${pageContext.request.contextPath}/hr/fresher-profile?id=${f.id}">
View Profile
</a>
</td>


</tr>

</c:forEach>

</table>

</body>
</html>