<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>

    <h2>Login</h2>

    <form method="post" action="/login">
        Email: <input type="email" name="email"><br>
        Password: <input type="password" name="password"><br><br>

        <button type="submit">Login</button>
    </form>

    <% String err = (String) request.getAttribute("loginError");
       if (err != null && !err.isEmpty()) { %>
        <div style="color:red;">
            <%= err %>
        </div>
    <% } %>

</body>
</html>
