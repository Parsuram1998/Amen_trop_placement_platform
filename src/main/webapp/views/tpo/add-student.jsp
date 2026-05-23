<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Add Student</title>

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
    padding:24px;
}

/* PAGE HEADER */

.page-header{
    margin-bottom:18px;
}

.page-header h1{
    font-size:32px;
    margin-bottom:6px;
}

.page-header h1 span{
    color:#d4af37;
}

.page-header p{
    color:#9d9d9d;
    font-size:14px;
    line-height:1.6;
}

/* FORM CARD */

.form-card{
    background:#121212;

    border:1px solid #252525;

    border-radius:24px;

    padding:28px;

    max-width:1200px;

    margin:auto;
}

/* GRID */

.form-grid{
    display:grid;

    grid-template-columns:
        repeat(2,1fr);

    gap:22px;
}

/* INPUT GROUP */

.input-group{
    display:flex;
    flex-direction:column;

    gap:8px;
}

.input-group label{
    color:#d4af37;

    font-size:13px;
    font-weight:600;
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

    font-size:14px;
}

.input-box input{
    width:100%;
    height:50px;

    background:#0d0d0d;

    border:1px solid #2b2b2b;

    border-radius:14px;

    color:white;

    padding:0 16px 0 44px;

    outline:none;

    font-size:14px;

    transition:0.3s;
}

.input-box input:focus{
    border-color:#d4af37;

    box-shadow:0 0 0 4px rgba(212,175,55,0.08);
}

/* BUTTON */

.button-section{
    margin-top:28px;

    display:flex;
    justify-content:flex-end;
}

.save-btn{
    height:50px;

    padding:0 28px;

    border:none;

    border-radius:14px;

    background:#d4af37;

    color:black;

    font-size:14px;
    font-weight:700;

    cursor:pointer;

    transition:0.3s;
}

.save-btn:hover{
    background:#b8932f;

    transform:translateY(-2px);
}

/* RESPONSIVE */

@media(max-width:1000px){

    .form-grid{
        grid-template-columns:1fr;
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

    .form-card{
        padding:20px;
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

            Add
            <span>Student</span>

        </h1>

        <p>

            Register and manage student records
            for placement and campus recruitment activities.

        </p>

    </div>

    <!-- FORM CARD -->

    <div class="form-card">

        <form action="${pageContext.request.contextPath}/tpo/save-student"
              method="post">

            <div class="form-grid">

                <!-- NAME -->

                <div class="input-group">

                    <label>

                        Student Name

                    </label>

                    <div class="input-box">

                        <i class="fa-solid fa-user"></i>

                        <input type="text"
                               name="name"
                               placeholder="Enter Student Name"
                               required>

                    </div>

                </div>

                <!-- USN -->

                <div class="input-group">

                    <label>

                        USN

                    </label>

                    <div class="input-box">

                        <i class="fa-solid fa-id-card"></i>

                        <input type="text"
                               name="usn"
                               placeholder="Enter USN"
                               required>

                    </div>

                </div>

                <!-- EMAIL -->

                <div class="input-group">

                    <label>

                        Email Address

                    </label>

                    <div class="input-box">

                        <i class="fa-solid fa-envelope"></i>

                        <input type="email"
                               name="email"
                               placeholder="Enter Email"
                               required>

                    </div>

                </div>

                <!-- PHONE -->

                <div class="input-group">

                    <label>

                        Phone Number

                    </label>

                    <div class="input-box">

                        <i class="fa-solid fa-phone"></i>

                        <input type="text"
                               name="phone"
                               placeholder="Enter Phone Number"
                               required>

                    </div>

                </div>

                <!-- BRANCH -->

                <div class="input-group">

                    <label>

                        Branch

                    </label>

                    <div class="input-box">

                        <i class="fa-solid fa-code-branch"></i>

                        <input type="text"
                               name="branch"
                               placeholder="Enter Branch"
                               required>

                    </div>

                </div>

                <!-- 10TH -->

                <div class="input-group">

                    <label>

                        10th Percentage

                    </label>

                    <div class="input-box">

                        <i class="fa-solid fa-percent"></i>

                        <input type="number"
                               step="0.01"
                               name="tenth"
                               placeholder="Enter 10th Percentage"
                               required>

                    </div>

                </div>

                <!-- 12TH -->

                <div class="input-group">

                    <label>

                        12th Percentage

                    </label>

                    <div class="input-box">

                        <i class="fa-solid fa-percent"></i>

                        <input type="number"
                               step="0.01"
                               name="twelfth"
                               placeholder="Enter 12th Percentage"
                               required>

                    </div>

                </div>

                <!-- DEGREE -->

                <div class="input-group">

                    <label>

                        Degree Percentage

                    </label>

                    <div class="input-box">

                        <i class="fa-solid fa-percent"></i>

                        <input type="number"
                               step="0.01"
                               name="degree"
                               placeholder="Enter Degree Percentage"
                               required>

                    </div>

                </div>

            </div>

            <!-- BUTTON -->

            <div class="button-section">

                <button type="submit"
                        class="save-btn">

                    Save Student

                </button>

            </div>

        </form>

    </div>

</div>

</body>

</html>