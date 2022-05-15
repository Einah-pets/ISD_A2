<%-- 
    Document   : cart.jsp
    Created on : 04/05/2022, 11:21:41 PM
    Author     : Stephanie
--%>

<%@page import="uts.isd.model.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Cart Page</title>
    </head>
    <body>
        <div class="container">

            <h1>IoTBay</h1>

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                           <%
                                if (session.getAttribute("user") == null) {
                            %>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                            </li>
                            <%} 
                                          else{%>
                            <li class="nav-item">
                                <a class="nav-link" href="main.jsp">Main</a>
                            </li>  
                            <%} %>
                            
                            <li class="nav-item">
                                <form action="CatalogueController" method="POST">
                                    <input type="hidden" value="1" name="page">
                                    <input type="submit" class="btn btn-light" value="Catalogue">
                                </form>
                            </li> 
                            <li class="nav-item">
                                <a class="nav-link" href="cart.jsp">Cart</a>
                            </li>
                            <%
                                if (session.getAttribute("user") != null) {
                            %>
                            
                            <li class="nav-item">
                                <form action="OrderHistoryController" method="POST">
                                    <input type="submit" class="btn btn-light" value="Order History">
                                </form>
                            </li> 
                            <!--
                            IF USER IS LOGGED IN, THEY CAN ACCESS TRACKING FEATURE
                            -->
                            
                            <li class="nav-item">
                                <a class="nav-link" href="shippingTracking.jsp">Track Order</a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link" href="logout.jsp">Logout</a>
                            </li>  
                                                   
                            <%} else {%>
                            <li class="nav-item">
                                <a class="nav-link" href="register.jsp">Register</a>
                            </li> 
                            
                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">Login</a>
                            </li>   
                            <%}%>
                            
                            <%
                                if (session.getAttribute("userType") == "Staff") {
                            %>
                              <li class="nav-item">
                                <a class="nav-link" href="AddProduct.jsp">Add Product</a>
                            </li> 
                            <%}%>
                            
                            
                            
                        </ul>          
                    </div>
                </div>
            </nav>
            <div class="container p-5">
                <%
                    if (session.getAttribute("cart") != null && session.getAttribute("orderlinesInCart") != null) {%>
                <div class="row g-5">
                    <div class="col-3">
                        <h2>Product</h2>
                    </div>
                    <div class="col-3">
                        <h2>Quantity</h2>
                    </div>
                    <div class="col-2">
                        <h2>Unit price</h2>
                    </div>
                    <div class="col-2">
                        <h2>Price</h2>
                    </div>
                    <div class="col-1">
                    </div>
                </div>

                <%
                    Order cart = (Order) session.getAttribute("cart");
                    ArrayList<Product> productsInCart = (ArrayList) session.getAttribute("productsInCart");
                    ArrayList<OrderLine> orderlinesInCart = (ArrayList) session.getAttribute("orderlinesInCart");
                    double totalPrice = 0;
                    for (int i = 0; i < productsInCart.size(); i++) {
                        int prodID = productsInCart.get(i).getProductID();
                        String prodName = productsInCart.get(i).getProductName();       //get name of each product in the order
                        double prodPrice = productsInCart.get(i).getProductPrice();
                        int prodQuantity = orderlinesInCart.get(i).getQuantity();       //get qty of each product in cart
                        totalPrice += prodPrice * prodQuantity;
                %>   
                <div class="row g-5 py-5">

                    <div class="col-3">

                        <p><%=prodName%></p>
                    </div>
                    <div class="col-3">
                        <form class="row row-cols-lg-auto g-3 align-items-center" action="CartController" method="POST">

                            <input type="hidden" name="productID" value="<%=prodID%>">
                            <input type="submit" name="action" class="btn btn-light" value="-"> 

                            <p><%=prodQuantity%></p>
                            <input type="submit" name="action" class="btn btn-light" value="+">
                        </form>
                    </div>
                    <div class="col-2">

                        <p>$<%=prodPrice%></p>
                    </div>
                    <div class="col-2">

                        <p>$<%=prodPrice * prodQuantity%></p>
                    </div>

                    <div class="col">
                        <form action="CartController" method="POST">
                            <input type="hidden" name="productID" value="<%=prodID%>">
                            <input class="btn btn-light" type="submit" name="action" value="X">
                        </form>
                    </div>

                </div >  
                <%}%>
                <div class="row">
                    <div class="col-9"></div>
                    <div class="col-1">
                        <h4>Total:</h4>
                    </div>
                    <div class="col-2">
                        <h4>$<%=totalPrice%></h4>
                    </div>
                </div>
                <%} else {
                %>
                <p class="text-center">Cart is empty</p>
                <%
                    }

                %>

            </div>



        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>

