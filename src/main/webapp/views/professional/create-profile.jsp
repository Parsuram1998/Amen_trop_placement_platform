<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Create Professional Profile</title>
</head>

<body>

<h2>Create Professional Profile</h2>

<form action="${pageContext.request.contextPath}/professional/save-profile"
method="post" enctype="multipart/form-data">

Experience Years<br/>
<input type="number" name="experienceYears"><br/><br/>

Current Role<br/>
<input type="text" name="currentRole"><br/><br/>

Current Company Name<br/>
<input type="text" name="companyName"><br/><br/>

Company Location<br/>
<input type="text" name="companyLocation"><br/><br/>

Current CTC<br/>
<input type="number" step="0.01" name="currentCtc"><br/><br/>

Expected CTC<br/>
<input type="number" step="0.01" name="expectedCtc"><br/><br/>

Domain Looking For<br/>
<input type="text" name="domainLooking"><br/><br/>

Skill Set<br/>
<input type="text" name="skillSet"><br/><br/>

Preferred Locations<br/>
<input type="text" name="preferredLocations"><br/><br/>

Notice Period<br/>
<input type="text" name="noticePeriod"><br/><br/>

LinkedIn Profile<br/>
<input type="text" name="linkedIn"><br/><br/>

Portfolio / GitHub<br/>
<input type="text" name="portfolio"><br/><br/>

Upload Resume<br/>
<input type="file" name="resume"><br/><br/>

<button type="submit">Save Profile</button>

</form>

</body>
</html>