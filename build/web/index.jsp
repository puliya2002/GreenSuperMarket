<%-- 
    Document   : index
    Created on : Dec 9, 2023, 11:43:13 PM
    Author     : pulin
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="customer.DBConnect" %>
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
        <div class="container text-center align-item-center px-4 ">
            <div class="row">
                <div class="col-md-6">
                    <div class="col-12">
                        <div>
                            <h1 class=" herotext py-3"><span id="hero1">Freshest</span> Online Grocery Store</h1>
                            <h2 class="herotext2 pb-4">Your Green Supermarket for a Sustainable Tomorrow! </h2>
                        </div>
                        <div class="hero-btn">
                            <a class="btn btn-primary me-2 px-5 py-3 border-0" href="products.jsp">Order Now</a>
                            <a class="btn btn-light ms-2 px-5 py-3 border" href="contactus.html">Contact US</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <img src="img/Content/hero-image.png" class="hero-image">

                </div>
            </div>


        </div>
    </div>

    <!--Hero section end-->

    <!--Featured section start-->
    <div class="container px-4  "> 
    <h1 class="default-title">Featured Products</h1><br> 
    <div class="row px-lg-5 mx-lg-2 " >
<%
    // Retrieve product information from the database
    try {
        Connection connection = DBConnect.getConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM product WHERE featured = 'yes'");
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            int P_id = resultSet.getInt("p_id");
            String productName = resultSet.getString("name");
            double productPrice = resultSet.getDouble("price");
            String imagePath = resultSet.getString("image");
%>
                    <div class="col-lg-3 col-md-4 col-6 mb-3 ">
                        <div class="card text-center mx-0" style="width:100%; ">
                            <img src="<%= imagePath %>" height="200px" width="auto" class="card-img-top img-fluid" alt="...">
                            <div class="card-body">
                                <h5 class="card-title" style="font-size:16px; "><%= productName %></h5>
                                <p class="card-text">Rs <%= productPrice %> </p>
                            <form action="addToCart" method="post">
                                <input type="hidden" name="productID" value="<%= P_id%>">
                                <input type="hidden" name="productName" value="<%= productName%>">
                                <input type="hidden" name="imagePath" value="<%= imagePath%>">
                                <input type="hidden" name="productPrice" value="<%= productPrice%>">
                                <button type="submit" class="btn btn-primary btn-cart px-4">
                                    <img class="card-cart" src="img/Content/cart2.png">&nbsp;Add to Cart
                                </button>
                            </form>
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
    <!--Featured section end-->

    <!--Category start-->
    <div class=" section-padding pb-3 px-3">
        <div class="container ">
            <h1 class="default-title pb-4">Shop by Category</h1>
            <div class="row">
                <div class="col-md-4">
                    <a href="c-meats.jsp"><img class="ct-img" src="img/category/1.png" ></a>
                </div>
                <div class="col-md-4">
                    <a href="c-fruits.jsp"><img class="ct-img" src="img/category/2.png"></a>
                </div>
                <div class="col-md-4">
                    <a href="c-vegetables.jsp"><img class="ct-img" src="img/category/3.png"></a>
                </div>
            </div>
            <div id="ct-for-mob" class="row pt-4">
                <div class="col-md-4">
                    <a href="c-snacks.jsp"><img class="ct-img" src="img/category/4.png" ></a>
                </div>
                <div class="col-md-4">
                    <a href="c-frozens.jsp"><img class="ct-img" src="img/category/5.png"></a>
                </div>
                <div class="col-md-4">
                    <a href="c-others.jsp"><img class="ct-img" src="img/category/6.png"></a>
                </div>
            </div>
        </div>
    </div>
    <!--Category end-->

    <!--How to Order Section start-->
    
    <div class=" section-padding pb-3">
        <div class="container">
            <div class="row">
                <div class="col-md-6 align-self-center">
                    <div class="text-center">
                        <h1 class="default-title">How to Order?</h1>
                        <p class="p-text px-2">
                            Harvesting Goodness, Nurturing Nature: Your Green Supermarket for a Sustainable Tomorrow!
                        </p>
                    </div>
    
                </div>
                <div class="col-md-6  ">
    
                    <div class=" p-3  ">
    
                        <div class="row ">
                            <div class="col-1">
                                <h5 class=""
                                    style="font-size: 25px; background-color: var(--c-primary);color:aliceblue; border-radius: 50px; width: 30px; height: 30px; text-align: center;">
                                    1</h5>
                            </div>
                            <div class="col-11">
                                <p class="p-text" style="font-weight: 600; margin-bottom: -5px; text-align: left;">Register
                                    & Explore:</p>
                                <p class="p-text" >Create an account effortlessly—it's a simple process! Explore our diverse grocery selection packed with fresh produce and pantry essentials.</p>
                            </div>
                        </div>
                    </div>
    
                    <div class=" p-3  ">
    
                        <div class="row ">
                            <div class="col-1">
                                <h5 class=""
                                    style="font-size: 25px; background-color: var(--c-primary);color:aliceblue; border-radius: 50px; width: 30px; height: 30px; text-align: center;">
                                    2</h5>
                            </div>
                            <div class="col-11">
                                <p class="p-text" style="font-weight: 600; margin-bottom: -5px; text-align: left;">Order &
                                    Enjoy:</p>
                                <p class="p-text">Login, make your selections, and unwind. We'll promptly deliver your grocery necessities to your doorstep within 2 days.
                                </p>
                            </div>
                        </div>
                    </div>
    
    
                    <div class=" p-3  ">
    
                        <div class="row ">
                            <div class="col-1">
                                <h5 class=""
                                    style="font-size: 25px; background-color: var(--c-primary);color:aliceblue; border-radius: 50px; width: 30px; height: 30px; text-align: center;">
                                    3</h5>
                            </div>
                            <div class="col-11">
                                <p class="p-text" style="font-weight: 600; margin-bottom: -5px; text-align: left;">Pay with
                                    Pleasure:</p>
                                <p class="p-text" >After receiving your order, pay at your doorstep with cash or choose the card payment option at the checkout to savor every grocery item.</p>
                            </div>
                        </div>
                    </div>
    
    
                </div>
    
            </div>
    
        </div>
    
    </div>
    
    <!--How to Order Section end -->



    
    <!--Our happy costomer start-->

    <div class="section-padding" style="background-color: var(--c-background);">

        <h1 class="default-title">Customer Testimonials</h1>
        <br>

        <div class="container ">


            <div id="carouselExampleControls" class="carousel slide " data-bs-ride="carousel">
                <div class="carousel-inner ">


                    <div class="carousel-item active ">
                        <div id="ts" class="card text-center card-padding">
                            <div class="row">
                                <div class=" col-3 ">
                    
                                </div>
                                <div class=" col-6 text-center">
                                    <img id="profile-pic" src="img/Content/mahinda.png" class="card-img-top" alt="...">
                                </div>
                                <div class=" col-3 text">
                    
                                </div>
                            </div>
                            <div class="card-body">
                                <h5 class="ts-title">Mahinda Rajapaksha</h5>
                                <p class="ts-job">Former Prasident</p>
                                <p class="ts-text"> <i>"I'm thrilled with the convenience this grocery store offers! The registration was a
                                        breeze, the delivery was super quick, and being able to pay with my card at checkout made the entire
                                        process seamless. I've found my go-to grocery service!"</i></p>
                                <img id="star" src="img/Content/stars.png" class="" alt="...">
                            </div>
                        </div>
                    </div>

                    <div class="carousel-item ">
                        <div id="ts" class="card text-center card-padding">
                            <div class="row">
                                <div class=" col-3 ">
                    
                                </div>
                                <div class=" col-6 text-center">
                                    <img id="profile-pic" src="img/Content/piumi.png" class="card-img-top" alt="...">
                                </div>
                                <div class=" col-3 text">
                    
                                </div>
                            </div>
                            <div class="card-body">
                                <h5 class="ts-title">Piumi Hansamali</h5>
                                <p class="ts-job">Actress</p>
                                <p class="ts-text"> <i>"Ordering groceries has never been this easy. The user-friendly registration made me feel at ease, and the swift 5-hour delivery exceeded my expectations. Paying with my card online was a breeze. Cash on delivery is a great option for those who prefer it. Overall, a solid grocery shopping experience!"</i></p>
                                <img id="star" src="img/Content/stars.png" class="" alt="...">
                            </div>
                        </div>
                    </div>

                    <div class="carousel-item ">
                        <div id="ts" class="card text-center card-padding">
                            <div class="row">
                                <div class=" col-3 ">
                    
                                </div>
                                <div class=" col-6 text-center">
                                    <img id="profile-pic" src="img/Content/pic.png" class="card-img-top" alt="...">
                                </div>
                                <div class=" col-3 text">
                    
                                </div>
                            </div>
                            <div class="card-body">
                                <h5 class="ts-title">Nilantha Karunarathna</h5>
                                <p class="ts-job">Bank Manager</p>
                                <p class="ts-text"> <i>"I love the simplicity of this Supper market process. Registering took no time at all, and the variety of products available is impressive. The 5-hour delivery window is a game-changer for my busy schedule. Plus, having the flexibility to pay with cash upon delivery or using my card online gives me the best of both worlds. Highly recommend!"</i></p>
                                <img id="star" src="img/Content/stars.png" class="" alt="...">
                            </div>
                        </div>
                    </div>
                    
                    


                    

                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

        </div>

    </div>

    <!--Our happy costomer end-->



<!-- Include the footer -->    
<jsp:include page="HeaderFooter/footer.jsp" />




    

     <!--Java script linked-->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>