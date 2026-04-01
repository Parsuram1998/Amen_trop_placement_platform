<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Edit Professional Profile</title>
</head>

<body>

<h2>Edit Professional Profile</h2>

<form action="${pageContext.request.contextPath}/professional/save-profile"
method="post" enctype="multipart/form-data">

Experience Years<br/>
<input type="number" name="experienceYears"
value="${profile.experienceYears}">
<br/><br/>

Current Role<br/>
<input type="text" name="currentRole"
value="${profile.currentRole}">
<br/><br/>

Current Company Name<br/>
<input type="text" name="companyName"
value="${profile.companyName}">
<br/><br/>

Company Location<br/>
<input type="text" name="companyLocation"
value="${profile.companyLocation}">
<br/><br/>

Current CTC<br/>
<input type="number" step="0.01"
name="currentCtc"
value="${profile.currentCtc}">
<br/><br/>

Expected CTC<br/>
<input type="number" step="0.01"
name="expectedCtc"
value="${profile.expectedCtc}">
<br/><br/>

Domain Looking For<br/>
<input type="text" name="domainLooking"
value="${profile.domainLooking}">
<br/><br/>

Skill Set<br/>
<input type="text" name="skillSet"
value="${profile.skillSet}">
<br/><br/>

Preferred Locations<br/>
<input type="text" name="preferredLocations"
value="${profile.preferredLocations}">
<br/><br/>

Notice Period<br/>
<input type="text" name="noticePeriod"
value="${profile.noticePeriod}">
<br/><br/>

LinkedIn Profile<br/>
<input type="text" name="linkedIn"
value="${profile.linkedIn}">
<br/><br/>

Portfolio / GitHub<br/>
<input type="text" name="portfolio"
value="${profile.portfolio}">
<br/><br/>

<c:if test="${profile.resumePath != null}">
<p>
Current Resume:
<a target="_blank"
href="${pageContext.request.contextPath}/files/${profile.resumePath}">
View
</a>
</p>
</c:if>

Upload New Resume<br/>
<input type="file" name="resume">
<br/><br/>

<button type="submit">Update Profile</button>

</form>

<br>

<a href="${pageContext.request.contextPath}/professional/profile">
Back to Profile
</a>

</body>
</html>