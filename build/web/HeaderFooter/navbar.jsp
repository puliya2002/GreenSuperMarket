<%-- 
    Document   : navbar
    Created on : Dec 13, 2023, 4:08:19 AM
    Author     : pulin
--%>

<%@page import="cart.ShoppingCartUtil"%>
<%@page import="cart.CartItem"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
    HttpSession currentSession = request.getSession(false);
    boolean userLoggedIn = currentSession != null && currentSession.getAttribute("userLoggedIn") != null && (boolean) currentSession.getAttribute("userLoggedIn");
    Object userRoleObj = currentSession.getAttribute("userRole");
%>
<%
    // Retrieve the entire cart from the session
    List<CartItem> cart = ShoppingCartUtil.getCartFromSession(session);


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Green Supper</title>
        <link rel="icon" href="img/logo/icon.png">
        <link rel="stylesheet" href="css/style.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!--Bostrap Linked-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!--Icon Linked-->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>
    <body>
        <!--Navbar section start-->

        <div class="backcolor ">
            <nav class="px-2 navbar navbar-expand-lg navbar-light  ">
                <div class="container">
                    <a class="navbar-brand " href="index.jsp"><img class="nav-brand-logo" src="img/logo/Logodark.png" ></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse " id="navbarNavDropdown">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="products.jsp">Products</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="aboutus.jsp">About Us</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contactus.jsp">Contact Us</a>
                            </li>

                            <li class="nav-item" id="btn-nav">

                                <% if (!userLoggedIn) { %>
                                <a class="btn btn-primary btn-nav mx-2 px-5 py-2  border-0" href="login.jsp">Login/register</a>
                                <% } %>

                                <% if (userLoggedIn) { %>
                            <c:forEach var="cus" items="${cusDetails}">
                                <c:catch var="exception">
                                    <a class="btn btn-primary btn-nav mx-2 px-5 py-2  border-0" href="login.jsp"><i class="fas fa-user"></i> &nbsp;<c:out value="${cus.first_name}" /></a>
                                </c:catch>   
                                <c:if test="${not empty exception}">
                                    <!-- Log or print the exception -->
                                    ${exception}
                                </c:if>   
                            </c:forEach>  

                            <% }%>


                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="cart.jsp"><img class="nav-cart" src="img/Content/cart.png" >&nbsp;Cart</a>
                            </li>

                        </ul>
                    </div>


                </div>
            </nav>
        </div>

        <!--Navbar section end-->
    </body>
</html>
