<%-- 
    Document   : add-products
    Created on : Dec 18, 2023, 11:04:20 PM
    Author     : pulin
--%>

<%@page import="java.util.List"%>
<%@page import="customer.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="customer.UserRole" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    HttpSession currentSession = request.getSession(false);
    boolean userLoggedIn = currentSession != null && currentSession.getAttribute("userLoggedIn") != null && (boolean) currentSession.getAttribute("userLoggedIn");
    Object userRoleObj = currentSession.getAttribute("userRole");

    // Check if the user is logged in and is a user
    if (!userLoggedIn || userRoleObj == null || (!(userRoleObj instanceof customer.UserRole) && !UserRole.ADMIN.equals(userRoleObj.toString()))) {
        // Redirect to a login page or show an error message
        response.sendRedirect("login.jsp");
    } else {
        // If the user role is stored as an object, you can cast it to customer.UserRole
        UserRole userRole = (userRoleObj instanceof customer.UserRole) ? (UserRole) userRoleObj : null;
        // Use userRole as needed in your JSP
        
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
                            <div id="login-card" class=" p-4 pt-5 ">

                                <div class="d-flex justify-content-between ">
                                    <h3 class="mb-1 fw-bold">Admin <c:out value="${cus.first_name}" /> </h3>

                                </div>
                                <div class="d-flex justify-content-between">
                                    <p class="mb-2"><c:out value="${cus.email}" /> </p>
                                    
                                </div>

                                <div class="">
                                    <div class="d-grid gap-2">
                                        <a href="admin.jsp" class="btn btn-white  my-2 py-3 nonselected  mt-2 " width="100%">Orders</a>
                                    </div>
                                </div>
                                <div class="">
                                    <div class="d-grid gap-2">
                                        <a href="add-products.jsp" class="btn btn-white  py-3  mt-2 " >Add Products</a>
                                    </div>
                                <div class="">
                                    <div class="d-grid gap-2">
                                        <a href="edit-products.jsp" class="btn btn-white nonselected py-3  mt-2 " >Edit/Delete Products</a>
                                    </div>
                                </div>  
                                    
                                </div>
                                <div class="pt-5">
                                    <div class="d-grid gap-2">
                                        <a href="LogoutServlet" class="btn btn-primary  py-3  mt-2 ">Logout</a>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-md-8">
                            <h5 class="px-3 py-2 pt-5 " style="color: var(--c-secondary);">Add Products</h5>

                            <div class="col-12">

                                <div class="card " id="contact-card">
                                  <form action="AdminProductServlet" method="post" enctype="multipart/form-data">  
                                    <p class="text-white-50 mb-5">Please enter your details!</p>
                                    
                                    <div class="form-outline form-white mb-4">
                                        <input type="text" name="name" id="typeEmailX" placeholder="Product Name" class="form-control form-control-lg" />
                                    </div>
                                    
                                    <div class="">
                                        <input type="checkbox" name="featured" value="yes" placeholder="Product Name"   />
                                        Featured Product
                                    </div><br>
                                    
                                    <div class="form-outline form-white mb-4">
                                        <input type="text" name="price" id="numbers" placeholder="Product Price" class="form-control form-control-lg" /> 
                                    </div>
                                    
                                    <div class="form-outline form-white mb-4">
                                        <select class="form-control form-control-lg" name="category" id="cars">
                                            <option value="" disabled selected>Select Category..</option>
                                            <option value="FreshMeats">Fresh Meats</option>
                                            <option value="FreshFruits">Fresh Fruits</option>
                                            <option value="FreshVegetables">Fresh Vegetables</option>
                                            <option value="Snacks">Snacks</option>
                                            <option value="FrozenFoods">Frozen Foods</option>
                                            <option value="OtherGrocery">Other Grocery</option>
                                        </select>
                                    </div>
                                
                                    <div class="form-outline form-white mb-4">
                                        Product Image<br>
                                        <input type="file" name="image" id="myFile" />
                                    </div>
                                
                                    <button class="btn btn-lg btn-primary px-5" type="submit">Submit</button>
                                </form>
                                
                                </div>
        
                            </div>






                            

                            
                            

                           

                            
    
                            
    
                            
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
</body>
</html>
