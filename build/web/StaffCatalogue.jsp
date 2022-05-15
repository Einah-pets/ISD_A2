<%-- 
    Document   : catalogue.jsp
    Created on : 05/05/2022, 10:58:31 AM
    Author     : Stephanie
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.*"%>
<%@page import="java.util.*"%>
<%@page import="uts.isd.model.dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Catalogue Page</title>
    </head>
    <body>
        
        <% DBManager manager = (DBManager) session.getAttribute("manager");
            Product product = (Product) session.getAttribute("product");
            ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("Product");
            String productName = (String) session.getAttribute("productName");
           // products = manager.fetchAllProducts();
           // session.setAttribute("allProducts", products);
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

                            <li class="nav-item">
                                <a class="nav-link" href="main.jsp">Main</a>
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
                        <br>
            <form method="post" action="CatalogueSearchServlet"> 
                <label class="label">Search catalogue by product name: 
                    <input class="input" type="text" placeholder="<%=(productName != null ? productName : "")%>" name="productName" required="true">
                </label>
                <input class="btn btn-secondary btn-sm" type="submit" value="Search">
                <a href="CatalogueViewServlet" class="btn btn-secondary btn-sm">Reset search</a>
            </form> 
                <br>
       
            <br>
            <div class="container">
                <table class="table">
                    <thead class="table-light">
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Product Type</th>
                    <th>Product Brand</th>
                    <th>Product Price</th>
                    <th>Product Quantity</th>
                    <th>Product Description</th>
                    <th></th>
                   
                    </thead>
                    <%
                       for (Product log : products) {
                    %>
                    <tr>
                        <td><%= log.getProductID()%></td>
                        <td><%= log.getProductName()%></td>
                         <td><%= log.getProductType()%></td> 
                        <td><%= log.getProductBrand()%></td>
                        <td><%= log.getProductPrice()%></td>
                        <td><%= log.getProductQuantity()%></td>
                        <td><%= log.getProductDescription()%></td>
                        <td> 
                           
                         <form  action="ProductEdit.jsp" method="POST">
                       
                             <input class="btn btn-outline-primary" type="submit" value="Edit product">
                        </form></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>



        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>

