<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop - HR Dashboard</title>

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
    --green:#22c55e;
    --blue:#3b82f6;
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

/* HEADER */
.header{
    margin-bottom:25px;
}

.header h2{
    font-weight:600;
}

.header p{
    color:var(--muted);
    font-size:0.85rem;
}

/* STATS */
.stats{
    display:grid;
    grid-template-columns: repeat(4,1fr);
    gap:15px;
    margin-bottom:25px;
}

.stat-card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:14px;
    padding:15px;
}

.stat-title{
    font-size:0.75rem;
    color:var(--muted);
}

.stat-value{
    font-size:1.3rem;
    margin-top:5px;
}

/* ACTION CARDS */
.actions{
    display:grid;
    grid-template-columns: repeat(2,1fr);
    gap:20px;
}

.action-card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:16px;
    padding:20px;
    text-decoration:none;
    color:#fff;
    transition:0.2s;
}

.action-card:hover{
    background:#1a1a1a;
    transform:translateY(-2px);
}

/* ICON */
.icon{
    width:36px;
    height:36px;
    margin-bottom:10px;
    color:var(--gold);
}

/* TEXT */
.action-title{
    font-size:1rem;
    font-weight:500;
}

.action-desc{
    font-size:0.8rem;
    color:var(--muted);
    margin-top:5px;
}

</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="logo">AMENTROP</div>

    <div class="nav">
        <a class="active">Dashboard</a>
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
    <div class="header">
        <h2>HR Dashboard</h2>
        <p>Manage candidates, track progress, and take hiring decisions</p>
    </div>

    <!-- STATS -->
    <div class="stats">
        <div class="stat-card">
            <div class="stat-title">Total Candidates</div>
            <div class="stat-value">${totalCandidates}</div>
        </div>

        <div class="stat-card">
            <div class="stat-title">Selected</div>
            <div class="stat-value">${selectedCandidates}</div>
        </div>

        <div class="stat-card">
            <div class="stat-title">In Progress</div>
            <div class="stat-value">${inProgress}</div>
        </div>

       <%--  <div class="stat-card">
            <div class="stat-title">Rejected</div>
            <div class="stat-value">${rejected}</div>
        </div> --%>
    </div>

    <!-- ACTIONS -->
    <div class="actions">

        <a class="action-card" href="${pageContext.request.contextPath}/hr/freshers">
            <div class="icon">
                <!-- user icon -->
                <svg viewBox="0 0 24 24" fill="none">
                    <circle cx="12" cy="8" r="4" stroke="currentColor"/>
                    <path d="M4 20c0-4 4-6 8-6s8 2 8 6" stroke="currentColor"/>
                </svg>
            </div>
            <div class="action-title">Selected Freshers</div>
            <div class="action-desc">View and manage fresher candidates</div>
        </a>

        <a class="action-card" href="${pageContext.request.contextPath}/hr/professionals">
            <div class="icon">
                <svg viewBox="0 0 24 24" fill="none">
                    <rect x="4" y="4" width="16" height="16" stroke="currentColor"/>
                </svg>
            </div>
            <div class="action-title">Professionals</div>
            <div class="action-desc">View experienced candidates</div>
        </a>

        <a class="action-card" href="${pageContext.request.contextPath}/candidates">
            <div class="icon">
                <svg viewBox="0 0 24 24" fill="none">
                    <path d="M12 5v14M5 12h14" stroke="currentColor"/>
                </svg>
            </div>
            <div class="action-title">Select Candidates</div>
            <div class="action-desc">Choose candidates for hiring rounds</div>
        </a>

        <a class="action-card" href="${pageContext.request.contextPath}/hr/stats">
            <div class="icon">
                <svg viewBox="0 0 24 24" fill="none">
                    <path d="M4 20V10M10 20V4M16 20v-6M22 20v-8" stroke="currentColor"/>
                </svg>
            </div>
            <div class="action-title">Manage Candidates</div>
            <div class="action-desc">Update status and track progress</div>
        </a>

    </div>

</div>

</body>
</html>