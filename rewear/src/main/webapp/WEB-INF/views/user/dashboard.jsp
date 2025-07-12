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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fafafa;
        }

        .search-bar {
            text-align: center;
            margin: 20px;
        }

        .search-bar input[type="text"] {
            width: 60%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        .brand-banner {
            text-align: center;
            margin: 20px 0;
        }

        .brand-banner img {
            max-width: 95%;
            height: auto;
            border-radius: 10px;
        }

        .category-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            padding: 0 10%;
            margin: 40px 0;
        }

        .category-item {
            text-align: center;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .category-item img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .category-item span {
            display: block;
            padding: 10px;
            font-weight: bold;
            background-color: #f8f8f8;
        }

        .item-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }

        .item-card {
            width: 220px;
            background: #fff;
            border: 1px solid #ddd;
            margin: 15px;
            padding: 15px;
            text-align: center;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .item-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 5px;
        }

        .item-card h4 {
            margin: 10px 0 5px;
        }

        .item-card p {
            margin: 5px 0 10px;
            font-size: 14px;
            color: #555;
        }

        .item-card a {
            padding: 8px 12px;
            text-decoration: none;
            background-color: #333;
            color: #fff;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<jsp:include page="/components/navbar.jsp" />

<div class="search-bar">
    <input type="text" placeholder="Search items..." />
</div>

<div class="brand-banner">
    <img src="/images/banner.png" alt="Brand Banner" />
</div>

<div class="category-grid">
    <div class="category-item">
        <img src="https://images.unsplash.com/photo-1602810310591-46ec73d2f3a8" alt="Tops" />
        <span>Tops</span>
    </div>
    <div class="category-item">
        <img src="https://images.unsplash.com/photo-1541099649105-f69ad21f3246" alt="Bottoms" />
        <span>Bottoms</span>
    </div>
    <div class="category-item">
        <img src="https://images.unsplash.com/photo-1611078489935-88c8e06c9c6a" alt="Dresses" />
        <span>Dresses</span>
    </div>
    <div class="category-item">
        <img src="https://images.unsplash.com/photo-1552374196-c4e7ffc6e126" alt="Outerwear" />
        <span>Outerwear</span>
    </div>
    <div class="category-item">
        <img src="https://images.unsplash.com/photo-1600185365529-b8f3e0654e6f" alt="Accessories" />
        <span>Accessories</span>
    </div>
    <div class="category-item">
        <img src="https://images.unsplash.com/photo-1581591524425-4c4e1ec7a6c7" alt="Other" />
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
        <p>No items available for swap at the moment.</p>
    <% } %>
</div>

<jsp:include page="/common/footer.jsp" />

</body>
</html>
