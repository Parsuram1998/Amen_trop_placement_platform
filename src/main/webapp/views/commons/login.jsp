<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Login</title>
</head>
<body>

<h2>Login</h2>

<form:form method="post" modelAttribute="loginRequest">
    Email or Phone: <form:input path="emailOrPhone"/><br/><br/>
    Password: <form:password path="password"/><br/><br/>
    <button type="submit">Login</button>
</form:form>

<a href="/register">Register</a>

</body>
</html>
