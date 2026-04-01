<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Job Details</title>
</head>

<body>

<h2>${job.title}</h2>

<c:if test="${param.applied eq 'true'}">
    <p style="color:green;">Application submitted successfully.</p>
</c:if>

<c:if test="${param.alreadyApplied eq 'true'}">
    <p style="color:green;">You have already applied for this job.</p>
</c:if>

<c:if test="${param.notEligible eq 'true'}">
    <p style="color:red;">Not applicable for your profile.</p>
</c:if>

<p><b>Company:</b> ${job.companyName}</p>
<p><b>Location:</b> ${job.location}</p>
<p><b>Domain:</b> ${job.domain}</p>
<p><b>Description:</b> ${job.description}</p>
<p><b>Eligibility:</b> ${job.eligibility}</p>
<p><b>Minimum Experience:</b> ${job.minExperience}</p>
<p><b>Minimum Percentage:</b> ${job.minPercentage}</p>
<p><b>Job Type:</b> ${job.jobType}</p>

<c:choose>
    <c:when test="${alreadyApplied}">
        <p style="color:green;">You have already applied for this job.</p>
    </c:when>
    <c:otherwise>
        <form action="${pageContext.request.contextPath}/jobs/apply" method="post">
            <input type="hidden" name="jobId" value="${job.id}">
            <button type="submit">Apply</button>
        </form>
    </c:otherwise>
</c:choose>
<h3>Updates</h3>

<c:forEach items="${updates}" var="u">

<div style="border:1px solid #ccc; padding:8px; margin:5px;">

${u.updateText} <br>
<small>${u.createdAt}</small>

</div>

</c:forEach>
</body>
</html>