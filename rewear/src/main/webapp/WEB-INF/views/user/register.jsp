<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .registration-form {
            max-width: 400px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
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
    <div class="registration-form">
        <img src="/images/logo.png" alt="Logo" class="logo">
        <h3 class="text-center mb-4">Register</h3>

        <form action="/register" method="post">
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" name="name" value="${user.name}" class="form-control"/>
                <%
                    if (request.getAttribute("errors") != null) {
                        var errors = (org.springframework.validation.Errors) request.getAttribute("errors");
                        if (errors.getFieldError("name") != null) {
                            out.println("<div class='text-danger small'>" + errors.getFieldError("name").getDefaultMessage() + "</div>");
                        }
                    }
                %>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" value="${user.email}" class="form-control"/>
                <%
                    if (request.getAttribute("errors") != null) {
                        var errors = (org.springframework.validation.Errors) request.getAttribute("errors");
                        if (errors.getFieldError("email") != null) {
                            out.println("<div class='text-danger small'>" + errors.getFieldError("email").getDefaultMessage() + "</div>");
                        }
                    }
                %>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control"/>
                <%
                    if (request.getAttribute("errors") != null) {
                        var errors = (org.springframework.validation.Errors) request.getAttribute("errors");
                        if (errors.getFieldError("password") != null) {
                            out.println("<div class='text-danger small'>" + errors.getFieldError("password").getDefaultMessage() + "</div>");
                        }
                    }
                %>
            </div>

            <div class="mb-3">
                <label class="form-label">Gender</label>
                <select name="gender" class="form-select">
                    <option value="">-- Select Gender --</option>
                    <option value="MALE" <%= "MALE".equals(request.getParameter("gender")) ? "selected" : "" %>>Male</option>
                    <option value="FEMALE" <%= "FEMALE".equals(request.getParameter("gender")) ? "selected" : "" %>>Female</option>
                    <option value="OTHER" <%= "OTHER".equals(request.getParameter("gender")) ? "selected" : "" %>>Other</option>
                </select>
                <%
                    if (request.getAttribute("errors") != null) {
                        var errors = (org.springframework.validation.Errors) request.getAttribute("errors");
                        if (errors.getFieldError("gender") != null) {
                            out.println("<div class='text-danger small'>" + errors.getFieldError("gender").getDefaultMessage() + "</div>");
                        }
                    }
                %>
            </div>

            <div class="d-grid mt-4">
                <button type="submit" class="btn btn-primary">Register</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>