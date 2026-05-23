<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Admin Login</title>

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
    url('https://images.unsplash.com/photo-1552664730-d307ca884978?q=80&w=1600');

    background-size:cover;
    background-position:center;

    padding:40px 55px;

    display:flex;
    flex-direction:column;
    justify-content:center;

    overflow:hidden;
}

/* LOGO */

.logo{
    display:flex;
    align-items:center;
    gap:15px;
    margin-bottom:34px;
}

.logo-icon{
    width:58px;
    height:58px;

    background:#d4af37;

    border-radius:16px;

    display:flex;
    justify-content:center;
    align-items:center;

    color:black;
    font-size:26px;
}

.logo h1{
    color:#d4af37;
    font-size:32px;
}

.logo p{
    color:#aaa;
    font-size:13px;
    margin-top:4px;
}

/* CONTENT */

.content{
    max-width:620px;
}

.content h2{
    font-size:44px;
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
    margin-bottom:28px;
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
    width:40px;
    height:40px;

    background:rgba(212,175,55,0.12);

    border-radius:10px;

    display:flex;
    justify-content:center;
    align-items:center;

    color:#d4af37;

    flex-shrink:0;
}

.feature span{
    color:#ddd;
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
    max-width:460px;

    background:#161616;

    border:1px solid #2a2a2a;

    border-radius:22px;

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
    margin-bottom:8px;
}

.login-header p{
    color:#999;
    line-height:1.6;
    font-size:14px;
}

/* ERROR */
.error-box{
    background:#2a1111;
    border:1px solid #5a1f1f;
    color:#ffb3b3;

    padding:14px 16px;

    border-radius:12px;

    margin-bottom:18px;

    font-size:14px;

    display:flex;
    align-items:flex-start;
    gap:10px;

    line-height:1.5;
}

.error-box i{
    color:#ff6b6b;
    margin-top:2px;
}

/* FORM */

.form-group{
    margin-bottom:18px;
}

.form-group label{
    display:block;
    margin-bottom:9px;
    color:#ddd;
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
    z-index:5;
}

.input-box input{
    width:100%;

    padding:14px 14px 14px 48px;

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
    box-shadow:0 0 0 4px rgba(212,175,55,0.12);
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

    font-weight:bold;

    cursor:pointer;

    transition:0.3s;
}

button:hover{
    background:#b8932f;
    transform:translateY(-2px);
}

/* REGISTER LINK */

.bottom-text{
    margin-top:22px;
    text-align:center;
    color:#999;
    font-size:14px;
}

.bottom-text a{
    color:#d4af37;
    text-decoration:none;
    font-weight:bold;
}

/* RESPONSIVE */

@media(max-width:992px){

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
        padding:35px 22px;
        text-align:center;
        align-items:center;
    }

    .logo{
        justify-content:center;
        margin-bottom:24px;
    }

    .content{
        max-width:100%;
    }

    .content h2{
        font-size:32px;
    }

    .content p{
        font-size:14px;
    }

    .features{
        max-width:420px;
        width:100%;
    }

    .feature{
        justify-content:flex-start;
        text-align:left;
    }

    .right-section{
        padding:25px 18px 40px;
    }

    .login-card{
        max-width:500px;
        padding:28px 22px;
    }

}

@media(max-width:480px){

    .left-section{
        padding:30px 18px;
    }

    .logo{
        flex-direction:column;
        text-align:center;
        gap:10px;
    }

    .content h2{
        font-size:26px;
        line-height:1.3;
    }

    .content p{
        font-size:13px;
    }

    .feature span{
        font-size:13px;
    }

    .login-header h2{
        font-size:24px;
    }

    .login-card{
        padding:24px 18px;
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

            <i class="fa-solid fa-briefcase"></i>

        </div>

        <div>

            <h1>Amentrop</h1>

            <p>Placement Management Platform</p>

        </div>

    </div>

    <!-- CONTENT -->

    <div class="content">

        <h2>

            Manage Placements With
            <span>Confidence & Intelligence</span>

        </h2>

        <p>

            Amentrop empowers administrators to oversee colleges,
            TPOs, placement drives, student recruitment activities
            and placement analytics through one unified platform.

        </p>

        <!-- FEATURES -->

        <div class="features">

            <div class="feature">

                <i class="fa-solid fa-building-columns"></i>

                <span>

                    Centralized College Management

                </span>

            </div>

            <div class="feature">

                <i class="fa-solid fa-users"></i>

                <span>

                    TPO & Student Administration

                </span>

            </div>

            <div class="feature">

                <i class="fa-solid fa-chart-pie"></i>

                <span>

                    Placement Analytics & Insights

                </span>

            </div>

            <div class="feature">

                <i class="fa-solid fa-shield-halved"></i>

                <span>

                    Secure Role Based Access

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

            <h2>Admin Login</h2>

            <p>

                Sign in to continue managing
                your placement ecosystem.

            </p>

        </div>

        <!-- ERROR MESSAGE -->

   <c:if test="${error != null && error.trim().length() > 0}">

    <div class="error-box">

        <i class="fa-solid fa-circle-exclamation"></i>

        <span>

            ${error}

        </span>

    </div>

</c:if>

        <!-- FORM -->

        <form action="${pageContext.request.contextPath}/admin/login"
              method="post">

            <!-- EMAIL -->

            <div class="form-group">

                <label>Email Address</label>

                <div class="input-box">

                    <i class="fa-solid fa-envelope"></i>

                    <input type="email"
                           name="email"
                           placeholder="Enter email address"
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
                           placeholder="Enter password"
                           required>

                </div>

            </div>

            <!-- BUTTON -->

            <button type="submit">

                Login

            </button>

        </form>

        <!-- REGISTER -->

        <div class="bottom-text">

            Don't have an account?

            <a href="${pageContext.request.contextPath}/admin/register">

                Register

            </a>

        </div>

    </div>

</div>

</body>

</html>