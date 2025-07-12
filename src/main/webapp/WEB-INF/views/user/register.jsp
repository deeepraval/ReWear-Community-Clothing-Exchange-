<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Register</title>
</head>
<body>

<jsp:include page="../common/nav.jsp"/>
<jsp:include page="../common/header.jsp"/>

<h2>Register</h2>

<form:form method="POST" modelAttribute="user" enctype="multipart/form-data">
    <p>Name: <form:input path="name" required="true"/></p>
    <p>Email: <form:input path="email" type="email" required="true"/></p>
    <p>Password: <form:password path="password" required="true"/></p>
    <p>Profile Image: <input type="file" name="profileImageFile" accept="image/*" required /></p>
    <p><input type="submit" value="Register"/></p>
</form:form>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>

<c:if test="${not empty success}">
    <p style="color:green">${success}</p>
</c:if>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>
