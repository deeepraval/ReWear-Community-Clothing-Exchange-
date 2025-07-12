<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rewear.bean.ItemBean" %>

<html>
<head>
    <title>My Uploaded Items</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
        }
        h2 {
            text-align: center;
            margin-top: 20px;
        }
        table {
            width: 90%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #efefef;
        }
        img {
            width: 80px;
            height: auto;
            border-radius: 4px;
        }
        a {
            text-decoration: none;
            color: #007BFF;
        }
        a:hover {
            text-decoration: underline;
        }
        .center {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            padding: 6px 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            margin: 2px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-delete {
            background-color: #dc3545;
        }
        .btn-delete:hover {
            background-color: #a71d2a;
        }
    </style>
</head>
<body>

<h2>🧾 My Uploaded Items</h2>

<%
    List<ItemBean> items = (List<ItemBean>) request.getAttribute("items");
    if (items == null || items.isEmpty()) {
%>
    <p class="center">No items found.</p>
<%
    } else {
%>
    <table>
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
                    <img src="<%= request.getContextPath() + "/uploads/" + item.getImage() %>" alt="Image" />
                </td>
                <td><%= item.getName() %></td>
                <td><%= item.getDescription() %></td>
                <td><%= item.getCategory() %></td>
                <td><%= item.getSize() %></td>
                <td><%= item.getCondition() %></td>
                <td><%= item.getCreatedAt() %></td>
                <td>
                    <a class="btn" href="<%= request.getContextPath() + "/item/" + item.getId() %>">View</a>
                    <a class="btn" href="<%= request.getContextPath() + "/item/edit?id=" + item.getId() %>">Edit</a>
                    <a class="btn btn-delete" href="<%= request.getContextPath() + "/item/delete?id=" + item.getId() %>" 
                        onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
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
    <a class="btn" href="<%= request.getContextPath() + "/item/add" %>">➕ Add New Item</a>
</div>

</body>
</html>
