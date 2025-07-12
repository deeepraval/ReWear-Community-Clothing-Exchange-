<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
	
        .login-form {
            max-width: 400px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .logo {
            display: block;
            margin: 0 auto 20px auto;
            width: 80px;
            height: 80px;
            object-fit: contain;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="login-form">
        <img src="https://cdn-icons-png.flaticon.com/512/194/194931.png" alt="Logo" class="logo">
        <h3 class="text-center mb-4">Login</h3>

        <% String err = (String) request.getAttribute("loginError");
           if (err != null && !err.isEmpty()) { %>
            <div class="alert alert-danger text-center"><%= err %></div>
        <% } %>

        <form method="post" action="/login">
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" required />
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required />
            </div>

            <div class="d-grid mt-4">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
