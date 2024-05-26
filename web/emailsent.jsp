<%-- 
    Document   : emailsent
    Created on : Jan 5, 2024, 1:16:09 AM
    Author     : pulin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
    Document   : ordersuccess
    Created on : Dec 28, 2023, 2:38:31 AM
    Author     : pulin
--%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="customer.DBConnect" %>

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
                <h1 class="default-title">Thank you for contacting us!</h1>
                <h1 style="font-size: 16px" class="default-title">We will Contact You Shortly</h1>
            </div>
            
                        <div class="hero-btn justify-content-center align-middle text-center pt-5">
                            <a class="btn btn-light me-2 px-5 py-3 border-0 btn-sm" style="color: white" href="user-account.jsp">Go Back</a>

            </div>




        </div>

        <!-- Include the footer -->    


    </body>
</html>

