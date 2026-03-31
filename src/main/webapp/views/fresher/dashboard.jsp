<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Fresher Dashboard</title>

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

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Inter',sans-serif;
    background:var(--bg);
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
    font-size:14px;
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
    padding:30px;
}

/* HEADER */
.header h2{
    font-weight:600;
    margin-bottom:20px;
}

/* STATS */
.stats{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:15px;
    margin-bottom:25px;
}

.stat-card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:12px;
    padding:18px;
}

.stat-card h4{
    color:var(--muted);
    font-size:0.8rem;
}

.stat-card p{
    font-size:1.4rem;
    font-weight:600;
    margin-top:5px;
}

/* ACTION CARDS */
.actions{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:15px;
}

.action-card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:12px;
    padding:18px;
    text-decoration:none;
    color:#fff;
    transition:0.2s;
}

.action-card:hover{
    background:var(--hover);
    transform:translateY(-2px);
}

/* TITLE */
.action-title{
    font-weight:500;
    margin-bottom:6px;
}

/* DESC */
.action-desc{
    font-size:0.8rem;
    color:var(--muted);
}

/* GOLD LINK */
a{
    text-decoration:none;
}

</style>

</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="logo">AMENTROP</div>

    <div class="nav">
        <a href="#" class="active">Dashboard</a>
        <a href="${pageContext.request.contextPath}/fresher/profile">Profile</a>
        <a href="${pageContext.request.contextPath}/jobs">Jobs</a>
        <a href="${pageContext.request.contextPath}/fresher/messages">Messages</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

<div class="header">
    <h2>Fresher Dashboard</h2>
</div>

<!-- STATS -->
<div class="stats">
    <div class="stat-card">
        <h4>Total Jobs</h4>
        <p>${totalJobs}</p>
    </div>

    <div class="stat-card">
        <h4>Jobs Applied</h4>
        <p>${appliedJobs}</p>
    </div>
</div>

<!-- ACTIONS -->
<div class="actions">

    <a class="action-card" href="${pageContext.request.contextPath}/fresher/profile">
        <div class="action-title">View Profile</div>
        <div class="action-desc">Check and update your profile</div>
    </a>

    <a class="action-card" href="${pageContext.request.contextPath}/jobs">
        <div class="action-title">Browse Jobs</div>
        <div class="action-desc">Explore available opportunities</div>
    </a>

    <a class="action-card" href="${pageContext.request.contextPath}/fresher/toggle-profile">
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
        <div class="action-desc">Control profile visibility</div>
    </a>

    <c:if test="${showCertificate}">
        <a class="action-card" target="_blank"
           href="${pageContext.request.contextPath}/files/${certificatePath}">
            <div class="action-title">Download Certificate</div>
            <div class="action-desc">Get your internship certificate</div>
        </a>
    </c:if>

    <a class="action-card" href="${pageContext.request.contextPath}/fresher/messages">
        <div class="action-title">Messages</div>
        <div class="action-desc">View HR communication</div>
    </a>

</div>

</div>

<!-- SCRIPT (UNCHANGED) -->
<script>
setInterval(function(){
    fetch('${pageContext.request.contextPath}/notify')
    .then(res => res.text())
    .then(msg => {
        console.log(msg);
    });
}, 10000);
</script>

</body>
</html>