<%-- 
    Document   : login
    Created on : Dec 9, 2023, 11:43:35 PM
    Author     : pulin
--%>

<%@page import="java.util.List"%>
<%@page import="customer.Customer"%>
<%@page import="customer.UserRole"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession currentSession = request.getSession(false);
    boolean userLoggedIn = currentSession != null && currentSession.getAttribute("userLoggedIn") != null && (boolean) currentSession.getAttribute("userLoggedIn");
    Object userRoleObj = currentSession.getAttribute("userRole");

    // Check if the user is logged in and is a user
    if (!userLoggedIn || userRoleObj == null || (!(userRoleObj instanceof customer.UserRole) && !UserRole.ADMIN.equals(userRoleObj.toString()))) {
        // Redirect to a login page or show an error message
        
    } else {
        // If the user role is stored as an object, you can cast it to customer.UserRole
        UserRole userRole = (userRoleObj instanceof customer.UserRole) ? (UserRole) userRoleObj : null;
        // Use userRole as needed in your JSP
        response.sendRedirect("admin.jsp");
    }
    
        if (!userLoggedIn || userRoleObj == null || (!(userRoleObj instanceof customer.UserRole) && !UserRole.USER.equals(userRoleObj.toString()))) {
        // Redirect to a login page or show an error message
        
    } else {
        // If the user role is stored as an object, you can cast it to customer.UserRole
        UserRole userRole = (userRoleObj instanceof customer.UserRole) ? (UserRole) userRoleObj : null;
        // Use userRole as needed in your JSP
        response.sendRedirect("user-account.jsp");
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
        <!--Hero section start-->

        <div id="hero" class="col-12 min-vh-100 text-center align-items-center d-flex  back-image py-5 " >
            <div class="container text-center align-item-center px-4 ">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                      <div id="login-card" class="" >
                        <div class="card-body p-5 text-center">
              
                          <div class="mb-md-5 mt-md-4 pb-5">
                              <form action="LoginServlet" method="post" onsubmit="setRefPage()">

                                  <h2 class="fw-bold mb-2 default-title text-white">Login</h2>
                                  <p class="text-white-50 mb-5">Please enter your login and password!</p>

                                  <div class="form-outline form-white mb-4">
                                      <input type="email" name="email" id="typeEmailX" placeholder="Email" class="form-control form-control-lg" />

                                  </div>

                                  <div class="form-outline form-white mb-4">
                                      <input type="password" name="password" placeholder="password" id="typePasswordX" class="form-control form-control-lg" />
                                      <input type="hidden" name="refPage" id="refPage" value="">
                                  </div>
                                  


                                  

                                  <button class="btn  btn-lg btn-primary px-5" type="submit" name="submit">Login</button>

                              </form>
                              
                          </div>
              
                          <div>
                            <p class="mb-0">Don't have an account? <a href="register.jsp" class="text-white-50 fw-bold">Sign Up</a>
                            </p>
                          </div>
              
                        </div>
                      </div>
                    </div>
                  </div>
              
    
    
            </div>
        </div>
    
        <!--Hero section end-->



        
    <!-- Copyright -->
    <div class="backcolor">
        <div class=" text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
        © 2024 Copyright:
        <a class="text-reset fw-bold" href="index.html">Green SupperMarket</a>
        </div>
    </div>    
    <!-- Copyright -->
  </footer>
  <!-- Footer -->

<script>
    function setRefPage() {
        document.getElementById('refPage').value = window.location.href;
    }
</script>


    

     <!--Java script linked-->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
