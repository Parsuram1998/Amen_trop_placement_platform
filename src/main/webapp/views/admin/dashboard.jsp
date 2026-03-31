<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop Admin</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

:root{
    --bg:#0a0a0a;
    --card:#111;
    --border:rgba(255,255,255,0.06);
    --text:#fff;
    --muted:#9ca3af;
    --gold:#d4af37;
}

*{margin:0;padding:0;box-sizing:border-box}

body{
    font-family:'Inter',sans-serif;
    background:var(--bg);
    color:var(--text);
    display:flex;
}

/* ===== SIDEBAR ===== */
.sidebar{
    width:230px;
    height:100vh;
    padding:25px;
    border-right:1px solid var(--border);
    background:#0d0d0d;
}

.logo{
    font-weight:600;
    font-size:1.3rem;
    margin-bottom:35px;
    color:var(--gold);
}

.nav a{
    display:block;
    padding:10px 12px;
    border-radius:8px;
    margin-bottom:6px;
    color:var(--muted);
    text-decoration:none;
    transition:0.2s;
}

.nav a:hover{
    background:#1a1a1a;
    color:#fff;
}

/* ===== MAIN ===== */
.main{
    flex:1;
    padding:25px;
}

/* GRID */
.grid{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:18px;
}

/* CARD */
.card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:14px;
    padding:18px;
    transition:0.25s;
}

.card:hover{
    border-color:rgba(212,175,55,0.3);
}

/* STAT */
.stat-title{
    font-size:0.8rem;
    color:var(--muted);
}

.stat-value{
    font-size:1.6rem;
    margin-top:5px;
}

/* CHART */
.chart{
    height:180px !important;
}

/* BIG CARD */
.span-2{
    grid-column:span 2;
}

.section-title{
    font-size:0.85rem;
    color:var(--muted);
    margin-bottom:10px;
}

</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="logo">AMENTROP</div>

    <div class="nav">
        <a>Dashboard</a>
        <a href="${pageContext.request.contextPath}/admin/freshers">Freshers</a>
        <a href="${pageContext.request.contextPath}/admin/professionals">Professionals</a>
        <a href="${pageContext.request.contextPath}/admin/jobs">Jobs</a>
        <a href="${pageContext.request.contextPath}/admin/hr-feedback">Feedback</a>
        <a href="${pageContext.request.contextPath}/admin/send-message">Send Message</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

    <div class="grid">

        <!-- STATS -->
        <div class="card">
            <div class="stat-title">Freshers</div>
            <div class="stat-value">${totalFreshers}</div>
        </div>

        <div class="card">
            <div class="stat-title">Selected</div>
            <div class="stat-value">${selectedFreshers}</div>
        </div>

        <div class="card">
            <div class="stat-title">Needs Work</div>
            <div class="stat-value">${needsImprovement}</div>
        </div>

        <div class="card">
            <div class="stat-title">Professionals</div>
            <div class="stat-value">${totalProfessionals}</div>
        </div>

        <!-- DONUT CHART -->
        <div class="card">
            <div class="section-title">Fresher Status</div>
            <canvas id="donutChart" class="chart"></canvas>
        </div>

        <!-- BAR CHART -->
        <div class="card">
            <div class="section-title">Platform Totals</div>
            <canvas id="barChart" class="chart"></canvas>
        </div>

        <!-- BIG CHART (REAL DATA) -->
        <div class="card span-2">
            <div class="section-title">System Overview</div>
            <canvas id="overviewChart" style="height:200px;"></canvas>
        </div>

    </div>

</div>

<script>

/* DONUT - REAL DATA */
new Chart(document.getElementById("donutChart"), {
    type: 'doughnut',
    data: {
        labels: ["Selected", "Needs Work"],
        datasets: [{
            data: [${selectedFreshers}, ${needsImprovement}],
            backgroundColor: ["#d4af37", "#2a2a2a"],
            borderWidth: 0
        }]
    },
    options:{
        plugins:{legend:{display:false}}
    }
});

/* BAR - REAL TOTALS */
new Chart(document.getElementById("barChart"), {
    type: 'bar',
    data: {
        labels: ["Jobs", "Applications"],
        datasets: [{
            data: [${totalJobs}, ${totalApplications}],
            backgroundColor: ["#d4af37", "#555"]
        }]
    },
    options:{
        plugins:{legend:{display:false}},
        scales:{
            x:{ticks:{color:"#aaa"}},
            y:{ticks:{color:"#aaa"}}
        }
    }
});

/* OVERVIEW - REAL SYSTEM DATA */
new Chart(document.getElementById("overviewChart"), {
    type: 'bar',
    data: {
        labels: [
            "Freshers",
            "Selected",
            "Needs Improvement",
            "Professionals",
            "Jobs",
            "Applications"
        ],
        datasets: [{
            data: [
                ${totalFreshers},
                ${selectedFreshers},
                ${needsImprovement},
                ${totalProfessionals},
                ${totalJobs},
                ${totalApplications}
            ],
            backgroundColor: "#d4af37"
        }]
    },
    options:{
        plugins:{legend:{display:false}},
        scales:{
            x:{ticks:{color:"#aaa"}},
            y:{ticks:{color:"#aaa"}}
        }
    }
});

</script>

</body>
</html>