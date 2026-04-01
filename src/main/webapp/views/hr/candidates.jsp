<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HR Candidates</title>

<style>

body {
    font-family: "Inter", sans-serif;
    background: #f6f9fc;
    margin: 0;
    padding: 20px;
    color: #081828;
}

/* HEADER */
h2 {
    margin-bottom: 20px;
    font-weight: 600;
}

/* FILTER BOX */
.filters {
    background: #ffffff;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(35, 38, 45, 0.08);
    margin-bottom: 25px;
}

/* INPUTS */
input, select {
    padding: 8px 10px;
    margin: 6px;
    border-radius: 8px;
    border: 1px solid #eee;
    font-size: 13px;
    outline: none;
    transition: all 0.2s ease;
}

input:focus, select:focus {
    border-color: #2042e3;
    box-shadow: 0 0 0 2px #2042e31c;
}

/* BUTTONS */
button {
    padding: 8px 16px;
    margin: 6px;
    border: none;
    border-radius: 8px;
    font-size: 13px;
    cursor: pointer;
    background: #2042e3;
    color: #fff;
    transition: all 0.2s ease;
}

button:hover {
    background: #081828;
}

/* TABLE */
table {
    width: 100%;
    border-collapse: collapse;
    background: #ffffff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(35, 38, 45, 0.08);
}

/* HEADER */
th {
    background: #2042e3;
    color: #ffffff;
    font-weight: 500;
    font-size: 13px;
    padding: 12px;
}

/* CELLS */
td {
    padding: 10px;
    font-size: 13px;
    color: #555;
    border-bottom: 1px solid #f0f0f0;
}

/* ROW HOVER (soft, no black effect) */
tr:hover {
    background: #f6f9fc;
}

/* LINKS */
a {
    color: #2042e3;
    text-decoration: none;
    font-weight: 500;
}

a:hover {
    text-decoration: underline;
}

/* BADGE STYLE */
td.verified, td.approved {
    font-weight: 500;
}

td.verified:contains("true"),
td.approved:contains("true") {
    color: green;
}

/* LOCK STATUS */
td.locked {
    font-weight: 500;
}

/* SCROLL FOR LARGE TABLE */
table {
    display: block;
    overflow-x: auto;
    white-space: nowrap;
}

</style>

</head>
<body>

<h2>👨‍💼 HR Candidate Search</h2>

<div class="filters">

    <!-- COMMON -->
    <input type="text" id="skillFilter" placeholder="Skill (Java, SQL)">
    <input type="text" id="locationFilter" placeholder="Location">

    <select id="roleFilter">
        <option value="">All</option>
        <option value="FRESHER">Fresher</option>
        <option value="PROFESSIONAL">Professional</option>
    </select>

    <br/>

    <!-- PROFESSIONAL -->
    <input type="number" id="minExp" placeholder="Min Exp">
    <input type="number" id="maxExp" placeholder="Max Exp">

    <input type="number" id="maxCtc" placeholder="Max Expected CTC">

    <select id="noticeFilter">
        <option value="">Notice</option>
        <option value="Immediate">Immediate</option>
        <option value="30">30 Days</option>
        <option value="60">60 Days</option>
    </select>

    <input type="text" id="companyFilter" placeholder="Company">

    <br/>

    <!-- FRESHER -->
    <input type="number" id="minDegree" placeholder="Min Degree %">

    <select id="bondFilter">
        <option value="">Bond</option>
        <option value="true">Ready</option>
        <option value="false">Not Ready</option>
    </select>

    <br/>

    <!-- GLOBAL -->
<!--     <select id="verifiedFilter">
        <option value="">Verified</option>
        <option value="true">Yes</option>
        <option value="false">No</option>
    </select>

    <select id="statusFilter">
        <option value="">Approved</option>
        <option value="true">Yes</option>
        <option value="false">No</option>
    </select>

    <select id="lockFilter">
        <option value="">Availability</option>
        <option value="free">Free</option>
        <option value="locked">Locked</option>
    </select> -->

    <br/>

    <button onclick="filterTable()">Search</button>
    <button onclick="resetFilters()">Reset</button>

</div>

<!-- TABLE -->
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

<!-- <th>Verified</th>
<th>Approved</th>
<th>Locked</th> -->

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

<%-- <td class="verified">${verifiedMap[c.id]}</td>
<td class="approved">${approvedMap[c.id]}</td>
<td class="locked">${lockedMap[c.id]}</td> --%>

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