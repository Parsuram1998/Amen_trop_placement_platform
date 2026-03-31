<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>Create Fresher Profile</title>

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
    display:flex;
    justify-content:center;
    padding:40px;
}

/* CARD */
.form-wrapper{
    width:100%;
    max-width:850px;
}

.header{
    margin-bottom:20px;
}

.header h2{
    font-size:1.6rem;
}

/* CARD */
.form-card{
    background:linear-gradient(145deg,#111,#0d0d0d);
    border:1px solid var(--border);
    border-radius:20px;
    padding:30px;
    box-shadow:0 15px 50px rgba(0,0,0,0.7);
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

/* REQUIRED */
.required{
    color:var(--danger);
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

/* CHECKBOX */
.checkbox{
    display:flex;
    align-items:center;
    gap:10px;
    margin-top:10px;
}

/* FILE BOX */
.file-box{
    padding:15px;
    border-radius:12px;
    background:var(--card2);
    border:1px dashed rgba(255,255,255,0.08);
    transition:0.2s;
}

.file-box:hover{
    border-color:var(--gold);
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
    transition:0.2s;
}

button:hover{
    transform:translateY(-2px);
    box-shadow:0 10px 25px rgba(212,175,55,0.3);
}

</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="logo">AMENTROP</div>

    <div class="nav">
        <a href="${pageContext.request.contextPath}/fresher/dashboard">Dashboard</a>
        <a href="#" class="active">Create Profile</a>
        <a href="${pageContext.request.contextPath}/jobs">Jobs</a>
        <a href="${pageContext.request.contextPath}/fresher/messages">Messages</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

<div class="form-wrapper">

<div class="header">
    <h2>Create Your Fresher Profile</h2>
</div>

<form action="${pageContext.request.contextPath}/fresher/profile"
      method="post"
      enctype="multipart/form-data">

<div class="form-card">

<!-- BASIC -->
<div class="section-title">Basic Details</div>
<div class="form-grid">

<div>
<label>Skill Set <span class="required">*</span></label>
<input type="text" name="skillSet" required/>
</div>

<div>
<label>Domain Interested <span class="required">*</span></label>
<input type="text" name="domainInterested" required/>
</div>

<div class="full">
<label>Preferred Locations</label>
<input type="text" name="preferredLocations"/>
</div>

<div class="checkbox full">
<input type="checkbox" name="readyForBond" value="true"/>
<label>Ready For Bond</label>
</div>

</div>

<!-- EDUCATION -->
<div class="section-title">Education</div>
<div class="form-grid">

<div>
<label>10th % <span class="required">*</span></label>
<input type="number" step="0.01" name="tenth" required/>
</div>

<div>
<label>12th % <span class="required">*</span></label>
<input type="number" step="0.01" name="twelfth" required/>
</div>

<div class="full">
<label>Degree % <span class="required">*</span></label>
<input type="number" step="0.01" name="degree" required/>
</div>

</div>

<!-- DOCUMENTS -->
<div class="section-title">Documents</div>

<div class="file-box full">
<label>Resume</label>
<input type="file" name="resume"/>
</div>

<div class="file-box full">
<label>Video Resume</label>
<input type="file" name="video"/>
</div>

<div class="file-box full">
<label>Photo</label>
<input type="file" name="photo"/>
</div>

<div class="file-box full">
<label>Aadhar</label>
<input type="file" name="aadhar"/>
</div>

<button type="submit">Save Profile</button>

</div>

</form>

</div>

</div>

</body>
</html>