<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop - Candidate Profile</title>

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

/* MAIN */
.main{
    flex:1;
    padding:30px;
}

/* PROFILE HEADER */
.profile-header{
    margin-bottom:25px;
}

.profile-header h2{
    font-weight:600;
}

.profile-header p{
    color:var(--muted);
    font-size:0.85rem;
}

/* GRID */
.grid{
    display:grid;
    grid-template-columns: repeat(2,1fr);
    gap:20px;
}

/* CARD */
.card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:14px;
    padding:18px;
}

/* LABEL */
.label{
    font-size:0.75rem;
    color:var(--muted);
}

/* VALUE */
.value{
    margin-top:5px;
    font-size:0.95rem;
}

/* FULL WIDTH */
.full{
    grid-column: span 2;
}

/* BUTTON */
.btn{
    display:inline-block;
    margin-top:10px;
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
    padding:10px 16px;
    border-radius:8px;
    text-decoration:none;
    font-size:0.85rem;
}

</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="logo">AMENTROP</div>

    <div class="nav">
        <a href="${pageContext.request.contextPath}/hr/dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/hr/freshers">Freshers</a>
        <a href="${pageContext.request.contextPath}/hr/professionals">Professionals</a>
        <a href="${pageContext.request.contextPath}/candidates">Select Candidates</a>
        <a href="${pageContext.request.contextPath}/hr/stats">Manage Candidates</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

    <!-- HEADER -->
    <div class="profile-header">
        <h2>${profile.user.fullName}</h2>
        <p>Fresher Candidate Profile</p>
    </div>

    <!-- GRID -->
    <div class="grid">

        <div class="card">
            <div class="label">Email</div>
            <div class="value">${profile.user.email}</div>
        </div>

        <div class="card">
            <div class="label">Phone</div>
            <div class="value">${profile.user.phone}</div>
        </div>

        <div class="card">
            <div class="label">Skill Set</div>
            <div class="value">${profile.skillSet}</div>
        </div>

        <div class="card">
            <div class="label">Domain Interested</div>
            <div class="value">${profile.domainInterested}</div>
        </div>

        <div class="card">
            <div class="label">10th Percentage</div>
            <div class="value">${profile.tenthPercentage}%</div>
        </div>

        <div class="card">
            <div class="label">12th Percentage</div>
            <div class="value">${profile.twelfthPercentage}%</div>
        </div>

        <div class="card full">
            <div class="label">Degree Percentage</div>
            <div class="value">${profile.degreePercentage}%</div>
        </div>

        <!-- RESUME -->
        <div class="card full">
            <div class="label">Resume</div>
            <a class="btn"
               target="_blank"
               href="${pageContext.request.contextPath}/files/${profile.resumePath}">
                Download Resume
            </a>
        </div>

    </div>

</div>

</body>
</html>