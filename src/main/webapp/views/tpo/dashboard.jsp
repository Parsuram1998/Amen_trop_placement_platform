<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>TPO Dashboard</title>

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
    display:flex;
    min-height:100vh;
    overflow-x:hidden;
}

/* SIDEBAR */

/* SIDEBAR */

.sidebar{
    width:260px;
    background:#111111;

    border-right:1px solid #232323;

    position:fixed;

    top:0;
    left:0;

    height:100vh;

    padding:22px 16px;

    overflow-y:auto;

    z-index:1000;
}

/* LOGO */

.logo{
    display:flex;
    align-items:center;

    gap:14px;

    margin-bottom:34px;
}

.logo-box{
    width:52px;
    height:52px;

    border-radius:16px;

    background:#d4af37;

    display:flex;
    align-items:center;
    justify-content:center;

    color:black;

    font-size:20px;

    flex-shrink:0;
}

.logo-text h2{
    color:#d4af37;

    font-size:28px;

    line-height:1;
}

.logo-text p{
    color:#9d9d9d;

    font-size:11px;

    margin-top:4px;
}

/* MENU */

.menu{
    display:flex;
    flex-direction:column;

    gap:10px;
}

.menu a{
    text-decoration:none;

    color:#d5d5d5;

    padding:12px 14px;

    border-radius:14px;

    display:flex;
    align-items:center;

    gap:12px;

    transition:0.3s;

    font-size:14px;
    font-weight:500;
}

.menu a i{
    color:#d4af37;

    width:20px;

    font-size:15px;

    transition:0.3s;
}

.menu a:hover,
.menu a.active{

    background:#1a1a1a;

    color:white;

    transform:translateX(3px);
}

.menu a:hover i,
.menu a.active i{

    transform:scale(1.08);
}

/* MAIN */

.main{
    margin-left:260px;

    min-height:100vh;

    padding:24px;
}
/* TOPBAR */

.topbar{
    display:flex;
    justify-content:space-between;
    align-items:center;

    margin-bottom:28px;

    gap:20px;
}

.topbar h2{
    font-size:34px;
    margin-bottom:8px;
}

.topbar h2 span{
    color:#d4af37;
}

.topbar p{
    color:#9d9d9d;
    line-height:1.7;
}

.profile-box{
    background:#141414;

    border:1px solid #252525;

    padding:14px 18px;

    border-radius:18px;

    display:flex;
    align-items:center;
    gap:12px;
}

.profile-box i{
    width:44px;
    height:44px;

    border-radius:14px;

    background:#d4af37;

    color:black;

    display:flex;
    align-items:center;
    justify-content:center;
}

/* STATS */
.stats-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(190px,1fr));

    gap:14px;

    margin-bottom:22px;
}

.stat-card{
    background:#141414;

    border:1px solid #252525;

    border-radius:18px;

    padding:16px 18px;

    transition:0.3s;

    position:relative;

    overflow:hidden;

    min-height:125px;
}

.stat-card:hover{
    transform:translateY(-4px);
    border-color:#d4af37;
}

.stat-card::before{
    content:'';

    position:absolute;

    right:-20px;
    top:-20px;

    width:90px;
    height:90px;

    background:rgba(212,175,55,0.08);

    border-radius:50%;
}

.stat-icon{
    width:42px;
    height:42px;

    border-radius:12px;

    background:#d4af37;

    color:black;

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:16px;

    margin-bottom:12px;
}

.stat-card h3{
    font-size:26px;
    margin-bottom:4px;
}

.stat-card p{
    color:#9d9d9d;
    font-size:13px;
}
/* ACTIONS */

.section-title{
    font-size:26px;
    color:#d4af37;

    margin-bottom:22px;
}

.action-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(210px,1fr));

    gap:16px;
}

.action-card{
    background:#141414;

    border:1px solid #252525;

    border-radius:18px;

    padding:18px;

    text-decoration:none;

    color:white;

    transition:0.3s;

    min-height:180px;
}

.action-card:hover{
    transform:translateY(-4px);
    border-color:#d4af37;
}

.action-icon{
    width:46px;
    height:46px;

    border-radius:14px;

    background:#d4af37;

    color:black;

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:18px;

    margin-bottom:14px;
}

.action-card h3{
    margin-bottom:8px;
    font-size:18px;
}

.action-card p{
    color:#9d9d9d;
    line-height:1.6;
    font-size:13px;
}

/* RESPONSIVE */

@media(max-width:1000px){

    .sidebar{
        width:100%;

        height:auto;

        position:relative;
    }

    .menu{
        flex-direction:row;

        overflow-x:auto;

        padding-bottom:6px;
    }

    .menu a{
        white-space:nowrap;
    }

    .main{
        margin-left:0;

        width:100%;
    }

}

</style>

</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

    <!-- LOGO -->

    <div class="logo">

        <div class="logo-box">

            <i class="fa-solid fa-building-columns"></i>

        </div>

       <div class="logo-text">

            <h2>Amentrop</h2>

            <p>TPO Management Portal</p>

        </div>

    </div>

    <!-- MENU -->

    <div class="menu">

        <a class="active"
           href="${pageContext.request.contextPath}/tpo/dashboard">

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

    <!-- TOPBAR -->

    <div class="topbar">

        <div>

            <h2>

                Welcome,
                <span>TPO</span>

            </h2>

            <p>

                Manage placement drives, students,
                applications and placement activities
                through the Amentrop portal.

            </p>

        </div>

        <div class="profile-box">

            <i class="fa-solid fa-user-tie"></i>

            <div>

                <strong>

                    Training & Placement Officer

                </strong>

                <br>

                <small style="color:#999;">

                    Placement Administration

                </small>

            </div>

        </div>

    </div>

    <!-- STATS -->

    <div class="stats-grid">

        <!-- DRIVES -->

        <div class="stat-card">

            <div class="stat-icon">

                <i class="fa-solid fa-briefcase"></i>

            </div>

            <h3>${totalDrives}</h3>

            <p>Total Placement Drives</p>

        </div>

        <!-- STUDENTS -->

        <div class="stat-card">

            <div class="stat-icon">

                <i class="fa-solid fa-users"></i>

            </div>

            <h3>${totalStudents}</h3>

            <p>Total Students</p>

        </div>

        <!-- APPLICATIONS -->

        <div class="stat-card">

            <div class="stat-icon">

                <i class="fa-solid fa-file-circle-check"></i>

            </div>

            <h3>${totalApplications}</h3>

            <p>Total Applications</p>

        </div>

    </div>

    <!-- QUICK ACTIONS -->

    <h3 class="section-title">

        Quick Actions

    </h3>

    <div class="action-grid">

        <!-- ADD DRIVE -->

        <a class="action-card"
           href="${pageContext.request.contextPath}/tpo/add-drive">

            <div class="action-icon">

                <i class="fa-solid fa-plus"></i>

            </div>

            <h3>

                Add Placement Drive

            </h3>

            <p>

                Create and manage new placement opportunities.

            </p>

        </a>

        <!-- VIEW DRIVES -->

        <a class="action-card"
           href="${pageContext.request.contextPath}/tpo/drives">

            <div class="action-icon">

                <i class="fa-solid fa-chart-column"></i>

            </div>

            <h3>

                Manage Drives

            </h3>

            <p>

                View drives, applicants and export reports.

            </p>

        </a>

        <!-- ADD STUDENT -->

        <a class="action-card"
           href="${pageContext.request.contextPath}/tpo/add-student">

            <div class="action-icon">

                <i class="fa-solid fa-user-plus"></i>

            </div>

            <h3>

                Add Student

            </h3>

            <p>

                Register individual students into the portal.

            </p>

        </a>

        <!-- BULK UPLOAD -->

        <a class="action-card"
           href="${pageContext.request.contextPath}/tpo/upload-students">

            <div class="action-icon">

                <i class="fa-solid fa-file-arrow-up"></i>

            </div>

            <h3>

                Bulk Upload

            </h3>

            <p>

                Upload students using Excel sheet onboarding.

            </p>

        </a>

    </div>

</div>

</body>

</html>