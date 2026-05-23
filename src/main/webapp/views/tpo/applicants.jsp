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

<title>Applicants</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
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

    display:flex;
    align-items:center;
    justify-content:space-between;

    gap:14px;

    flex-wrap:wrap;
}

/* FILTER */

.filter-form{
    display:flex;
    align-items:end;
    gap:12px;

    flex-wrap:wrap;
}

.filter-group{
    display:flex;
    flex-direction:column;
    gap:6px;
}

.filter-label{
    font-size:11px;
    color:#9d9d9d;
}

/* SELECT */

.select-box{
    position:relative;
}

.select-box i{
    position:absolute;

    left:14px;
    top:50%;

    transform:translateY(-50%);

    color:#d4af37;
}

select{
    height:44px;

    min-width:220px;

    background:#0d0d0d;

    border:1px solid #2c2c2c;

    border-radius:14px;

    color:white;

    padding:0 14px 0 42px;

    outline:none;

    font-size:13px;

    appearance:none;
}

select:focus{
    border-color:#d4af37;
}

/* BUTTONS */

.btn{
    height:44px;

    padding:0 18px;

    border:none;

    border-radius:14px;

    cursor:pointer;

    font-weight:600;

    font-size:13px;

    transition:0.3s;

    background:#d4af37;
    color:black;

    text-decoration:none;

    display:flex;
    align-items:center;
    justify-content:center;

    white-space:nowrap;
}

.btn:hover{
    background:#b8932f;
}

.clear-btn{
    background:#1b1b1b;
    color:#d4af37;

    border:1px solid #2a2a2a;
}

/* COUNT */

.total-box{
    height:44px;

    padding:0 18px;

    border-radius:14px;

    background:#181818;

    border:1px solid #2a2a2a;

    display:flex;
    align-items:center;
    justify-content:center;

    color:#d4af37;

    font-size:13px;
    font-weight:600;
}

/* TABLE CARD */

.table-card{
    background:#121212;

    border:1px solid #252525;

    border-radius:20px;

    overflow:hidden;

    display:flex;
    flex-direction:column;

    min-height:calc(100vh - 260px);
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
    padding:7px 14px;

    border-radius:30px;

    font-size:11px;
    font-weight:700;

    display:inline-block;
}

.selected-status{
    background:rgba(46,204,113,0.12);
    color:#2ecc71;
}

.applied-status{
    background:rgba(241,196,15,0.12);
    color:#f1c40f;
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

@media(max-width:1100px){

    .toolbar{
        flex-direction:column;
        align-items:stretch;
    }

    .filter-form{
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
        min-width:1300px;
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

            <i class="fa-solid fa-plus"></i>

            Add Drive

        </a>

        <a href="${pageContext.request.contextPath}/tpo/drives">

            <i class="fa-solid fa-briefcase"></i>

            Drives

        </a>

        <a class="active"
           href="${pageContext.request.contextPath}/tpo/applicants/${driveId}">

            <i class="fa-solid fa-users"></i>

            Applicants

        </a>

        <a href="${pageContext.request.contextPath}/tpo/students">

            <i class="fa-solid fa-user-graduate"></i>

            Students

        </a>

         <a href="${pageContext.request.contextPath}/logout">

            <i class="fa-solid fa-right-from-bracket"></i>

            Logout

        </a>

    </div>

</div>

<!-- MAIN -->

<div class="main">

    <!-- HEADER -->

    <div class="page-header">

        <h1>

            Drive
            <span>Applicants</span>

        </h1>

        <p>

            View, filter and manage all placement
            applicants efficiently from one place.

        </p>

    </div>

    <!-- TOOLBAR -->

    <div class="toolbar">

        <!-- FILTER -->

        <form method="get"
              action="${pageContext.request.contextPath}/tpo/applicants/${driveId}"
              class="filter-form">

            <div class="filter-group">

                <div class="filter-label">

                    Filter Status

                </div>

                <div class="select-box">

                    <i class="fa-solid fa-filter"></i>

                    <select name="status">

                        <option value="">
                            All Applicants
                        </option>

                        <option value="APPLIED"
                            ${selectedStatus == 'APPLIED' ? 'selected' : ''}>

                            Applied

                        </option>

                        <option value="SELECTED"
                            ${selectedStatus == 'SELECTED' ? 'selected' : ''}>

                            Selected

                        </option>

                    </select>

                </div>

            </div>

            <!-- FILTER BUTTON -->

            <button type="submit"
                    class="btn">

                Filter

            </button>

            <!-- CLEAR -->

            <a href="${pageContext.request.contextPath}/tpo/applicants/${driveId}"
               class="btn clear-btn">

                Clear Filter

            </a>

        </form>

        <!-- TOTAL -->

        <div class="total-box">

            Total Applicants :
            ${totalApplicants}

        </div>

    </div>

    <!-- TABLE CARD -->

    <div class="table-card">

        <!-- HEADER -->

        <div class="table-header">

            <h3>

                Applicant List

            </h3>

        </div>

        <!-- TABLE -->

        <div class="table-wrapper">

            <table>

                <tr>

                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Branch</th>
                    <th>10th %</th>
                    <th>12th %</th>
                    <th>Degree %</th>
                    <th>Resume</th>
                    <th>Status</th>
                    <th>Action</th>

                </tr>

                <c:forEach var="app"
                           items="${applications}">

                    <tr>

                        <td>${app.student.name}</td>

                        <td>${app.student.email}</td>

                        <td>${app.student.phone}</td>

                        <td>${app.student.branch}</td>

                        <td>${app.student.tenthPercentage}</td>

                        <td>${app.student.twelfthPercentage}</td>

                        <td>${app.student.degreePercentage}</td>

                        <!-- RESUME -->

                        <td>

                            <div class="action-links">

                                <c:if test="${not empty app.student.resumePath}">

                                    <a href="${pageContext.request.contextPath}/tpo/view-resume/${app.student.id}"
                                       target="_blank">

                                        View Resume

                                    </a>

                                    <a href="${pageContext.request.contextPath}/tpo/download-resume/${app.student.id}">

                                        Download

                                    </a>

                                </c:if>

                            </div>

                        </td>

                        <!-- STATUS -->

                        <td>

                            <c:choose>

                                <c:when test="${app.status == 'SELECTED'}">

                                    <span class="status selected-status">

                                        SELECTED

                                    </span>

                                </c:when>

                                <c:otherwise>

                                    <span class="status applied-status">

                                        APPLIED

                                    </span>

                                </c:otherwise>

                            </c:choose>

                        </td>

                        <!-- ACTION -->

                        <td>

                            <div class="action-links">

                                <c:choose>

                                    <c:when test="${app.status == 'SELECTED'}">

                                        <span style="
                                            color:#2ecc71;
                                            font-weight:600;
                                        ">

                                            Already Selected

                                        </span>

                                    </c:when>

                                    <c:otherwise>

                                        <a href="${pageContext.request.contextPath}/tpo/select/${app.id}">

                                            Select Candidate

                                        </a>

                                    </c:otherwise>

                                </c:choose>

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

                <a href="${pageContext.request.contextPath}/tpo/applicants/${driveId}?page=${currentPage - 1}&status=${selectedStatus}"
                   class="nav-btn">

                    Previous

                </a>

            </c:if>

            <!-- PAGE NUMBERS -->

            <c:forEach begin="0"
                       end="${totalPages - 1}"
                       var="i">

                <a href="${pageContext.request.contextPath}/tpo/applicants/${driveId}?page=${i}&status=${selectedStatus}"

                   class="${currentPage == i
                            ? 'active-page'
                            : 'normal-page'}">

                    ${i + 1}

                </a>

            </c:forEach>

            <!-- NEXT -->

            <c:if test="${currentPage + 1 < totalPages}">

                <a href="${pageContext.request.contextPath}/tpo/applicants/${driveId}?page=${currentPage + 1}&status=${selectedStatus}"
                   class="nav-btn">

                    Next

                </a>

            </c:if>

        </div>

    </c:if>

</div>

</body>

</html>