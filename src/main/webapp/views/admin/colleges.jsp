<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Colleges</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:Arial,sans-serif;
    background:#111111;
    display:flex;
    color:white;
}

/* SIDEBAR */

.sidebar{
    width:260px;
    height:100vh;
    background:#0a0a0a;
    position:fixed;
    left:0;
    top:0;
    padding:25px 20px;
    border-right:1px solid #2b2b2b;
}

.logo{
    display:flex;
    align-items:center;
    gap:12px;
    margin-bottom:45px;
}

.logo-icon{
    width:48px;
    height:48px;
    background:#d4af37;
    border-radius:12px;
    display:flex;
    justify-content:center;
    align-items:center;
    color:black;
    font-size:22px;
}

.logo h2{
    color:#d4af37;
    font-size:24px;
}

.logo p{
    color:#999;
    font-size:13px;
}

/* MENU */

.menu{
    display:flex;
    flex-direction:column;
    gap:12px;
}

.menu a{
    text-decoration:none;
    color:#e5e5e5;
    padding:14px 18px;
    border-radius:10px;
    display:flex;
    align-items:center;
    gap:12px;
    transition:0.3s;
    font-size:15px;
}

.menu a:hover{
    background:#d4af37;
    color:black;
    transform:translateX(4px);
}

/* MAIN */

.main{
    margin-left:260px;
    width:calc(100% - 260px);
    padding:35px;

    min-height:100vh;

    display:flex;
    flex-direction:column;
}
.content-area{
    flex:1;

    display:flex;
    flex-direction:column;
}
/* TOPBAR */

.topbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.topbar h1{
    color:#d4af37;
    font-size:30px;
}

.topbar p{
    color:#aaa;
    margin-top:5px;
}

.admin-box{
    background:#1a1a1a;
    padding:12px 18px;
    border-radius:12px;
    border:1px solid #2d2d2d;
    display:flex;
    align-items:center;
    gap:10px;
}

.admin-box i{
    color:#d4af37;
}

/* TABLE */

.table-card{
    background:#1a1a1a;
    border:1px solid #2a2a2a;
    border-radius:20px;
    overflow:hidden;
    box-shadow:0 10px 30px rgba(0,0,0,0.3);
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#151515;
    color:#d4af37;
    padding:18px;
    text-align:left;
    font-size:14px;
    border-bottom:1px solid #2a2a2a;
}

td{
    padding:18px;
    border-bottom:1px solid #2a2a2a;
    color:#ddd;
    font-size:14px;
}

tr:hover{
    background:#181818;
}

/* BADGE */

.status-badge{
    background:rgba(212,175,55,0.15);
    color:#d4af37;
    padding:8px 12px;
    border-radius:30px;
    font-size:12px;
    font-weight:bold;
}

/* ACTIONS */

.action-btn{
    text-decoration:none;
    padding:10px 14px;
    border-radius:8px;
    font-size:13px;
    font-weight:bold;
    margin-right:8px;
    display:inline-block;
    transition:0.3s;
}

.edit-btn{
    background:#d4af37;
    color:black;
}

.edit-btn:hover{
    background:#b8932f;
}

.delete-btn{
    background:#dc3545;
    color:white;
}

.delete-btn:hover{
    background:#b02a37;
}

/* PAGINATION */

.pagination{
    margin-top:30px;
    display:flex;
    justify-content:center;
    gap:10px;
}

.pagination a{
    padding:10px 16px;
    border-radius:8px;
    text-decoration:none;
    transition:0.3s;
}

.pagination-wrapper{
    margin-top:auto;
}
.active-page{
    background:#d4af37;
    color:black;
    font-weight:bold;
}

.normal-page{
    background:#1a1a1a;
    color:white;
    border:1px solid #2a2a2a;
}

.nav-btn{
    background:#d4af37;
    color:black;
    font-weight:bold;
}

/* FOOTER */

.footer{
    margin-top:35px;
    color:#777;
    text-align:center;
    font-size:13px;
}

</style>

</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

    <div class="logo">

        <div class="logo-icon">
            <i class="fa-solid fa-briefcase"></i>
        </div>

        <div>
            <h2>Amentrop</h2>
            <p>Admin Portal</p>
        </div>

    </div>

    <div class="menu">

        <a href="${pageContext.request.contextPath}/admin/dashboard">
            <i class="fa-solid fa-chart-line"></i>
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/admin/add-college">
            <i class="fa-solid fa-building-columns"></i>
            Add College
        </a>

        <a href="${pageContext.request.contextPath}/admin/colleges">
            <i class="fa-solid fa-school"></i>
            View Colleges
        </a>

        <a href="${pageContext.request.contextPath}/admin/add-tpo">
            <i class="fa-solid fa-user-plus"></i>
            Add TPO
        </a>

        <a href="${pageContext.request.contextPath}/admin/tpos">
            <i class="fa-solid fa-users"></i>
            View TPOs
        </a>

        <a href="${pageContext.request.contextPath}/logout">
            <i class="fa-solid fa-right-from-bracket"></i>
            Logout
        </a>

    </div>

</div>

<!-- MAIN -->


<div class="main">

    <div class="content-area">

        <!-- TOPBAR -->

        <div class="topbar">

            <div>

                <h1>Colleges</h1>

                <p>
                    Manage colleges and subscription validity.
                </p>

            </div>

            <div class="admin-box">

                <i class="fa-solid fa-user-shield"></i>

                <span>Administrator</span>

            </div>

        </div>

        <!-- TABLE -->

        <div class="table-card">

            <table>

                <tr>
                    <th>College Name</th>
                    <th>Subscription End</th>
                    <th>Actions</th>
                </tr>

                <c:forEach var="c" items="${colleges}">

                    <tr>

                        <td>

                            <i class="fa-solid fa-building-columns"
                               style="
                                    color:#d4af37;
                                    margin-right:8px;
                               "></i>

                            ${c.name}

                        </td>

                        <td>

                            <span class="status-badge">

                                ${c.subscriptionEnd}

                            </span>

                        </td>

                        <td>

                            <a href="${pageContext.request.contextPath}/admin/edit-college/${c.id}"
                               class="action-btn edit-btn">

                                Edit

                            </a>

                            <a href="${pageContext.request.contextPath}/admin/delete-college/${c.id}"
                               class="action-btn delete-btn"
                               onclick="return confirm('Are you sure you want to delete this college?')">

                                Delete

                            </a>

                        </td>

                    </tr>

                </c:forEach>

            </table>

        </div>

        <!-- PAGINATION -->

      <div class="pagination-wrapper">

<c:if test="${totalPages > 0}">

    <div class="pagination">

                <!-- PREVIOUS -->

                <c:if test="${currentPage > 0}">

                    <a href="${pageContext.request.contextPath}/admin/colleges?page=${currentPage - 1}"
                       class="nav-btn">

                        Previous

                    </a>

                </c:if>

                <!-- PAGE NUMBERS -->

                <c:forEach begin="0"
                           end="${totalPages - 1}"
                           var="i">

                    <a href="${pageContext.request.contextPath}/admin/colleges?page=${i}"

                       class="${currentPage == i
                                ? 'active-page'
                                : 'normal-page'}">

                        ${i + 1}

                    </a>

                </c:forEach>

                <!-- NEXT -->

                <c:if test="${currentPage + 1 < totalPages}">

                    <a href="${pageContext.request.contextPath}/admin/colleges?page=${currentPage + 1}"
                       class="nav-btn">

                        Next

                    </a>

                </c:if>

            </div>

        </c:if>

    </div>

    <!-- FOOTER -->

    <div class="footer">

        © 2026 Amentrop Placement Management Platform

    </div>

</div>

</body>
</html>