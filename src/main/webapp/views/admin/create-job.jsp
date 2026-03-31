<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop - Create Job</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

:root{
    --bg:#0a0a0a;
    --sidebar:#0d0d0d;
    --card:#111;
    --border:rgba(255,255,255,0.06);
    --text:#fff;
    --muted:#9ca3af;
    --gold:#d4af37;
}

*{margin:0;padding:0;box-sizing:border-box}

body{
    font-family:'Inter',sans-serif;
    background:var(--bg);
    color:var(--text);
    display:flex;
}

/* ===== SIDEBAR ===== */
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
    margin-bottom:40px;
}

.nav a{
    display:block;
    padding:12px;
    border-radius:10px;
    margin-bottom:6px;
    color:var(--muted);
    text-decoration:none;
}

.nav a:hover{
    background:#1a1a1a;
    color:#fff;
}

.nav a.active{
    background:rgba(212,175,55,0.1);
    color:var(--gold);
}

/* ===== MAIN ===== */
/* MAIN */
.main{
    flex:1;
    padding:40px;
}

/* CARD */
.card{
    width:100%;
    max-width:1000px;   /* 👈 key change */
    margin:0 auto;      /* center */
    background:var(--card);
    border:1px solid var(--border);
    border-radius:18px;
    padding:30px;
}
/* TITLE */
.title{
    font-size:1.4rem;
    font-weight:600;
    margin-bottom:20px;
}

/* FORM */
.form-group{
    margin-bottom:18px;
}

label{
    font-size:0.8rem;
    color:var(--muted);
    display:block;
    margin-bottom:6px;
}

/* INPUT */
input, textarea, select{
    width:100%;
    padding:10px;
    border-radius:8px;
    border:1px solid var(--border);
    background:#1a1a1a;
    color:#fff;
    font-size:0.9rem;
}

textarea{
    resize:none;
    height:90px;
}

input:focus, textarea:focus, select:focus{
    outline:none;
    border-color:var(--gold);
}

/* TOGGLE */
.toggle{
    display:flex;
    align-items:center;
    gap:10px;
}

.toggle input{
    width:auto;
}

/* BUTTON */
.btn{
    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
    font-weight:500;
    cursor:pointer;
    margin-top:10px;
}

.btn:hover{
    opacity:0.9;
}

/* ERROR */
.error-box{
    background: rgba(239, 68, 68, 0.08);
    border: 1px solid rgba(239, 68, 68, 0.2);
    color: #ff6b6b;
    padding: 10px 12px;
    border-radius: 10px;
    margin-bottom: 15px;
    font-size: 0.85rem;
}
/* GRID */
.form-row{
    display:grid;
    grid-template-columns: 1fr 1fr;
    gap:15px;
}

/* FULL WIDTH */
.full{
    grid-column: span 2;
}

/* RESPONSIVE */
@media(max-width:768px){
    .form-row{
        grid-template-columns: 1fr;
    }
}
</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="logo">AMENTROP</div>

    <div class="nav">
        <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/admin/freshers">Freshers</a>
        <a href="${pageContext.request.contextPath}/admin/professionals">Professionals</a>
        <a href="${pageContext.request.contextPath}/admin/jobs">Jobs</a>
       <!--  <a class="active">Create Job</a> -->
        <a href="${pageContext.request.contextPath}/admin/hr-feedback">Feedback</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

    <div class="card">

        <div class="title">Create Job</div>

       <c:if test="${not empty error}">
    <div class="error-box">
        ${error}
    </div>
</c:if>

        <form action="${pageContext.request.contextPath}/admin/save-job" method="post">

    <!-- TITLE (FULL) -->
    <div class="form-group full">
        <label>Job Title</label>
        <input type="text" name="title">
    </div>

    <!-- COMPANY + LOCATION -->
    <div class="form-row">
        <div class="form-group">
            <label>Company Name</label>
            <input type="text" name="companyName">
        </div>

        <div class="form-group">
            <label>Location</label>
            <input type="text" name="location">
        </div>
    </div>

    <!-- DOMAIN + ELIGIBILITY -->
    <div class="form-row">
        <div class="form-group">
            <label>Domain</label>
            <input type="text" name="domain">
        </div>

        <div class="form-group">
            <label>Eligibility</label>
            <input type="text" name="eligibility">
        </div>
    </div>

    <!-- DESCRIPTION FULL -->
    <div class="form-group full">
        <label>Description</label>
        <textarea name="description"></textarea>
    </div>

    <!-- EXPERIENCE + % -->
    <div class="form-row">
        <div class="form-group">
            <label>Minimum Experience</label>
            <input type="number" name="minExperience">
        </div>

        <div class="form-group">
            <label>Minimum Percentage</label>
            <input type="number" step="0.01" name="minPercentage">
        </div>
    </div>

    <!-- TOGGLES -->
    <div class="form-row">
        <div class="form-group toggle">
            <input type="checkbox" name="strictApply">
            <label>Strict Apply</label>
        </div>

        <div class="form-group toggle">
            <input type="checkbox" name="bondRequired">
            <label>Bond Required</label>
        </div>
    </div>

    <!-- CATEGORY -->
    <div class="form-group full">
        <label>Job Category</label>
        <select name="jobType">
            <option value="FRESHER">Fresher</option>
            <option value="PROFESSIONAL">Professional</option>
            <option value="BOTH">Both</option>
        </select>
    </div>

    <button type="submit" class="btn">Create Job</button>

</form>

    </div>

</div>

</body>
</html>