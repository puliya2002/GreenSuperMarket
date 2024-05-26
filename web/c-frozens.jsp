<%-- 
    Document   : c-frozens
    Created on : Dec 19, 2023, 11:18:43 PM
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
<body>
    
    <!-- Include the navbar -->    
<jsp:include page="HeaderFooter/navbar.jsp" />




<div class="container px-4 section-padding "> 
    <h1 class="default-title">Frozen Foods</h1><br> 
    <div class="row px-lg-5 mx-lg-2 " >
<%
    // Retrieve product information from the database
    try {
        Connection connection = DBConnect.getConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM product WHERE category = 'FrozenFoods'");
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
    
    <!-- Include the footer -->    
<jsp:include page="HeaderFooter/footer.jsp" />
    
</body>
</html>