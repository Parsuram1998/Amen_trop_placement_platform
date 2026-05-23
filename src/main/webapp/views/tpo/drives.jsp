<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Placement Drives</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

html{
    scroll-behavior:smooth;
}

body{
    font-family:'Inter',sans-serif;
    background:#090909;
    color:white;
    min-height:100vh;
    overflow-x:hidden;
}

/* NAVBAR */

.top-navbar{
    min-height:74px;

    background:#111111;

    border-bottom:1px solid #232323;

    position:sticky;
    top:0;
    z-index:999;

    display:flex;
    align-items:center;
    justify-content:space-between;

    padding:12px 22px;

    gap:20px;
}

/* LEFT */

.nav-left{
    display:flex;
    align-items:center;
    gap:14px;
}

.logo-box{
    width:48px;
    height:48px;

    border-radius:14px;

    background:#d4af37;

    display:flex;
    align-items:center;
    justify-content:center;

    color:black;
    font-size:18px;
}

.brand h2{
    color:#d4af37;
    font-size:28px;
}

.brand p{
    color:#9d9d9d;
    font-size:11px;
    margin-top:2px;
}

/* NAV LINKS */

.nav-links{
    display:flex;
    align-items:center;
    gap:10px;
}

.nav-links a{
    text-decoration:none;

    color:#d5d5d5;

    padding:10px 16px;

    border-radius:12px;

    display:flex;
    align-items:center;
    gap:8px;

    transition:0.3s;

    font-size:13px;
    font-weight:500;

    white-space:nowrap;
}

.nav-links a i{
    color:#d4af37;
}

.nav-links a:hover,
.nav-links a.active{
    background:#1a1a1a;
    color:white;
}

/* MAIN */

.main{
    padding:18px;
}

/* HEADER */

.page-header{
    margin-bottom:14px;
}

.page-header h1{
    font-size:30px;
    margin-bottom:5px;
}

.page-header h1 span{
    color:#d4af37;
}

.page-header p{
    color:#9d9d9d;
    line-height:1.5;
    font-size:13px;
}

/* TOOLBAR */

.toolbar{
    background:#121212;

    border:1px solid #252525;

    border-radius:18px;

    padding:14px 16px;

    margin-bottom:14px;

    display:grid;

    grid-template-columns:
        1.6fr
        0.9fr
        0.9fr
        auto;

    gap:12px;

    align-items:end;
}

/* TOOLBAR SECTIONS */

.toolbar-section{
    display:flex;
    align-items:end;
    gap:10px;
}

.toolbar-section.compact{
    gap:8px;
}

.toolbar-title{
    font-size:11px;
    color:#9f9f9f;
    margin-bottom:6px;
}

/* TOTAL BOX */

.total-box{
    height:46px;

    min-width:160px;

    border-radius:14px;

    background:#181818;

    border:1px solid #2a2a2a;

    display:flex;
    align-items:center;
    justify-content:center;

    color:#d4af37;

    font-size:13px;
    font-weight:600;

    padding:0 18px;

    white-space:nowrap;
}

/* INPUT */

.input-box{
    position:relative;
}

.input-box i{
    position:absolute;

    left:14px;
    top:50%;

    transform:translateY(-50%);

    color:#d4af37;
}

.input-box input{
    width:190px;
    height:46px;

    background:#0d0d0d;

    border:1px solid #2c2c2c;

    border-radius:14px;

    color:white;

    padding:0 14px 0 42px;

    outline:none;

    font-size:13px;

    transition:0.3s;
}

.input-box input:focus{
    border-color:#d4af37;
}

/* BUTTONS */

.btn{
    height:46px;

    padding:0 18px;

    border:none;

    border-radius:14px;

    cursor:pointer;

    font-weight:600;

    font-size:13px;

    transition:0.3s;

    background:#d4af37;
    color:black;

    white-space:nowrap;
}

.btn:hover{
    background:#b8932f;
}

/* CLEAR */

.clear-btn{
    color:#d4af37;

    text-decoration:none;

    font-size:13px;

    margin-bottom:13px;

    white-space:nowrap;
}

/* TABLE CARD */

.table-card{
    background:#121212;

    border:1px solid #252525;

    border-radius:20px;

    overflow:hidden;

    display:flex;
    flex-direction:column;

    min-height:calc(100vh - 280px);
}

/* TABLE HEADER */

.table-header{
    padding:16px 20px;

    border-bottom:1px solid #222;
}

.table-header h3{
    color:#d4af37;
    font-size:20px;
}

/* TABLE */

.table-wrapper{
    flex:1;
    overflow:auto;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#181818;

    color:#d4af37;

    text-align:left;

    padding:14px 16px;

    font-size:12px;

    white-space:nowrap;

    position:sticky;
    top:0;
    z-index:5;
}

td{
    padding:14px 16px;

    border-bottom:1px solid #1e1e1e;

    color:#ececec;

    font-size:13px;

    vertical-align:middle;

    white-space:nowrap;
}

tr:hover{
    background:#161616;
}

/* STATUS */

.status{
    padding:8px 14px;

    border-radius:30px;

    font-size:11px;
    font-weight:700;

    display:inline-block;
}

.active-status{
    background:rgba(46,204,113,0.12);
    color:#2ecc71;
}

.end-status{
    background:rgba(231,76,60,0.12);
    color:#ff6b6b;
}

/* LINKS */

.action-links{
    display:flex;
    flex-direction:column;
    gap:8px;
}

.action-links a{
    color:#d4af37;

    text-decoration:none;

    font-size:13px;
    font-weight:500;
}

.action-links a:hover{
    text-decoration:underline;
}

/* PAGINATION */

.pagination{
    margin-top:16px;

    display:flex;
    justify-content:center;
    align-items:center;

    gap:10px;

    flex-wrap:wrap;

    padding-bottom:12px;
}

.pagination a{
    text-decoration:none;

    min-width:40px;
    height:40px;

    border-radius:12px;

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:13px;
    font-weight:600;

    transition:0.3s;
}

.normal-page{
    background:#181818;

    border:1px solid #2a2a2a;

    color:white;
}

.active-page{
    background:#d4af37;
    color:black;
}

.nav-btn{
    background:#d4af37;
    color:black;

    padding:0 16px !important;
}

/* RESPONSIVE */

@media(max-width:1200px){

    .toolbar{
        grid-template-columns:1fr;
    }

    .toolbar-section{
        flex-wrap:wrap;
    }

    .input-box input{
        width:100%;
    }

    .total-box{
        width:100%;
    }

}

@media(max-width:900px){

    .top-navbar{
        flex-direction:column;
        align-items:flex-start;
    }

    .nav-links{
        width:100%;
        overflow-x:auto;
        padding-bottom:4px;
    }

}

@media(max-width:700px){

    .main{
        padding:14px;
    }

    .page-header h1{
        font-size:26px;
    }

    table{
        min-width:1100px;
    }

}

</style>

</head>

<body>

<!-- NAVBAR -->

<div class="top-navbar">

    <!-- LEFT -->

    <div class="nav-left">

        <div class="logo-box">

            <i class="fa-solid fa-building-columns"></i>

        </div>

        <div class="brand">

            <h2>Amentrop</h2>

            <p>TPO Management Portal</p>

        </div>

    </div>

    <!-- NAV LINKS -->

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/tpo/dashboard">

            <i class="fa-solid fa-chart-line"></i>

            Dashboard

        </a>

       <a href="${pageContext.request.contextPath}/tpo/add-drive">

            <i class="fa-solid fa-briefcase"></i>

            Add Drive

        </a>

        <a href="${pageContext.request.contextPath}/tpo/drives">

            <i class="fa-solid fa-building"></i>

            View Drives

        </a>

        <a href="${pageContext.request.contextPath}/tpo/add-student">

            <i class="fa-solid fa-user-plus"></i>

            Add Student

        </a>

        <a href="${pageContext.request.contextPath}/tpo/upload-students">

            <i class="fa-solid fa-file-arrow-up"></i>

            Upload Students

        </a>

        <a href="${pageContext.request.contextPath}/tpo/students">

            <i class="fa-solid fa-users"></i>

            View Students

        </a>

         <a href="${pageContext.request.contextPath}/logout">

            <i class="fa-solid fa-right-from-bracket"></i>

            Logout

        </a>

    </div>

</div>

<!-- MAIN -->

<div class="main">

    <!-- PAGE HEADER -->

    <div class="page-header">

        <h1>

            Placement
            <span>Drives</span>

        </h1>

        <p>

            Manage placement drives, applicants,
            exports and drive operations efficiently.

        </p>

    </div>

    <!-- TOOLBAR -->

    <div class="toolbar">

        <!-- FILTER -->

        <form action="${pageContext.request.contextPath}/tpo/drives"
              method="get"
              class="toolbar-section">

            <!-- START DATE -->

            <div>

                <div class="toolbar-title">

                    Start Date

                </div>

                <div class="input-box">

                    <i class="fa-solid fa-calendar"></i>

                    <input type="date"
                           name="startDate"
                           value="${startDate}"/>

                </div>

            </div>

            <!-- END DATE -->

            <div>

                <div class="toolbar-title">

                    End Date

                </div>

                <div class="input-box">

                    <i class="fa-solid fa-calendar"></i>

                    <input type="date"
                           name="endDate"
                           value="${endDate}"/>

                </div>

            </div>

            <!-- FILTER -->

            <button type="submit"
                    class="btn">

                Filter

            </button>

            <!-- CLEAR -->

            <a href="${pageContext.request.contextPath}/tpo/drives"
               class="clear-btn">

                Clear

            </a>

        </form>

        <!-- EXPORT FILTERED -->

        <form action="${pageContext.request.contextPath}/tpo/export/drives/date-range"
              method="get"
              class="toolbar-section compact">

            <input type="hidden"
                   name="startDate"
                   value="${startDate}"/>

            <input type="hidden"
                   name="endDate"
                   value="${endDate}"/>

            <button type="submit"
                    class="btn"
                    style="width:100%;">

                Export Filtered

            </button>

        </form>

        <!-- EXPORT YEAR -->

        <form action="${pageContext.request.contextPath}/tpo/export/drives"
              method="get"
              class="toolbar-section compact">

            <div class="input-box">

                <i class="fa-solid fa-calendar-days"></i>

                <input type="number"
                       name="year"
                       placeholder="2026"
                       required
                       style="width:130px;"/>

            </div>

            <button type="submit"
                    class="btn">

                Export

            </button>

        </form>

        <!-- TOTAL DRIVES -->

        <div class="total-box">

            Total Drives :
            ${totalDrives}

        </div>

    </div>

    <!-- TABLE CARD -->

    <div class="table-card">

        <!-- HEADER -->

        <div class="table-header">

            <h3>

                All Placement Drives

            </h3>

        </div>

        <!-- TABLE -->

        <div class="table-wrapper">

            <table>

                <tr>

                    <th>Company</th>
                    <th>Role</th>
                    <th>Salary</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Applicants</th>
                    <th>Actions</th>
                    <th>Exports</th>

                </tr>

                <c:forEach var="d"
                           items="${drives}">

                    <tr>

                        <td>${d.companyName}</td>

                        <td>${d.role}</td>

                        <td>₹ ${d.salary}</td>

                        <td>${d.driveDate}</td>

                        <td>

                            <c:choose>

                                <c:when test="${d.status == 'ENDED'}">

                                    <span class="status end-status">

                                        ENDED

                                    </span>

                                </c:when>

                                <c:otherwise>

                                    <span class="status active-status">

                                        ACTIVE

                                    </span>

                                </c:otherwise>

                            </c:choose>

                        </td>

                        <!-- APPLICANTS -->

                        <td>

                            <div class="action-links">

                                <a href="${pageContext.request.contextPath}/tpo/applicants/${d.id}">

                                    View Applicants

                                </a>

                            </div>

                        </td>

                        <!-- ACTIONS -->

                        <td>

                            <div class="action-links">

                                <c:if test="${d.status != 'ENDED'}">

                                    <a href="${pageContext.request.contextPath}/tpo/end-drive/${d.id}">

                                        End Drive

                                    </a>

                                </c:if>

                            </div>

                        </td>

                        <!-- EXPORTS -->

                        <td>

                            <div class="action-links">

                                <a href="${pageContext.request.contextPath}/tpo/export/applicants/${d.id}">

                                    Export Applicants

                                </a>

                                <a href="${pageContext.request.contextPath}/tpo/export/selected/${d.id}">

                                    Export Selected

                                </a>

                            </div>

                        </td>

                    </tr>

                </c:forEach>

            </table>

        </div>

    </div>

    <!-- PAGINATION -->

    <c:if test="${totalPages > 0}">

        <div class="pagination">

            <!-- PREVIOUS -->

            <c:if test="${currentPage > 0}">

                <a href="${pageContext.request.contextPath}/tpo/drives?page=${currentPage - 1}&startDate=${startDate}&endDate=${endDate}"
                   class="nav-btn">

                    Previous

                </a>

            </c:if>

            <!-- PAGE NUMBERS -->

            <c:forEach begin="0"
                       end="${totalPages - 1}"
                       var="i">

                <a href="${pageContext.request.contextPath}/tpo/drives?page=${i}&startDate=${startDate}&endDate=${endDate}"

                   class="${currentPage == i
                            ? 'active-page'
                            : 'normal-page'}">

                    ${i + 1}

                </a>

            </c:forEach>

            <!-- NEXT -->

            <c:if test="${currentPage + 1 < totalPages}">

                <a href="${pageContext.request.contextPath}/tpo/drives?page=${currentPage + 1}&startDate=${startDate}&endDate=${endDate}"
                   class="nav-btn">

                    Next

                </a>

            </c:if>

        </div>

    </c:if>

</div>

</body>

</html>