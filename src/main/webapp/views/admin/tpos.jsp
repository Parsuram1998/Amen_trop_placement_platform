<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>TPO Management</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<!-- SELECT2 -->

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
      rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

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

/* TOTAL BOX */

.total-box{
    background:#1a1a1a;
    border:1px solid #2a2a2a;
    color:#d4af37;
    padding:12px 18px;
    border-radius:12px;
    font-weight:bold;
}

/* FILTER */

.filter-box{
    background:#1a1a1a;
    border:1px solid #2a2a2a;
    padding:24px;
    border-radius:18px;
    margin-bottom:25px;
}

.filter-form{
    display:flex;
    gap:15px;
    align-items:center;
    flex-wrap:wrap;
}

/* BUTTONS */

.filter-btn{
    background:#d4af37;
    color:black;
    border:none;
    padding:12px 22px;
    border-radius:10px;
    cursor:pointer;
    font-weight:bold;
    transition:0.3s;
}

.filter-btn:hover{
    background:#b8932f;
}

.clear-btn{
    background:#dc3545;
    color:white;
    text-decoration:none;
    padding:12px 22px;
    border-radius:10px;
    font-weight:bold;
    transition:0.3s;
}

.clear-btn:hover{
    background:#b02a37;
}

/* TABLE */

.table-card{
    background:#1a1a1a;
    border:1px solid #2a2a2a;
    border-radius:18px;
    overflow:hidden;
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

/* ACTION BUTTONS */

.action-buttons{
    display:flex;
    gap:10px;
}

.action-btn{
    text-decoration:none;
    padding:10px 14px;
    border-radius:8px;
    font-size:13px;
    font-weight:bold;
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

/* NO DATA */

.no-data{
    text-align:center;
    padding:25px;
    color:#999;
    font-weight:bold;
}

/* PAGINATION */

.pagination-wrapper{
    margin-top:auto;
}

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

/* SELECT2 */

.select2-container{
    width:320px !important;
}

.select2-container--default
.select2-selection--single{

    height:46px !important;
    background:#111111 !important;
    border:1px solid #2d2d2d !important;
    border-radius:10px !important;
    padding-top:7px !important;
}

.select2-selection__rendered{
    color:white !important;
}

.select2-selection__arrow{
    margin-top:8px;
}

.select2-dropdown{
    background:#1a1a1a !important;
    border:1px solid #2d2d2d !important;
    color:white !important;
}

.select2-search__field{
    background:#111111 !important;
    color:white !important;
    border:1px solid #2d2d2d !important;
}

.select2-results__option{
    background:#1a1a1a !important;
    color:white !important;
}

.select2-results__option--highlighted{
    background:#d4af37 !important;
    color:black !important;
}

/* FOOTER */

.footer{
    margin-top:auto;
    padding-top:40px;
    color:#777;
    font-size:13px;
    text-align:center;
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

                <h1>TPO Management</h1>

                <p>
                    Manage, filter and monitor all Training & Placement Officers.
                </p>

            </div>

            <div class="admin-box">

                <i class="fa-solid fa-user-shield"></i>

                <span>Administrator</span>

            </div>

        </div>

        <!-- TOTAL -->

        <div class="total-box">

            Total TPOs : ${tpos.size()}

        </div>

        <br>

        <!-- FILTER -->

        <div class="filter-box">

            <form action="${pageContext.request.contextPath}/admin/tpos"
                  method="get"
                  class="filter-form">

                <select id="collegeDropdown"
                        name="collegeId">

                    <option value="">
                        All Colleges
                    </option>

                    <c:forEach var="c"
                               items="${colleges}">

                        <option value="${c.id}"
                            ${selectedCollegeId == c.id ? 'selected' : ''}>

                            ${c.name}

                        </option>

                    </c:forEach>

                </select>

                <button type="submit"
                        class="filter-btn">

                    Filter

                </button>

                <a href="${pageContext.request.contextPath}/admin/tpos"
                   class="clear-btn">

                    Clear Filter

                </a>

            </form>

        </div>

        <!-- TABLE -->

        <div class="table-card">

            <table>

                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>College</th>
                    <th>Actions</th>
                </tr>

                <c:choose>

                    <c:when test="${not empty tpos}">

                        <c:forEach var="t"
                                   items="${tpos}">

                            <tr>

                                <td>${t.name}</td>

                                <td>${t.email}</td>

                                <td>${t.college.name}</td>

                                <td>

                                    <div class="action-buttons">

                                        <a href="${pageContext.request.contextPath}/admin/edit-tpo/${t.id}"
                                           class="action-btn edit-btn">

                                            Edit

                                        </a>

                                        <a href="${pageContext.request.contextPath}/admin/delete-tpo/${t.id}"
                                           class="action-btn delete-btn"
                                           onclick="return confirm('Are you sure you want to delete this TPO?')">

                                            Delete

                                        </a>

                                    </div>

                                </td>

                            </tr>

                        </c:forEach>

                    </c:when>

                    <c:otherwise>

                        <tr>

                            <td colspan="4"
                                class="no-data">

                                No TPOs Found

                            </td>

                        </tr>

                    </c:otherwise>

                </c:choose>

            </table>

        </div>

        <!-- PAGINATION -->

        <div class="pagination-wrapper">

            <c:if test="${totalPages > 0}">

                <div class="pagination">

                    <!-- PREVIOUS -->

                    <c:if test="${currentPage > 0}">

                        <a href="${pageContext.request.contextPath}/admin/tpos?page=${currentPage - 1}&collegeId=${selectedCollegeId}"
                           class="nav-btn">

                            Previous

                        </a>

                    </c:if>

                    <!-- PAGE NUMBERS -->

                    <c:forEach begin="0"
                               end="${totalPages - 1}"
                               var="i">

                        <a href="${pageContext.request.contextPath}/admin/tpos?page=${i}&collegeId=${selectedCollegeId}"

                           class="${currentPage == i
                                    ? 'active-page'
                                    : 'normal-page'}">

                            ${i + 1}

                        </a>

                    </c:forEach>

                    <!-- NEXT -->

                    <c:if test="${currentPage + 1 < totalPages}">

                        <a href="${pageContext.request.contextPath}/admin/tpos?page=${currentPage + 1}&collegeId=${selectedCollegeId}"
                           class="nav-btn">

                            Next

                        </a>

                    </c:if>

                </div>

            </c:if>

        </div>

    </div>

    <!-- FOOTER -->

    <div class="footer">

        © 2026 Amentrop Placement Management Platform

    </div>

</div>

<script>

$(document).ready(function() {

    $('#collegeDropdown').select2({
        placeholder: "Search College",
        allowClear: true
    });

});

</script>

</body>
</html>