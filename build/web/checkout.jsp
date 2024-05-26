<%-- 
    Document   : checkout.jsp
    Created on : Dec 24, 2023, 10:43:51 AM
    Author     : pulin
--%>
<%@page import="java.util.List"%>
<%@page import="cart.CartItem"%>
<%@ page import="cart.ShoppingCartUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <script src="https://www.paypal.com/sdk/js?client-id=AdlFWrUFTpoWGq2gTrwHHOpM8ooGqAUiJXyz_uEHnk3JckLamnqtrADOA-DxEcJIEdl-JtDC_uxbycAI"></script>

    </head>
    <body>
        <!-- Include the navbar -->
        <jsp:include page="HeaderFooter/navbar.jsp" />


        <div class="container py-5">
            <h3 class="mb-4">CheckOut</h3>
            <div class="row">





                <div class="col-md-6">
                    <%-- Display this div for !userLoggedIn --%>
                    <% if (!userLoggedIn) { %>
                    <div class="card p-4" style="width:100%; height: 200px" >
                        <div class="card-body">
                            <p>You need to log in or sign up to continue. Please log in or create an account to proceed.</p>
                            <a href="checkout-login.jsp" class="btn btn-primary d-flex justify-content-center">Login/register</a>
                        </div>
                    </div>
                    <% } %>


                    <%-- Display this div for userLoggedIn --%>
                    <% if (userLoggedIn) { %>

                    <c:forEach var="cus" items="${cusDetails}">
                        <c:catch var="exception">
                            <div class="card p-3" style="width:100%; " >
                                <div class="card-body ">
                                    <!-- Add content for userLoggedIn div -->

                                    <div class="d-flex justify-content-between ">

                                        <h3 class="mb-1 fw-bold"> <c:out value="${cus.first_name}" /> <c:out value="${cus.last_name}" /> </h3>

                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p class="mb-2">Email : <b><c:out value="${cus.email}" /> </b></p>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p class="mb-2">Shipping address : <b><c:out value="${cus.address}" /></b> </p>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p class="mb-2">Phone Number : <b><c:out value="${cus.phone}" /></b> </p>
                                    </div>

                                    <div class="d-grid gap-2">
                                        <a href="LogoutServlet" class="  py-3  mt-2 " style="opacity:0.75; font-weight: 500 ; color: white">Logout and login with a differnt user</a>
                                    </div>

                                </div>
                            </div>
                        </c:catch>   
                        <c:if test="${not empty exception}">
                            <!-- Log or print the exception -->
                            ${exception}
                        </c:if>   
                    </c:forEach>      

                    <% }%>


                </div>






                <div class="col-md-6">





                    <c:if test="${not empty cart}">

                        <c:forEach var="cartItem" items="${cart}">






                            <div id="cart-card" class="card mb-3">
                                <!-- Display cart item image and other details as needed -->
                                <div class="card-body">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-2 col-lg-2 col-xl-2 cart-left">
                                            <img class="card-img-top"
                                                 src="${cartItem.imagePath}"
                                                 class="img-fluid " alt="Cotton T-shirt">
                                        </div>
                                        <div class="col-10 cart-right">
                                            <div class="row "> 

                                                <div class="col-md-4 col align-self-center">
                                                    <h5 id="title-cart" class=" card-title pt-2">${cartItem.productName}</h5>
                                                    <p style="font-size: 12px"> ID : ${cartItem.p_id} </p>
                                                </div>


                                                <div class="col-md-3 d-flex align-self-center">

                                                    Quantity: <br>
                                                    ${cartItem.price} x ${cartItem.quantity}

                                                </div><!-- comment -->

                                                <div class="col-md-4  offset-lg-1 align-self-center">
                                                    Total:<br> <mark>Rs ${cartItem.price * cartItem.quantity}</mark>

                                                </div><!-- comment -->




                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </c:forEach>

                    </c:if>

                    <div class="px-5 pt-3">
                        <c:if test="${not empty cart}">
                            <c:set var="overallTotal" value="0" />
                            <c:forEach var="cartItem" items="${cart}">
                                <!-- Calculate total for each item and add to overallTotal -->
                                <c:set var="itemTotal" value="${cartItem.price * cartItem.quantity}" />
                                <c:set var="overallTotal" value="${overallTotal + itemTotal}" />
                            </c:forEach>

                            <!-- Display overall total and other information -->
                            <div class="d-flex justify-content-between"> 
                                <p class="card-text">  Sub Total:</p> 
                                <p> Rs ${overallTotal} </p>
                            </div>

                            <div class="d-flex justify-content-between"> 
                                <p class="card-text">  Shipping:</p> 
                                <p> Rs 120.0 </p>
                            </div>

                            <div class="d-flex justify-content-between pb-2"> 
                                <p  class="card-text"><b><mark>Checkout Total:</mark></b></p> 
                                <p style="font-size: 20px"><b> Rs ${overallTotal + 120.00}</b></p>
                            </div>

                        </c:if>

                        <div class="d-grid gap-2">

                            <form action="OrderServlet" method="post" id="orderForm">
                                <!-- Your existing content goes here -->
                                <c:forEach var="cus" items="${cusDetails}">
                                    <c:catch var="exception">
                                        <input type="hidden" name="customerId" value="${cus.id}" />
                                        <input type="hidden" name="customerEmail" value="${cus.email}" />
                                        <input type="hidden" name=overall" value="${overallTotal}" />
                                    </c:catch>   
                                    <c:if test="${not empty exception}">
                                        <!-- Log or print the exception -->
                                        ${exception}
                                    </c:if>   
                                </c:forEach>  

                                <c:forEach var="cartItem" items="${cart}" varStatus="loop">
                                    <input type="hidden" name="productID_${loop.index}" value="${cartItem.p_id}" />
                                    <input type="hidden" name="productName_${loop.index}" value="${cartItem.productName}" />
                                    <input type="hidden" name="quantity_${loop.index}" value="${cartItem.quantity}" />
                                    <input type="hidden" name="price_${loop.index}" value="${cartItem.price}" />
                                    <input type="hidden" name="total_${loop.index}" value="${cartItem.price * cartItem.quantity}" />
                                    <input type="hidden" name="orderDateTime_${loop.index}" id="orderDateTime_${loop.index}" value="" />
                                    <input type="hidden" name="productCount" value="${cart.size()}" />
                                    <!-- Add more hidden fields for each product -->
                                </c:forEach>

                                <input type="hidden" name="paymentStatus" id="paymentStatus" value="" />
                                <div id="paypal-button-container"></div>
                                
                                <div id="messageArea" class="mt-3"></div>

                                <!-- Place the Order button -->
                                <div class="d-grid gap-2">
                                    <span  id="placeOrderButton2"  class="btn btn-primary py-3 mt-2" style="opacity: 0.30; pointer-events: none; ">Payment Pending</span>
                                    <button type="submit" id="placeOrderButton" onclick="setOrderDateTime(); submitForm();" class="btn btn-primary py-3 mt-2">Place the Order</button>
                                </div>
                            </form>

                        </div>

                    </div>

                </div>

            </div>

        </div>


        <jsp:include page="HeaderFooter/footer.jsp" />

        <script>
            function setOrderDateTime() {
                var now = new Date();
                var formattedDateTime = now.toISOString(); // You can format this string as needed

                // Set unique orderDateTime values for each product
                var productCount = ${cart.size()};
                for (var i = 0; i < productCount; i++) {
                    document.getElementById("orderDateTime_" + i).value = formattedDateTime;
                }
            }
        </script>



        <script>
            paypal.Buttons({
                createOrder: function (data, actions) {
                    // This function sets up the details of the transaction
                    return actions.order.create({
                        purchase_units: [{
                                amount: {
                                    value: ${overallTotal + 120.00},
                                }
                            }]
                    });
                },
                onApprove: function (data, actions) {
                    // This function captures the funds from the transaction
                    return actions.order.capture().then(function (details) {
                        // Set payment status in the hidden field
                        document.getElementById('paymentStatus').value = 'SUCCESS';
                        
                        document.getElementById('placeOrderButton').style.display = 'block';
                        document.getElementById('placeOrderButton2').style.display = 'none';

                        document.getElementById('payment').value = 'PayPal';
                        window.location.href = 'OrderServlet';
                    });
                }
                
                
            }).render('#paypal-button-container');
            
            document.getElementById('placeOrderButton').style.display = 'none';
            document.getElementById('placeOrderButton2').style.display = 'block';
            
        </script>



    </body>
</html>
