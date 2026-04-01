<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Send Message</title>
</head>

<body>

<h2>Send Message</h2>

<form method="post" action="${pageContext.request.contextPath}/admin/send-message">

Client Name (optional):<br>
<input type="text" name="clientName"><br><br>

Message:<br>
<textarea name="content"></textarea><br><br>

<h3>Select Users</h3>

<!-- Select All -->
<input type="checkbox" onclick="toggleAll(this)"> Select All<br><br>

<c:forEach items="${users}" var="u">

    <input type="checkbox" name="userIds" value="${u.id}">
    ${u.fullName} (${u.role})<br>

</c:forEach>

<br>

<button type="submit">Send Message</button>

</form>
<c:if test="${param.success eq 'true'}">
    <p style="color:green;">Message sent successfully</p>
</c:if>

<c:if test="${param.error eq 'noUsersSelected'}">
    <p style="color:red;">Please select at least one user</p>
</c:if>
<script>
function toggleAll(source) {
    let checkboxes = document.getElementsByName('userIds');
    for(let i=0; i<checkboxes.length; i++){
        checkboxes[i].checked = source.checked;
    }
}
</script>

</body>
</html>