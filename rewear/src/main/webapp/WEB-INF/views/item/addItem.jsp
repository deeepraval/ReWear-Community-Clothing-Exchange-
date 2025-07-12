<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.rewear.bean.ItemBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Clothing Item</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background-color: #f5f5f5;
        }

        .form-container {
            background: #fff;
            border-radius: 8px;
            padding: 30px;
            max-width: 600px;
            margin: 40px auto;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-primary {
            width: 100%;
        }
    </style>
</head>
<body>

<jsp:include page="../common/nav.jsp" />

<div class="container">
    <div class="form-container">
        <h2>➕ Add New Clothing Item</h2>

        <form action="/item/add" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label class="form-label">Name:</label>
                <input type="text" name="name" value="${item.name}" class="form-control" required />
            </div>

            <div class="mb-3">
                <label class="form-label">Description:</label>
                <textarea name="description" class="form-control" rows="4" required>${item.description}</textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Category:</label>
                <select name="category" class="form-select" required>
                    <option value="">-- Select Category --</option>
                    <option value="Tops">Tops</option>
                    <option value="Bottoms">Bottoms</option>
                    <option value="Dresses">Dresses</option>
                    <option value="Outerwear">Outerwear</option>
                    <option value="Accessories">Accessories</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Size:</label>
                <select name="size" class="form-select" required>
                    <option value="">-- Select Size --</option>
                    <option value="XS">XS</option>
                    <option value="S">S</option>
                    <option value="M">M</option>
                    <option value="L">L</option>
                    <option value="XL">XL</option>
                    <option value="Free Size">Free Size</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Condition:</label>
                <select name="condition" class="form-select" required>
                    <option value="">-- Select Condition --</option>
                    <option value="New">New</option>
                    <option value="Like New">Like New</option>
                    <option value="Used">Used</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Image (required):</label>
                <input type="file" name="imageFile" class="form-control" required />
            </div>

            <button type="submit" class="btn btn-primary">Submit Item</button>
        </form>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

<!-- Bootstrap JS (Optional if using dropdowns/modal) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
