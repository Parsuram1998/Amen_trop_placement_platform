<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Fresher Dashboard</title>
</head>

<body>

<h2>Fresher Dashboard</h2>

<p><b>Total Jobs Available:</b> ${totalJobs}</p>
<p><b>Jobs Applied:</b> ${appliedJobs}</p>

<ul>
    <li><a href="${pageContext.request.contextPath}/fresher/profile">View Profile</a></li>
    <li><a href="${pageContext.request.contextPath}/jobs">View Jobs</a></li>

<li>
    <a href="${pageContext.request.contextPath}/fresher/toggle-profile">
        <c:choose>
            <c:when test="${user.profileActive}">
                Make Profile Inactive
            </c:when>
            <c:otherwise>
                Make Profile Active
            </c:otherwise>
        </c:choose>
    </a>
</li>

   <c:if test="${showCertificate}">
    <li>
        <a target="_blank"
           href="${pageContext.request.contextPath}/files/${certificatePath}">
            Download Certificate
        </a>
    </li>
</c:if>

<li>
    <a href="${pageContext.request.contextPath}/fresher/messages">
        View Messages
    </a>
</li>
    <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
</ul>

<script>
setInterval(function(){
    fetch('${pageContext.request.contextPath}/notify')
    .then(res => res.text())
    .then(msg => {
        console.log(msg);
    });
}, 10000);
</script>
</body>
</html>