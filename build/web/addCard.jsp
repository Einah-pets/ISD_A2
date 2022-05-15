<%-- 
    Document   : addCard
    Author     : Wisam
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
        <title>Payment Details</title>
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
                            
                            <li class="nav-item">
                                <a class="nav-link" href="main.jsp">Main</a>
                            </li>  
                            </li>
                            <li class="nav-item">
                                <form action="CatalogueController" method="POST">
                                    <input type="hidden" value="1" name="page">
                                    <input type="submit" class="btn btn-light" value="Catalogue">
                                </form>
                            </li>  
                            <%
                                if (session.getAttribute("user") != null) {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="logout.jsp">Logout</a>
                            </li>  
                            <%} else {%>
                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">Login</a>
                            </li>   
                            <%}%>
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
                            <%}%>
                        </ul>          
                    </div>
                </div>
            </nav>
                        
                        <form action="confirmpayment.jsp" method="POST">
                            <br>
                            <table>
                                <tr><td>Owner: </td><td><input type="text" name = "nameOnCard" required></td></tr>
                                <tr><td>Card Number: </td><td><input type="number" name = "creditCardNo" required></td></tr>
                                <tr><td>Expiration Date: </td><td><input type="date" name = "expirationDate" required></td></tr>
                                <tr><td>CVV: </td><td><input type="number" name = "cvv" required></td></tr>
                            </table>
                            <br>
                            <div>
                                <a href="cart.jsp">Cancel</a>
                                <input type="submit" class="btn btn-primary" value="Pay">
                            </div>
                        </form>
                        
        </div>
    </body>
</html>
