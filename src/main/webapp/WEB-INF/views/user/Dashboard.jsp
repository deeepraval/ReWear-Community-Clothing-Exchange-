<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../common/nav.jsp"/>
<jsp:include page="../common/header.jsp"/>

<div style="padding: 20px;">

    <h2>Welcome, ${user.name} 👋</h2>

    <div style="display: flex; align-items: center; margin-top: 15px;">
        <img src="/uploads/profile/${user.profileImage}" width="100" height="100" style="border-radius: 50%; margin-right: 20px;">
        <div>
            <p><strong>Email:</strong> ${user.email}</p>
            <p><strong>Points:</strong> ${user.points}</p>
        </div>
    </div>

    <hr/>

    <h3>Your Uploaded Items</h3>

    <c:if test="${empty items}">
        <p>You haven't uploaded any items yet.</p>
    </c:if>

    <c:if test="${not empty items}">
        <div style="display: flex; flex-wrap: wrap; gap: 20px;">
            <c:forEach var="item" items="${items}">
                <div style="border: 1px solid #ccc; padding: 10px; width: 200px;">
                    <img src="/uploads/item_images/${item.imagePath}" width="180" height="180" style="object-fit: cover;"><br/>
                    <strong>${item.title}</strong><br/>
                    <small>Status: ${item.status}</small>
                </div>
            </c:forEach>
        </div>
    </c:if>

    <br/>
    <a href="/item/add">
        <button style="padding: 10px 20px; background-color: #2d3e50; color: white; border: none; cursor: pointer;">
            + Add New Item
        </button>
    </a>

</div>

<jsp:include page="../common/footer.jsp"/>
