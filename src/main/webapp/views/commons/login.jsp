<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop - Login</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>

/* ===== USE SAME CSS AS REGISTER (IMPORTANT) ===== */
:root {
    --gold: #D4AF37;
    --gold-light: #F5D173;
    --black: #0A0A0A;
    --black-2: #121212;
    --text-gray: #d1d1d1;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
    height: 100vh;
    display: flex;
    background: var(--black);
    color: #ffffff;
}

/* ===== LEFT ===== */
.left {
    flex: 1.2;
    display: flex;
    align-items: center;
    padding: 80px;
    background: radial-gradient(circle at center, rgba(212,175,55,0.12), transparent 60%),
                linear-gradient(rgba(10,10,10,0.8), rgba(10,10,10,0.95)),
                url("https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=2070&q=80") center/cover;
}

.left-content {
    z-index: 2;
}

.logo {
    font-size: 2rem;
    font-weight: 800;
    margin-bottom: 40px;
    background: linear-gradient(135deg, var(--gold), var(--gold-light));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.title {
    font-size: 3rem;
    font-weight: 800;
}

.title span {
    background: linear-gradient(135deg, var(--gold), var(--gold-light));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.subtitle {
    margin-top: 20px;
    color: var(--text-gray);
    max-width: 500px;
}

/* ===== RIGHT ===== */
.right {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    background: var(--black-2);
}

/* CARD */
.card {
    width: 380px;
    padding: 40px;
    border-radius: 20px;
    background: rgba(20,20,20,0.9);
    backdrop-filter: blur(15px);
    border: 1px solid rgba(212,175,55,0.15);
    box-shadow: 0 25px 60px rgba(0,0,0,0.7);
}

.card h2 {
    text-align: center;
    margin-bottom: 25px;
    background: linear-gradient(135deg, var(--gold), var(--gold-light));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* INPUT */
.input-group {
    margin-bottom: 18px;
}

.input-group input {
    width: 100%;
    padding: 13px;
    border-radius: 12px;
    border: 1px solid rgba(255,255,255,0.08);
    background: rgba(255,255,255,0.03);
    color: #fff;
}

.input-group input:focus {
    border-color: var(--gold);
    box-shadow: 0 0 10px rgba(212,175,55,0.3);
    outline: none;
}

::placeholder {
    color: #bfbfbf;
}

/* BUTTON */
.btn {
    width: 100%;
    padding: 14px;
    border-radius: 14px;
    border: none;
    background: linear-gradient(135deg, var(--gold), var(--gold-light));
    color: black;
    font-weight: 600;
    cursor: pointer;
}

.btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(212,175,55,0.4);
}

/* REGISTER LINK */
.register {
    text-align: center;
    margin-top: 15px;
    color: #cfcfcf;
}

.register a {
    color: var(--gold-light);
    text-decoration: none;
    font-weight: 600;
}

.register a:hover {
    text-decoration: underline;
}

/* RESPONSIVE */
@media(max-width:900px){
    .left {
        display: none;
    }
}

</style>

</head>

<body>

<!-- LEFT SIDE -->
<div class="left">
    <div class="left-content">
        <div class="logo">AMENTROP</div>

        <div class="title">
            Welcome Back.<br>
            <span>Continue Your Journey.</span>
        </div>

        <div class="subtitle">
            Log in to access your dashboard, track your progress,
            and explore opportunities tailored for you.
        </div>
    </div>
</div>

<!-- RIGHT SIDE -->
<div class="right">

    <div class="card">

        <h2>Login</h2>

        <form:form method="post" modelAttribute="loginRequest">

            <div class="input-group">
                <form:input path="emailOrPhone" placeholder="Email or Phone"/>
            </div>

            <div class="input-group">
                <form:password path="password" placeholder="Password"/>
            </div>

            <button type="submit" class="btn">Login</button>

        </form:form>

        <div class="register">
            Don’t have an account?
            <a href="${pageContext.request.contextPath}/auth/register">Register</a>
        </div>

    </div>

</div>

</body>
</html>