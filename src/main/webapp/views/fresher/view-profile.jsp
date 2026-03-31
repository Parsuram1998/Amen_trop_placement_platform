<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>View Profile</title>

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
    font-size:1.6rem;
    margin-bottom:20px;
}

/* PROFILE CARD */
.profile-card{
    background:linear-gradient(145deg,#111,#0d0d0d);
    border:1px solid var(--border);
    border-radius:18px;
    padding:25px;
    box-shadow:0 10px 40px rgba(0,0,0,0.6);
}

/* TOP SECTION */
.top{
    display:flex;
    align-items:center;
    gap:20px;
    margin-bottom:25px;
}

.top img{
    width:120px;
    height:120px;
    border-radius:12px;
    object-fit:cover;
    border:2px solid var(--border);
}

.top-info h3{
    font-weight:600;
}

.badge{
    display:inline-block;
    margin-top:6px;
    padding:4px 10px;
    border-radius:20px;
    font-size:0.75rem;
}

.status{
    background:rgba(212,175,55,0.15);
    color:var(--gold);
}

.bond{
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
    padding:15px;
}

.label{
    font-size:0.75rem;
    color:var(--muted);
}

.value{
    margin-top:5px;
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
        <a href="${pageContext.request.contextPath}/fresher/dashboard">Dashboard</a>
        <a href="#" class="active">View Profile</a>
        <a href="${pageContext.request.contextPath}/jobs">Jobs</a>
        <a href="${pageContext.request.contextPath}/fresher/messages">Messages</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

<div class="header">
    <h2>Fresher Profile</h2>
</div>

<c:if test="${profile != null}">

<div class="profile-card">

<!-- TOP -->
<div class="top">

<c:if test="${profile.photoPath != null}">
    <img src="${pageContext.request.contextPath}/files/${profile.photoPath}" />
</c:if>

<div class="top-info">
    <h3>${profile.skillSet}</h3>

    <span class="badge status">${profile.status}</span>
    <span class="badge bond">
        <c:choose>
            <c:when test="${profile.readyForBond}">Ready for Bond</c:when>
            <c:otherwise>No Bond</c:otherwise>
        </c:choose>
    </span>
</div>

</div>

<!-- GRID -->
<div class="grid">

<div class="item">
    <div class="label">Domain</div>
    <div class="value">${profile.domainInterested}</div>
</div>

<div class="item">
    <div class="label">Preferred Locations</div>
    <div class="value">${profile.preferredLocations}</div>
</div>

<div class="item">
    <div class="label">10th %</div>
    <div class="value">${profile.tenthPercentage}</div>
</div>

<div class="item">
    <div class="label">12th %</div>
    <div class="value">${profile.twelfthPercentage}</div>
</div>

<div class="item full">
    <div class="label">Degree %</div>
    <div class="value">${profile.degreePercentage}</div>
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

<c:if test="${profile.aadharPath != null}">
<a class="btn secondary" target="_blank"
   href="${pageContext.request.contextPath}/files/${profile.aadharPath}">
   Aadhar
</a>
</c:if>

<c:if test="${profile.videoResumePath != null}">
<a class="btn secondary" target="_blank"
   href="${pageContext.request.contextPath}/files/${profile.videoResumePath}">
   Video
</a>
</c:if>

<a class="btn primary"
   href="${pageContext.request.contextPath}/fresher/edit-profile">
   Edit Profile
</a>

<%-- <a class="btn secondary"
   href="${pageContext.request.contextPath}/fresher/dashboard">
   Back
</a> --%>

</div>

</div>

</c:if>

</div>

</body>
</html>