<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add College</title>

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
}

/* TOPBAR */

.topbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:35px;
}

.topbar h1{
    color:#d4af37;
    font-size:30px;
}

.topbar p{
    color:#aaa;
    margin-top:6px;
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

/* FORM CARD */

.form-card{
    width:100%;
    max-width:650px;
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
}

.input-box input{
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

.input-box input:focus{
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

/* FOOTER */

.footer{
    margin-top:35px;
    color:#777;
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

    <!-- TOPBAR -->

    <div class="topbar">

        <div>

            <h1>Add College</h1>

            <p>
                Register a new college and manage subscription access.
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

            <h2>College Information</h2>

            <p>
                Fill in the details below to onboard a new college.
            </p>

        </div>

        <form action="${pageContext.request.contextPath}/admin/save-college"
              method="post">

            <!-- COLLEGE NAME -->

            <div class="form-group">

                <label>College Name</label>

                <div class="input-box">

                    <i class="fa-solid fa-building-columns"></i>

                    <input type="text"
                           name="name"
                           placeholder="Enter college name"
                           required>

                </div>

            </div>

            <!-- START DATE -->

            <div class="form-group">

                <label>Subscription Start Date</label>

                <div class="input-box">

                    <i class="fa-solid fa-calendar-days"></i>

                    <input type="date"
                           name="startDate"
                           required>

                </div>

            </div>

            <!-- END DATE -->

            <div class="form-group">

                <label>Subscription End Date</label>

                <div class="input-box">

                    <i class="fa-solid fa-calendar-check"></i>

                    <input type="date"
                           name="endDate"
                           required>

                </div>

            </div>

            <!-- BUTTON -->

            <button type="submit">

                Save College

            </button>

        </form>

    </div>

    <!-- FOOTER -->

    <div class="footer">

        © 2026 Amentrop Placement Management Platform

    </div>

</div>

</body>
</html>