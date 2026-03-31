<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop - Jobs</title>

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
.main{
    flex:1;
    padding:30px;
}

/* HEADER */
.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.header h2{
    font-weight:600;
}

.btn-primary{
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
    padding:8px 14px;
    border-radius:8px;
    text-decoration:none;
    font-size:0.85rem;
}

/* TABLE */
.table-card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:14px;
    overflow:hidden;
}

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

/* ACTION ICON */
.icon-btn{
    background:#1a1a1a;
    border:1px solid rgba(255,255,255,0.05);
    padding:6px;
    border-radius:6px;
    cursor:pointer;
    color:#aaa;
    display:inline-flex;
    align-items:center;
    justify-content:center;
    transition:0.2s;
}

.icon-btn:hover{
    background:#222;
    color:#d4af37;
}

/* UPDATE INPUT */
.update-box{
    display:flex;
    gap:6px;
}

.update-box input{
    padding:6px;
    border-radius:6px;
    border:1px solid var(--border);
    background:#1a1a1a;
    color:#fff;
    font-size:0.75rem;
}

.update-box button{
    background:#222;
    border:none;
    padding:6px 10px;
    border-radius:6px;
    color:#fff;
    cursor:pointer;
}

/* SMALL TEXT */
.muted{
    color:var(--muted);
    font-size:0.8rem;
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
        <a class="active">Jobs</a>
        <a href="${pageContext.request.contextPath}/admin/create-job">Create Job</a>
        <a href="${pageContext.request.contextPath}/admin/hr-feedback">Feedback</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

    <div class="header">
        <h2>Job Management</h2>

        <a class="btn-primary"
           href="${pageContext.request.contextPath}/admin/create-job">
            + Create Job
        </a>
    </div>

    <div class="table-card">

        <table>

            <tr>
                <th>Title</th>
                <th>Company</th>
                <th>Location</th>
                <th>Domain</th>
                <th>Min Exp</th>
                <th>Applicants</th>
                <th>Update</th>
            </tr>

            <c:forEach items="${jobs}" var="j">

            <tr>

                <td>${j.title}</td>
                <td class="muted">${j.companyName}</td>
                <td>${j.location}</td>
                <td>${j.domain}</td>
                <td>${j.minExperience}</td>

                <!-- VIEW APPLICANTS ICON -->
                <td>
                    <a class="icon-btn"
                       href="${pageContext.request.contextPath}/admin/job-applicants?jobId=${j.id}"
                       title="View Applicants">

                        <svg width="16" height="16" viewBox="0 0 24 24">
                            <path d="M3 12s4-6 9-6 9 6 9 6-4 6-9 6-9-6-9-6z" stroke="currentColor" fill="none"/>
                            <circle cx="12" cy="12" r="3" stroke="currentColor"/>
                        </svg>

                    </a>
                </td>

                <!-- UPDATE -->
                <td>

                    <form method="post"
                          action="${pageContext.request.contextPath}/admin/add-update">

                        <input type="hidden" name="jobId" value="${j.id}">

                        <div class="update-box">
                            <input type="text"
                                   name="updateText"
                                   placeholder="Add update">
                            <button>Save</button>
                        </div>

                    </form>

                </td>

            </tr>

            </c:forEach>

        </table>

    </div>

</div>

</body>
</html>