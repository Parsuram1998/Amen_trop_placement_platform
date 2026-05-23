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

<title>Student Dashboard</title>

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
    background:#0b0b0b;
    color:white;
    display:flex;
    min-height:100vh;
}

/* SIDEBAR */

.sidebar{
    width:270px;
    background:#111111;
    border-right:1px solid #2a2a2a;
    padding:28px 20px;
    position:fixed;
    height:100vh;
    overflow-y:auto;
}

/* LOGO */

.logo{
    display:flex;
    align-items:center;
    gap:14px;
    margin-bottom:45px;
}

.logo-icon{
    width:58px;
    height:58px;
    border-radius:18px;
    background:#d4af37;

    display:flex;
    align-items:center;
    justify-content:center;

    color:black;
    font-size:24px;

    box-shadow:0 10px 25px rgba(212,175,55,0.25);
}

.logo h2{
    color:#d4af37;
    font-size:30px;
}

.logo p{
    color:#9d9d9d;
    font-size:13px;
    margin-top:4px;
}

/* MENU */

.menu{
    display:flex;
    flex-direction:column;
    gap:14px;
}

.menu button{
    width:100%;
    border:none;
    background:none;

    display:flex;
    align-items:center;
    gap:14px;

    padding:15px 18px;

    border-radius:14px;

    color:#d7d7d7;

    font-size:15px;

    cursor:pointer;

    transition:0.3s;
}

.menu button i{
    width:42px;
    height:42px;

    border-radius:12px;

    background:#1d1d1d;

    display:flex;
    align-items:center;
    justify-content:center;

    color:#d4af37;

    font-size:16px;

    transition:0.3s;
}

.menu button:hover,
.menu button.active{

    background:#1b1b1b;

    color:white;

    transform:translateX(3px);
}

.menu button:hover i,
.menu button.active i{

    background:#d4af37;

    color:black;
}

/* MAIN */

.main{
    margin-left:270px;
    width:calc(100% - 270px);
    padding:26px;
}

/* TOPBAR */

.topbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:32px;
    gap:20px;
}

.topbar h1{
    font-size:34px;
    color:white;
    margin-bottom:8px;
}

.topbar h1 span{
    color:#d4af37;
}

.topbar p{
    color:#9d9d9d;
}

.profile-box{
    background:#151515;
    border:1px solid #2a2a2a;

    padding:14px 18px;

    border-radius:16px;

    display:flex;
    align-items:center;
    gap:12px;
}

.profile-box i{
    width:42px;
    height:42px;

    border-radius:12px;

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
    gap:16px;
    margin-bottom:24px;
}
.stat-card{
    background:#151515;
    border:1px solid #2a2a2a;

    border-radius:18px;

    padding:18px;

    position:relative;

    overflow:hidden;

    transition:0.3s;

    min-height:150px;
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

    width:100px;
    height:100px;

    background:rgba(212,175,55,0.08);

    border-radius:50%;
}

.stat-icon{
    width:48px;
    height:48px;

    border-radius:14px;

    background:#d4af37;

    color:black;

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:18px;

    margin-bottom:14px;

    box-shadow:0 8px 18px rgba(212,175,55,0.15);
}

.stat-card h2{
    font-size:28px;
    color:white;
    margin-bottom:6px;
}

.stat-card p{
    color:#a5a5a5;
    font-size:14px;
}

/* SECTION */

.section{
    display:none;
}

.section.active{
    display:block;
}

/* CARD */

.card{
    background:#151515;
    border:1px solid #2a2a2a;

    border-radius:20px;

    padding:22px;
}

.card-title{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:24px;
}

.card-title h3{
    color:#d4af37;
    font-size:24px;
}

/* TABLE */

.table-wrapper{
    overflow-x:auto;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#d4af37;
    color:black;
    padding:16px;
    text-align:left;
    font-weight:700;
    font-size:14px;
}

td{
    padding:16px;
    border-bottom:1px solid #242424;
    color:#d7d7d7;
}

tr:hover{
    background:#1a1a1a;
}

/* STATUS */

.status{
    padding:8px 14px;
    border-radius:30px;
    font-size:12px;
    font-weight:700;
    display:inline-block;
}

.selected{
    background:#113d29;
    color:#6ff0b0;
}

.applied{
    background:#4d3a08;
    color:#ffd86a;
}

.closed{
    background:#4a1515;
    color:#ff8f8f;
}

/* BUTTONS */

.btn{
    padding:11px 18px;
    border:none;
    border-radius:12px;

    cursor:pointer;

    text-decoration:none;

    font-size:14px;
    font-weight:600;

    transition:0.3s;

    display:inline-flex;
    align-items:center;
    gap:8px;
}

.btn-primary{
    background:#d4af37;
    color:black;
}

.btn-primary:hover{
    background:#b8932f;
}

.btn-danger{
    background:#922727;
    color:white;
}

.btn-danger:hover{
    background:#b73232;
}

/* RESUME */

.resume-box{
    border:2px dashed #343434;
    border-radius:22px;
    padding:40px;
    text-align:center;
    background:#101010;
}

.resume-icon{
    width:90px;
    height:90px;

    border-radius:24px;

    background:#d4af37;

    color:black;

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:34px;

    margin:auto auto 20px;

    box-shadow:0 15px 35px rgba(212,175,55,0.18);
}

.resume-box h3{
    font-size:28px;
    margin-bottom:14px;
    color:#d4af37;
}

.resume-box p{
    color:#a1a1a1;
    line-height:1.7;
    margin-bottom:24px;
}

.file-input{
    background:#1a1a1a;
    border:1px solid #2d2d2d;
    color:#cfcfcf;

    padding:14px;

    border-radius:12px;

    width:100%;

    max-width:420px;

    margin-bottom:22px;
}

.resume-actions{
    display:flex;
    gap:14px;
    justify-content:center;
    flex-wrap:wrap;
    margin-top:24px;
}

/* RESPONSIVE */

@media(max-width:992px){

    body{
        flex-direction:column;
    }

    .sidebar{
        width:100%;
        height:auto;
        position:relative;
    }

    .main{
        margin-left:0;
        width:100%;
        padding:24px;
    }

    .topbar{
        flex-direction:column;
        align-items:flex-start;
    }

}

@media(max-width:600px){

    .main{
        padding:18px;
    }

    .topbar h1{
        font-size:28px;
    }

    .stats-grid{
        grid-template-columns:1fr;
    }

    .card{
        padding:20px;
    }

    .resume-actions{
        flex-direction:column;
    }

    .btn{
        width:100%;
        justify-content:center;
    }

    .menu button{
        font-size:14px;
    }

}
@media(max-width:1100px){

    .sidebar{
        width:220px;
    }

    .main{
        margin-left:220px;
        width:calc(100% - 220px);
    }

}

@media(max-width:900px){

    body{
        flex-direction:column;
    }

    .sidebar{
        width:100%;
        height:auto;
        position:relative;

        display:flex;
        flex-direction:column;

        padding:20px;
    }

    .menu{
        flex-direction:row;
        overflow-x:auto;
        padding-bottom:6px;
    }

    .menu button{
        min-width:max-content;
    }

    .main{
        margin-left:0;
        width:100%;
        padding:20px;
    }

    .topbar{
        flex-direction:column;
        align-items:flex-start;
        gap:16px;
    }

    .stats-grid{
        grid-template-columns:repeat(2,1fr);
    }

}

@media(max-width:600px){

    .main{
        padding:16px;
    }

    .topbar h1{
        font-size:26px;
    }

    .stats-grid{
        grid-template-columns:1fr;
    }

    .card{
        padding:16px;
    }

    .table-wrapper{
        overflow-x:auto;
    }

    table{
        min-width:650px;
    }

    .resume-box{
        padding:24px 18px;
    }

    .resume-actions{
        flex-direction:column;
    }

    .btn{
        width:100%;
        justify-content:center;
    }

    .profile-box{
        width:100%;
    }

}

</style>

</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

    <div class="logo">

        <div class="logo-icon">

            <i class="fa-solid fa-crown"></i>

        </div>

        <div>

            <h2>Amentrop</h2>

            <p>Student Placement Portal</p>

        </div>

    </div>

    <!-- MENU -->

    <div class="menu">

        <button class="tab-btn active"
                onclick="openSection('drivesSection',this)">

            <i class="fa-solid fa-briefcase"></i>

            Placement Drives

        </button>

        <button class="tab-btn"
                onclick="openSection('resumeSection',this)">

            <i class="fa-solid fa-file-lines"></i>

            Resume Center

        </button>

        <button
            onclick="window.location.href='${pageContext.request.contextPath}/logout'">

            <i class="fa-solid fa-right-from-bracket"></i>

            Logout

        </button>

    </div>

</div>

<!-- MAIN -->

<div class="main">

    <!-- TOPBAR -->

    <div class="topbar">

        <div>

            <h1>

                Welcome,
                <span>${sessionScope.student.name}</span>

            </h1>

            <p>

                Your placement journey starts here.
                Track drives, manage resumes and monitor applications.

            </p>

        </div>

        <div class="profile-box">

            <i class="fa-solid fa-user-graduate"></i>

            <div>

                <strong>

                    ${sessionScope.student.branch}

                </strong>

                <br>

                <small style="color:#999;">

                    Student Portal

                </small>

            </div>

        </div>

    </div>

    <!-- STATS -->

    <div class="stats-grid">

        <div class="stat-card">

            <div class="stat-icon">

                <i class="fa-solid fa-building"></i>

            </div>

            <h2>${totalDrives}</h2>

            <p>Total Placement Drives</p>

        </div>

        <div class="stat-card">

            <div class="stat-icon">

                <i class="fa-solid fa-paper-plane"></i>

            </div>

            <h2>${appliedCount}</h2>

            <p>Applications Submitted</p>

        </div>

    </div>

    <!-- DRIVES SECTION -->

    <div id="drivesSection"
         class="section active">

        <div class="card">

            <div class="card-title">

                <h3>

                    Placement Opportunities

                </h3>

            </div>

            <div class="table-wrapper">

                <table>

                    <tr>

                        <th>Company</th>
                        <th>Role</th>
                        <th>Date</th>
                        <th>Status</th>

                    </tr>

                    <c:forEach var="d"
                               items="${drives}">

                        <tr>

                            <td>${d.companyName}</td>

                            <td>${d.role}</td>

                            <td>${d.driveDate}</td>

                            <td>

                                <c:choose>

                                    <c:when test="${d.status == 'ENDED'}">

                                        <span class="status closed">

                                            Closed

                                        </span>

                                    </c:when>

                                    <c:when test="${applicationStatusMap[d.id] == 'SELECTED'}">

                                        <span class="status selected">

                                            Selected

                                        </span>

                                    </c:when>

                                    <c:when test="${applicationStatusMap[d.id] == 'APPLIED'}">

                                        <span class="status applied">

                                            Applied

                                        </span>

                                    </c:when>

                                    <c:otherwise>

                                        <a class="btn btn-primary"
                                           href="${pageContext.request.contextPath}/student/apply/${d.id}">

                                            <i class="fa-solid fa-bolt"></i>

                                            Apply

                                        </a>

                                    </c:otherwise>

                                </c:choose>

                            </td>

                        </tr>

                    </c:forEach>

                </table>

            </div>

        </div>

    </div>

    <!-- RESUME SECTION -->

    <div id="resumeSection"
         class="section">

        <div class="card">

            <div class="resume-box">

                <div class="resume-icon">

                    <i class="fa-solid fa-file-shield"></i>

                </div>

                <h3>

                    Resume Center

                </h3>

                <p>

                    Upload your latest professional resume
                    to apply for placement opportunities.

                </p>

                <c:choose>

                    <c:when test="${empty sessionScope.student.resumePath}">

                        <form action="${pageContext.request.contextPath}/student/upload-resume"
                              method="post"
                              enctype="multipart/form-data">

                            <input class="file-input"
                                   type="file"
                                   name="file"
                                   required>

                            <br>

                            <button class="btn btn-primary">

                                <i class="fa-solid fa-upload"></i>

                                Upload Resume

                            </button>

                        </form>

                    </c:when>

                    <c:otherwise>

                        <span class="status selected">

                            Resume Uploaded Successfully

                        </span>

                        <div class="resume-actions">

                            <button class="btn btn-primary"
                                    onclick="viewResume(${sessionScope.student.id})">

                                <i class="fa-solid fa-eye"></i>

                                View Resume

                            </button>

                            <a class="btn btn-danger"
                               href="${pageContext.request.contextPath}/student/delete-resume">

                                <i class="fa-solid fa-trash"></i>

                                Delete Resume

                            </a>

                        </div>

                        <br><br>

                        <form action="${pageContext.request.contextPath}/student/upload-resume"
                              method="post"
                              enctype="multipart/form-data">

                            <input class="file-input"
                                   type="file"
                                   name="file"
                                   required>

                            <br>

                            <button class="btn btn-primary">

                                <i class="fa-solid fa-rotate"></i>

                                Replace Resume

                            </button>

                        </form>

                    </c:otherwise>

                </c:choose>

            </div>

        </div>

    </div>

</div>

<script>

function openSection(sectionId,button){

    document.querySelectorAll('.section')
        .forEach(section => {

            section.classList.remove('active');

        });

    document.getElementById(sectionId)
        .classList.add('active');

    document.querySelectorAll('.tab-btn')
        .forEach(btn => {

            btn.classList.remove('active');

        });

    button.classList.add('active');
}

function viewResume(id){

    window.open(
        "/student/view-resume/" + id,
        "_blank"
    );
}

</script>

</body>

</html>