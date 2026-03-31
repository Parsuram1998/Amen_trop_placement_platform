<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop - HR Feedback</title>

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
    margin-bottom:20px;
}

.header h2{
    font-weight:600;
}

.header p{
    font-size:0.85rem;
    color:var(--muted);
    margin-top:5px;
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
    vertical-align:top;
}

tr:hover{
    background:rgba(255,255,255,0.03);
}

/* FEEDBACK BOX */
.feedback-box{
    background:#1a1a1a;
    padding:10px;
    border-radius:8px;
    font-size:0.85rem;
    line-height:1.5;
}

/* NAME STYLE */
.name{
    font-weight:500;
}

.sub{
    font-size:0.75rem;
    color:var(--muted);
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
        <a class="active">HR Feedback</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

    <div class="header">
        <h2>HR Feedback</h2>
        <p>Insights and comments shared by HR on candidate performance</p>
    </div>

    <div class="table-card">

        <table>

            <tr>
                <th>Candidate</th>
                <th>HR</th>
                <th>Feedback</th>
            </tr>

            <c:forEach items="${feedbackList}" var="f">

            <tr>

                <td>
                    <div class="name">${f.candidate.fullName}</div>
                </td>

                <td>
                    <div class="name">${f.hr.fullName}</div>
                </td>

                <td>
                    <div class="feedback-box">
                        ${f.feedback}
                    </div>
                </td>

            </tr>

            </c:forEach>

        </table>

    </div>

</div>

</body>
</html>