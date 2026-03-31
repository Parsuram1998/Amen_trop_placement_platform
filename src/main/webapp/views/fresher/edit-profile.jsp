<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

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
    --danger:#ff4d4d;
}

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
    padding:40px;
}

/* HEADER */
h2{
    font-size:1.6rem;
    margin-bottom:25px;
}

/* CARD */
.form-card{
    background:linear-gradient(145deg,#111,#0d0d0d);
    border:1px solid var(--border);
    border-radius:18px;
    padding:30px;
    max-width:950px;
    box-shadow:0 10px 40px rgba(0,0,0,0.6);
}

/* SECTION TITLE */
.section-title{
    font-size:0.85rem;
    color:var(--gold);
    margin:20px 0 10px;
    letter-spacing:0.5px;
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

/* REQUIRED */
.required{
    color:var(--danger);
    margin-left:4px;
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
    box-shadow:0 0 0 2px rgba(212,175,55,0.15);
}

/* CHECKBOX */
.checkbox{
    display:flex;
    align-items:center;
    gap:10px;
    margin-top:10px;
}

/* FILE BOX */
.file-box{
    margin-top:15px;
    padding:16px;
    border-radius:12px;
    background:var(--card2);
    border:1px dashed rgba(255,255,255,0.08);
    transition:0.2s;
}

.file-box:hover{
    border-color:var(--gold);
}

/* LINKS */
a{
    color:var(--gold);
    text-decoration:none;
}

a:hover{
    text-decoration:underline;
}

/* IMAGE */
img{
    border-radius:10px;
    margin-top:10px;
    border:2px solid var(--border);
}

/* BUTTON */
button{
    margin-top:25px;
    width:100%;
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
    padding:12px;
    border:none;
    border-radius:10px;
    font-weight:600;
    cursor:pointer;
    transition:0.2s;
}

button:hover{
    transform:translateY(-1px);
    box-shadow:0 8px 20px rgba(212,175,55,0.3);
}

/* BACK LINK */
.back-link{
    display:inline-block;
    margin-top:20px;
    color:var(--muted);
}

.back-link:hover{
    color:var(--gold);
}

</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="logo">AMENTROP</div>

    <div class="nav">
        <a href="${pageContext.request.contextPath}/fresher/dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/fresher/profile" class="active">Edit Profile</a>
        <a href="${pageContext.request.contextPath}/jobs">Jobs</a>
        <a href="${pageContext.request.contextPath}/fresher/messages">Messages</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
        <a href="${pageContext.request.contextPath}/fresher/viewprofile">
 Back to View Profile
</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

<h2>Edit Fresher Profile</h2>

<form action="${pageContext.request.contextPath}/fresher/profile"
      method="post"
      enctype="multipart/form-data">

<div class="form-card">

<!-- BASIC -->
<div class="section-title">Basic Details</div>
<div class="form-grid">

<div>
<label>Skill Set <span class="required">*</span></label>
<input type="text" name="skillSet" value="${profile.skillSet}" required/>
</div>

<div>
<label>Domain Interested <span class="required">*</span></label>
<input type="text" name="domainInterested" value="${profile.domainInterested}" required/>
</div>

<div>
<label>Preferred Locations</label>
<input type="text" name="preferredLocations" value="${profile.preferredLocations}" />
</div>

<div class="checkbox">
<input type="checkbox" name="readyForBond" value="true"
<c:if test="${profile.readyForBond}">checked</c:if> />
<label>Ready For Bond</label>
</div>

</div>

<!-- EDUCATION -->
<div class="section-title">Education</div>
<div class="form-grid">

<div>
<label>10th % <span class="required">*</span></label>
<input type="number" step="0.01" name="tenth" value="${profile.tenthPercentage}" required/>
</div>

<div>
<label>12th % <span class="required">*</span></label>
<input type="number" step="0.01" name="twelfth" value="${profile.twelfthPercentage}" required/>
</div>

<div class="full">
<label>Degree % <span class="required">*</span></label>
<input type="number" step="0.01" name="degree" value="${profile.degreePercentage}" required/>
</div>

</div>

<!-- DOCUMENTS -->
<div class="section-title">Documents</div>

<div class="file-box full">
<c:if test="${profile.resumePath != null}">
<b>Current Resume:</b>
<a target="_blank" href="${pageContext.request.contextPath}/files/${profile.resumePath}">View Resume</a><br/>
</c:if>
<label>Upload Resume <span class="required">*</span></label>
<input type="file" name="resume" required/>
</div>

<div class="file-box full">
<c:if test="${profile.videoResumePath != null}">
<b>Current Video:</b>
<a target="_blank" href="${pageContext.request.contextPath}/files/${profile.videoResumePath}">Watch Video</a><br/>
</c:if>
<label>Upload Video Resume</label>
<input type="file" name="video"/>
</div>

<div class="file-box full">
<c:if test="${profile.photoPath != null}">
<b>Current Photo:</b><br/>
<img src="${pageContext.request.contextPath}/files/${profile.photoPath}" width="120"/><br/>
</c:if>
<label>Upload Photo <span class="required">*</span></label>
<input type="file" name="photo" required/>
</div>

<div class="file-box full">
<c:if test="${profile.aadharPath != null}">
<b>Current Aadhar:</b>
<a target="_blank" href="${pageContext.request.contextPath}/files/${profile.aadharPath}">View Aadhar</a><br/>
</c:if>
<label>Upload Aadhar <span class="required">*</span></label>
<input type="file" name="aadhar" required/>
</div>

<button type="submit">Update Profile</button>

</div>

</form>

</div>

</body>
</html>