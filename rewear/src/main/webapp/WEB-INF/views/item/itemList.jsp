<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rewear.bean.ItemBean" %>

<html>
<head>
    <title>My Uploaded Items</title>
    <style>
        table {
            width: 90%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
        }
        img {
            width: 80px;
            height: auto;
        }
        .center {
            text-align: center;
        }
    </style>
</head>
<body>

<h2 class="center">My Uploaded Items</h2>

<%
    List<ItemBean> items = (List<ItemBean>) request.getAttribute("items");
    if (items == null || items.isEmpty()) {
%>
    <p class="center">No items found.</p>
<%
    } else {
%>
    <table align="center">
        <thead>
        <tr>
            <th>Image</th>
            <th>Name</th>
            <th>Description</th>
            <th>Category</th>
            <th>Size</th>
            <th>Condition</th>
            <th>Created</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
<%
        for (ItemBean item : items) {
%>
        <tr>
            <td>
                <img src="<%= request.getContextPath() + "/uploads/" + item.getImage() %>" alt="Item Image" />
            </td>
            <td><%= item.getName() %></td>
            <td><%= item.getDescription() %></td>
            <td><%= item.getCategory() %></td>
            <td><%= item.getSize() %></td>
            <td><%= item.getCondition() %></td>
            <td><%= item.getCreatedAt() %></td>
            <td>
                <a href="/item/edit?id=<%= item.getId() %>">Edit</a> |
                <a href="/item/delete?id=<%= item.getId() %>" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
<%
        }
%>
        </tbody>
    </table>
<%
    }
%>

<div class="center">
    <a href="/item/add">➕ Add New Item</a>
</div>

</body>
</html>
