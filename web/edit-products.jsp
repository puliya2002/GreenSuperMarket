<%-- 
    Document   : edit-products
    Created on : Dec 28, 2023, 8:56:13 PM
    Author     : pulin
--%>

<%@page import="customer.UserRole"%>
<%@page import="customer.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="customer.DBConnect" %>


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
<html>
    <head>
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
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    </head>
    <body>
        <c:forEach var="cus" items="${cusDetails}">
            <c:catch var="exception">

                <!-- Include the navbar -->    
                <jsp:include page="HeaderFooter/navbar.jsp" />

                <section class="" style="background-color: #fcfcfc; ">
                    <div class="container  py-5">
                        <div class="row d-flex justify-content-center align-items-center ">
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
                                                    <a href="add-products.jsp" class="btn btn-white  py-3 nonselected  mt-2 " >Add Products</a>
                                                </div>
                                                <div class="">
                                                    <div class="d-grid gap-2">
                                                        <a href="edit-products.jsp" class="btn btn-white  py-3  mt-2 " >Edit/Delete Products</a>
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
                                        <h5 class="px-3 py-2 pt-5 " style="color: var(--c-secondary);">Edit/delete products</h5>
                                        <%
                                            // Retrieve product information from the database
                                            try {
                                                Connection connection = DBConnect.getConnection();
                                                PreparedStatement statement = connection.prepareStatement("SELECT * FROM product");
                                                ResultSet resultSet = statement.executeQuery();

                                                while (resultSet.next()) {
                                                    int P_id = resultSet.getInt("p_id");
                                                    String productName = resultSet.getString("name");
                                                    double productPrice = resultSet.getDouble("price");
                                                    String imagePath = resultSet.getString("image");
                                        %>
                                        <div class=" ">
                                            <div class="card text-center mx-0" style="width:100%; ">
                                                <div class="row align-items-center">
                                                    <div class="col-2 col-lg-2 col-xl-2 cart-left ">
                                                        <img src="<%= imagePath%>" height="200px" width="auto" class="card-img-top img-fluid" alt="...">
                                                    </div>

                                                    <div class="col-10 cart-right">
                                                        <div class="row align-items-center pe-3">    
                                                            <div class="col-md-3 content-center">

                                                                <h5 class="card-title pt-2" style="font-size:16px; "><%= productName%></h5>
                                                                <p class="card-text">Rs <%= productPrice%> </p>

                                                            </div>

                                                            <div class="col-md-8 content-center">  
                                                            
                                                                <div class="row">    

                                                                <div class="col-6">

                                                                    <form action="UpdateProductServlet" method="post">
                                                                        <input type="hidden" name="productID" value="<%= P_id%>">
                                                                        <input type="text" name="productName" class="form-control " style="height: 2px">
                                                                        <input type="hidden" name="imagePath" value="<%= imagePath%>">
                                                                        <input type="hidden" name="productPrice" value="<%= productPrice%>">
                                                                        <button type="submit" class="btn btn-primary btn-cart px-4">
                                                                            &nbsp;Edit Name
                                                                        </button>
                                                                    </form>
                                                                </div>

                                                                <div class="col-6">

                                                                    <form action="UpdateProductServlet" method="post">
                                                                        <input type="hidden" name="productID" value="<%= P_id%>">
                                                                        <input type="hidden" name="productName" value="<%= productName%>">
                                                                        <input type="hidden" name="imagePath" value="<%= imagePath%>">
                                                                        <input type="text"  name="productPrice" class="form-control " style="height: 2px">
                                                                        <button type="submit" class="btn btn-primary btn-cart px-4">
                                                                            &nbsp;Edit Price
                                                                        </button>
                                                                    </form>
                                                                </div>   
                                                                        
                                                                </div>        
                                                            </div>

                                                            <div class="col-md-1    ">
                                                                <form action="DeleteProductServlet" method="post">
                                                                    <input type="hidden" name="productID" value="<%= P_id%>">
                                                                    <input type="hidden" name="productName" value="<%= productName%>">
                                                                    <input type="hidden" name="imagePath" value="<%= imagePath%>">
                                                                    <input type="hidden" name="productPrice" value="<%= productPrice%>">
                                                                    <button type="submit" class="text-danger fas fa-trash fa-lg" style="border: none; background-color: var(--c-primary)">

                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                                }

                                                // Close the database connections
                                                resultSet.close();
                                                statement.close();
                                                connection.close();

                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>




                                    </div>

                                </div>



                            </div>
                        </div>
                    </div>
                </section>






                <!-- Include the footer -->    
                <jsp:include page="HeaderFooter/footer.jsp" />
            </c:catch>   
            <c:if test="${not empty exception}">
                <!-- Log or print the exception -->
                ${exception}
            </c:if>   
        </c:forEach> 

    </body>
</html>





