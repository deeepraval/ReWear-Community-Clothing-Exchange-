<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rewear.bean.ItemBean" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Uploaded Items</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: #f5f7fa;
            font-family: 'Segoe UI', sans-serif;
        }

        h2 {
            margin-top: 30px;
            text-align: center;
        }

        .table-container {
            margin: 30px auto;
            width: 95%;
        }

        .table {
            background-color: white;
            box-shadow: 0 0 12px rgba(0,0,0,0.08);
            border-radius: 8px;
            overflow: hidden;
        }

        .table th {
            background-color: #f1f1f1;
        }

        .table img {
            width: 75px;
            height: auto;
            border-radius: 4px;
        }

        .btn {
            font-size: 14px;
            padding: 5px 10px;
            border-radius: 6px;
        }

        .btn-view {
            background-color: #0d6efd;
            color: white;
        }

        .btn-edit {
            background-color: #ffc107;
            color: black;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .add-btn {
            display: block;
            width: fit-content;
            margin: 20px auto;
            padding: 10px 16px;
            font-weight: bold;
            border-radius: 6px;
            background-color: #198754;
            color: white;
            text-decoration: none;
        }

        .add-btn:hover {
            background-color: #146c43;
        }
    </style>
</head>
<body>

<jsp:include page="../common/nav.jsp" />

<h2><i class="bi bi-box-seam"></i> My Uploaded Items</h2>

<%
    List<ItemBean> items = (List<ItemBean>) request.getAttribute("items");
%>

<div class="table-container">
<% if (items == null || items.isEmpty()) { %>
    <div class="text-center fs-5 mt-5">No items found.</div>
<% } else { %>
    <table class="table table-bordered text-center align-middle">
        <thead class="table-light">
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
        <% for (ItemBean item : items) { %>
            <tr>
                <td><img src="<%= request.getContextPath() + "/uploads/" + item.getImage() %>" alt="Image" /></td>
                <td><%= item.getName() %></td>
                <td><%= item.getDescription() %></td>
                <td><%= item.getCategory() %></td>
                <td><%= item.getSize() %></td>
                <td><%= item.getCondition() %></td>
                <td><%= item.getCreatedAt() %></td>
                <td>
                    <a class="btn btn-view" href="<%= request.getContextPath() + "/item/" + item.getId() %>">
                        <i class="bi bi-eye"></i>
                    </a>
                    <a class="btn btn-edit" href="<%= request.getContextPath() + "/item/edit?id=" + item.getId() %>">
                        <i class="bi bi-pencil-square"></i>
                    </a>
                    <a class="btn btn-delete" href="<%= request.getContextPath() + "/item/delete?id=" + item.getId() %>"
                       onclick="return confirm('Are you sure you want to delete this item?')">
                        <i class="bi bi-trash3"></i>
                    </a>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
<% } %>
</div>

<a class="add-btn" href="<%= request.getContextPath() + "/item/add" %>"><i class="bi bi-plus-circle"></i> Add New Item</a>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
