<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HR Candidates</title>

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

/* FILTER BOX (SMALL + CLEAN) */
.filters{
    background:var(--card);
    padding:14px;
    border-radius:10px;
    border:1px solid var(--border);
    margin-bottom:20px;
}

/* COMPACT INPUTS */
.filters input,
.filters select{
    padding:6px 8px;
    margin:4px;
    border-radius:6px;
    border:1px solid var(--border);
    background:#0f0f0f;
    color:#fff;
    font-size:12px;
}

.filters input::placeholder{
    color:var(--muted);
}

/* BUTTON */
button{
    padding:6px 12px;
    margin:4px;
    border:none;
    border-radius:6px;
    font-size:12px;
    cursor:pointer;
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
}

/* TABLE WRAPPER */
.table-wrapper{
    background:var(--card);
    border-radius:12px;
    border:1px solid var(--border);
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

/* LINKS */
a{
    color:var(--gold);
    text-decoration:none;
    font-weight:500;
}

a:hover{
    text-decoration:underline;
}

/* SCROLL */
.table-wrapper{
    overflow-x:auto;
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
        <a href="${pageContext.request.contextPath}/candidates" class="active">Candidates</a>
        <a href="${pageContext.request.contextPath}/hr/stats">Manage</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

<h2>HR Candidate Search</h2>

<!-- FILTERS -->
<div class="filters">

<input type="text" id="skillFilter" placeholder="Skill">
<input type="text" id="locationFilter" placeholder="Location">

<select id="roleFilter">
<option value="">All</option>
<option value="FRESHER">Fresher</option>
<option value="PROFESSIONAL">Professional</option>
</select>

<br/>

<input type="number" id="minExp" placeholder="Min Exp">
<input type="number" id="maxExp" placeholder="Max Exp">
<input type="number" id="maxCtc" placeholder="CTC">

<select id="noticeFilter">
<option value="">Notice</option>
<option value="Immediate">Immediate</option>
<option value="30">30 Days</option>
<option value="60">60 Days</option>
</select>

<input type="text" id="companyFilter" placeholder="Company">

<br/>

<input type="number" id="minDegree" placeholder="Degree %">

<select id="bondFilter">
<option value="">Bond</option>
<option value="true">Ready</option>
<option value="false">Not Ready</option>
</select>

<br/>

<button onclick="filterTable()">Search</button>
<button onclick="resetFilters()">Reset</button>

</div>

<!-- TABLE -->
<div class="table-wrapper">
<table>

<tr>
<th>Name</th>
<th>Email</th>
<th>Role</th>
<th>Skill</th>
<th>Location</th>
<th>Experience</th>
<th>Expected CTC</th>
<th>Notice</th>
<th>Company</th>
<th>Degree %</th>
<th>Bond</th>
<th>Action</th>
<th>Resume</th>
</tr>

<c:forEach items="${candidates}" var="c">

<tr class="candidate-row">

<td>${c.fullName}</td>
<td>${c.email}</td>
<td class="role">${c.role}</td>

<td class="skill">${skillMap[c.id]}</td>
<td class="location">${locationMap[c.id]}</td>

<td class="experience">${experienceMap[c.id]}</td>
<td class="expectedCtc">${expectedCtcMap[c.id]}</td>
<td class="notice">${noticeMap[c.id]}</td>
<td class="company">${companyMap[c.id]}</td>

<td class="degree">${degreeMap[c.id]}</td>
<td class="bond">${bondMap[c.id]}</td>

<td>
<a href="${pageContext.request.contextPath}/hr/select?candidateId=${c.id}">
Select
</a>
</td>

<td>
<c:choose>
<c:when test="${not empty resumeMap[c.id]}">
<a target="_blank"
href="${pageContext.request.contextPath}/files/${resumeMap[c.id]}">
View Resume
</a>
</c:when>
<c:otherwise>
<span style="color:gray;">Not uploaded</span>
</c:otherwise>
</c:choose>
</td>

</tr>

</c:forEach>

</table>
</div>

</div>

<!-- SCRIPT -->
<script>

function filterTable(){

    let skill = document.getElementById("skillFilter").value.toLowerCase();
    let location = document.getElementById("locationFilter").value.toLowerCase();
    let role = document.getElementById("roleFilter").value;

    let minExp = document.getElementById("minExp").value;
    let maxExp = document.getElementById("maxExp").value;
    let maxCtc = document.getElementById("maxCtc").value;

    let notice = document.getElementById("noticeFilter").value;
    let company = document.getElementById("companyFilter").value.toLowerCase();

    let minDegree = document.getElementById("minDegree").value;
    let bond = document.getElementById("bondFilter").value;

    let rows = document.getElementsByClassName("candidate-row");

    for(let i=0; i<rows.length; i++){

        let row = rows[i];

        let skillText = row.querySelector(".skill").innerText.toLowerCase();
        let locationText = row.querySelector(".location").innerText.toLowerCase();
        let roleText = row.querySelector(".role").innerText;

        let exp = parseInt(row.querySelector(".experience")?.innerText || 0);
        let ctc = parseFloat(row.querySelector(".expectedCtc")?.innerText || 0);
        let noticeText = row.querySelector(".notice")?.innerText || "";
        let companyText = row.querySelector(".company")?.innerText.toLowerCase() || "";

        let degree = parseFloat(row.querySelector(".degree")?.innerText || 0);
        let bondText = row.querySelector(".bond")?.innerText || "";

        let show = true;

        if(skill && !skillText.includes(skill)) show = false;
        if(location && !locationText.includes(location)) show = false;
        if(role && roleText !== role) show = false;

        if(minExp && exp < minExp) show = false;
        if(maxExp && exp > maxExp) show = false;
        if(maxCtc && ctc > maxCtc) show = false;

        if(notice && noticeText !== notice) show = false;
        if(company && !companyText.includes(company)) show = false;

        if(minDegree && degree < minDegree) show = false;
        if(bond && bondText !== bond) show = false;

        row.style.display = show ? "" : "none";
    }
}

function resetFilters(){
    document.querySelectorAll("input, select").forEach(e => e.value = "");
    filterTable();
}

</script>

</body>
</html>