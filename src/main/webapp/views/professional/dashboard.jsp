<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Professional Dashboard</title>
</head>

<body>

<h2>Professional Dashboard</h2>

<p><b>Total Jobs Available:</b> ${totalJobs}</p>
<p><b>Jobs Applied:</b> ${appliedJobs}</p>

<ul>
    <li><a href="${pageContext.request.contextPath}/professional/profile">View Profile</a></li>
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

<li>
    <a href="${pageContext.request.contextPath}/professional/messages">
        View Messages
    </a>
</li>
    
    <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
</ul>

</body>
</html>