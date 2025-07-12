<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.rewear.bean.ItemBean" %>
<%
    ItemBean item = (ItemBean) request.getAttribute("item");
%>
<html>
<head>
    <title>Edit Item</title>
    <style>
        label {
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<h2>Edit Clothing Item</h2>

<form action="/item/edit" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<%= item.getId() %>" />

    <label>Name:</label>
    <input type="text" name="name" value="<%= item.getName() %>" required />

    <label>Description:</label>
    <textarea name="description" rows="4" cols="50" required><%= item.getDescription() %></textarea>

    <label>Category:</label>
    <select name="category" required>
        <%
            String[] categories = {"Tops", "Bottoms", "Dresses", "Outerwear", "Accessories", "Other"};
            for (String cat : categories) {
                String selected = cat.equals(item.getCategory()) ? "selected" : "";
        %>
        <option value="<%= cat %>" <%= selected %>><%= cat %></option>
        <% } %>
    </select>

    <label>Size:</label>
    <select name="size" required>
        <%
            String[] sizes = {"XS", "S", "M", "L", "XL", "Free Size"};
            for (String size : sizes) {
                String selected = size.equals(item.getSize()) ? "selected" : "";
        %>
        <option value="<%= size %>" <%= selected %>><%= size %></option>
        <% } %>
    </select>

    <label>Condition:</label>
    <select name="condition" required>
        <%
            String[] conditions = {"New", "Like New", "Used"};
            for (String c : conditions) {
                String selected = c.equals(item.getCondition()) ? "selected" : "";
        %>
        <option value="<%= c %>" <%= selected %>><%= c %></option>
        <% } %>
    </select>

    <label>Current Image:</label><br>
    <img src="<%= request.getContextPath() + "/uploads/" + item.getImage() %>" width="100" /><br><br>

    <label>Replace Image:</label>
    <input type="file" name="imageFile" />

    <br><br>
    <button type="submit">Update Item</button>
</form>

<br>
<a href="/item/list">⬅ Back to My Items</a>
</body>
</html>
