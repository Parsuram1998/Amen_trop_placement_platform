<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Jobs</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

:root{
    --bg:#0a0a0a;
    --card:#111;
    --hover:#1a1a1a;
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
}

/* NAVBAR */
.navbar{
    padding:15px 30px;
    border-bottom:1px solid var(--border);
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.logo{
    font-size:1.3rem;
    font-weight:600;
    color:var(--gold);
}

.nav-links a{
    margin-left:20px;
    color:var(--muted);
    text-decoration:none;
    font-size:0.9rem;
}

.nav-links a:hover{
    color:#fff;
}

/* MAIN */
.main{
    padding:30px;
    max-width:1000px;
    margin:auto;
}

/* HEADER */
.header h2{
    font-size:1.7rem;
    margin-bottom:20px;
}

/* JOB CARD */
.job-card{
    background:linear-gradient(145deg,#111,#0d0d0d);
    border:1px solid var(--border);
    border-radius:16px;
    padding:18px;
    margin-bottom:15px;
    transition:0.2s;
}

.job-card:hover{
    background:var(--hover);
    transform:translateY(-2px);
}

/* TITLE */
.job-title{
    font-size:1.05rem;
    font-weight:600;
    margin-bottom:6px;
}

/* COMPANY */
.company{
    color:var(--muted);
    font-size:0.9rem;
}

/* META */
.meta{
    margin-top:8px;
    font-size:0.85rem;
    color:var(--muted);
}

/* FOOTER */
.job-footer{
    margin-top:12px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

/* BUTTON */
.btn{
    padding:7px 14px;
    border-radius:8px;
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
    text-decoration:none;
    font-size:0.85rem;
    font-weight:500;
}

</style>

</head>

<body>

<!-- COMMON NAVBAR -->
<div class="navbar">
    <div class="logo">AMENTROP</div>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/">Home</a>
       
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

<div class="header">
    <h2>Available Jobs</h2>
</div>

<c:forEach items="${jobs}" var="j">

<div class="job-card">

<div class="job-title">${j.title}</div>

<div class="company">${j.companyName}</div>

<div class="meta">
📍 ${j.location}
</div>

<div class="job-footer">

<span class="meta">Explore opportunity</span>

<a class="btn"
   href="${pageContext.request.contextPath}/jobs/details?id=${j.id}">
   View Details
</a>

</div>

</div>

</c:forEach>

</div>

</body>
</html>