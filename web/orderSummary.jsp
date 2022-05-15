<%-- 
    Document   : orderSummary
    Created on : 09/05/2022, 8:33:15 PM
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
        <title>Order Summary Page</title>
    </head>
    <body>
        <div class="container">

            <h1>IoTBay</h1>

            <%User user = (User) session.getAttribute("user");%>

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <%if (user != null) {%>
                            <!--Home-->
                            <li class="nav-item">
                                <a class="nav-link" href="main.jsp">Main</a>
                            </li>  
                            
                            <%} else {%>
                            <!--Main-->
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Home</a>
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
                            <% }if (user != null) {%>
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

            <div class="container">
                <table class="table">
                    <thead class="table-light">
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Product Type</th>
                    <th>Product Brand</th>
                    <th>Product Price</th>
                    <th>Product Quantity</th>
                    </thead>
                    <%
                        ArrayList<Product> products = (ArrayList) session.getAttribute("productsInPrevOrder");

                        ArrayList quantities = (ArrayList) session.getAttribute("quantities");
                        double total = 0;
                        for (int i = 0; i < products.size(); i++) {
                    %>
                    <tr>
                        <td><%=products.get(i).getProductID()%></td>
                        <td><%=products.get(i).getProductName()%></td>
                        <td><%=products.get(i).getProductType()%></td>
                        <td><%=products.get(i).getProductBrand()%></td>
                        <td>$<%=products.get(i).getProductPrice()%></td>
                        <td><%=(Integer) quantities.get(i)%></td>
                        <%total += products.get(i).getProductPrice() * (Integer) quantities.get(i);%>
                    </tr> 
                    <tr>
                        <td>Total</td>
                        <td>$<%=total%></td>
                    </tr>
                    <%}%>
                </table>
            </div>



        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>