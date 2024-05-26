<%-- 
    Document   : aboutus
    Created on : Dec 23, 2023, 5:31:59 PM
    Author     : pulin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


    <!--Hero section start-->

    <div id="hero" class="col-12 min-vh-100 text-center align-items-center d-flex">
        <div class="container text-center align-item-center px-4 py-5 ">
            <div class="row ">
                
                <div class="col-md-6 ">
                    <div class="col-12">

                        <div class="card " id="contact-card">

              
                                <h2 class="fw-bold mb-2 default-title text-white">About Us</h2>

                                <p class="p-text">
                                
                                    Welcome to Green Supermarket, your one-stop destination for fresh, sustainable, and community-focused shopping. We
                                    pride ourselves on providing a delightful experience with a commitment to quality and environmental responsibility.
                                    Explore our wide range of locally sourced produce, organic products, and eco-friendly options. At Green Supermarket,
                                    we're not just a store; we're a community dedicated to healthier living and a greener planet. Join us on this
                                    journey and make every purchase a positive choice for yourself and the environment. Thank you for choosing Green
                                    Supermarket.
                                </p>
                                
                                
                        </div>

                    </div>
                </div>
                <div class="col-md-6">
                    <img src="img/Content/contact-img.png" class="hero-image" id="contact-img">

                </div>
            </div>


        </div>
    </div>

    <!--Hero section end-->





        <jsp:include page="HeaderFooter/footer.jsp" />
    

     <!--Java script linked-->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
