<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Edit Professional Profile</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

:root{
    --bg:#0a0a0a;
    --sidebar:#0d0d0d;
    --card:#111;
    --card2:#0f0f0f;
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
    margin-bottom:20px;
}

/* FORM CARD */
.form-card{
    background:linear-gradient(145deg,#111,#0d0d0d);
    border:1px solid var(--border);
    border-radius:18px;
    padding:30px;
    max-width:950px;
    box-shadow:0 10px 40px rgba(0,0,0,0.6);
}

/* SECTION */
.section-title{
    color:var(--gold);
    font-size:0.85rem;
    margin:20px 0 10px;
}

/* GRID */
.form-grid{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:18px;
}

.full{
    grid-column:span 2;
}

/* LABEL */
label{
    font-size:0.75rem;
    color:var(--muted);
}

/* INPUT */
input[type="text"],
input[type="number"],
input[type="file"]{
    width:100%;
    margin-top:6px;
    padding:10px 12px;
    border-radius:10px;
    border:1px solid var(--border);
    background:var(--card2);
    color:#fff;
    transition:0.2s;
}

input:focus{
    border-color:var(--gold);
    box-shadow:0 0 0 2px rgba(212,175,55,0.2);
}

/* FILE BOX */
.file-box{
    padding:15px;
    border-radius:12px;
    background:var(--card2);
    border:1px dashed rgba(255,255,255,0.08);
}

/* LINKS */
a{
    color:var(--gold);
    text-decoration:none;
}

a:hover{
    text-decoration:underline;
}

/* BUTTON */
button{
    margin-top:25px;
    width:100%;
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
    padding:12px;
    border:none;
    border-radius:12px;
    font-weight:600;
    cursor:pointer;
}

/* BACK */
.back{
    display:inline-block;
    margin-top:20px;
    color:var(--muted);
}

.back:hover{
    color:var(--gold);
}

</style>

</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="logo">AMENTROP</div>

    <div class="nav">
        <a href="${pageContext.request.contextPath}/professional/dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/professional/profile" class="active">Edit Profile</a>
        <a href="${pageContext.request.contextPath}/jobs">Jobs</a>

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
    <h2>Edit Professional Profile</h2>
</div>

<form action="${pageContext.request.contextPath}/professional/save-profile"
method="post" enctype="multipart/form-data">

<div class="form-card">

<!-- EXPERIENCE -->
<div class="section-title">Experience</div>
<div class="form-grid">

<div>
<label>Experience Years</label>
<input type="number" name="experienceYears" value="${profile.experienceYears}">
</div>

<div>
<label>Current Role</label>
<input type="text" name="currentRole" value="${profile.currentRole}">
</div>

<div>
<label>Company Name</label>
<input type="text" name="companyName" value="${profile.companyName}">
</div>

<div>
<label>Company Location</label>
<input type="text" name="companyLocation" value="${profile.companyLocation}">
</div>

</div>

<!-- CTC -->
<div class="section-title">Compensation</div>
<div class="form-grid">

<div>
<label>Current CTC</label>
<input type="number" step="0.01" name="currentCtc" value="${profile.currentCtc}">
</div>

<div>
<label>Expected CTC</label>
<input type="number" step="0.01" name="expectedCtc" value="${profile.expectedCtc}">
</div>

</div>

<!-- SKILLS -->
<div class="section-title">Skills & Preferences</div>
<div class="form-grid">

<div>
<label>Domain Looking</label>
<input type="text" name="domainLooking" value="${profile.domainLooking}">
</div>

<div>
<label>Skill Set</label>
<input type="text" name="skillSet" value="${profile.skillSet}">
</div>

<div>
<label>Preferred Locations</label>
<input type="text" name="preferredLocations" value="${profile.preferredLocations}">
</div>

<div>
<label>Notice Period</label>
<input type="text" name="noticePeriod" value="${profile.noticePeriod}">
</div>

</div>

<!-- LINKS -->
<div class="section-title">Links</div>
<div class="form-grid">

<div>
<label>LinkedIn</label>
<input type="text" name="linkedIn" value="${profile.linkedIn}">
</div>

<div>
<label>Portfolio / GitHub</label>
<input type="text" name="portfolio" value="${profile.portfolio}">
</div>

</div>

<!-- RESUME -->
<div class="section-title">Resume</div>

<div class="file-box">

<c:if test="${profile.resumePath != null}">
Current Resume:
<a target="_blank"
href="${pageContext.request.contextPath}/files/${profile.resumePath}">
View
</a>
<br/><br/>
</c:if>

<label>Upload New Resume</label>
<input type="file" name="resume">

</div>

<button type="submit">Update Profile</button>

</div>

</form>



</div>

</body>
</html>