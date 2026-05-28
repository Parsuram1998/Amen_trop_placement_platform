<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Drive Details</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    background:#050505;
    font-family:Arial,sans-serif;
    color:white;
    overflow-x:hidden;
}

/* BACKGROUND EFFECTS */

body::before{
    content:'';
    position:fixed;
    width:450px;
    height:450px;
    border-radius:50%;
    background:rgba(255,215,0,0.05);
    top:-180px;
    right:-120px;
    filter:blur(100px);
    z-index:-1;
}

body::after{
    content:'';
    position:fixed;
    width:350px;
    height:350px;
    border-radius:50%;
    background:rgba(255,215,0,0.03);
    bottom:-150px;
    left:-100px;
    filter:blur(120px);
    z-index:-1;
}

.page{
    width:92%;
    max-width:1350px;
    margin:35px auto;
}

/* HERO */

.hero{
    background:linear-gradient(135deg,#111111,#1a1a1a);
    border:1px solid rgba(255,215,0,0.15);
    border-radius:28px;
    padding:38px;
    margin-bottom:25px;
    position:relative;
    overflow:hidden;
}

.hero::before{
    content:'';
    position:absolute;
    width:220px;
    height:220px;
    border-radius:50%;
    background:rgba(255,215,0,0.04);
    top:-90px;
    right:-70px;
}

.top-row{
    display:flex;
    justify-content:space-between;
    align-items:flex-start;
    gap:30px;
    flex-wrap:wrap;
}

.company-section{
    flex:1;
}

.company{
    font-size:38px;
    font-weight:800;
    color:#FFD700;
    margin-bottom:10px;
}

.role{
    font-size:22px;
    color:#f3f4f6;
    margin-bottom:24px;
    font-weight:500;
}

.badges{
    display:flex;
    flex-wrap:wrap;
    gap:12px;
}

.badge{
    background:rgba(255,215,0,0.08);
    border:1px solid rgba(255,215,0,0.12);
    padding:11px 18px;
    border-radius:50px;
    font-size:13px;
    display:flex;
    align-items:center;
    gap:10px;
    color:#f5f5f5;
}

.badge i{
    color:#FFD700;
}

.salary-box{
    min-width:220px;
    background:#0e0e0e;
    border:1px solid rgba(255,215,0,0.12);
    border-radius:24px;
    padding:28px;
    text-align:center;
}

.salary-label{
    color:#9ca3af;
    margin-bottom:12px;
    font-size:14px;
}

.salary{
    font-size:38px;
    font-weight:bold;
    color:#FFD700;
}

.salary span{
    font-size:18px;
}

/* GRID */

.grid{
    display:grid;
    grid-template-columns:repeat(2,minmax(0,1fr));
    gap:22px;
    align-items:start;
}

.card{
    background:linear-gradient(145deg,#111111,#171717);
    border:1px solid rgba(255,215,0,0.10);
    border-radius:24px;
    padding:24px;
    transition:0.4s;
    position:relative;
    overflow:hidden;
    height:fit-content;
}

.card::before{
    content:'';
    position:absolute;
    width:100px;
    height:100px;
    border-radius:50%;
    background:rgba(255,215,0,0.03);
    top:-40px;
    right:-40px;
}

.card:hover{
    transform:translateY(-4px);
    border-color:rgba(255,215,0,0.28);
    box-shadow:0 12px 30px rgba(0,0,0,0.35);
}

.card h2{
    color:#FFD700;
    font-size:20px;
    margin-bottom:20px;
    display:flex;
    align-items:center;
    gap:12px;
}

.card h2 i{
    font-size:18px;
}

.label{
    color:#999;
    margin-bottom:6px;
    font-size:13px;
}

.value{
    color:#f3f4f6;
    font-size:15px;
    line-height:1.7;
    margin-bottom:10px;
}

/* COMPACT CARDS */

.card:nth-child(1),
.card:nth-child(2),
.card:nth-child(3){
    min-height:auto;
}

/* ELIGIBILITY */

.criteria-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:16px;
}

.criteria-box{
    background:#0c0c0c;
    border:1px solid rgba(255,215,0,0.08);
    padding:16px;
    border-radius:16px;
    text-align:center;
}

.criteria-title{
    color:#999;
    font-size:13px;
    margin-bottom:8px;
}

.criteria-value{
    font-size:22px;
    font-weight:bold;
    color:#FFD700;
}

.bond{
    margin-top:16px;
    background:#0c0c0c;
    border:1px solid rgba(255,215,0,0.08);
    border-radius:16px;
    padding:18px;
}

.bond-value{
    color:#FFD700;
    font-size:18px;
    font-weight:bold;
    margin-top:6px;
}

/* APPLY SECTION */

.apply-section{
    margin-top:28px;
    background:linear-gradient(135deg,#111111,#181818);
    border:1px solid rgba(255,215,0,0.12);
    border-radius:26px;
    padding:30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    gap:20px;
    flex-wrap:wrap;
}

.apply-content h2{
    color:#FFD700;
    margin-bottom:8px;
    font-size:26px;
}

.apply-content p{
    color:#bdbdbd;
    font-size:14px;
    line-height:1.7;
}

.apply-btn{
    background:linear-gradient(135deg,#FFD700,#ffbf00);
    color:black;
    text-decoration:none;
    padding:16px 34px;
    border-radius:15px;
    font-weight:800;
    font-size:15px;
    display:flex;
    align-items:center;
    gap:12px;
    transition:0.4s;
    box-shadow:0 10px 30px rgba(255,215,0,0.2);
}

.apply-btn:hover{
    transform:translateY(-3px) scale(1.02);
    box-shadow:0 14px 35px rgba(255,215,0,0.35);
}

/* RESPONSIVE */

@media(max-width:950px){

.grid{
    grid-template-columns:1fr;
}

.company{
    font-size:30px;
}

.role{
    font-size:18px;
}

.hero{
    padding:28px;
}

.salary-box{
    width:100%;
}

.criteria-grid{
    grid-template-columns:1fr;
}

.apply-section{
    flex-direction:column;
    align-items:flex-start;
}

}

</style>

</head>
<body>

<div class="page">

    <!-- HERO SECTION -->

    <div class="hero">

        <div class="top-row">

            <div class="company-section">

                <div class="company">
                    ${drive.companyName}
                </div>

                <div class="role">
                    ${drive.role}
                </div>

                <div class="badges">

                    <div class="badge">
                        <i class="fa-solid fa-location-dot"></i>
                        ${drive.companyLocation}
                    </div>

                    <div class="badge">
                        <i class="fa-solid fa-calendar"></i>
                        ${drive.driveDate}
                    </div>

                    <div class="badge">
                        <i class="fa-solid fa-circle-check"></i>
                        ${drive.status}
                    </div>

                </div>

            </div>

            <div class="salary-box">

                <div class="salary-label">
                    Package Offered
                </div>

                <div class="salary">
                    ₹${drive.salary}
                    <span>LPA</span>
                </div>

            </div>

        </div>

    </div>

    <!-- GRID -->

    <div class="grid">

        <!-- SKILLS -->

        <div class="card">

            <h2>
                <i class="fa-solid fa-code"></i>
                Required Skills
            </h2>

            <div class="value">
                ${drive.skills}
            </div>

        </div>

        <!-- ROUNDS -->

        <div class="card">

            <h2>
                <i class="fa-solid fa-layer-group"></i>
                Selection Process
            </h2>

            <div class="value">
                ${drive.rounds}
            </div>

        </div>

        <!-- ABOUT -->

        <div class="card">

            <h2>
                <i class="fa-solid fa-building"></i>
                About Company
            </h2>

            <div class="value">
                ${drive.aboutCompany}
            </div>

        </div>

        <!-- ELIGIBILITY -->

        <div class="card">

            <h2>
                <i class="fa-solid fa-graduation-cap"></i>
                Eligibility Criteria
            </h2>

            <div class="criteria-grid">

                <div class="criteria-box">

                    <div class="criteria-title">
                        10th Percentage
                    </div>

                    <div class="criteria-value">
                        ${drive.tenthCriteria}%
                    </div>

                </div>

                <div class="criteria-box">

                    <div class="criteria-title">
                        12th Percentage
                    </div>

                    <div class="criteria-value">
                        ${drive.twelfthCriteria}%
                    </div>

                </div>

                <div class="criteria-box">

                    <div class="criteria-title">
                        Degree Percentage
                    </div>

                    <div class="criteria-value">
                        ${drive.degreeCriteria}%
                    </div>

                </div>

                <div class="criteria-box">

                    <div class="criteria-title">
                        Status
                    </div>

                    <div class="criteria-value">
                        Eligible
                    </div>

                </div>

            </div>

            <div class="bond">

                <div class="label">
                    Bond Applicable
                </div>

                <div class="bond-value">

                    <c:choose>

                        <c:when test="${drive.bondApplicable}">
                            YES
                        </c:when>

                        <c:otherwise>
                            NO
                        </c:otherwise>

                    </c:choose>

                </div>

            </div>

        </div>

    </div>

    <!-- APPLY SECTION -->

    <div class="apply-section">

        <div class="apply-content">

            <h2>
                Ready to Apply?
            </h2>

            <p>
                Submit your application and start your journey with
                ${drive.companyName}.
            </p>

        </div>

        <a href="${pageContext.request.contextPath}/student/apply-drive/${drive.id}"
           class="apply-btn">

            <i class="fa-solid fa-paper-plane"></i>
            Apply Now

        </a>

    </div>

</div>

</body>
</html>