<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../common/nav.jsp"/>
<jsp:include page="../common/header.jsp"/>

<div style="padding: 30px;">
    <h2>Add New Clothing Item</h2>

    <form:form action="/item/save" method="post" modelAttribute="item" enctype="multipart/form-data">
        <p>Title: <form:input path="title" required="true"/></p>
        <p>Description: <form:textarea path="description"/></p>
        <p>Category: <form:input path="category"/></p>
        <p>Type: <form:input path="type"/></p>
        <p>Size: <form:input path="size"/></p>
        <p>Condition: <form:input path="condition"/></p>
        <p>Tags (comma separated): <form:input path="tags"/></p>
        <p>Upload Image: <input type="file" name="imageFile" accept="image/*" required/></p>
        <p><input type="submit" value="Save Item"/></p>
    </form:form>

    <c:if test="${not empty error}">
        <p style="color:red">${error}</p>
    </c:if>
    <c:if test="${not empty success}">
        <p style="color:green">${success}</p>
    </c:if>
</div>

<jsp:include page="../common/footer.jsp"/>
