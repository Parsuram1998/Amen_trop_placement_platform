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

<title>Students</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
      rel="stylesheet">

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

/* SEARCH */

.search-box{
    position:relative;

    flex:1;
    min-width:320px;
}

.search-box i{
    position:absolute;

    left:14px;
    top:50%;

    transform:translateY(-50%);

    color:#d4af37;
}

.search-box input{
    width:100%;
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

.search-box input:focus{
    border-color:#d4af37;
}

/* BUTTONS */

.clear-btn{
    height:46px;

    padding:0 18px;

    border-radius:14px;

    background:#d4af37;

    color:black;

    text-decoration:none;

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:13px;
    font-weight:600;

    transition:0.3s;
}

.clear-btn:hover{
    background:#b8932f;
}

/* TOTAL */

.total-box{
    height:46px;

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

tr{
    transition:0.25s;
}

tr:nth-child(even){
    background:#111111;
}

tr:hover{
    background:#181818;
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

    .search-box{
        min-width:100%;
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
        min-width:900px;
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

    <!-- HEADER -->

    <div class="page-header">

        <h1>

            Student
            <span>Directory</span>

        </h1>

        <p>

            Search, manage and view all students
            registered under your institution.

        </p>

    </div>

    <!-- TOOLBAR -->

    <div class="toolbar">

        <!-- SEARCH -->

        <div class="search-box">

            <i class="fa-solid fa-magnifying-glass"></i>

            <input type="text"
                   id="studentSearch"
                   placeholder="Search by Name, USN, Email, Phone or Branch">

        </div>

        <!-- CLEAR -->

        <a href="${pageContext.request.contextPath}/tpo/students"
           class="clear-btn">

            Clear

        </a>

        <!-- TOTAL -->

        <div class="total-box">

            Total Students :
            ${totalStudents}

        </div>

    </div>

    <!-- TABLE CARD -->

    <div class="table-card">

        <!-- HEADER -->

        <div class="table-header">

            <h3>

                Student Records

            </h3>

        </div>

        <!-- TABLE -->

        <div class="table-wrapper">

            <table id="studentTable">

                <tr>

                    <th>Name</th>
                    <th>USN</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Branch</th>

                </tr>

                <c:forEach var="s"
                           items="${students}">

                    <tr>

                        <td>${s.name}</td>

                        <td>${s.usn}</td>

                        <td>${s.email}</td>

                        <td>${s.phone}</td>

                        <td>${s.branch}</td>

                    </tr>

                </c:forEach>

            </table>

        </div>

    </div>

    <!-- PAGINATION -->

    <div class="pagination">

        <!-- PREVIOUS -->

        <c:if test="${currentPage > 0}">

            <a href="${pageContext.request.contextPath}/tpo/students?page=${currentPage - 1}&keyword=${keyword}"
               class="nav-btn">

                Previous

            </a>

        </c:if>

        <!-- PAGE NUMBERS -->

        <c:forEach begin="0"
                   end="${totalPages - 1}"
                   var="i">

            <a href="${pageContext.request.contextPath}/tpo/students?page=${i}&keyword=${keyword}"

               class="${currentPage == i
                        ? 'active-page'
                        : 'normal-page'}">

                ${i + 1}

            </a>

        </c:forEach>

        <!-- NEXT -->

        <c:if test="${currentPage + 1 < totalPages}">

            <a href="${pageContext.request.contextPath}/tpo/students?page=${currentPage + 1}&keyword=${keyword}"
               class="nav-btn">

                Next

            </a>

        </c:if>

    </div>

</div>

<script>

document.getElementById("studentSearch")
.addEventListener("keyup", function() {

    let value =
        this.value.toLowerCase();

    let rows =
        document.querySelectorAll(
            "#studentTable tr"
        );

    rows.forEach((row, index) => {

        // skip header

        if(index === 0) return;

        let text =
            row.innerText.toLowerCase();

        if(text.includes(value)) {

            row.style.display = "";

        } else {

            row.style.display = "none";
        }

    });

});

</script>

</body>

</html>