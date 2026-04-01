<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>View Profile</title>
</head>
<body>

<h2>Fresher Profile</h2>

<c:if test="${profile != null}">

    <p><b>Skill Set:</b> ${profile.skillSet}</p>
    <p><b>Domain:</b> ${profile.domainInterested}</p>
    <p><b>10th %:</b> ${profile.tenthPercentage}</p>
    <p><b>12th %:</b> ${profile.twelfthPercentage}</p>
    <p><b>Degree %:</b> ${profile.degreePercentage}</p>
    <p><b>Preferred Locations:</b> ${profile.preferredLocations}</p>
    <p><b>Ready For Bond:</b> ${profile.readyForBond}</p>
    <p><b>Status:</b> ${profile.status}</p>

    <c:if test="${profile.resumePath != null}">
    <p>
        <b>Resume:</b>
        <a target="_blank"
           href="${pageContext.request.contextPath}/files/${profile.resumePath}">
           View Resume
        </a>
    </p>
</c:if>

<c:if test="${profile.photoPath != null}">
    <p><b>Photo:</b></p>
    <img src="${pageContext.request.contextPath}/files/${profile.photoPath}"
         width="150" />
</c:if>

<c:if test="${profile.aadharPath != null}">
    <p>
        <b>Aadhar:</b>
        <a target="_blank"
           href="${pageContext.request.contextPath}/files/${profile.aadharPath}">
           View Aadhar
        </a>
    </p>
</c:if>

<c:if test="${profile.videoResumePath != null}">
    <p>
        <b>Video Resume:</b>
        <a target="_blank"
           href="${pageContext.request.contextPath}/files/${profile.videoResumePath}">
           Watch Video
        </a>
    </p>
</c:if>

    <br/>

    <a href="${pageContext.request.contextPath}/fresher/edit-profile">
        Edit Profile
    </a>

</c:if>

<br/><br/>
<a href="${pageContext.request.contextPath}/fresher/dashboard">Back</a>

</body>
</html>