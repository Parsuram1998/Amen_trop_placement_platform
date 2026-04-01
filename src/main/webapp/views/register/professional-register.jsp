<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Fresher Registration</title>
</head>

<body>

<h2>Fresher Registration</h2>

<form action="${pageContext.request.contextPath}/auth/register" method="post">

<input type="hidden" name="role" value="PROFESSIONAL"/>

Full Name
<input type="text" name="fullName"/><br/><br/>

Email
<input type="email" name="email"/><br/><br/>

Phone
<input type="text" name="phone"/><br/><br/>

Password
<input type="password" name="password"/><br/><br/>

<button type="submit">Register</button>

</form>

</body>
</html>