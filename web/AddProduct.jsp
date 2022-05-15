<!-- Lara --------------------------------------------------->
<%@page import="uts.isd.model.*"%>
<%@page import="uts.isd.model.Product"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Catalogue Page</title>
    </head>
    <body>
        <%/*
                
                String productName = (String)session.getAttribute("productName");    
                String productType = (String)session.getAttribute("productType");
                String productBrand = (String)session.getAttribute("productBrand");
                String productPrice = (String)session.getAttribute("productPrice");
                String productQuantity = (String)session.getAttribute("productQuantity");
                String productDescription = (String)session.getAttribute("productDescription");
            */    
                
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
                           
                            <li class="nav-item">
                                <a class="nav-link" href="logout.jsp">Add Product</a>
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
                          </ul>
                    </div>
                </div>
            </nav>

            <h1> Add Product to Catalogue</h1>

            <form action="AddProductServlet" method="POST">
<!--               <table>
                  <tr><td>Product Name:</td><td><input type="text" name="productName"  value="${AddPcroduct.productName}"  required="true"></td></tr>
                  <tr><td>Product Type:</td><td><input type="text" name="productType" value="${AddProduct.productType}"required="true"></td></tr>
                  <tr><td>Product Brand:</td><td><input type="text" name="productBrand" value="${AddProduct.productBrand}"required="true"></td></tr>
                  <tr><td>Product Price:</td><td><input type="text" name="productPrice" value="${AddProduct.productPrice}"required="true"></td></tr>
                  <tr><td>Product Quantity:</td><td><input type="text" name="productQuantity" value="${AddProduct.productQuantity}"required="true"></td></tr>
                  <tr><td>Product Description:</td><td><input type="text" name="productDescription" value="${AddProduct.productDescription}"required="true"></td></tr>
              </table> -->
              <table>
                  <tr><td>Product Name:</td><td><input type="text" name="productName"  required="true"></td></tr>
                  <tr><td>Product Type:</td><td><input type="text" name="productType" required="true"></td></tr>
                  <tr><td>Product Brand:</td><td><input type="text" name="productBrand" required="true"></td></tr>
                  <tr><td>Product Price:</td><td><input type="text" name="productPrice" required="true"></td></tr>
                  <tr><td>Product Quantity:</td><td><input type="text" name="productQuantity" required="true"></td></tr>
                  <tr><td>Product Description:</td><td><input type="text" name="productDescription" required="true"></td></tr>
              </table>
              <!-- <button type="submit">Submit</button> -->
               <input type="submit" class="btn btn-primary" value="Submit"> 
              <%// Product product = (Product) session.getAttribute("product"); %>
             <!-- <a href="AddProductServlet?productName='<%//=product.getProductName()%>'&productType='<%//=product.getProductType()%>'&productBrand='<%//=product.getProductBrand()%>'&productPrice='<//%=product.getProductPrice()%>'&productQuantity='<%//=product.getProductQuantity()%>'&productDescription='<%//=product.getProductDescription()%>'" class="btn btn-primary">Edit profile</a>
          -->
             </form>
            



            <% /*
                String productName1 = request.getParameter("productName");
                String productType1 = request.getParameter("productType");
                String productBrand1 = request.getParameter("productBrand");
                String productPrice1 = request.getParameter("productPrice");
                String productQuantity1 = request.getParameter("productQuantity");
                String productDescription1 = request.getParameter("productDescription");
*/ %>
            
            
             <div>
            
        </div>
            </body>
        </html>
