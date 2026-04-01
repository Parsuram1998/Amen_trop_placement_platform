<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Admin Freshers</title>
</head>

<body>

<h2>Fresher Management</h2>

<table border="1">

<tr>
<th>Name</th>
<th>Email</th>
<th>Skill</th>
<th>Domain</th>
<th>Degree %</th>
<th>Resume</th>
<th>Status</th>
<th>Update</th>
</tr>

<c:forEach items="${freshers}" var="f">

<tr>

<td>
<c:choose>
    <c:when test="${f.user != null}">
        ${f.user.fullName}
    </c:when>
    <c:otherwise>N/A</c:otherwise>
</c:choose>
</td>

<td>
<c:choose>
    <c:when test="${f.user != null}">
        ${f.user.email}
    </c:when>
    <c:otherwise>N/A</c:otherwise>
</c:choose>
</td>

<td>${f.skillSet}</td>
<td>${f.domainInterested}</td>
<td>${f.degreePercentage}</td>

<td>
<c:if test="${f.resumePath != null}">
    <a target="_blank"
       href="${pageContext.request.contextPath}/files/${f.resumePath}">
       View Resume
    </a>
</c:if>
<c:if test="${f.resumePath == null}">
    N/A
</c:if>
</td>

<td>${f.status}</td>

<td>

<form action="${pageContext.request.contextPath}/admin/update-status" method="post">

<input type="hidden" name="id" value="${f.id}"/>

<select name="status">

<option value="IN_PROGRESS"
<c:if test="${f.status == 'IN_PROGRESS'}">selected</c:if>>
IN PROGRESS
</option>

<option value="SELECTED"
<c:if test="${f.status == 'SELECTED'}">selected</c:if>>
SELECTED
</option>

<option value="NEEDS_IMPROVEMENT"
<c:if test="${f.status == 'NEEDS_IMPROVEMENT'}">selected</c:if>>
NEEDS IMPROVEMENT
</option>

</select>

<button type="submit">Update</button>

</form>
</td>
<td>
 <a href="${pageContext.request.contextPath}/admin/generate-certificate?fresherId=${f.id}">
Generate Certificate
</a> 

</td>
<td>
<a href="${pageContext.request.contextPath}/admin/approve-candidate?userId=${f.user.id}">
    Approve
</a>
</td>
</tr>

</c:forEach>

</table>

<br/>

<c:if test="${currentPage > 0}">
<a href="${pageContext.request.contextPath}/admin/freshers?page=${currentPage-1}">
Previous
</a>
</c:if>

Page ${currentPage+1} of ${totalPages}

<c:if test="${currentPage+1 < totalPages}">
<a href="${pageContext.request.contextPath}/admin/freshers?page=${currentPage+1}">
Next
</a>
</c:if>

</body>
</html>