<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop - Professionals</title>

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

.header{
    display:flex;
    justify-content:space-between;
    margin-bottom:20px;
}

.header h2{
    font-weight:600;
}

/* ===== CARD TABLE ===== */
.card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:16px;
    overflow:hidden;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    text-align:left;
    padding:16px;
    font-size:0.75rem;
    color:var(--muted);
    background:#111;
}

td{
    padding:16px;
    border-top:1px solid var(--border);
    font-size:0.9rem;
}

tr:hover{
    background:rgba(255,255,255,0.03);
}

/* BADGE */
.badge{
    padding:5px 10px;
    border-radius:20px;
    font-size:0.75rem;
}

.verified{
    background:#163d2c;
    color:var(--green);
}

.not-verified{
    background:#3d2f14;
    color:#f59e0b;
}

/* ACTIONS */
.action-bar{
    display:flex;
    align-items:center;
    gap:8px;
}

/* BUTTON */
.btn{
    background:linear-gradient(135deg,#d4af37,#f5d173);
    border:none;
    padding:6px 10px;
    border-radius:6px;
    font-size:0.75rem;
    cursor:pointer;
    color:#000;
}

/* ICON BUTTON */
.icon-btn{
    background:#1a1a1a;
    border:1px solid rgba(255,255,255,0.05);
    padding:6px;
    border-radius:6px;
    cursor:pointer;
    color:#aaa;
    display:flex;
    align-items:center;
    justify-content:center;
    transition:0.2s;
}

.icon-btn:hover{
    background:#222;
    color:#d4af37;
}

/* PAGINATION */
.pagination{
    margin-top:20px;
    display:flex;
    justify-content:center;
    gap:10px;
}

.pagination a{
    padding:6px 10px;
    background:#1a1a1a;
    border-radius:6px;
    color:#fff;
    text-decoration:none;
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
        <a class="active">Professionals</a>
        <a href="${pageContext.request.contextPath}/admin/jobs">Jobs</a>
        <a href="${pageContext.request.contextPath}/admin/hr-feedback">Feedback</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

    <div class="header">
        <h2>Professional Candidates</h2>
        <span>Total: ${totalProfessionals}</span>
    </div>

    <div class="card">

        <table>

            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Exp</th>
                <th>Role</th>
                <th>Skills</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>

            <c:forEach items="${professionals}" var="p">

            <tr>

                <td>${p.user.fullName}</td>
                <td>${p.user.email}</td>
                <td>${p.experienceYears} yrs</td>
                <td>${p.currentRole}</td>
                <td>${p.skillSet}</td>

                <!-- VERIFIED -->
                <td>
                    <c:choose>
                        <c:when test="${p.verified}">
                            <span class="badge verified">Verified</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge not-verified">Pending</span>
                        </c:otherwise>
                    </c:choose>
                </td>

                <!-- ACTIONS -->
                <td>

                    <div class="action-bar">

                        <!-- VERIFY -->
                        <c:if test="${!p.verified}">
                            <form action="${pageContext.request.contextPath}/admin/verify-professional" method="post">
                                <input type="hidden" name="id" value="${p.id}">
                                <button class="btn">Verify</button>
                            </form>
                        </c:if>

                        <!-- RESUME ICON -->
                        <a class="icon-btn"
                           href="${pageContext.request.contextPath}/files/${p.resumePath}"
                           target="_blank" title="Resume">

                            <svg width="16" height="16" viewBox="0 0 24 24">
                                <path d="M6 2h9l5 5v15H6z" stroke="currentColor" fill="none"/>
                                <path d="M14 2v6h6" stroke="currentColor"/>
                            </svg>
                        </a>

                        <!-- APPROVE ICON -->
                        <a class="icon-btn"
                           href="${pageContext.request.contextPath}/admin/approve-candidate?userId=${p.user.id}"
                           title="Approve">

                            <svg width="16" height="16" viewBox="0 0 24 24">
                                <path d="M5 13l4 4L19 7" stroke="currentColor" stroke-width="2"/>
                            </svg>
                        </a>

                    </div>

                </td>

            </tr>

            </c:forEach>

        </table>

    </div>

    <!-- PAGINATION -->
    <div class="pagination">

        <c:if test="${currentPage>0}">
            <a href="${pageContext.request.contextPath}/admin/professionals?page=${currentPage-1}">
                Prev
            </a>
        </c:if>

        <span>Page ${currentPage+1} / ${totalPages}</span>

        <c:if test="${currentPage+1<totalPages}">
            <a href="${pageContext.request.contextPath}/admin/professionals?page=${currentPage+1}">
                Next
            </a>
        </c:if>

    </div>

</div>

</body>
</html>