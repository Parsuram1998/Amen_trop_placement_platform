<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Professional Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

:root{
    --bg:#0a0a0a;
    --sidebar:#0d0d0d;
    --card:#111;
    --hover:#1a1a1a;
    --border:rgba(255,255,255,0.06);
    --text:#fff;
    --muted:#9ca3af;
    --gold:#d4af37;
}

/* RESET */
*{margin:0;padding:0;box-sizing:border-box}

body{
    font-family:'Inter',sans-serif;
    background:radial-gradient(circle at top,#111,#0a0a0a);
    color:var(--text);
    display:flex;
}

/* SIDEBAR */
.sidebar{
    width:240px;
    height:100vh;
    background:var(--sidebar);
    border-right:1px solid var(--border);
    padding:25px;
}

.logo{
    font-size:1.4rem;
    font-weight:600;
    color:var(--gold);
    margin-bottom:35px;
}

.nav a{
    display:block;
    padding:10px 12px;
    border-radius:8px;
    margin-bottom:6px;
    color:var(--muted);
    text-decoration:none;
    transition:0.2s;
}

.nav a:hover{
    background:var(--hover);
    color:#fff;
}

.nav a.active{
    background:rgba(212,175,55,0.12);
    color:var(--gold);
}

/* MAIN */
.main{
    flex:1;
    padding:35px;
}

/* HEADER */
.header h2{
    font-size:1.7rem;
    margin-bottom:25px;
}

/* STATS */
.stats{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:20px;
    margin-bottom:30px;
}

.stat-card{
    background:linear-gradient(145deg,#111,#0d0d0d);
    border:1px solid var(--border);
    border-radius:16px;
    padding:20px;
    box-shadow:0 10px 40px rgba(0,0,0,0.6);
}

.stat-title{
    color:var(--muted);
    font-size:0.8rem;
}

.stat-value{
    font-size:1.6rem;
    font-weight:600;
    margin-top:6px;
}

/* ACTIONS */
.actions{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:18px;
}

.action-card{
    background:linear-gradient(145deg,#111,#0d0d0d);
    border:1px solid var(--border);
    border-radius:14px;
    padding:18px;
    text-decoration:none;
    color:#fff;
    transition:0.2s;
}

.action-card:hover{
    background:var(--hover);
    transform:translateY(-2px);
}

.action-title{
    font-weight:500;
    margin-bottom:6px;
}

.action-desc{
    font-size:0.8rem;
    color:var(--muted);
}

</style>

</head>

<body>

<!-- SIDEBAR (ONLY DASHBOARD LINKS — FIXED) -->
<div class="sidebar">
    <div class="logo">AMENTROP</div>

    <div class="nav">
        <a href="#" class="active">Dashboard</a>
        <a href="${pageContext.request.contextPath}/professional/profile">View Profile</a>
        <a href="${pageContext.request.contextPath}/jobs">View Jobs</a>

        <a href="${pageContext.request.contextPath}/fresher/toggle-profile">
            <c:choose>
                <c:when test="${user.profileActive}">
                    Make Profile Inactive
                </c:when>
                <c:otherwise>
                    Make Profile Active
                </c:otherwise>
            </c:choose>
        </a>

        <a href="${pageContext.request.contextPath}/professional/messages">View Messages</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

<div class="header">
    <h2>💼 Professional Dashboard</h2>
</div>

<!-- STATS -->
<div class="stats">

<div class="stat-card">
    <div class="stat-title">Total Jobs Available</div>
    <div class="stat-value">${totalJobs}</div>
</div>

<div class="stat-card">
    <div class="stat-title">Jobs Applied</div>
    <div class="stat-value">${appliedJobs}</div>
</div>

</div>

<!-- ACTIONS (same links as sidebar only) -->
<div class="actions">

<a class="action-card"
   href="${pageContext.request.contextPath}/professional/profile">
    <div class="action-title">View Profile</div>
    <div class="action-desc">Manage your profile</div>
</a>

<a class="action-card"
   href="${pageContext.request.contextPath}/jobs">
    <div class="action-title">View Jobs</div>
    <div class="action-desc">Explore opportunities</div>
</a>

<a class="action-card"
   href="${pageContext.request.contextPath}/fresher/toggle-profile">
    <div class="action-title">
        <c:choose>
            <c:when test="${user.profileActive}">
                Make Profile Inactive
            </c:when>
            <c:otherwise>
                Make Profile Active
            </c:otherwise>
        </c:choose>
    </div>
    <div class="action-desc">Control visibility</div>
</a>

<a class="action-card"
   href="${pageContext.request.contextPath}/professional/messages">
    <div class="action-title">View Messages</div>
    <div class="action-desc">Check recruiter messages</div>
</a>

</div>

</div>

</body>
</html>