<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop Admin</title>

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
    transition:0.2s;
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
    margin-bottom:25px;
}

.header h2{
    font-weight:600;
}

.header span{
    color:var(--muted);
    font-size:0.9rem;
}

/* ===== CARD ===== */
.card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:16px;
    overflow:hidden;
}

/* ===== TABLE ===== */
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

/* STATUS BADGE */
.badge{
    padding:5px 10px;
    border-radius:20px;
    font-size:0.75rem;
}

.selected{background:#163d2c;color:#22c55e;}
.progress{background:#3d2f14;color:#f59e0b;}
.improve{background:#3d1414;color:#ef4444;}

/* ACTIONS */
.action-bar{
    display:flex;
    gap:8px;
    align-items:center;
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
    border-color:rgba(212,175,55,0.3);
}

/* SELECT */
select{
    background:#1a1a1a;
    border:1px solid var(--border);
    color:#fff;
    padding:6px;
    border-radius:6px;
    font-size:0.75rem;
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
        <a class="active">Freshers</a>
        <a href="${pageContext.request.contextPath}/admin/professionals">Professionals</a>
        <a href="${pageContext.request.contextPath}/admin/jobs">Jobs</a>
        <a href="${pageContext.request.contextPath}/admin/hr-feedback">Feedback</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

    <div class="header">
        <h2>Fresher Management</h2>
        <span>Total: ${totalFreshers}</span>
    </div>

    <div class="card">

        <table>

            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Skill</th>
                <th>Domain</th>
                <th>%</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>

            <c:forEach items="${freshers}" var="f">

            <tr>

                <td>${f.user != null ? f.user.fullName : 'N/A'}</td>
                <td>${f.user != null ? f.user.email : 'N/A'}</td>
                <td>${f.skillSet}</td>
                <td>${f.domainInterested}</td>
                <td>${f.degreePercentage}</td>

                <td>
                    <c:choose>
                        <c:when test="${f.status == 'SELECTED'}">
                            <span class="badge selected">Selected</span>
                        </c:when>
                        <c:when test="${f.status == 'IN_PROGRESS'}">
                            <span class="badge progress">In Progress</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge improve">Needs Work</span>
                        </c:otherwise>
                    </c:choose>
                </td>

                <!-- 🔥 PREMIUM ACTIONS -->
                <td>

                    <div class="action-bar">

                        <!-- STATUS -->
                        <form action="${pageContext.request.contextPath}/admin/update-status" method="post">
                            <input type="hidden" name="id" value="${f.id}"/>

                            <select name="status">
                                <option value="IN_PROGRESS">In Progress</option>
                                <option value="SELECTED">Selected</option>
                                <option value="NEEDS_IMPROVEMENT">Needs Work</option>
                            </select>

                            <button class="btn">Save</button>
                        </form>

                        <!-- ICON ACTIONS -->
                     <a class="icon-btn"
   href="${pageContext.request.contextPath}/files/${f.resumePath}"
   target="_blank" title="View Resume">

    <!-- Document Icon -->
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
        <path d="M6 2h9l5 5v15H6V2z" stroke="currentColor" stroke-width="1.5"/>
        <path d="M14 2v6h6" stroke="currentColor" stroke-width="1.5"/>
    </svg>

</a>

<a class="icon-btn"
   href="${pageContext.request.contextPath}/admin/generate-certificate?fresherId=${f.id}"
   title="Generate Certificate">

    <!-- Certificate Icon -->
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
        <circle cx="12" cy="10" r="3" stroke="currentColor" stroke-width="1.5"/>
        <path d="M8 14l-2 6 4-2 4 2-2-6" stroke="currentColor" stroke-width="1.5"/>
    </svg>

</a>

<a class="icon-btn"
   href="${pageContext.request.contextPath}/admin/approve-candidate?userId=${f.user.id}"
   title="Approve Candidate">

    <!-- Check Icon -->
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
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

        <c:if test="${currentPage > 0}">
            <a href="${pageContext.request.contextPath}/admin/freshers?page=${currentPage-1}">Prev</a>
        </c:if>

        <span>Page ${currentPage+1} / ${totalPages}</span>

        <c:if test="${currentPage+1 < totalPages}">
            <a href="${pageContext.request.contextPath}/admin/freshers?page=${currentPage+1}">Next</a>
        </c:if>

    </div>

</div>

</body>
</html>