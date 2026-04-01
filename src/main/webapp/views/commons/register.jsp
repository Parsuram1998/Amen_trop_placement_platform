<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>

<h2>Register</h2>

<% if(request.getAttribute("error") != null) { %>
    <p style="color:red;">
        <%= request.getAttribute("error") %>
    </p>
<% } %>

<form action="${pageContext.request.contextPath}/auth/register" method="post">

    Full Name:
    <input type="text" name="fullName" required />
    <br/><br/>

    Email:
    <input type="email" name="email" required />
    <br/><br/>

    Phone:
    <input type="text" name="phone" required />
    <br/><br/>

    Password:
    <input type="password" name="password" required />
    <br/><br/>

    Role:
    <select name="role" required>
        <option value="FRESHER">Fresher</option>
        <option value="PROFESSIONAL">Professional</option>
    </select>

    <br/><br/>

    <button type="submit">Register</button>

</form>

<a href="${pageContext.request.contextPath}/auth/login">Login</a>

</body>
</html>