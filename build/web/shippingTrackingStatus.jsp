<%-- 
    Document   : shippingTrackingStatus
    Created on : 14 May 2022, 1:41:30 pm
    Author     : AlineStamboulian
--%>
<%--
    Through typing their order number, users can find the state of their order.
    After shippingTracking is clicked.
    4 states:
        - Not found
        - Order Recieved
        - In Transit
        - Out for Delivery
--%>

<%@page import="uts.isd.model.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Tracking Order</title>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
        %>
        <div class="container">

            <h1>IoTBay</h1>

           
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <!--Main-->
                            <li class="nav-item">
                                <a class="nav-link" href="main.jsp">Main</a>
                            </li>
                            <!--Catalogue-->
                            <li class="nav-item">
                                <form action="CatalogueController" method="POST">
                                    <input type="hidden" value="1" name="page">
                                    <input type="submit" class="btn btn-light" value="Catalogue">
                                </form>                            
                            </li>
                            <!--Cart-->
                            <li class="nav-item">
                                <a class="nav-link" href="cart.jsp">Cart</a>
                            </li>

                            <!--if logged in-->
                            <% if (user != null) {%>
                            <!--Access log-->
                            <li class="nav-item">
                                <a class="nav-link" href="AccessLogViewServlet">Access Log</a>
                            </li>
                            <!--Order history-->                            
                            <li class="nav-item">
                                <form action="OrderHistoryController" method="POST">
                                    <input type="submit" class="btn btn-light" value="Order History">
                                </form>
                            </li>
                            <%--
                            IF USER IS LOGGED IN, THEY CAN ACCESS TRACKING FEATURE
                            --%>
                            
                            <li class="nav-item">
                                <a class="nav-link" href="shippingTracking.jsp">Track Order</a>
                            </li>
                            
                            <!--Logout-->
                            <li class="nav-item">
                                <a class="nav-link" href="LogoutServlet?userID=<%= user.getUserID()%>">Logout</a>
                            </li>  
                            <%} else {
                            %>
                            <!--Register-->
                            <li class="nav-item">
                                <a class="nav-link" href="register.jsp">Register</a>
                            </li> 
                            <!--Login-->  
                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">Login</a>
                            </li>   
                            <%}%>
                        </ul>          
                    </div>
                </div>
            </nav>       

            <br>
            <h3>Tracking Your Order</h3>
            <br>
            
<%
                             // if user is true in delivery not found = 
                             // css of stage 1: Not found
                             //text below: We couldn't find your order number.
                             
                             // if user is true in deliveryorderrecieved = 
                             // css of stage 2: Order Recieved
                             //text below: Your order has been recieved. 
                             //text below: Expected Date: ......
                             
                             
                             // if user is true in deliveryintransit = 
                             // css of stage 3: In Transit
                             //text below: Your order is currently in transit. 
                             //text below: Expected Date: .....
                             
                             
                             // if user is true in deliveryoutfordel = 
                             // css of stage 4: Out for Delivery
                             //text below: Your order is on its way!
                             //text below: Expected Date: .....

                              
    %>
                        
    </body>
</html>













