<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Create Job</title>
</head>

<body>

<h2>Create Job</h2>

<c:if test="${not empty error}">
<p style="color:red">${error}</p>
</c:if>

<form action="${pageContext.request.contextPath}/admin/save-job"
method="post">

Title<br/>
<input type="text" name="title"><br/><br/>

Company Name<br/>
<input type="text" name="companyName"><br/><br/>

Location<br/>
<input type="text" name="location"><br/><br/>

Domain<br/>
<input type="text" name="domain"><br/><br/>

Description<br/>
<textarea name="description"></textarea><br/><br/>

Eligibility<br/>
<input type="text" name="eligibility"><br/><br/>

Minimum Experience<br/>
<input type="number" name="minExperience"><br/><br/>

Minimum Percentage<br/>
<input type="number" step="0.01" name="minPercentage"><br/><br/>

Strict Apply
<input type="checkbox" name="strictApply"><br></br>

Bond Required
<input type="checkbox" name="bondRequired">
<br/><br/>

Job Category<br/>
<select name="jobType">

<option value="FRESHER">Fresher</option>
<option value="PROFESSIONAL">Professional</option>
<option value="BOTH">Both</option>

</select>

<br/><br/>

<br/><br/>

<button type="submit">Create Job</button>

</form>

</body>
</html>