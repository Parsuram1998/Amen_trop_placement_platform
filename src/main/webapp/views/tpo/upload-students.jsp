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

<title>Upload Students</title>

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
}

.logo-text h2{
    color:#d4af37;
    font-size:28px;
}

.logo-text p{
    color:#9d9d9d;
    font-size:11px;
    margin-top:2px;
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
}

.menu a:hover,
.menu a.active{
    background:#1a1a1a;
    color:white;
}

/* MAIN */

.main{
    margin-left:260px;

    padding:24px;
}

/* PAGE HEADER */

.page-header{
    margin-bottom:18px;
}

.page-header h1{
    font-size:34px;
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

/* CONTENT GRID */

.content-grid{
    display:grid;

    grid-template-columns:
        1.2fr 0.8fr;

    gap:20px;
}

/* CARD */

.card{
    background:#121212;

    border:1px solid #252525;

    border-radius:24px;

    padding:28px;
}

/* TITLES */

.card-title{
    display:flex;
    align-items:center;
    gap:12px;

    margin-bottom:22px;
}

.card-title i{
    width:42px;
    height:42px;

    border-radius:12px;

    background:#d4af37;

    color:black;

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:16px;
}

.card-title h3{
    color:#d4af37;
    font-size:22px;
}

/* TEMPLATE BUTTON */

.template-btn{
    height:48px;

    padding:0 22px;

    border-radius:14px;

    background:#d4af37;

    color:black;

    text-decoration:none;

    display:inline-flex;
    align-items:center;
    gap:10px;

    font-size:14px;
    font-weight:700;

    transition:0.3s;

    margin-bottom:24px;
}

.template-btn:hover{
    background:#b8932f;

    transform:translateY(-2px);
}

/* INSTRUCTIONS */

.instructions{
    display:flex;
    flex-direction:column;
    gap:14px;
}

.instruction-item{
    background:#0d0d0d;

    border:1px solid #232323;

    border-radius:16px;

    padding:14px 16px;

    display:flex;
    align-items:flex-start;
    gap:12px;

    transition:0.3s;
}

.instruction-item:hover{
    border-color:#d4af37;
}

.instruction-item i{
    color:#d4af37;

    margin-top:2px;
}

.instruction-item p{
    color:#d5d5d5;

    font-size:14px;
    line-height:1.5;
}

/* UPLOAD AREA */

.upload-box{
    border:2px dashed #2f2f2f;

    border-radius:22px;

    padding:40px 24px;

    text-align:center;

    background:#0d0d0d;

    transition:0.3s;
}

.upload-box:hover{
    border-color:#d4af37;
}

.upload-icon{
    width:74px;
    height:74px;

    border-radius:20px;

    background:#d4af37;

    color:black;

    margin:auto auto 18px;

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:28px;
}

.upload-box h3{
    color:#d4af37;

    font-size:22px;

    margin-bottom:10px;
}

.upload-box p{
    color:#9d9d9d;

    font-size:14px;

    margin-bottom:22px;
}

/* FILE INPUT */

.file-input{
    display:none;
}

.custom-file-upload{
    width:100%;

    height:56px;

    border:1px dashed #3a3a3a;

    border-radius:16px;

    background:#121212;

    display:flex;
    align-items:center;
    justify-content:center;

    gap:12px;

    color:#d4af37;

    font-size:14px;
    font-weight:600;

    cursor:pointer;

    transition:0.3s;

    margin-bottom:22px;
}

.custom-file-upload:hover{
    border-color:#d4af37;

    background:#161616;
}

.custom-file-upload i{
    font-size:18px;
}
/* BUTTON */

.upload-btn{
    width:100%;
    height:52px;

    border:none;

    border-radius:16px;

    background:#d4af37;

    color:black;

    font-size:15px;
    font-weight:700;

    cursor:pointer;

    transition:0.3s;
}

.upload-btn:hover{
    background:#b8932f;

    transform:translateY(-2px);
}

/* RESPONSIVE */

@media(max-width:1100px){

    .content-grid{
        grid-template-columns:1fr;
    }

}

@media(max-width:900px){

    .sidebar{
        width:100%;
        height:auto;

        position:relative;
    }

    .menu{
        flex-direction:row;
        overflow-x:auto;
    }

    .menu a{
        white-space:nowrap;
    }

    .main{
        margin-left:0;
    }

}

@media(max-width:700px){

    .main{
        padding:14px;
    }

    .page-header h1{
        font-size:28px;
    }

    .card{
        padding:20px;
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

            Upload
            <span>Students</span>

        </h1>

        <p>

            Bulk upload student records using Excel templates
            for faster placement management and onboarding.

        </p>

    </div>

    <!-- CONTENT -->

    <div class="content-grid">

        <!-- LEFT -->

        <div class="card">

            <div class="card-title">

                <i class="fa-solid fa-file-excel"></i>

                <h3>

                    Excel Instructions

                </h3>

            </div>

            <!-- DOWNLOAD -->

            <a href="${pageContext.request.contextPath}/tpo/download-template"
               class="template-btn">

                <i class="fa-solid fa-download"></i>

                Download Excel Template

            </a>

            <!-- INSTRUCTIONS -->

            <div class="instructions">

                <div class="instruction-item">

                    <i class="fa-solid fa-circle-check"></i>

                    <p>

                        Do not change the column order in the Excel template.

                    </p>

                </div>

                <div class="instruction-item">

                    <i class="fa-solid fa-circle-check"></i>

                    <p>

                        Avoid leaving empty rows between records.

                    </p>

                </div>

                <div class="instruction-item">

                    <i class="fa-solid fa-circle-check"></i>

                    <p>

                        10th, 12th and Degree percentages must contain valid numeric values.

                    </p>

                </div>

                <div class="instruction-item">

                    <i class="fa-solid fa-circle-check"></i>

                    <p>

                        Student email addresses must be unique.

                    </p>

                </div>

            </div>

        </div>

        <!-- RIGHT -->

        <div class="card">

            <div class="upload-box">

                <div class="upload-icon">

                    <i class="fa-solid fa-cloud-arrow-up"></i>

                </div>

                <h3>

                    Upload Excel File

                </h3>

                <p>

                    Upload the completed student template
                    to register multiple students instantly.

                </p>

                <!-- FORM -->

                <form action="${pageContext.request.contextPath}/tpo/upload-students"
                      method="post"
                      enctype="multipart/form-data">

<label class="custom-file-upload">

    <i class="fa-solid fa-file-arrow-up"></i>

    <span id="fileName">

        Choose Excel File

    </span>

    <input type="file"
           name="file"
           accept=".xlsx"
           required
           class="file-input"
           id="excelFile"/>

</label>

                    <button type="submit"
                            class="upload-btn">

                        Upload Students

                    </button>

                </form>

            </div>

        </div>

    </div>

</div>

</body>

</html>