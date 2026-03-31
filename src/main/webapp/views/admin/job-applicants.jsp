<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop - Applicants</title>

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

.download-btn{
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
    padding:8px 14px;
    border-radius:8px;
    text-decoration:none;
    font-size:0.85rem;
}

/* FILTER BAR */
.filter-card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:14px;
    padding:15px;
    margin-bottom:20px;
}

.filter-row{
    display:grid;
    grid-template-columns: repeat(5,1fr);
    gap:12px;
}

.filter-row input,
.filter-row select{
    padding:8px;
    border-radius:6px;
    border:1px solid var(--border);
    background:#1a1a1a;
    color:#fff;
}

.filter-btn{
    background:#222;
    border:none;
    border-radius:6px;
    color:#fff;
    cursor:pointer;
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

.badge{
    padding:4px 10px;
    border-radius:20px;
    font-size:0.75rem;
    background:#1f1f1f;
}

/* RESPONSIVE */
@media(max-width:1000px){
    .filter-row{
        grid-template-columns:1fr;
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
        <a class="active">Applicants</a>
        <a href="${pageContext.request.contextPath}/admin/hr-feedback">Feedback</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

    <div class="header">
        <h2>Applicants - ${job.title}</h2>

        <a class="download-btn"
           href="${pageContext.request.contextPath}/admin/download-applicants?jobId=${job.id}&skill=${param.skill}&role=${param.role}&minExperience=${param.minExperience}&minDegree=${param.minDegree}">
            Download Excel
        </a>
    </div>

    <!-- FILTER -->
    <div class="filter-card">

        <form method="get" action="${pageContext.request.contextPath}/admin/job-applicants">

            <input type="hidden" name="jobId" value="${job.id}">

            <div class="filter-row">

                <input type="text" name="skill" placeholder="Skill" value="${param.skill}">

                <select name="role">
                    <option value="">All Roles</option>
                    <option value="FRESHER" ${param.role eq 'FRESHER' ? 'selected' : ''}>Fresher</option>
                    <option value="PROFESSIONAL" ${param.role eq 'PROFESSIONAL' ? 'selected' : ''}>Professional</option>
                </select>

                <input type="number" name="minExperience" placeholder="Min Exp" value="${param.minExperience}">

                <input type="number" step="0.01" name="minDegree" placeholder="Min %" value="${param.minDegree}">

                <button class="filter-btn">Apply</button>

            </div>

        </form>

    </div>

    <!-- TABLE -->
    <div class="table-card">

        <table>

            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Applied At</th>
            </tr>

<%@ page import="java.time.format.DateTimeFormatter" %>

<c:forEach items="${applications}" var="a">
    <tr>
        <td>${a.user.fullName}</td>
        <td>${a.user.email}</td>
        <td>${a.user.phone}</td>
        <td>
            <span class="badge">${a.user.role}</span>
        </td>
        <td>
            <%
            java.time.LocalDateTime appliedAt =
                                ((in.sp.main.Entities.JobApplication) pageContext.getAttribute("a")).getAppliedAt();

            		if (appliedAt != null) {
            			java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter
            					.ofPattern("dd MMM yyyy, hh:mm a");

            			out.print(appliedAt.format(formatter));
            		}
            %>
        </td>
    </tr>
</c:forEach>
        </table>

    </div>

</div>

</body>
</html>