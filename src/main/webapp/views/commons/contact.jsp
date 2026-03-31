<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Page</title>
</head>
<body>

<form method="post">

Name <input name="name"><br>
Email <input name="email"><br>
Phone <input name="phone"><br>

Type
<select name="type">
<option>TRAINING</option>
<option>PLACEMENT</option>
<option>CSR</option>
</select>

Message <textarea name="message"></textarea>

<button type="submit">Submit</button>

</form>

<c:if test="${param.success eq 'true'}">
<p style="color:green;">Submitted successfully</p>
</c:if>

</body>
</html>