<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop - Register</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>
:root {
    --gold: #D4AF37;
    --gold-light: #F5D173;
    --black: #0A0A0A;
    --black-2: #121212;
    --text-gray: #d1d1d1;
}

/* RESET */
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

/* ===== LEFT SIDE ===== */
.left {
    flex: 1.2;
    position: relative;
    display: flex;
    align-items: center;
    padding: 80px;
    background: radial-gradient(circle at center, rgba(212,175,55,0.12), transparent 60%),
                linear-gradient(rgba(10,10,10,0.8), rgba(10,10,10,0.95)),
                url("https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=2070&q=80") center/cover;
}

.left::after {
    content: "";
    position: absolute;
    top: 50%;
    left: 50%;
    width: 600px;
    height: 600px;
    transform: translate(-50%, -50%);
    background: radial-gradient(circle, rgba(212,175,55,0.15), transparent 70%);
}

.left-content {
    position: relative;
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

/* HERO TEXT */
.title {
    font-size: 3rem;
    font-weight: 800;
    line-height: 1.2;
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
    line-height: 1.7;
}

/* FEATURES */
.features {
    margin-top: 50px;
}

.feature {
    display: flex;
    align-items: center;
    margin-bottom: 18px;
    font-weight: 500;
    color: #ffffff;
}

.feature i {
    color: var(--gold);
    margin-right: 12px;
}

/* ===== RIGHT SIDE ===== */
.right {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    background: var(--black-2);
}

/* FORM CARD */
.card {
    width: 400px;
    padding: 40px;
    border-radius: 20px;
    background: rgba(20,20,20,0.9);
    backdrop-filter: blur(15px);
    border: 1px solid rgba(212,175,55,0.15);
    box-shadow:
        0 25px 60px rgba(0,0,0,0.7),
        0 0 40px rgba(212,175,55,0.1);
}

/* TITLE */
.card h2 {
    text-align: center;
    margin-bottom: 25px;
    font-weight: 700;
    background: linear-gradient(135deg, var(--gold), var(--gold-light));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* INPUT */
.input-group {
    margin-bottom: 18px;
    position: relative;
}

.input-group input,
.input-group select {
    width: 100%;
    padding: 13px;
    border-radius: 12px;
    border: 1px solid rgba(255,255,255,0.08);
    background: rgba(255,255,255,0.03);
    color: #ffffff;
    transition: 0.3s;
    appearance: none;
}

.input-group input:focus,
.input-group select:focus {
    border-color: var(--gold);
    box-shadow: 0 0 12px rgba(212,175,55,0.3);
    outline: none;
}

/* PLACEHOLDER FIX */
::placeholder {
    color: #bfbfbf;
    opacity: 1;
}

/* DROPDOWN ARROW */
.input-group select {
    background-image: url("data:image/svg+xml;utf8,<svg fill='%23D4AF37' height='20' viewBox='0 0 24 24' width='20' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/></svg>");
    background-repeat: no-repeat;
    background-position: right 12px center;
    background-size: 18px;
    cursor: pointer;
}

/* DROPDOWN OPTIONS */
select option {
    background: #1a1a1a;
    color: #ffffff;
}

/* BUTTON */
.btn {
    width: 100%;
    padding: 14px;
    border-radius: 14px;
    border: none;
    font-weight: 600;
    background: linear-gradient(135deg, var(--gold), var(--gold-light));
    color: black;
    cursor: pointer;
    margin-top: 10px;
    transition: 0.3s;
}

.btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 35px rgba(212,175,55,0.4);
}

/* LOGIN */
.login {
    text-align: center;
    margin-top: 18px;
    font-size: 0.9rem;
    color: #cfcfcf;
}

.login a {
    color: var(--gold-light);
    font-weight: 600;
    text-decoration: none;
    position: relative;
}

.login a::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: -2px;
    width: 0%;
    height: 2px;
    background: linear-gradient(135deg, var(--gold), var(--gold-light));
    transition: 0.3s;
}

.login a:hover::after {
    width: 100%;
}

/* ERROR */
.error {
    background: rgba(255,0,0,0.1);
    border: 1px solid rgba(255,0,0,0.3);
    padding: 10px;
    border-radius: 8px;
    color: #ff6b6b;
    margin-bottom: 15px;
    text-align: center;
}

/* RESPONSIVE */
@media(max-width: 900px){
    .left {
        display: none;
    }
}
</style>

</head>

<body>

<!-- LEFT -->
<div class="left">
    <div class="left-content">

        <div class="logo">AMENTROP</div>

        <div class="title">
            Train Smarter.<br>
            <span>Hire Faster.</span>
        </div>

        <div class="subtitle">
            Amentrop transforms raw talent into industry-ready professionals
            and helps companies hire faster with verified skill-based profiles.
        </div>

        <div class="features">
            <div class="feature"><i class="fas fa-check-circle"></i> Verified Candidates</div>
            <div class="feature"><i class="fas fa-chart-line"></i> Smart Hiring Analytics</div>
            <div class="feature"><i class="fas fa-users"></i> Global Talent Network</div>
        </div>

    </div>
</div>

<!-- RIGHT -->
<div class="right">

    <div class="card">

        <h2>Create Account</h2>

        <% if(request.getAttribute("error") != null) { %>
            <div class="error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/auth/register" method="post">

            <div class="input-group">
                <input type="text" name="fullName" placeholder="Full Name" required />
            </div>

            <div class="input-group">
                <input type="email" name="email" placeholder="Email Address" required />
            </div>

            <div class="input-group">
                <input type="text" name="phone" placeholder="Phone Number" required />
            </div>

            <div class="input-group">
                <input type="password" name="password" placeholder="Password" required />
            </div>

            <div class="input-group">
                <select name="role">
                    <option value="FRESHER">Fresher</option>
                    <option value="PROFESSIONAL">Professional</option>
                </select>
            </div>

            <button type="submit" class="btn">Register</button>

        </form>

      <div class="login">
    Already have an account? 
    <a href="${pageContext.request.contextPath}/auth/login">Sign in</a>
</div>

    </div>

</div>

</body>
</html>