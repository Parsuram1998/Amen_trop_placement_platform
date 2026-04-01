<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Fresher Profile</title>
</head>

<body>

<h2>${profile.user.fullName}</h2>

<p>Email: ${profile.user.email}</p>
<p>Phone: ${profile.user.phone}</p>
<p>Skill Set: ${profile.skillSet}</p>
<p>Domain Interested: ${profile.domainInterested}</p>
<p>10th %: ${profile.tenthPercentage}</p>
<p>12th %: ${profile.twelfthPercentage}</p>
<p>Degree %: ${profile.degreePercentage}</p>

<p>
<a target="_blank"
href="${pageContext.request.contextPath}/files/${profile.resumePath}">
Download Resume
</a>
</p>

</body>
</html>