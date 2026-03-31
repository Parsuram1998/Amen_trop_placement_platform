<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop - Selected Freshers</title>

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

/* HEADER */
.header{
    margin-bottom:20px;
}

.header h2{
    font-weight:600;
}

.header p{
    color:var(--muted);
    font-size:0.85rem;
}

/* TABLE CARD */
.table-card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:14px;
    overflow:hidden;
}

/* TABLE */
table{
    width:100%;
    border-collapse:collapse;
}

th{
    text-align:left;
    padding:14px;
    font-size:0.75rem;
    color:var(--muted);
    background:#111;
}

td{
    padding:14px;
    border-top:1px solid var(--border);
}

tr:hover{
    background:rgba(255,255,255,0.03);
}

/* ACTION BUTTON */
.btn{
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
    padding:6px 10px;
    border-radius:6px;
    text-decoration:none;
    font-size:0.75rem;
}

/* ICON BUTTON */
.icon-btn{
    background:#1a1a1a;
    border:1px solid rgba(255,255,255,0.05);
    padding:6px;
    border-radius:6px;
    display:inline-flex;
    align-items:center;
    justify-content:center;
    color:#aaa;
    transition:0.2s;
}

.icon-btn:hover{
    background:#222;
    color:#d4af37;
}

/* MUTED */
.muted{
    color:var(--muted);
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
        <a class="active">Selected Freshers</a>
        <a href="${pageContext.request.contextPath}/hr/professionals">Professionals</a>
        <a href="${pageContext.request.contextPath}/candidates">Select Candidates</a>
        <a href="${pageContext.request.contextPath}/hr/stats">Manage Candidates</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

    <div class="header">
        <h2>Selected Fresher Candidates</h2>
        <p>Review shortlisted fresher candidates and take further actions</p>
    </div>

    <div class="table-card">

        <table>

            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Skill</th>
                <th>Domain</th>
                <th>%</th>
                <th>Resume</th>
                <th>Profile</th>
            </tr>

            <c:forEach items="${freshers}" var="f">

            <tr>

                <td>${f.user.fullName}</td>

                <td class="muted">${f.user.email}</td>

                <td>${f.skillSet}</td>

                <td>${f.domainInterested}</td>

                <td>${f.degreePercentage}</td>

                <!-- RESUME ICON -->
                <td>
                    <a class="icon-btn"
                       target="_blank"
                       href="${pageContext.request.contextPath}/files/${f.resumePath}"
                       title="Download Resume">

                        <svg width="16" height="16" viewBox="0 0 24 24">
                            <path d="M6 2h9l5 5v15H6z" stroke="currentColor" fill="none"/>
                            <path d="M14 2v6h6" stroke="currentColor"/>
                        </svg>

                    </a>
                </td>

                <!-- PROFILE BUTTON -->
                <td>
                    <a class="btn"
                       href="${pageContext.request.contextPath}/hr/fresher-profile?id=${f.id}">
                        View
                    </a>
                </td>

            </tr>

            </c:forEach>

        </table>

    </div>

</div>

</body>
</html>