<%@ page import="java.util.List" %>
<%@ page import="customer.Customer" %>
<%@ page import="customer.OrderDetails" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Account</title>
</head>
<body>

<h2>Welcome, ${loggedInUser.first_name} ${loggedInUser.last_name}!</h2>

<h3>Customer Details:</h3>
<ul>
    <li>ID: ${loggedInUser.id}</li>
    <li>Name: ${loggedInUser.first_name} ${loggedInUser.last_name}</li>
    <li>Address: ${loggedInUser.address}</li>
    <li>Phone: ${loggedInUser.phone}</li>
    <li>Email: ${loggedInUser.email}</li>
    <li>User Type: ${loggedInUser.user}</li>
</ul>

<h3>Order Details:</h3>
<c:if test="${not empty orderDetails}">
    <table border="1">
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Order ID</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="orderDetail" items="${orderDetails}">
                <tr>
                    <td>${orderDetail.productId}</td>
                    <td>${orderDetail.orderId}</td>
                    <td>${orderDetail.productName}</td>
                    <td>${orderDetail.customerFname}</td>
                    
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

</body>
</html>
