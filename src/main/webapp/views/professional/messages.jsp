<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Messages</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

:root{
    --bg:#0a0a0a;
    --sidebar:#0d0d0d;
    --card:#111;
    --hover:#1a1a1a;
    --border:rgba(255,255,255,0.06);
    --text:#fff;
    --muted:#9ca3af;
    --gold:#d4af37;
}

/* RESET */
*{margin:0;padding:0;box-sizing:border-box}

body{
    font-family:'Inter',sans-serif;
    background:radial-gradient(circle at top,#111,#0a0a0a);
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
    padding:35px;
}

/* HEADER */
.header h2{
    font-size:1.7rem;
    margin-bottom:20px;
}

/* MESSAGE LIST */
.messages{
    max-width:800px;
}

/* CARD */
.message{
    background:linear-gradient(145deg,#111,#0d0d0d);
    border:1px solid var(--border);
    border-radius:14px;
    padding:16px;
    margin-bottom:15px;
    transition:0.2s;
}

.message:hover{
    background:var(--hover);
}

/* HEADER */
.msg-header{
    font-size:0.85rem;
    color:var(--muted);
    margin-bottom:8px;
}

/* SENDER */
.sender{
    font-weight:600;
    color:#fff;
}

/* CONTENT */
.content{
    font-size:0.9rem;
    color:#e5e7eb;
    line-height:1.4;
}

/* BUTTON */
.btn{
    display:inline-block;
    margin-top:20px;
    padding:8px 14px;
    border-radius:8px;
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
    text-decoration:none;
    font-size:0.85rem;
    font-weight:500;
}

</style>

</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="logo">AMENTROP</div>

    <div class="nav">
        <a href="${pageContext.request.contextPath}/professional/dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/professional/profile">View Profile</a>
        <a href="${pageContext.request.contextPath}/jobs">View Jobs</a>

        <a href="${pageContext.request.contextPath}/fresher/toggle-profile">
            <c:choose>
                <c:when test="${user.profileActive}">
                    Make Profile Inactive
                </c:when>
                <c:otherwise>
                    Make Profile Active
                </c:otherwise>
            </c:choose>
        </a>

        <a href="#" class="active">Messages</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

<div class="header">
    <h2>Your Messages</h2>
</div>

<div class="messages">

<c:forEach items="${messages}" var="m">

<div class="message">

<div class="msg-header">
From: <span class="sender">${m.senderName}</span>
</div>

<div class="content">
${m.content}
</div>

</div>

</c:forEach>



</div>

</div>

</body>
</html>