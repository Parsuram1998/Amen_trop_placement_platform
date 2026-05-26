<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0">

<title>Amentrop | Student Portal Activation</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<style>

:root{
	--gold:#D4AF37;
	--gold-light:#f5d173;
	--gold-dark:#b8860b;

	--bg:#050505;
	--card:#101010;

	--text:#ffffff;
	--text-gray:#a8a8a8;
}

/* RESET */

*{
	margin:0;
	padding:0;
	box-sizing:border-box;
}

html{
	scroll-behavior:smooth;
}

body{
	font-family:'Inter',sans-serif;

	background:
	radial-gradient(circle at top right,
	rgba(212,175,55,0.07),
	transparent 30%),

	radial-gradient(circle at bottom left,
	rgba(212,175,55,0.05),
	transparent 30%),

	#050505;

	color:white;

	min-height:100vh;

	display:flex;
	align-items:center;
	justify-content:center;

	padding:24px;

	overflow:hidden;

	position:relative;
}

/* BACKGROUND GLOW */

body::before{
	content:'';

	position:absolute;

	top:-220px;
	right:-220px;

	width:520px;
	height:520px;

	background:
	radial-gradient(circle,
	rgba(212,175,55,0.10),
	transparent 70%);
}

body::after{
	content:'';

	position:absolute;

	bottom:-220px;
	left:-220px;

	width:420px;
	height:420px;

	background:
	radial-gradient(circle,
	rgba(212,175,55,0.08),
	transparent 70%);
}

/* CARD */

.portal-card{
	position:relative;
	z-index:2;

	width:100%;
	max-width:1180px;

	min-height:690px;

	display:grid;
	grid-template-columns:1fr 1fr;

	background:
	linear-gradient(
		145deg,
		rgba(18,18,18,0.98),
		rgba(10,10,10,0.98)
	);

	border:1px solid rgba(212,175,55,0.10);

	border-radius:34px;

	overflow:hidden;

	box-shadow:
	0 30px 80px rgba(0,0,0,0.55),
	0 0 45px rgba(212,175,55,0.05);

	backdrop-filter:blur(20px);
}

/* LEFT */

.left-side{
	padding:60px;

	background:
	linear-gradient(
		145deg,
		#111111,
		#0a0a0a
	);

	display:flex;
	flex-direction:column;
	justify-content:space-between;

	border-right:1px solid rgba(255,255,255,0.05);

	position:relative;
}

.left-side::before{
	content:'';

	position:absolute;

	width:450px;
	height:450px;

	background:
	radial-gradient(circle,
	rgba(212,175,55,0.08),
	transparent 70%);

	top:-180px;
	right:-180px;
}

/* LOGO */

.logo{
	display:flex;
	align-items:center;
	gap:16px;

	position:relative;
	z-index:2;
}

.logo-icon{
	width:68px;
	height:68px;

	border-radius:22px;

	background:
	linear-gradient(
		135deg,
		var(--gold),
		var(--gold-light)
	);

	display:flex;
	align-items:center;
	justify-content:center;

	color:black;

	font-size:28px;

	box-shadow:
	0 14px 35px rgba(212,175,55,0.25);
}

.logo-text h1{
	font-size:34px;
	font-weight:900;
	color:white;
	letter-spacing:-1px;
}

.logo-text span{
	color:var(--gold-light);
}

.logo-text p{
	color:#a7a7a7;
	font-size:13px;
	margin-top:4px;
}

/* CONTENT */

.hero-content{
	position:relative;
	z-index:2;
}

.hero-badge{
	width:max-content;

	padding:11px 20px;

	border-radius:40px;

	background:rgba(212,175,55,0.08);

	border:1px solid rgba(212,175,55,0.16);

	color:var(--gold-light);

	font-size:12px;
	font-weight:700;

	letter-spacing:1px;

	margin-bottom:28px;
}

.hero-content h2{
	font-size:56px;

	line-height:1.08;

	font-weight:900;

	letter-spacing:-2px;

	margin-bottom:26px;
}

.hero-content h2 span{
	background:
	linear-gradient(
		135deg,
		var(--gold),
		var(--gold-light)
	);

	-webkit-background-clip:text;
	-webkit-text-fill-color:transparent;
}

.hero-content p{
	color:#b8b8b8;

	line-height:2;

	font-size:15px;

	max-width:520px;
}

/* FEATURES */

.features{
	display:flex;
	flex-direction:column;
	gap:18px;

	position:relative;
	z-index:2;
}

.feature{
	display:flex;
	align-items:center;
	gap:16px;
}

.feature i{
	width:46px;
	height:46px;

	border-radius:14px;

	background:rgba(212,175,55,0.08);

	border:1px solid rgba(212,175,55,0.16);

	display:flex;
	align-items:center;
	justify-content:center;

	color:var(--gold);

	font-size:15px;
}

.feature span{
	color:#ececec;
	font-size:14px;
}

/* RIGHT */

.right-side{
	padding:60px;

	display:flex;
	flex-direction:column;
	justify-content:center;

	position:relative;
}

.right-side::before{
	content:'';

	position:absolute;

	width:360px;
	height:360px;

	background:
	radial-gradient(circle,
	rgba(212,175,55,0.06),
	transparent 70%);

	bottom:-160px;
	right:-160px;
}

/* HEADER */

.form-header{
	margin-bottom:34px;
	position:relative;
	z-index:2;
}

.form-header h3{
	font-size:42px;
	font-weight:800;
	margin-bottom:14px;
}

.form-header p{
	color:#a9a9a9;
	line-height:1.9;
	font-size:14px;
}

/* FORM */

.form-group{
	margin-bottom:24px;
	position:relative;
	z-index:2;
}

.form-group label{
	display:block;

	margin-bottom:12px;

	font-size:14px;
	font-weight:600;

	color:#d8d8d8;
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

	color:var(--gold);
}

.input-box input{
	width:100%;

	padding:18px 18px 18px 54px;

	background:#0b0b0b;

	border:1px solid rgba(255,255,255,0.07);

	border-radius:18px;

	color:white;

	font-size:14px;

	outline:none;

	transition:0.35s;
}

.input-box input:focus{
	border-color:var(--gold);

	box-shadow:
	0 0 0 4px rgba(212,175,55,0.10),
	0 12px 30px rgba(212,175,55,0.06);
}

/* PASSWORD BOX */

.password-box{
	background:#0d0d0d;

	border:1px solid rgba(255,255,255,0.05);

	border-radius:18px;

	padding:18px;

	margin-top:18px;
}

.password-box h4{
	color:var(--gold-light);

	font-size:14px;

	margin-bottom:12px;
}

.password-box p{
	color:#9d9d9d;

	font-size:13px;

	line-height:1.9;
}

/* BUTTON */

.activate-btn{
	width:100%;

	padding:18px;

	background:
	linear-gradient(
		135deg,
		var(--gold),
		var(--gold-light)
	);

	border:none;

	border-radius:18px;

	color:black;

	font-size:15px;
	font-weight:800;

	cursor:pointer;

	transition:0.35s;

	margin-top:18px;

	box-shadow:
	0 18px 35px rgba(212,175,55,0.22);
}

.activate-btn:hover{
	transform:translateY(-3px);

	box-shadow:
	0 24px 45px rgba(212,175,55,0.30);
}

/* FOOTER */

.portal-footer{
	margin-top:30px;

	text-align:center;

	color:#808080;

	font-size:13px;

	line-height:1.8;
}

/* RESPONSIVE */

@media(max-width:980px){

body{
	overflow:auto;
	padding:18px;
}

.portal-card{
	grid-template-columns:1fr;
}

.left-side,
.right-side{
	padding:38px 26px;
}

.hero-content h2{
	font-size:42px;
}

}

@media(max-width:600px){

.logo{
	flex-direction:column;
	align-items:flex-start;
}

.hero-content h2{
	font-size:34px;
	line-height:1.12;
}

.form-header h3{
	font-size:30px;
}

.hero-content p{
	font-size:13px;
}

.feature span{
	font-size:13px;
}

}

</style>

</head>

<body>

<div class="portal-card">

<!-- LEFT -->

<div class="left-side">

<!-- LOGO -->

<div class="logo">

<div class="logo-icon">
<i class="fa-solid fa-graduation-cap"></i>
</div>

<div class="logo-text">

<h1>
AMEN<span>TROP</span>
</h1>

<p>
Premium Career & Placement Portal
</p>

</div>

</div>

<!-- HERO -->

<div class="hero-content">

<div class="hero-badge">
STUDENT PORTAL ACTIVATION
</div>

<h2>
Activate Your
<span>Career Portal</span>
</h2>

<p>
Securely create your password to access placement opportunities,
manage your profile, apply for jobs, and begin your professional
journey with Amentrop.
</p>

</div>

<!-- FEATURES -->

<div class="features">

<div class="feature">

<i class="fa-solid fa-shield-halved"></i>

<span>
Secure Student Account Access
</span>

</div>

<div class="feature">

<i class="fa-solid fa-file-shield"></i>

<span>
Protected Resume & Career Profile
</span>

</div>

<div class="feature">

<i class="fa-solid fa-briefcase"></i>

<span>
Access Premium Placement Opportunities
</span>

</div>

</div>

</div>

<!-- RIGHT -->

<div class="right-side">

<div class="form-header">

<h3>
Set Your Password
</h3>

<p>
Create a strong password to activate your student portal account.
</p>

</div>

<form
	action="${pageContext.request.contextPath}/tpo/set-password"
	method="post">

<input type="hidden"
	   name="token"
	   value="${token}" />

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

<div class="password-box">

<h4>
Password Requirements
</h4>

<p>
• Minimum 8 characters <br>
• Include uppercase & lowercase letters <br>
• Add numbers or symbols for stronger security
</p>

</div>

</div>

<button type="submit"
		class="activate-btn">

Activate My Account

</button>

</form>

<div class="portal-footer">

Securely powered by Amentrop <br>
Premium Career & Placement Ecosystem

</div>

</div>

</div>

</body>

</html>