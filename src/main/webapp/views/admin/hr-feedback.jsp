<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>HR Feedback</title>
</head>

<body>

<h2>HR Feedback on Candidates</h2>

<table border="1">

<tr>
<th>Candidate</th>
<th>HR</th>
<th>Feedback</th>
</tr>

<c:forEach items="${feedbackList}" var="f">

<tr>
<td>${f.candidate.fullName}</td>
<td>${f.hr.fullName}</td>
<td>${f.feedback}</td>
</tr>

</c:forEach>

</table>

</body>
</html>