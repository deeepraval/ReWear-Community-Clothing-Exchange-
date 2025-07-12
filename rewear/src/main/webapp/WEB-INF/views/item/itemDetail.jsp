<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Item Detail</title></head>
<body>

<h2>Item Detail</h2>

<img src="/uploads/${item.image}" alt="Image" width="200" /><br><br>

<b>Name:</b> ${item.name}<br>
<b>Description:</b> ${item.description}<br>
<b>Category:</b> ${item.category}<br>
<b>Size:</b> ${item.size}<br>
<b>Condition:</b> ${item.condition}<br>
<b>Posted On:</b> ${item.createdAt}<br>

</body>
</html>
