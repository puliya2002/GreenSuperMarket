<%-- 
    Document   : ordersuccess
    Created on : Dec 28, 2023, 2:38:31 AM
    Author     : pulin
--%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="customer.DBConnect" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    </head>
    <body  >




        <div class="container px-4 section-padding vh-100  align-items-center" style="backgorund-color:green; ">
            
            <div class="text-center ">
                <i class="fas fa-check-circle pb-4" style="font-size: 5rem; color: var(--c-primary)"></i>
                <h1 class="default-title">Order Success</h1>
            </div>


            <div class="hero-btn justify-content-center align-middle text-center pt-5">
                <a class="btn btn-light me-2 px-5 py-3 border-0 btn-sm" href="user-account.jsp">My Account</a>

            </div>

        </div>

        <!-- Include the footer -->    


    </body>
</html>
