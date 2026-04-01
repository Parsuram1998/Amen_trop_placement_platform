<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
</head>

<body>

<h2>Admin Dashboard</h2>

<h3>Fresher Analytics</h3>

<p>Total Freshers: ${totalFreshers}</p>
<p>Selected Freshers: ${selectedFreshers}</p>
<p>Needs Improvement: ${needsImprovement}</p>

<hr>

<h3>Professional Analytics</h3>

<p>Total Professionals: ${totalProfessionals}</p>
<p>Verified Professionals: ${verifiedProfessionals}</p>

<hr>

<h3>Job Analytics</h3>

<p>Total Jobs Posted: ${totalJobs}</p>

<hr>

<h3>Application Analytics</h3>

<p>Total Applications: ${totalApplications}</p>

<hr>

<h3>Admin Actions</h3>

<ul>

<li>
<a href="${pageContext.request.contextPath}/admin/freshers">
Manage Freshers
</a>
</li>

<li>
<a href="${pageContext.request.contextPath}/admin/professionals">
Manage Professionals
</a>
</li>

<li>
<a href="${pageContext.request.contextPath}/admin/jobs">
Manage Jobs
</a>
</li>

<li>
<a href="${pageContext.request.contextPath}/admin/send-message">
Send Messsage
</a>
</li>
<li>
    <a href="${pageContext.request.contextPath}/admin/hr-feedback">
        View HR Feedback
    </a>
</li>
<li>
<a href="${pageContext.request.contextPath}/logout">
Logout
</a>
</li>

</ul>

</body>
</html>