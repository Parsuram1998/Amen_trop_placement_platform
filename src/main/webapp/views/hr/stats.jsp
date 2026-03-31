<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidates</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

:root{
    --bg:#0a0a0a;
    --sidebar:#0d0d0d;
    --card:#111;
    --hover:#1a1a1a;
    --border:rgba(255,255,255,0.06);
    --text:#ffffff;
    --muted:#9ca3af;
    --gold:#d4af37;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

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
    margin-bottom:35px;
}

.nav a{
    display:block;
    padding:10px 12px;
    border-radius:8px;
    margin-bottom:6px;
    color:var(--muted);
    text-decoration:none;
    font-size:14px;
}

.nav a:hover{
    background:var(--hover);
    color:#fff;
}

.nav a.active{
    background:rgba(212,175,55,0.12);
    color:var(--gold);
}

/* MAIN */
.main{
    flex:1;
    padding:25px 30px;
}

/* HEADER */
h2{
    margin-bottom:18px;
    font-weight:600;
}

/* TABLE CARD */
.table-card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:12px;
    overflow:hidden;
}

/* TABLE */
table{
    width:100%;
    border-collapse:collapse;
    font-size:13px;
}

th{
    background:#111;
    color:var(--muted);
    font-weight:500;
    padding:12px;
    border-bottom:1px solid var(--border);
}

td{
    padding:12px;
    border-bottom:1px solid var(--border);
}

/* ROW HOVER */
tr:hover{
    background:var(--hover);
}

/* FORM ELEMENTS */
select, textarea{
    width:100%;
    margin-top:6px;
    padding:6px 8px;
    border-radius:6px;
    border:1px solid var(--border);
    background:#0f0f0f;
    color:#fff;
    font-size:12px;
}

textarea{
    resize:none;
}

/* BUTTON */
button{
    margin-top:8px;
    padding:6px 12px;
    border:none;
    border-radius:6px;
    font-size:12px;
    cursor:pointer;
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
}

/* SCROLL */
.table-card{
    overflow-x:auto;
}
.form-row{
    display:flex;
    gap:8px;
    align-items:center;
}

.form-row select{
    flex:1;
}

.form-row button{
    white-space:nowrap;
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
        <a href="#" class="active">Selections</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

<h2>Candidate Selections</h2>

<div class="table-card">

<table>

<tr>
<th>Candidate</th>
<th>Status</th>
<th>Update</th>
</tr>

<c:forEach items="${selections}" var="s">
<tr>

<td>${s.candidate.fullName}</td>
<td>${s.status}</td>

<td>
<form method="post" action="${pageContext.request.contextPath}/hr/update-status">

<input type="hidden" name="selectionId" value="${s.id}">

<div class="form-row">
    <select name="status" onchange="toggleFeedback(this, ${s.id})">
        <option value="SHORTLISTED">Shortlisted</option>
        <option value="INTERVIEW_SCHEDULED">Interview</option>
        <option value="SELECTED">Selected</option>
        <option value="REJECTED">Rejected</option>
    </select>

    <button type="submit">Update</button>
</div>

<textarea name="feedback" id="feedback-${s.id}" 
          placeholder="Enter feedback"
          style="display:none;"></textarea>

</form>
</td>

</tr>
</c:forEach>

</table>

</div>

</div>

<!-- SCRIPT (UNCHANGED) -->
<script>
function toggleFeedback(select, id){
    let box = document.getElementById("feedback-" + id);

    if(select.value === "REJECTED"){
        box.style.display = "block";
    } else {
        box.style.display = "none";
    }
}
</script>

</body>
</html>