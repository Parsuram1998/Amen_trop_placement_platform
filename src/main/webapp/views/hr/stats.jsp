<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidates</title>
</head>
<body>



<table border="1">

<tr>
<th>Candidate</th>
<th>Status</th>
<th>Update</th>
</tr>

<c:forEach items="${selections}" var="s">
<tr>

<td>${s.candidate.fullName}</td>
<td>${s.status}</td>

<td>
<form method="post" action="${pageContext.request.contextPath}/hr/update-status">

<input type="hidden" name="selectionId" value="${s.id}">

<select name="status" onchange="toggleFeedback(this, ${s.id})">
<option value="SHORTLISTED">Shortlisted</option>
<option value="INTERVIEW_SCHEDULED">Interview</option>
<option value="SELECTED">Selected</option>
<option value="REJECTED">Rejected</option>
</select>
<br>

<textarea name="feedback" id="feedback-${s.id}" 
          placeholder="Enter feedback"
          style="display:none;"></textarea>

<br>


<button type="submit">Update</button>

</form>
</td>

</tr>
</c:forEach>

</table>


<script>
function toggleFeedback(select, id){
    let box = document.getElementById("feedback-" + id);

    if(select.value === "REJECTED"){
        box.style.display = "block";
    } else {
        box.style.display = "none";
    }
}
</script>
</body>
</html>