<%-- 
    Document   : user-account
    Created on : Dec 10, 2023, 2:24:53?PM
    Author     : pulin
--%>

<%@page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>
<%@ page import="customer.Customer" %>
<%@ page import="java.io.PrintWriter" %><%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="customer.UserRole" %>
<%@ page import="customer.OrderDetails" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    HttpSession currentSession = request.getSession(false);
    boolean userLoggedIn = currentSession != null && currentSession.getAttribute("userLoggedIn") != null && (boolean) currentSession.getAttribute("userLoggedIn");
    Object userRoleObj = currentSession.getAttribute("userRole");

    // Check if the user is logged in and is a user
    if (!userLoggedIn || userRoleObj == null || (!(userRoleObj instanceof customer.UserRole) && !UserRole.USER.equals(userRoleObj.toString()))) {
        // Redirect to a login page or show an error message

    } else {
        // If the user role is stored as an object, you can cast it to customer.UserRole
        UserRole userRole = (userRoleObj instanceof customer.UserRole) ? (UserRole) userRoleObj : null;
        // Use userRole as needed in your JSP

    }

    if (!userLoggedIn || userRoleObj == null || (!(userRoleObj instanceof customer.UserRole) && !UserRole.ADMIN.equals(userRoleObj.toString()))) {
        // Redirect to a login page or show an error message

    } else {
        // If the user role is stored as an object, you can cast it to customer.UserRole
        UserRole userRole = (userRoleObj instanceof customer.UserRole) ? (UserRole) userRoleObj : null;
        // Use userRole as needed in your JSP
        response.sendRedirect("admin.jsp");
    }

    List<Customer> cusDetails = (List<Customer>) currentSession.getAttribute("cusDetails");
%>



<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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


        <c:forEach var="cus" items="${cusDetails}">
            <c:catch var="exception">


                <!--Navbar section start-->

                <jsp:include page="HeaderFooter/navbar.jsp" />

                <!--Navbar section end-->





                <section class="h-100" style="background-color: #fcfcfc; ">
                    <div class="container h-100 py-5">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-12">

                                <div class="d-flex justify-content-between align-items-center mb-4">


                                </div>
                                <div class="row">


                                    <div class="col-md-4">
                                        <div id="login-card" class="card p-4 pt-5 ">

                                            <div class="d-flex justify-content-between ">

                                                <h3 class="mb-1 fw-bold"> <span style="font-size: 19px">Welcome !</span><br> <c:out value="${cus.first_name}" /> <c:out value="${cus.last_name}" /> </h3>

                                            </div>
                                            
                                            <div class="d-flex justify-content-between">
                                                <p class="mb-2">Email : <c:out value="${cus.email}" /> </p>
                                            </div>

                                            <div class="d-flex justify-content-between">
                                                <p class="mb-2">Address : <c:out value="${cus.address}" /> </p>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <p class="mb-2">Phone : <c:out value="${cus.phone}" /> </p>
                                            </div>
                                            
                                            <p class=" mb-5 pb-lg-2"><a style="opacity: 0.75" href="edit-profile.jsp">Edit Profile</a></p>

                                            <div class="">
                                                <div class="d-grid gap-2">
                                                    <a href="LogoutServlet" class="btn btn-primary  py-3  mt-2 ">Logout</a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-md-8">
                                        
                                        <h5 class="px-3 py-2 pt-5 " style="color: var(--c-secondary);">Order History</h5>

                                        <form id="refreshForm" action="RefreshOrderDetailsServlet" method="post" onsubmit="setRefPage()" >

                                            <input type="hidden" name="refPage" id="refPage" value="">
                                            <div style="text-align:right">
                                            <input class="btn-sm btn-secondary btn " type="submit" value=" Refresh Order History ">
                                            </div>

                                        </form>

                                        <c:if test="${not empty orderDetails}">
                                            <c:forEach var="orderDetail" items="${orderDetails}"> 


                                                <div id="cart-card" class="card mb-4 ">
                                                    <div class="card-body ">
                                                        <div class="row d-flex justify-content-between align-items-center">
                                                            <div class="col-2 col-lg-2 col-xl-2 cart-left">
                                                                <img class="card-img-top"
                                                                     src="${orderDetail.productImage}"
                                                                     class="img-fluid " alt="Cotton T-shirt">
                                                            </div>
                                                            <div class="col-10 cart-right">
                                                                <div class="row">

                                                                    <div class="col-md-3 ">

                                                                        <p id="title-cart" class=" card-title pt-2"> ${orderDetail.productName}
                                                                        </p>
                                                                        <p style="font-size: 12px"> Product ID : ${orderDetail.productId} </p>

                                                                    </div>
                                                                    <div class="col-md-3 ">
                                                                        <p class="p-text mb-0 text-center pt-3"><span style="font-size: 12px">Quantity</span><br>Rs ${orderDetail.productPrice} X ${orderDetail.orderQnt}</p>
                                                                        
                                                                    </div>
                                                                    <div class="col-md-3 ">
                                                                        <p class="p-text mb-0 text-center pt-3 fw-bold"><span style="font-size: 12px">Total</span><br><mark>Rs ${orderDetail.orderTotal}</mark></p>
                                                                    </div>
                                                                    <div class="col-md-3" style="margin-bottom: -15px">
                                                                        <p style="font-size: 12px"><span style="font-size: 12px">Order ID</span> : ${orderDetail.orderId}</p>
                                                                        <p style="font-size: 12px"><span style="font-size: 12px">Date</span><br>${orderDetail.orderDate}</p>
                                                                        <p style="font-size: 11px; color: green"><span style="font-size: 12px; color: gray">Payment : </span >${orderDetail.orderPayment}</p>   
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>










                                            </c:forEach>
                                        </c:if>                            
                                    </div>

                                </div>



                            </div>
                        </div>
                    </div>
                </section>








                <!-- Footer start -->
                <jsp:include page="HeaderFooter/footer.jsp" />
                <!-- Footer -->






                <!--Java script linked-->

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

            </c:catch>   
            <c:if test="${not empty exception}">
                <!-- Log or print the exception -->
                ${exception}
            </c:if>   
        </c:forEach> 

    <script>
        function setRefPage() {
        document.getElementById('refPage').value = window.location.href;
        }
    </script>
</body>
</html>
