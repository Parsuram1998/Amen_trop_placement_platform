<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Job Details</title>

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
    --green:#2ea043;
    --red:#ff4d4d;
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
}

.nav-links a:hover{
    color:#fff;
}

/* MAIN */
.main{
    max-width:950px;
    margin:auto;
    padding:30px;
}

/* TITLE */
.title{
    font-size:1.8rem;
    margin-bottom:10px;
}

/* ALERT */
.alert{
    padding:10px 14px;
    border-radius:8px;
    margin-bottom:15px;
    font-size:0.85rem;
}

.success{
    background:#2ea04322;
    color:#3fb950;
}

.error{
    background:#ff4d4d22;
    color:#ff6b6b;
}

/* CARD */
.card{
    background:linear-gradient(145deg,#111,#0d0d0d);
    border:1px solid var(--border);
    border-radius:16px;
    padding:22px;
    margin-top:15px;
}

/* GRID */
.grid{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:18px;
}

.full{
    grid-column:span 2;
}

/* LABEL */
.label{
    font-size:0.75rem;
    color:var(--muted);
}

.value{
    margin-top:4px;
    font-weight:500;
}

/* APPLY */
.apply-btn{
    margin-top:20px;
    padding:10px 18px;
    border:none;
    border-radius:10px;
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
    font-weight:600;
    cursor:pointer;
}

/* UPDATES */
.section-title{
    margin-top:30px;
    margin-bottom:10px;
    color:var(--gold);
}

.update-card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:10px;
    padding:12px;
    margin-bottom:10px;
}

.update-card small{
    color:var(--muted);
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

<!-- COMMON NAVBAR -->
<div class="navbar">
    <div class="logo">AMENTROP</div>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/home">Home</a>
        <a href="${pageContext.request.contextPath}/jobs">Jobs</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

<div class="title">${job.title}</div>

<!-- ALERTS -->
<c:if test="${param.applied eq 'true'}">
    <div class="alert success">Application submitted successfully.</div>
</c:if>

<c:if test="${param.alreadyApplied eq 'true'}">
    <div class="alert success">You have already applied for this job.</div>
</c:if>

<c:if test="${param.notEligible eq 'true'}">
    <div class="alert error">Not applicable for your profile.</div>
</c:if>

<!-- DETAILS -->
<div class="card">

<div class="grid">

<div>
<div class="label">Company</div>
<div class="value">${job.companyName}</div>
</div>

<div>
<div class="label">Location</div>
<div class="value">${job.location}</div>
</div>

<div>
<div class="label">Domain</div>
<div class="value">${job.domain}</div>
</div>

<div>
<div class="label">Job Type</div>
<div class="value">${job.jobType}</div>
</div>

<div>
<div class="label">Minimum Experience</div>
<div class="value">${job.minExperience}</div>
</div>

<div>
<div class="label">Minimum Percentage</div>
<div class="value">${job.minPercentage}</div>
</div>

<div class="full">
<div class="label">Description</div>
<div class="value">${job.description}</div>
</div>

<div class="full">
<div class="label">Eligibility</div>
<div class="value">${job.eligibility}</div>
</div>

</div>

<!-- APPLY -->
<c:choose>
    <c:when test="${alreadyApplied}">
        <div class="alert success" style="margin-top:15px;">
            You have already applied.
        </div>
    </c:when>
    <c:otherwise>
        <form action="${pageContext.request.contextPath}/jobs/apply" method="post">
            <input type="hidden" name="jobId" value="${job.id}">
            <button class="apply-btn" type="submit">Apply Now</button>
        </form>
    </c:otherwise>
</c:choose>

</div>

<!-- UPDATES -->
<div class="section-title">Updates</div>

<c:forEach items="${updates}" var="u">

<div class="update-card">
${u.updateText}<br>
<small>${u.createdAt}</small>
</div>

</c:forEach>

<a class="back" href="${pageContext.request.contextPath}/jobs">
← Back to Jobs
</a>

</div>

</body>
</html>