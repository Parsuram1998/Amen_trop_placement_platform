<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
</head>
<body>

<h2>Edit Fresher Profile</h2>

<form action="${pageContext.request.contextPath}/fresher/profile"
      method="post"
      enctype="multipart/form-data">

    Skill Set:
    <input type="text" name="skillSet" value="${profile.skillSet}" />
    <br/><br/>

    Domain Interested:
    <input type="text" name="domainInterested" value="${profile.domainInterested}" />
    <br/><br/>

    10th %:
    <input type="number" step="0.01" name="tenth"
           value="${profile.tenthPercentage}" />
    <br/><br/>

    12th %:
    <input type="number" step="0.01" name="twelfth"
           value="${profile.twelfthPercentage}" />
    <br/><br/>

    Degree %:
    <input type="number" step="0.01" name="degree"
           value="${profile.degreePercentage}" />
    <br/><br/>

    Preferred Locations:
    <input type="text" name="preferredLocations"
           value="${profile.preferredLocations}" />
    <br/><br/>

    Ready For Bond:
    <input type="checkbox" name="readyForBond" value="true"
        <c:if test="${profile.readyForBond}">checked</c:if> />
    <br/><br/>

    <!-- Resume Section -->
    <c:if test="${profile.resumePath != null}">
        <p>
            <b>Current Resume:</b>
            <a target="_blank"
               href="${pageContext.request.contextPath}/files/${profile.resumePath}">
               View Resume
            </a>
        </p>
    </c:if>

    Upload New Resume:
    <input type="file" name="resume"/>
    <br/><br/>

    <!-- Video Resume -->
    <c:if test="${profile.videoResumePath != null}">
        <p>
            <b>Current Video Resume:</b>
            <a target="_blank"
               href="${pageContext.request.contextPath}/files/${profile.videoResumePath}">
               Watch Video
            </a>
        </p>
    </c:if>

    Upload New Video Resume:
    <input type="file" name="video"/>
    <br/><br/>

    <!-- Photo -->
    <c:if test="${profile.photoPath != null}">
        <p><b>Current Photo:</b></p>
        <img src="${pageContext.request.contextPath}/files/${profile.photoPath}"
             width="150" />
        <br/>
    </c:if>

    Upload New Photo:
    <input type="file" name="photo"/>
    <br/><br/>

    <!-- Aadhar -->
    <c:if test="${profile.aadharPath != null}">
        <p>
            <b>Current Aadhar:</b>
            <a target="_blank"
               href="${pageContext.request.contextPath}/files/${profile.aadharPath}">
               View Aadhar
            </a>
        </p>
    </c:if>

    Upload New Aadhar:
    <input type="file" name="aadhar"/>
    <br/><br/>

    <button type="submit">Update Profile</button>

</form>

<br/>
<a href="${pageContext.request.contextPath}/fresher/viewprofile">
    Back to View Profile
</a>

</body>
</html>