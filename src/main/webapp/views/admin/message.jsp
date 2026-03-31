<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop - Send Message</title>

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
    --red:#ef4444;
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

/* GRID */
.container{
    display:grid;
    grid-template-columns: 1fr 1fr;
    gap:20px;
}

/* CARD */
.card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:16px;
    padding:20px;
}

/* FORM */
label{
    font-size:0.8rem;
    color:var(--muted);
    display:block;
    margin-bottom:6px;
}

input[type="text"], textarea{
    width:100%;
    padding:10px;
    border-radius:8px;
    border:1px solid var(--border);
    background:#1a1a1a;
    color:#fff;
    margin-bottom:15px;
}

textarea{
    height:120px;
}

/* BUTTON */
.btn{
    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
    font-weight:500;
    cursor:pointer;
}

/* ALERT */
.alert{
    padding:10px;
    border-radius:8px;
    margin-bottom:15px;
    font-size:0.85rem;
}

.success{
    background:rgba(34,197,94,0.1);
    color:var(--green);
}

.error{
    background:rgba(239,68,68,0.1);
    color:var(--red);
}

/* ===== USER LIST ===== */
.user-list{
    max-height:350px;
    overflow-y:auto;
    display:flex;
    flex-direction:column;
    gap:10px;
}

/* USER CARD */
.user-card{
    display:flex;
    align-items:center;
    gap:12px;
    padding:12px;
    border-radius:12px;
    border:1px solid var(--border);
    background:#141414;
    cursor:pointer;
    transition:0.2s;
}

.user-card:hover{
    background:#1a1a1a;
}

/* HIDE CHECKBOX */
.user-checkbox{
    display:none;
}

/* USER TEXT */
.user-name{
    font-size:0.9rem;
}

.user-role{
    font-size:0.75rem;
    color:var(--muted);
}

/* SELECTED STATE */
.user-card.active{
    background:rgba(212,175,55,0.08);
    border:1px solid rgba(212,175,55,0.4);
    box-shadow:0 0 8px rgba(212,175,55,0.2);
}

/* SELECT ALL */
.select-all{
    display:flex;
    align-items:center;
    gap:8px;
    margin-bottom:10px;
    font-size:0.85rem;
}
.search-input{
    width:100%;
    padding:10px;
    border-radius:8px;
    border:1px solid var(--border);
    background:#1a1a1a;
    color:#fff;
    margin-bottom:12px;
}

.search-input:focus{
    outline:none;
    border-color:#d4af37;
}
</style>

<script>

/* SELECT ALL */
function toggleAll(source) {
    let checkboxes = document.getElementsByName('userIds');
    checkboxes.forEach(cb => {
        cb.checked = source.checked;
        toggleCard(cb);
    });
}

/* INDIVIDUAL CARD TOGGLE */
function toggleCard(checkbox){
    const card = checkbox.closest('.user-card');
    if(checkbox.checked){
        card.classList.add('active');
    }else{
        card.classList.remove('active');
    }
}

window.onload = function(){
    document.querySelectorAll('.user-checkbox').forEach(cb => {
        cb.addEventListener('change', function(){
            toggleCard(this);
        });
    });
}
function filterUsers(){
    const input = document.getElementById("userSearch").value.toLowerCase();
    const cards = document.querySelectorAll(".user-card");

    cards.forEach(card => {
        const name = card.querySelector(".user-name").innerText.toLowerCase();
        const role = card.querySelector(".user-role").innerText.toLowerCase();

        if(name.includes(input) || role.includes(input)){
            card.style.display = "flex";
        } else {
            card.style.display = "none";
        }
    });
}

/* attach event */
window.onload = function(){
    document.querySelectorAll('.user-checkbox').forEach(cb => {
        cb.addEventListener('change', function(){
            toggleCard(this);
        });
    });

    document.getElementById("userSearch").addEventListener("keyup", filterUsers);
}
</script>

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
        <a href="${pageContext.request.contextPath}/admin/hr-feedback">Feedback</a>
        <a class="active">Send Message</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

    <div class="header">
        <h2>Send Message</h2>
    </div>

    <!-- ALERTS -->
    <c:if test="${param.success eq 'true'}">
        <div class="alert success">Message sent successfully</div>
    </c:if>

    <c:if test="${param.error eq 'noUsersSelected'}">
        <div class="alert error">Please select at least one user</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/admin/send-message">

        <div class="container">

            <!-- LEFT -->
            <div class="card">

                <label>Client Name (optional)</label>
                <input type="text" name="clientName">

                <label>Message</label>
                <textarea name="content"></textarea>

                <button class="btn">Send Message</button>

            </div>

            <!-- RIGHT -->
            <div class="card">

                <div class="select-all">
                    <input type="checkbox" onclick="toggleAll(this)">
                    <span>Select All Users</span>
                </div>
<input type="text"
       id="userSearch"
       placeholder="Search users..."
       class="search-input">
                <div class="user-list">

                    <c:forEach items="${users}" var="u">

                        <label class="user-card">

                            <input type="checkbox"
                                   class="user-checkbox"
                                   name="userIds"
                                   value="${u.id}">

                            <div>
                                <div class="user-name">${u.fullName}</div>
                                <div class="user-role">${u.role}</div>
                            </div>

                        </label>

                    </c:forEach>

                </div>

            </div>

        </div>

    </form>

</div>

</body>
</html>