<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit TPO</title>

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
    min-width:260px;
    height:100vh;
    background:#0a0a0a;
    position:fixed;
    left:0;
    top:0;
    padding:25px 20px;
    border-right:1px solid #2b2b2b;
    overflow-y:auto;
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

/* TOPBAR */

.topbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:35px;
    gap:20px;
}

.topbar h1{
    color:#d4af37;
    font-size:30px;
}

.topbar p{
    color:#aaa;
    margin-top:5px;
    line-height:1.6;
}

.admin-box{
    background:#1a1a1a;
    padding:12px 18px;
    border-radius:12px;
    border:1px solid #2d2d2d;
    display:flex;
    align-items:center;
    gap:10px;
    white-space:nowrap;
}

.admin-box i{
    color:#d4af37;
}

/* FORM CARD */

.form-card{
    width:100%;
    max-width:650px;
    min-width:0;
    background:#1a1a1a;
    border:1px solid #2a2a2a;
    border-radius:20px;
    padding:35px;
    box-shadow:0 10px 30px rgba(0,0,0,0.35);
}

.form-title{
    margin-bottom:30px;
}

.form-title h2{
    color:#d4af37;
    margin-bottom:8px;
}

.form-title p{
    color:#999;
    font-size:14px;
    line-height:1.6;
}

/* FORM GROUP */

.form-group{
    margin-bottom:24px;
}

.form-group label{
    display:block;
    margin-bottom:10px;
    color:#ddd;
    font-size:14px;
}

.input-box{
    position:relative;
}

.input-box i{
    position:absolute;
    left:15px;
    top:50%;
    transform:translateY(-50%);
    color:#d4af37;
    font-size:15px;
    z-index:5;
}

.input-box input,
.input-box select{
    width:100%;
    padding:14px 14px 14px 45px;
    background:#111111;
    border:1px solid #2d2d2d;
    border-radius:12px;
    color:white;
    font-size:15px;
    outline:none;
    transition:0.3s;
}

.input-box input:focus,
.input-box select:focus{
    border-color:#d4af37;
    box-shadow:0 0 0 4px rgba(212,175,55,0.12);
}

/* BUTTON */

button{
    width:100%;
    padding:15px;
    background:#d4af37;
    color:black;
    border:none;
    border-radius:12px;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#b8932f;
}

/* SELECT2 RESPONSIVE */

.select2-container{
    width:100% !important;
    max-width:100%;
}

.select2-container--default
.select2-selection--single{

    height:50px !important;
    background:#111111 !important;
    border:1px solid #2d2d2d !important;
    border-radius:12px !important;

    display:flex !important;
    align-items:center !important;
}

.select2-selection__rendered{
    color:white !important;
    padding-left:40px !important;
    line-height:48px !important;
    font-size:14px;
}

.select2-selection__arrow{
    height:48px !important;
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
    border-radius:8px !important;
    padding:8px !important;
}

.select2-results__option{
    background:#1a1a1a !important;
    color:white !important;
    padding:10px !important;
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

/* RESPONSIVE */

@media(max-width:992px){

    body{
        flex-direction:column;
    }

    .sidebar{
        width:100%;
        min-width:100%;
        height:auto;
        position:relative;
        border-right:none;
        border-bottom:1px solid #2a2a2a;
    }

    .main{
        margin-left:0;
        width:100%;
        padding:20px;
    }

    .topbar{
        flex-direction:column;
        align-items:flex-start;
    }

    .form-card{
        max-width:100%;
        padding:25px;
    }

    .select2-container{
        width:100% !important;
    }

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

    <!-- TOPBAR -->

    <div class="topbar">

        <div>

            <h1>Edit TPO</h1>

            <p>
                Update Training & Placement Officer details and assigned college.
            </p>

        </div>

        <div class="admin-box">

            <i class="fa-solid fa-user-shield"></i>

            <span>Administrator</span>

        </div>

    </div>

    <!-- FORM -->

    <div class="form-card">

        <div class="form-title">

            <h2>TPO Information</h2>

            <p>
                Modify the details below and save the changes.
            </p>

        </div>

        <form action="${pageContext.request.contextPath}/admin/update-tpo"
              method="post">

            <input type="hidden"
                   name="id"
                   value="${tpo.id}" />

            <!-- NAME -->

            <div class="form-group">

                <label>TPO Name</label>

                <div class="input-box">

                    <i class="fa-solid fa-user"></i>

                    <input type="text"
                           name="name"
                           value="${tpo.name}"
                           required>

                </div>

            </div>

            <!-- EMAIL -->

            <div class="form-group">

                <label>Email Address</label>

                <div class="input-box">

                    <i class="fa-solid fa-envelope"></i>

                    <input type="email"
                           name="email"
                           value="${tpo.email}"
                           required>

                </div>

            </div>

            <!-- COLLEGE -->

            <div class="form-group">

                <label>Assigned College</label>

                <div class="input-box">

                    <i class="fa-solid fa-building-columns"></i>

                    <select id="collegeDropdown"
                            name="college.id"
                            required>

                        <c:forEach var="c"
                                   items="${colleges}">

                            <option value="${c.id}"
                                ${c.id == tpo.college.id ? 'selected' : ''}>

                                ${c.name}

                            </option>

                        </c:forEach>

                    </select>

                </div>

            </div>

            <!-- BUTTON -->

            <button type="submit">

                Update TPO

            </button>

        </form>

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
        width: '100%'
    });

});

</script>

</body>
</html>