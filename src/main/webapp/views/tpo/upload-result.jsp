<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Result</title>
</head>
<body>

<h2>Upload Result</h2>

<p style="color:green;">
    Successfully uploaded: ${successCount} students
</p>

<c:if test="${not empty errors}">
    <h3 style="color:red;">Errors:</h3>
    <ul>
        <c:forEach var="e" items="${errors}">
            <li>${e}</li>
        </c:forEach>
    </ul>
</c:if>

<br>
<a href="{pageContext.request.contextPath}/tpo/dashboard">Back to Dashboard</a>
</body>
</html>