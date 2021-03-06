<%-- 
    Document   : productView.jsp
    Created on : 05/05/2022, 6:11:30 PM
    Author     : Stephanie
--%>

<%@page import="uts.isd.model.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Product Page</title>
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
                            <%}%>
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

            <div class="container p-5">
                <div class="row">
                    <div class="col">
                        <%
                            String prodName = (String) session.getAttribute("prod" + request.getParameter("selectedProd") + "Name");
                            String prodType = (String) session.getAttribute("prod" + request.getParameter("selectedProd") + "Type");
                            String prodBrand = (String) session.getAttribute("prod" + request.getParameter("selectedProd") + "Brand");
                            String prodPrice = (String) session.getAttribute("prod" + request.getParameter("selectedProd") + "Price");
                            String prodDescription = (String) session.getAttribute("prod" + request.getParameter("selectedProd") + "Description");
                        %>

                        <p><%= prodName%></p>
                        <p><%= prodType%></p>
                        <p><%= prodBrand%></p>
                        <p><%= prodPrice%></p>
                        <p><%= prodDescription%></p>
                        <form action="OrderController" method="POST">

                            <%int p = (Integer) session.getAttribute("page") * 6 - 6 + Integer.parseInt(request.getParameter("selectedProd"));%>
                            <input type="hidden" name="productID" value="<%=p%>">
                            <input class="btn btn-primary" type="submit" value="Add to cart">
                        </form>
                    </div>
                </div>
                <div class="col">
                    <%if (session.getAttribute("productErr") != null) {%>
                    <p class="text-warning"><%=session.getAttribute("productErr")%></p>
                    <%}%>
                </div>

            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
