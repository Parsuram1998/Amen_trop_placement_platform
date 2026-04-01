<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Support Request</title>
</head>
<body>

<h3>Support Request</h3>

<form method="post" action="${pageContext.request.contextPath}/hr/support">

<select name="type">
    <option value="Bulk Hiring">Bulk Hiring</option>
    <option value="Campus Drive">Campus Drive</option>
    <option value="Special Requirement">Special Requirement</option>
</select>

<textarea name="message"></textarea>

<button type="submit">Send</button>

</form>

</body>
</html>