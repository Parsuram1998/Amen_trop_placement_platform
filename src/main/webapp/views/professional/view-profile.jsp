<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Professional Profile</title>
</head>

<body>

<h2>Your Professional Profile</h2>

<p><b>Experience Years:</b> ${profile.experienceYears}</p>

<p><b>Current Role:</b> ${profile.currentRole}</p>

<p><b>Current Company:</b> ${profile.companyName}</p>

<p><b>Company Location:</b> ${profile.companyLocation}</p>

<p><b>Current CTC:</b> ${profile.currentCtc}</p>

<p><b>Expected CTC:</b> ${profile.expectedCtc}</p>

<p><b>Domain Looking For:</b> ${profile.domainLooking}</p>

<p><b>Skill Set:</b> ${profile.skillSet}</p>

<p><b>Preferred Locations:</b> ${profile.preferredLocations}</p>

<p><b>Notice Period:</b> ${profile.noticePeriod}</p>

<p><b>LinkedIn:</b> ${profile.linkedIn}</p>

<p><b>Portfolio:</b> ${profile.portfolio}</p>

<c:if test="${profile.resumePath != null}">
<p>
<b>Resume:</b>
<a target="_blank"
href="${pageContext.request.contextPath}/files/${profile.resumePath}">
View Resume
</a>
</p>
</c:if>

<p><b>Verified By Admin:</b> ${profile.verified}</p>

<br>

<a href="${pageContext.request.contextPath}/professional/edit-profile">
Edit Profile
</a>

<br><br>

<a href="${pageContext.request.contextPath}/professional/dashboard">
Back to Dashboard
</a>

</body>
</html>