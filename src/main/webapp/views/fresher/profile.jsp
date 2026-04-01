<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Fresher Profile</title>
</head>
<body>

<h2>Fresher Profile</h2>

<form action="${pageContext.request.contextPath}/fresher/profile"
      method="post"
      enctype="multipart/form-data">

    Skill Set:
    <input type="text" name="skillSet" required/><br/><br/>

    Domain Interested:
    <input type="text" name="domainInterested" required/><br/><br/>

    10th %:
    <input type="number" step="0.01" name="tenth" required/><br/><br/>

    12th %:
    <input type="number" step="0.01" name="twelfth" required/><br/><br/>

    Degree %:
    <input type="number" step="0.01" name="degree" required/><br/><br/>

    Preferred Locations:
    <input type="text" name="preferredLocations"/><br/><br/>

    Ready For Bond:
    <input type="checkbox" name="readyForBond" value="true"/><br/><br/>

    Resume:
    <input type="file" name="resume"/><br/><br/>

    Video Resume:
    <input type="file" name="video"/><br/><br/>

    Photo:
    <input type="file" name="photo"/><br/><br/>

    Aadhar:
    <input type="file" name="aadhar"/><br/><br/>

    <button type="submit">Save Profile</button>

</form>

</body>
</html>