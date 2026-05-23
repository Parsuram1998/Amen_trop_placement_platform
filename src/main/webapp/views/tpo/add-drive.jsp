<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Add Drive</title>

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

/* WRAPPER */

.wrapper{
    display:flex;
    min-height:100vh;
}

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

    width:calc(100% - 260px);

    padding:28px;
}

/* HEADER */

.topbar{
    margin-bottom:28px;
}

.topbar h1{
    font-size:38px;

    font-weight:700;

    margin-bottom:10px;

    line-height:1.2;
}

.topbar h1 span{
    color:#d4af37;
}

.topbar p{
    color:#9d9d9d;

    line-height:1.8;

    font-size:14px;

    max-width:700px;
}

/* FORM CARD */

.form-card{
    background:#141414;

    border:1px solid #252525;

    border-radius:28px;

    padding:34px;

    box-shadow:
        0 10px 30px rgba(0,0,0,0.25);
}

/* SECTION TITLE */

.section-title{
    font-size:24px;

    font-weight:700;

    color:#d4af37;

    margin-bottom:30px;
}

/* GRID */

.form-grid{
    display:grid;

    grid-template-columns:
        repeat(2,minmax(0,1fr));

    gap:24px;
}

/* GROUP */

.form-group{
    display:flex;
    flex-direction:column;
}

.form-group.full{
    grid-column:1/3;
}

.form-group label{
    margin-bottom:10px;

    color:#e4e4e4;

    font-size:13px;

    font-weight:600;

    letter-spacing:0.3px;
}

/* INPUT */

.input-box{
    position:relative;
}

.input-box i{
    position:absolute;

    left:18px;
    top:50%;

    transform:translateY(-50%);

    color:#d4af37;

    font-size:15px;

    z-index:2;
}

.input-box input,
.input-box textarea{

    width:100%;

    background:#0d0d0d;

    border:1px solid #2b2b2b;

    border-radius:18px;

    color:white;

    font-size:14px;

    outline:none;

    transition:0.3s;
}

.input-box input{

    height:56px;

    padding:0 18px 0 52px;
}

.input-box textarea{

    padding:18px;

    min-height:150px;

    resize:vertical;

    line-height:1.7;
}

.input-box input:focus,
.input-box textarea:focus{

    border-color:#d4af37;

    background:#111111;

    box-shadow:
        0 0 0 4px rgba(212,175,55,0.08);
}

/* REMOVE NUMBER ARROWS */

input[type=number]::-webkit-outer-spin-button,
input[type=number]::-webkit-inner-spin-button{

    -webkit-appearance:none;

    margin:0;
}

input[type=number]{
    -moz-appearance:textfield;
}

/* PERCENT BOX */

.percent-box{
    position:relative;
}

.percent-symbol{

    position:absolute;

    right:18px;
    top:50%;

    transform:translateY(-50%);

    color:#d4af37;

    font-size:14px;

    font-weight:700;

    pointer-events:none;
}

.percent-box input{
    padding-right:46px !important;
}

/* CHECKBOX */

.checkbox-box{

    height:56px;

    background:#0d0d0d;

    border:1px solid #2b2b2b;

    border-radius:18px;

    padding:0 18px;

    display:flex;
    align-items:center;

    gap:14px;

    transition:0.3s;
}

.checkbox-box:hover{
    border-color:#d4af37;
}

.checkbox-box input[type="checkbox"]{

    appearance:none;

    -webkit-appearance:none;

    width:22px;
    height:22px;

    border:2px solid #d4af37;

    border-radius:6px;

    background:#0d0d0d;

    cursor:pointer;

    position:relative;

    transition:0.3s;

    flex-shrink:0;
}

.checkbox-box input[type="checkbox"]:checked{

    background:#d4af37;
}

.checkbox-box input[type="checkbox"]:checked::after{

    content:"✔";

    position:absolute;

    top:50%;
    left:50%;

    transform:translate(-50%,-50%);

    color:black;

    font-size:12px;

    font-weight:900;
}

.checkbox-box span{

    color:#d8d8d8;

    font-size:14px;

    font-weight:500;
}

/* BUTTON */

.button-box{
    margin-top:34px;
}

button{

    background:#d4af37;

    color:black;

    border:none;

    height:58px;

    padding:0 30px;

    border-radius:18px;

    font-size:15px;
    font-weight:700;

    cursor:pointer;

    transition:0.3s;

    box-shadow:
        0 10px 25px rgba(212,175,55,0.15);
}

button:hover{

    background:#b8932f;

    transform:translateY(-2px);
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

@media(max-width:700px){

    .form-grid{
        grid-template-columns:1fr;
    }

    .form-group.full{
        grid-column:auto;
    }

    .topbar h1{
        font-size:30px;
    }

    .form-card{
        padding:20px;
    }

    .main{
        padding:16px;
    }

}

</style>

</head>

<body>

<div class="wrapper">

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

            <a href="${pageContext.request.contextPath}/tpo/dashboard">

                <i class="fa-solid fa-chart-line"></i>

                Dashboard

            </a>

            <a class="active"
               href="${pageContext.request.contextPath}/tpo/add-drive">

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

        <div class="topbar">

            <h1>

                Create New
                <span>Placement Drive</span>

            </h1>

            <p>

                Add company recruitment details,
                eligibility criteria and placement process.

            </p>

        </div>

        <!-- FORM CARD -->

        <div class="form-card">

            <h3 class="section-title">

                Drive Information

            </h3>

            <form action="${pageContext.request.contextPath}/tpo/save-drive"
                  method="post">

                <div class="form-grid">

                    <!-- COMPANY -->

                    <div class="form-group">

                        <label>

                            Company Name

                        </label>

                        <div class="input-box">

                            <i class="fa-solid fa-building"></i>

                            <input type="text"
                                   name="companyName"
                                   placeholder="Enter company name"
                                   required>

                        </div>

                    </div>

                    <!-- ROLE -->

                    <div class="form-group">

                        <label>

                            Job Role

                        </label>

                        <div class="input-box">

                            <i class="fa-solid fa-briefcase"></i>

                            <input type="text"
                                   name="role"
                                   placeholder="Enter role"
                                   required>

                        </div>

                    </div>

                    <!-- SALARY -->

                    <div class="form-group">

                        <label>

                            Salary Package

                        </label>

                        <div class="input-box">

                            <i class="fa-solid fa-indian-rupee-sign"></i>

                            <input type="number"
                                   name="salary"
                                   placeholder="Enter package"
                                   required>

                        </div>

                    </div>

                    <!-- DRIVE DATE -->

                    <div class="form-group">

                        <label>

                            Drive Date

                        </label>

                        <div class="input-box">

                            <i class="fa-solid fa-calendar"></i>

                            <input type="date"
                                   name="driveDate"
                                   required>

                        </div>

                    </div>

                    <!-- ABOUT -->

                    <div class="form-group full">

                        <label>

                            About Company

                        </label>

                        <div class="input-box">

                            <textarea name="aboutCompany"
                                      placeholder="Enter company overview"></textarea>

                        </div>

                    </div>

                    <!-- ROUNDS -->

                    <div class="form-group full">

                        <label>

                            Recruitment Rounds

                        </label>

                        <div class="input-box">

                            <i class="fa-solid fa-layer-group"></i>

                            <input type="text"
                                   name="rounds"
                                   placeholder="Eg: Aptitude, Technical, HR">

                        </div>

                    </div>

                    <!-- SKILLS -->

                    <div class="form-group full">

                        <label>

                            Required Skills

                        </label>

                        <div class="input-box">

                            <i class="fa-solid fa-code"></i>

                            <input type="text"
                                   name="skills"
                                   placeholder="Java, SQL, Spring Boot etc">

                        </div>

                    </div>

                    <!-- 10TH -->

                    <div class="form-group">

                        <label>

                            10th Criteria %

                        </label>

                        <div class="input-box percent-box">

                           

                            <input type="number"
                                   name="tenthCriteria"
                                   placeholder="Enter criteria">

                            <span class="percent-symbol">

                                %

                            </span>

                        </div>

                    </div>

                    <!-- 12TH -->

                    <div class="form-group">

                        <label>

                            12th Criteria %

                        </label>

                        <div class="input-box percent-box">

                           

                            <input type="number"
                                   name="twelfthCriteria"
                                   placeholder="Enter criteria">

                            <span class="percent-symbol">

                                %

                            </span>

                        </div>

                    </div>

                    <!-- DEGREE -->

                    <div class="form-group">

                        <label>

                            Degree Criteria %

                        </label>

                        <div class="input-box percent-box">

                            

                            <input type="number"
                                   name="degreeCriteria"
                                   placeholder="Enter criteria">

                            <span class="percent-symbol">

                                %

                            </span>

                        </div>

                    </div>

                    <!-- BOND -->

                    <div class="form-group">

                        <label>

                            Bond Applicable

                        </label>

                        <div class="checkbox-box">

                            <input type="checkbox"
                                   name="bondApplicable"
                                   id="bondCheck">

                            <span>

                                Yes, bond applicable

                            </span>

                        </div>

                    </div>

                </div>

                <!-- BUTTON -->

                <div class="button-box">

                    <button type="submit">

                        Save Placement Drive

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>

</body>

</html>