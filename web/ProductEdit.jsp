<%-- 
    Document   : edit
    Created on : 30/03/2022, 11:35:48 AM
    Author     : bluin
--%>

<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
            <title>My Account Page</title>
        </head>
        <body>
            <%
                User user = (User)session.getAttribute("user");
                Product product = (Product)session.getAttribute("product");
             
                String updated = (String)session.getAttribute("updated");
                String updateProductName = (String) session.getAttribute("updateProductName");
                String updateProductType = (String) session.getAttribute("updateProductType");
                String updateProductBrand = (String) session.getAttribute("updateProductBrand");
                String updateProductPrice = (String) session.getAttribute("updateProductPrice");
                String updateProductQuantity = (String) session.getAttribute("updateProductQuantity");
                String updateProductDescription = (String) session.getAttribute("updateProductDescription");
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
                                    <a class="nav-link" href="AccessLogViewServlet?email='<%= user.getEmail()%>'">Access Log</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="LogoutServlet?userID=<%= user.getUserID()%>">Logout</a>
                                </li>  
                            </ul>          
                        </div>
                    </div>
                </nav>       

                <div class="container">
                    <div class="row">
                        <div class="col">
                        </div>
                        <br>
                        <div class="col">
                            <h3>Edit your information:</h3>
                            <%=(updated != null ? updated : "")%>
                            <%=(updateProductName != null ? updateProductName : "")%>
                            <%=(updateProductType != null ? updateProductType : "")%>
                            <%=(updateProductBrand != null ? updateProductBrand : "")%>
                            <%=(updateProductPrice != null ? updateProductPrice : "")%>
                            <%=(updateProductQuantity != null ? updateProductQuantity : "")%>
                            <%=(updateProductDescription != null ? updateProductDescription : "")%>
                            
                                                    
                            
                            <form action="AddProductServlet" method="post">
                                <br>
                                <table>
                                    <tr><td>Product Name:</td><td><input type="text" name="productName" value="${product.productName}" required="true" readonly="readonly"></td></tr>
                                    <tr><td>Product Type:</td><td><input type="text" name="productType" value="${product.productType}" required="true"></td></tr>
                                    <tr><td>Product Brand:</td><td><input type="text" name="productBrand" value="${product.productBrand}" required="true"></td></tr>
                                    <tr><td>Product Price:</td><td><input type="text" name="productPrice" value="${product.productPrice}" required="true"></td></tr>
                                    <tr><td>Product Quantity</td><td><input type="text" name="productQuantity" value="${product.productQuantity}" required="true"></td></tr>
                                    <tr><td>Product Description</td><td><input type="text" name="productDescription" value="${product.productDescription}" required="true"></td></tr>
                                </table>
                                <br>
                                <div>
                                    <a href="main.jsp">Cancel</a>
                                    <input type="submit" class="btn btn-primary" value="Update">
                                    <input type="submit"  style = "text-align: right" class="btn btn-primary" value="Delete">
                                </div>
                               
                            </form>
                        </div>
                        <div class="col">
                        </div>
                    </div>
                </div>
            </div>

        </body>
    </html>
