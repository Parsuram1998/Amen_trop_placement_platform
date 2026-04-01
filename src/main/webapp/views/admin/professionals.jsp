<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Professional Management</title>
</head>

<body>

<h2>Professional Candidates</h2>

<table border="1">

<tr>
<th>Name</th>
<th>Email</th>
<th>Experience</th>
<th>Current Role</th>
<th>Skill Set</th>
<th>Resume</th>
<th>Verified</th>
<th>Action</th>
</tr>

<c:forEach items="${professionals}" var="p">

<tr>

<td>${p.user.fullName}</td>

<td>${p.user.email}</td>

<td>${p.experienceYears}</td>

<td>${p.currentRole}</td>

<td>${p.skillSet}</td>

<td>
<a target="_blank"
href="${pageContext.request.contextPath}/files/${p.resumePath}">
View Resume
</a>
</td>

<td>${p.verified}</td>

<td>

<c:if test="${!p.verified}">
<form action="${pageContext.request.contextPath}/admin/verify-professional"
method="post">

<input type="hidden" name="id" value="${p.id}">

<button type="submit">Verify</button>

</form>
</c:if>

</td>
<td>
<a href="${pageContext.request.contextPath}/admin/approve-candidate?userId=${p.user.id}">
    Approve
</a>
</td>
</tr>

</c:forEach>

</table>

<br/>

<c:if test="${currentPage>0}">
<a href="${pageContext.request.contextPath}/admin/professionals?page=${currentPage-1}">
Previous
</a>
</c:if>

Page ${currentPage+1} of ${totalPages}

<c:if test="${currentPage+1<totalPages}">
<a href="${pageContext.request.contextPath}/admin/professionals?page=${currentPage+1}">
Next
</a>
</c:if>

</body>
</html>