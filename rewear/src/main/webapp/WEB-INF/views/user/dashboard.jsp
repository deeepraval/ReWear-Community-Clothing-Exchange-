<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rewear.bean.ItemBean" %>
<%
    String userName = (String) session.getAttribute("userName");
    List<ItemBean> items = (List<ItemBean>) request.getAttribute("availableItems");
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <jsp:include page="../common/Link.jsp" />
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        .search-bar {
            text-align: center;
            margin: 20px;
        }

        .search-bar input[type="text"] {
            width: 60%;
            padding: 12px 20px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .brand-banner {
            text-align: center;
        }

        .brand-banner img {
            width: 95%;
            max-height: 300px;
            border-radius: 12px;
            object-fit: cover;
        }

        .category-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            padding: 40px 10%;
        }

        .category-item {
            position: relative;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
        }

        .category-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            filter: brightness(60%) blur(1px);
        }

        .category-item span {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 22px;
            font-weight: bold;
            color: #fff;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.6);
        }

        .item-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 30px 20px;
        }

        .item-card {
            width: 240px;
            background: #fff;
            border-radius: 10px;
            margin: 15px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
        }

        .item-card:hover {
            transform: translateY(-5px);
        }

        .item-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 6px;
        }

        .item-card h4 {
            margin: 12px 0 6px;
            font-size: 18px;
        }

        .item-card p {
            font-size: 14px;
            color: #666;
            margin: 5px 0 10px;
        }

        .item-card a {
            padding: 8px 14px;
            background-color: #009879;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }

        .no-items {
            text-align: center;
            padding: 40px;
            color: #999;
        }
    </style>
</head>
<body>

<jsp:include page="../common/nav.jsp" />

<div class="search-bar">
    <input type="text" placeholder="Search items..." />
</div>

<div class="brand-banner">
    <img src="${pageContext.request.contextPath}/assets/brand/banner.png" alt="Banner">
</div>

<div class="category-grid">
    <div class="category-item">
        <img src="${pageContext.request.contextPath}/assets/brand/Tops.jpg" alt="Tops" />
        <span>Tops</span>
    </div>
    <div class="category-item">
        <img src="${pageContext.request.contextPath}/assets/brand/Bottoms.jpg" alt="Bottoms" />
        <span>Bottoms</span>
    </div>
    <div class="category-item">
        <img src="${pageContext.request.contextPath}/assets/brand/Dresses.jpg" alt="Dresses" />
        <span>Dresses</span>
    </div>
    <div class="category-item">
        <img src="${pageContext.request.contextPath}/assets/brand/Outerwear.jpg" alt="Outerwear" />
        <span>Outerwear</span>
    </div>
    <div class="category-item">
        <img src="${pageContext.request.contextPath}/assets/brand/Accessories.png" alt="Accessories" />
        <span>Accessories</span>
    </div>
    <div class="category-item">
        <img src="${pageContext.request.contextPath}/assets/brand/Other.jpg" alt="Other" />
        <span>Other</span>
    </div>
</div>

<div class="item-list">
    <% if (items != null && !items.isEmpty()) {
        for (ItemBean item : items) { %>
            <div class="item-card">
                <img src="<%= request.getContextPath() + "/uploads/" + item.getImage() %>" alt="Item" />
                <h4><%= item.getName() %></h4>
                <p><%= item.getCategory() %> | <%= item.getCondition() %></p>
                <a href="/swap/request?id=<%= item.getId() %>">Swap</a>
            </div>
    <%  }
    } else { %>
        <div class="no-items">
            <p>🚫 No items available for swap at the moment.</p>
        </div>
    <% } %>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
