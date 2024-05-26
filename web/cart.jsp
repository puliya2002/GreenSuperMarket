<%-- 
    Document   : cart
    Created on : Dec 20, 2023, 12:31:22 PM
    Author     : pulin
--%>

<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cart.ShoppingCartUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
    HttpSession currentSession = request.getSession(false);
    boolean userLoggedIn = currentSession != null && currentSession.getAttribute("userLoggedIn") != null && (boolean) currentSession.getAttribute("userLoggedIn");
    Object userRoleObj = currentSession.getAttribute("userRole");
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

    <!-- Include the navbar -->
    <jsp:include page="HeaderFooter/navbar.jsp" />
    <div class="container">
    <div class=" py-5">
        <h3 class="mb-4">Shopping Cart</h3>

        <!-- Retrieve cart items from the session -->
        <c:set var="cart" value="${sessionScope.cart}" />

        <!-- Display cart items -->
        <div class="row">
            <div class="col-md-8">
                
                <c:if test="${not empty cart}">
                    <c:forEach var="cartItem" items="${cart}">
                        <!-- Display cart item details -->
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
                                    <div class="row"> 
                                        
                                        <div class="col-md-4 col align-self-center">
                                        <h5 id="title-cart" class=" card-title pt-2">${cartItem.productName}</h5>
                                        <p style="font-size: 12px"> ID : ${cartItem.p_id} </p>
                                        </div>
                                        
                                        
                                        <div class="col-md-4 d-flex">


                                        <button class="btn px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <form action="updateCartItem" method="post" class="text-center ">
                                            <input type="hidden" name="productName" value="${cartItem.productName}">
                                            <input type="number" name="quantity" value="${cartItem.quantity}" min="1" max="100" id="quantity-${cartItem.productId}" class="form-control form-control-sm text-center" />
                                            <button type="submit" class=" btn btn-light ">Update</button>
                                        </form>
                                        <button class="btn px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                        </div><!-- comment -->
                                        
                                        <div class="col-md-4 col-lg-2 col-xl-2 offset-lg-1">
                                            <p class="p-text mb-0 text-center pt-2">Price: Rs&nbsp;${cartItem.price}</p>

                                                <p id="total-${cartItem.productId}" class="p-text mb-0 text-center pt-3">Total: <b>Rs&nbsp;${cartItem.price * cartItem.quantity}</b></p>

                                        </div><!-- comment -->
                                      
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end pt-3 col align-self-center">
                                            <form action="updateCartItem" method="post" class="text-center ">
                                            <input type="hidden" name="productName" value="${cartItem.productName}">
                                            <input type="hidden" name="quantity" value="1" min="0" max="100" id="quantity-${cartItem.productId}" class="form-control form-control-sm text-center" />
                                            
                                            <button type="submit" style="border: none" href="javascript:void(0);" class="text-danger fas fa-trash fa-lg" data-product="${cartItem.productName}"></button>
                                            </form>
                                        </div>

                                        
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>

            <!-- Display total and proceed to pay button -->
<!-- Display total and proceed to pay button -->
<div class="col-md-4">
    <div class="card" style="width:100%">
        <div class="card-body">
            <h5 class="card-title">Cart Total</h5>
            
            <!-- Iterate over cart items to calculate overall total -->
            <c:if test="${not empty cart}">
                <c:set var="overallTotal" value="0" />
                <c:forEach var="cartItem" items="${cart}">
                    <!-- Calculate total for each item and add to overallTotal -->
                    <c:set var="itemTotal" value="${cartItem.price * cartItem.quantity}" />
                    <c:set var="overallTotal" value="${overallTotal + itemTotal}" />
                </c:forEach>
                
                <!-- Display overall total and other information -->
                <div class="d-flex justify-content-between"> 
                <p class="card-text">Total:</p> 
                <p> Rs ${overallTotal}</p>
                </div>
                
                <div class="d-flex justify-content-between"> 
                <p class="card-text">Shipping:</p> 
                <p> Rs 120.0</p>
                </div>
                
                <div class="d-flex justify-content-between pb-2"> 
                <p class="card-text"><b>Total:</b></p> 
                <p style="font-size: 19px"><b> Rs ${overallTotal + 120.00}</b></p>
                </div>
                

                
                <a href="checkout.jsp" class="btn btn-primary d-flex justify-content-center">Proceed to Pay</a>

            </c:if>
        </div>
    </div>
</div>

        </div>
    </div>
    </div>
    <!-- Include the footer -->
    <div class="pt-5 " >
    <jsp:include page="HeaderFooter/footer.jsp" />
    </div>

    <!-- Add your JS scripts and other body elements here -->
    
<script>
function removeFromCart(productName) {
        // Log the function call for debugging
        console.log('Removing from cart:', productName);

        // Make an asynchronous request to remove the item
        fetch('removeFromCart?productName=' + encodeURIComponent(productName))
            .then(response => response.json())
            .then(data => {
                // Log the response for debugging
                console.log('Response:', data);

                // Reload the page or update the UI as needed
                location.reload();
            })
            .catch(error => console.error('Error:', error));
    }

    // Add an event listener to the trash icon to call the removeFromCart function
    document.addEventListener('DOMContentLoaded', function () {
        const trashIcons = document.querySelectorAll('.fas.fa-trash');
        trashIcons.forEach(icon => {
            icon.addEventListener('click', function () {
                // Get the product name from the data-product attribute
                const productName = this.getAttribute('data-product');

                // Call removeFromCart function
                removeFromCart(productName);
            });
        });
    });
    
    

    // Add an event listener to the quantity input fields
    document.addEventListener('DOMContentLoaded', function () {
        const quantityInputs = document.querySelectorAll('input[name="quantity"]');
        quantityInputs.forEach(input => {
            input.addEventListener('change', function () {
                // Get the product ID from the input field
                const productId = this.id.split('-')[1];

                // Get the updated quantity value
                const newQuantity = this.value;

                // Make an asynchronous request to update the total
                fetch('updateCartItem?productName=' + productId + '&quantity=' + newQuantity)
                    .then(response => response.json())
                    .then(data => {
                        // Update the total displayed on the page
                        const totalElement = document.getElementById('total-' + productId);
                        totalElement.textContent = 'Total: Rs ' + data.total;
                    })
                    .catch(error => console.error('Error:', error));
            });
        });
    });
</script>


</body>

</html>
