<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Clothing Item</title>
</head>
<body>

<h2>Add New Clothing Item</h2>

<form action="/item/add" method="post" enctype="multipart/form-data">
    <label>Name:</label><br>
    <input type="text" name="name" value="${item.name}" required /><br><br>

    <label>Description:</label><br>
    <textarea name="description" rows="4" cols="50" required>${item.description}</textarea><br><br>

    <label>Category:</label><br>
    <select name="category" required>
        <option value="">--Select Category--</option>
        <option value="Tops">Tops</option>
        <option value="Bottoms">Bottoms</option>
        <option value="Dresses">Dresses</option>
        <option value="Outerwear">Outerwear</option>
        <option value="Accessories">Accessories</option>
        <option value="Other">Other</option>
    </select><br><br>

    <label>Size:</label><br>
    <select name="size" required>
        <option value="">--Select Size--</option>
        <option value="XS">XS</option>
        <option value="S">S</option>
        <option value="M">M</option>
        <option value="L">L</option>
        <option value="XL">XL</option>
        <option value="Free Size">Free Size</option>
    </select><br><br>

    <label>Condition:</label><br>
    <select name="condition" required>
        <option value="">--Select Condition--</option>
        <option value="New">New</option>
        <option value="Like New">Like New</option>
        <option value="Used">Used</option>
    </select><br><br>

    <label>Image (required):</label><br>
    <input type="file" name="imageFile" required /><br><br>

    <button type="submit">Add Item</button>
</form>

</body>
</html>
