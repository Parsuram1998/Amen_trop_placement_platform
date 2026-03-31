<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Professional Profile</title>

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
    --green:#2ea043;
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

/* PROFILE CARD */
.profile-card{
    background:linear-gradient(145deg,#111,#0d0d0d);
    border:1px solid var(--border);
    border-radius:18px;
    padding:25px;
    box-shadow:0 10px 40px rgba(0,0,0,0.6);
}

/* TOP */
.top{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.title{
    font-size:1.2rem;
    font-weight:600;
}

/* BADGES */
.badge{
    padding:4px 10px;
    border-radius:20px;
    font-size:0.75rem;
}

.verified{
    background:#2ea04322;
    color:#3fb950;
}

.notice{
    background:#1f6feb33;
    color:#58a6ff;
}

/* GRID */
.grid{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:15px;
}

/* ITEM */
.item{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:12px;
    padding:14px;
}

.label{
    font-size:0.75rem;
    color:var(--muted);
}

.value{
    margin-top:4px;
    font-weight:500;
}

/* FULL */
.full{
    grid-column:span 2;
}

/* ACTIONS */
.actions{
    margin-top:20px;
    display:flex;
    gap:12px;
    flex-wrap:wrap;
}

.btn{
    padding:8px 14px;
    border-radius:8px;
    text-decoration:none;
    font-size:0.85rem;
}

.primary{
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
}

.secondary{
    border:1px solid var(--border);
    color:#fff;
}

.btn:hover{
    opacity:0.9;
}

</style>

</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="logo">AMENTROP</div>

    <div class="nav">
        <a href="${pageContext.request.contextPath}/professional/dashboard">Dashboard</a>
        <a href="#" class="active">View Profile</a>
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

        <a href="${pageContext.request.contextPath}/professional/messages">Messages</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

<div class="header">
    <h2>💼 Professional Profile</h2>
</div>

<div class="profile-card">

<!-- TOP -->
<div class="top">
    <div class="title">${profile.currentRole}</div>

    <div>
        <span class="badge verified">
            <c:choose>
                <c:when test="${profile.verified}">Verified</c:when>
                <c:otherwise>Not Verified</c:otherwise>
            </c:choose>
        </span>

        <span class="badge notice">${profile.noticePeriod}</span>
    </div>
</div>

<!-- GRID -->
<div class="grid">

<div class="item">
<div class="label">Experience</div>
<div class="value">${profile.experienceYears} Years</div>
</div>

<div class="item">
<div class="label">Company</div>
<div class="value">${profile.companyName}</div>
</div>

<div class="item">
<div class="label">Location</div>
<div class="value">${profile.companyLocation}</div>
</div>

<div class="item">
<div class="label">Current CTC</div>
<div class="value">${profile.currentCtc}</div>
</div>

<div class="item">
<div class="label">Expected CTC</div>
<div class="value">${profile.expectedCtc}</div>
</div>

<div class="item">
<div class="label">Domain Looking</div>
<div class="value">${profile.domainLooking}</div>
</div>

<div class="item full">
<div class="label">Skill Set</div>
<div class="value">${profile.skillSet}</div>
</div>

<div class="item full">
<div class="label">Preferred Locations</div>
<div class="value">${profile.preferredLocations}</div>
</div>

<div class="item">
<div class="label">LinkedIn</div>
<div class="value">${profile.linkedIn}</div>
</div>

<div class="item">
<div class="label">Portfolio</div>
<div class="value">${profile.portfolio}</div>
</div>

</div>

<!-- ACTIONS -->
<div class="actions">

<c:if test="${profile.resumePath != null}">
<a class="btn secondary" target="_blank"
   href="${pageContext.request.contextPath}/files/${profile.resumePath}">
   Resume
</a>
</c:if>

<a class="btn primary"
   href="${pageContext.request.contextPath}/professional/edit-profile">
   Edit Profile
</a>



</div>

</div>

</div>

</body>
</html>