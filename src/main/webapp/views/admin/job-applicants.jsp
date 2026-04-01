<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Job Applicants</title>
</head>

<body>

<h2>Applicants for ${job.title}</h2>

<form method="get" action="${pageContext.request.contextPath}/admin/job-applicants">
    <input type="hidden" name="jobId" value="${job.id}">

    Skill:
    <input type="text" name="skill" value="${param.skill}">

    Role:
    <select name="role">
        <option value="">All</option>
        <option value="FRESHER" ${param.role eq 'FRESHER' ? 'selected' : ''}>Fresher</option>
        <option value="PROFESSIONAL" ${param.role eq 'PROFESSIONAL' ? 'selected' : ''}>Professional</option>
    </select>

    Min Experience:
    <input type="number" name="minExperience" value="${param.minExperience}">

    Min Degree %:
    <input type="number" step="0.01" name="minDegree" value="${param.minDegree}">

    <button type="submit">Filter</button>
</form>

<br/>

<a href="${pageContext.request.contextPath}/admin/download-applicants?jobId=${job.id}&skill=${param.skill}&role=${param.role}&minExperience=${param.minExperience}&minDegree=${param.minDegree}">
    Download Excel
</a>

<br/><br/>

<table border="1">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Role</th>
        <th>Applied At</th>
    </tr>

    <c:forEach items="${applications}" var="a">
        <tr>
            <td>${a.user.fullName}</td>
            <td>${a.user.email}</td>
            <td>${a.user.phone}</td>
            <td>${a.user.role}</td>
            <td>${a.appliedAt}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>