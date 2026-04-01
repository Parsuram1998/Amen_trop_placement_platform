<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Jobs</title>
</head>

<body>

<h2>Job Management</h2>

<a href="${pageContext.request.contextPath}/admin/create-job">
Create Job
</a>


<br/><br/>

<table border="1">

<tr>
<th>Title</th>
<th>Company</th>
<th>Location</th>
<th>Domain</th>
<th>Min Experience</th>
</tr>

<c:forEach items="${jobs}" var="j">

<tr>

<td>${j.title}</td>
<td>${j.companyName}</td>
<td>${j.location}</td>
<td>${j.domain}</td>
<td>${j.minExperience}</td>
<td>
<a href="${pageContext.request.contextPath}/admin/job-applicants?jobId=${j.id}">
View Applicants
</a>
</td>
<td>

<form method="post" action="${pageContext.request.contextPath}/admin/add-update">

<input type="hidden" name="jobId" value="${j.id}">

<input type="text" name="updateText" placeholder="Add update (Round 1 cleared)">

<button type="submit">Add Update</button>

</form>

</td>
</tr>

</c:forEach>

</table>

</body>
</html>