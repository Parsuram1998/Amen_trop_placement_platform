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

<title>Student Login</title>

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
    height:100vh;
    overflow:hidden;
    display:flex;
}

/* LEFT SECTION */

.left-section{
    width:55%;
    height:100vh;

    background:
    linear-gradient(
        rgba(0,0,0,0.78),
        rgba(0,0,0,0.88)
    ),
    url('https://images.unsplash.com/photo-1523240795612-9a054b0db644?q=80&w=1600');

    background-size:cover;
    background-position:center;

    padding:42px 55px;

    display:flex;
    flex-direction:column;
    justify-content:center;

    overflow:hidden;
}

/* LOGO */

.logo{
    display:flex;
    align-items:center;
    gap:14px;
    margin-bottom:36px;
}

.logo-icon{
    width:58px;
    height:58px;

    background:#d4af37;

    border-radius:18px;

    display:flex;
    align-items:center;
    justify-content:center;

    color:black;
    font-size:24px;

    box-shadow:0 10px 25px rgba(212,175,55,0.2);
}

.logo h1{
    color:#d4af37;
    font-size:32px;
}

.logo p{
    color:#9d9d9d;
    font-size:13px;
    margin-top:4px;
}

/* CONTENT */

.content{
    max-width:620px;
}

.content h2{
    font-size:46px;
    line-height:1.15;
    margin-bottom:18px;
}

.content h2 span{
    color:#d4af37;
}

.content p{
    color:#cfcfcf;
    line-height:1.7;
    font-size:15px;
    margin-bottom:30px;
}

/* FEATURES */

.features{
    display:flex;
    flex-direction:column;
    gap:14px;
}

.feature{
    display:flex;
    align-items:center;
    gap:12px;
}

.feature i{
    width:42px;
    height:42px;

    border-radius:12px;

    background:#1d1d1d;

    display:flex;
    align-items:center;
    justify-content:center;

    color:#d4af37;

    font-size:16px;
}

.feature span{
    color:#d7d7d7;
    font-size:14px;
}

/* RIGHT SECTION */

.right-section{
    width:45%;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:20px 35px;
}

/* LOGIN CARD */

.login-card{
    width:100%;
    max-width:450px;

    background:#151515;

    border:1px solid #2a2a2a;

    border-radius:24px;

    padding:34px;

    box-shadow:0 20px 60px rgba(0,0,0,0.45);
}

/* HEADER */

.login-header{
    margin-bottom:26px;
}

.login-header h2{
    color:#d4af37;
    font-size:30px;
    margin-bottom:10px;
}

.login-header p{
    color:#999;
    font-size:14px;
    line-height:1.6;
}

/* ERROR */

.error-box{
    background:#3b1414;
    border:1px solid #5a2222;

    color:#ffb0b0;

    padding:14px 16px;

    border-radius:14px;

    margin-bottom:20px;

    display:flex;
    align-items:flex-start;
    gap:10px;

    font-size:14px;
    line-height:1.5;
}

.error-box i{
    margin-top:2px;
}

/* FORM */

.form-group{
    margin-bottom:18px;
}

.form-group label{
    display:block;
    margin-bottom:10px;
    color:#d8d8d8;
    font-size:14px;
}

.input-box{
    position:relative;
}

.input-box i{
    position:absolute;
    left:16px;
    top:50%;
    transform:translateY(-50%);

    color:#d4af37;
}

.input-box input{
    width:100%;

    padding:15px 15px 15px 48px;

    background:#0f0f0f;

    border:1px solid #2d2d2d;

    border-radius:14px;

    color:white;

    font-size:14px;

    outline:none;

    transition:0.3s;
}

.input-box input:focus{
    border-color:#d4af37;
    box-shadow:0 0 0 4px rgba(212,175,55,0.1);
}

/* BUTTON */

button{
    width:100%;

    padding:14px;

    background:#d4af37;

    color:black;

    border:none;

    border-radius:14px;

    font-size:15px;

    font-weight:700;

    cursor:pointer;

    transition:0.3s;
}

button:hover{
    background:#b8932f;
    transform:translateY(-2px);
}

/* FOOTER */

.bottom-text{
    text-align:center;
    margin-top:22px;

    color:#9d9d9d;

    font-size:14px;
}

.bottom-text span{
    color:#d4af37;
    font-weight:600;
}

/* RESPONSIVE */

@media(max-width:1100px){

    .content h2{
        font-size:40px;
    }

}

@media(max-width:900px){

    body{
        flex-direction:column;
        height:auto;
        overflow:auto;
    }

    .left-section,
    .right-section{
        width:100%;
        height:auto;
    }

    .left-section{
        padding:35px 24px;
        text-align:center;
        align-items:center;
    }

    .logo{
        justify-content:center;
    }

    .content{
        max-width:100%;
    }

    .content h2{
        font-size:34px;
    }

    .features{
        width:100%;
        max-width:450px;
    }

    .feature{
        justify-content:flex-start;
        text-align:left;
    }

    .right-section{
        padding:30px 20px 45px;
    }

}

@media(max-width:600px){

    .left-section{
        padding:30px 18px;
    }

    .logo{
        flex-direction:column;
        text-align:center;
        gap:10px;
    }

    .content h2{
        font-size:28px;
        line-height:1.3;
    }

    .content p{
        font-size:13px;
    }

    .feature span{
        font-size:13px;
    }

    .login-card{
        padding:24px 18px;
    }

    .login-header h2{
        font-size:24px;
    }

}

</style>

</head>

<body>

<!-- LEFT -->

<div class="left-section">

    <!-- LOGO -->

    <div class="logo">

        <div class="logo-icon">

            <i class="fa-solid fa-user-graduate"></i>

        </div>

        <div>

            <h1>Amentrop</h1>

            <p>Student Placement Portal</p>

        </div>

    </div>

    <!-- CONTENT -->

    <div class="content">

        <h2>

            Your Future Starts
            <span>With Opportunity</span>

        </h2>

        <p>

            Access placement drives, upload your resume,
            track application progress and stay connected
            with your college placement activities through
            the Amentrop student portal.

        </p>

        <!-- FEATURES -->

        <div class="features">

            <div class="feature">

                <i class="fa-solid fa-briefcase"></i>

                <span>

                    Apply For Placement Drives

                </span>

            </div>

            <div class="feature">

                <i class="fa-solid fa-file-shield"></i>

                <span>

                    Manage Professional Resume

                </span>

            </div>

            <div class="feature">

                <i class="fa-solid fa-chart-line"></i>

                <span>

                    Track Application Status

                </span>

            </div>

            <div class="feature">

                <i class="fa-solid fa-building"></i>

                <span>

                    Connect With Recruiters & Companies

                </span>

            </div>

        </div>

    </div>

</div>

<!-- RIGHT -->

<div class="right-section">

    <div class="login-card">

        <!-- HEADER -->

        <div class="login-header">

            <h2>

                Student Login

            </h2>

            <p>

                Login to continue your placement journey.

            </p>

        </div>

        <!-- ERROR -->

        <c:if test="${error != null && error.trim().length() > 0}">

            <div class="error-box">

                <i class="fa-solid fa-circle-exclamation"></i>

                <span>

                    ${error}

                </span>

            </div>

        </c:if>

        <!-- FORM -->

        <form action="${pageContext.request.contextPath}/student/login"
              method="post">

            <!-- EMAIL -->

            <div class="form-group">

                <label>Email Address</label>

                <div class="input-box">

                    <i class="fa-solid fa-envelope"></i>

                    <input type="email"
                           name="email"
                           placeholder="Enter your email"
                           required>

                </div>

            </div>

            <!-- PASSWORD -->

            <div class="form-group">

                <label>Password</label>

                <div class="input-box">

                    <i class="fa-solid fa-lock"></i>

                    <input type="password"
                           name="password"
                           placeholder="Enter your password"
                           required>

                </div>

            </div>

            <!-- BUTTON -->

            <button type="submit">

                Login To Dashboard

            </button>

        </form>

        <!-- FOOTER -->

        <div class="bottom-text">

            Powered by
            <span>Amentrop</span>

        </div>

    </div>

</div>

</body>

</html>