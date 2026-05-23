<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Activate Account</title>

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

    min-height:100vh;

    overflow:hidden;

    position:relative;
}

/* BACKGROUND */

body::before{
    content:'';

    position:absolute;

    top:-120px;
    right:-120px;

    width:320px;
    height:320px;

    background:rgba(212,175,55,0.10);

    border-radius:50%;

    filter:blur(90px);

    z-index:0;
}

body::after{
    content:'';

    position:absolute;

    bottom:-120px;
    left:-120px;

    width:280px;
    height:280px;

    background:rgba(212,175,55,0.06);

    border-radius:50%;

    filter:blur(90px);

    z-index:0;
}

/* MAIN */

.wrapper{
    position:relative;
    z-index:2;

    width:100%;
    height:100vh;

    display:flex;
    align-items:center;
    justify-content:center;

    padding:20px;
}

/* CARD */

.card{
    width:100%;
    max-width:1100px;
    height:640px;

    background:#111111;

    border:1px solid #242424;

    border-radius:28px;

    overflow:hidden;

    display:grid;
    grid-template-columns:1.1fr 0.9fr;

    box-shadow:0 25px 80px rgba(0,0,0,0.45);
}

/* LEFT */

.left{
    padding:50px 55px;

    background:
    linear-gradient(
        rgba(0,0,0,0.65),
        rgba(0,0,0,0.82)
    ),
    url('https://images.unsplash.com/photo-1522202176988-66273c2fd55f?q=80&w=1600');

    background-size:cover;
    background-position:center;

    display:flex;
    flex-direction:column;
    justify-content:space-between;
}

/* LOGO */

.logo{
    display:flex;
    align-items:center;
    gap:14px;
}

.logo-box{
    width:60px;
    height:60px;

    border-radius:18px;

    background:#d4af37;

    display:flex;
    align-items:center;
    justify-content:center;

    color:black;

    font-size:24px;
}

.logo h1{
    color:#d4af37;
    font-size:32px;
}

.logo p{
    color:#b8b8b8;
    font-size:13px;
    margin-top:4px;
}

/* CONTENT */

.content h2{
    font-size:56px;
    line-height:1.1;
    margin-bottom:22px;
}

.content h2 span{
    color:#d4af37;
}

.content p{
    color:#d0d0d0;
    line-height:1.9;
    font-size:15px;

    max-width:520px;
}

/* FEATURES */

.features{
    display:flex;
    flex-direction:column;
    gap:16px;
}

.feature{
    display:flex;
    align-items:center;
    gap:14px;
}

.feature i{
    width:42px;
    height:42px;

    border-radius:12px;

    background:rgba(212,175,55,0.15);

    display:flex;
    align-items:center;
    justify-content:center;

    color:#d4af37;
}

.feature span{
    color:#ececec;
    font-size:14px;
}

/* RIGHT */

.right{
    padding:45px 42px;

    display:flex;
    flex-direction:column;
    justify-content:center;

    background:#141414;
}

/* TOP */

.top-badge{
    width:max-content;

    padding:10px 18px;

    border-radius:30px;

    background:rgba(212,175,55,0.12);

    color:#d4af37;

    font-size:13px;
    font-weight:600;

    margin-bottom:24px;
}

/* HEADER */

.header{
    margin-bottom:28px;
}

.header h3{
    font-size:36px;
    color:white;
    margin-bottom:12px;
}

.header p{
    color:#9d9d9d;
    line-height:1.7;
    font-size:14px;
}

/* FORM */

.form-group{
    margin-bottom:22px;
}

.form-group label{
    display:block;
    margin-bottom:10px;

    color:#ddd;

    font-size:14px;
    font-weight:500;
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

    padding:16px 16px 16px 50px;

    background:#0d0d0d;

    border:1px solid #2c2c2c;

    border-radius:16px;

    color:white;

    font-size:14px;

    outline:none;

    transition:0.3s;
}

.input-box input:focus{
    border-color:#d4af37;
    box-shadow:0 0 0 4px rgba(212,175,55,0.1);
}

/* PASSWORD BOX */

.password-box{
    background:#101010;

    border:1px solid #232323;

    border-radius:16px;

    padding:16px;

    margin-top:14px;
}

.password-box h4{
    color:#d4af37;
    margin-bottom:10px;
    font-size:14px;
}

.password-box p{
    color:#9d9d9d;
    font-size:13px;
    line-height:1.8;
}

/* BUTTON */

button{
    width:100%;

    padding:16px;

    background:#d4af37;

    color:black;

    border:none;

    border-radius:18px;

    font-size:15px;

    font-weight:700;

    cursor:pointer;

    transition:0.3s;

    margin-top:12px;
}

button:hover{
    background:#b8932f;
    transform:translateY(-2px);
}

/* FOOTER */

.footer{
    margin-top:26px;

    text-align:center;

    color:#8d8d8d;

    font-size:13px;
    line-height:1.7;
}

/* RESPONSIVE */

@media(max-width:980px){

    body{
        overflow:auto;
    }

    .wrapper{
        height:auto;
        min-height:100vh;
        padding:18px;
    }

    .card{
        height:auto;
        grid-template-columns:1fr;
    }

    .left{
        padding:36px 24px;
        gap:35px;
    }

    .content h2{
        font-size:40px;
    }

    .right{
        padding:34px 22px;
    }

}

@media(max-width:600px){

    .logo{
        flex-direction:column;
        align-items:flex-start;
    }

    .content h2{
        font-size:30px;
        line-height:1.25;
    }

    .content p{
        font-size:13px;
    }

    .header h3{
        font-size:28px;
    }

    .feature span{
        font-size:13px;
    }

}

</style>

</head>

<body>

<div class="wrapper">

    <div class="card">

        <!-- LEFT -->

        <div class="left">

            <!-- LOGO -->

            <div class="logo">

                <div class="logo-box">

                    <i class="fa-solid fa-graduation-cap"></i>

                </div>

                <div>

                    <h1>Amentrop</h1>

                    <p>Placement Management Platform</p>

                </div>

            </div>

            <!-- CONTENT -->

            <div class="content">

                <h2>

                    Activate Your
                    <span>Student Portal</span>

                </h2>

                <p>

                    Create your password to securely
                    access placement drives, manage
                    your resume, apply for opportunities
                    and begin your placement journey
                    with Amentrop.

                </p>

            </div>

            <!-- FEATURES -->

            <div class="features">

                <div class="feature">

                    <i class="fa-solid fa-lock"></i>

                    <span>

                        Secure Student Account Access

                    </span>

                </div>

                <div class="feature">

                    <i class="fa-solid fa-file-shield"></i>

                    <span>

                        Resume & Placement Profile Protection

                    </span>

                </div>

                <div class="feature">

                    <i class="fa-solid fa-briefcase"></i>

                    <span>

                        Access Placement Opportunities

                    </span>

                </div>

            </div>

        </div>

        <!-- RIGHT -->

        <div class="right">

            <!-- BADGE -->

            <div class="top-badge">

                Secure Account Setup

            </div>

            <!-- HEADER -->

            <div class="header">

                <h3>

                    Set Password

                </h3>

                <p>

                    Create a strong password to activate
                    your placement portal account.

                </p>

            </div>

            <!-- FORM -->

            <form action="${pageContext.request.contextPath}/student/set-password"
                  method="post">

                <input type="hidden"
                       name="token"
                       value="${token}" />

                <!-- PASSWORD -->

                <div class="form-group">

                    <label>

                        Create Password

                    </label>

                    <div class="input-box">

                        <i class="fa-solid fa-key"></i>

                        <input type="password"
                               name="password"
                               placeholder="Enter strong password"
                               required>

                    </div>

                    <!-- PASSWORD TIPS -->

                    <div class="password-box">

                        <h4>

                            Password Requirements

                        </h4>

                        <p>

                            • Minimum 8 characters <br>
                            • Include uppercase & lowercase letters <br>
                            • Add numbers or symbols for stronger protection

                        </p>

                    </div>

                </div>

                <!-- BUTTON -->

                <button type="submit">

                    Activate My Account

                </button>

            </form>

            <!-- FOOTER -->

            <div class="footer">

                Securely powered by Amentrop
                Placement Management Platform

            </div>

        </div>

    </div>

</div>

</body>

</html>