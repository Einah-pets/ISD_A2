<%-- 
    Document   : catalogue.jsp
    Created on : 05/05/2022, 10:58:31 AM
    Author     : Stephanie
--%>

<%@page import="uts.isd.model.*"%>
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

            <div class="container p-5">
                <div class="row p-4 g-10">
                    <%
                        if (session.getAttribute("prod0Name") != null) {
                    %>
                    <div class="col">
                        <%
                            String prod1Name = (String) session.getAttribute("prod0Name");
                            String prod1Type = (String) session.getAttribute("prod0Type");
                            String prod1Brand = (String) session.getAttribute("prod0Brand");
                            String prod1Price = (String) session.getAttribute("prod0Price");
                        %>
                        <form action="productView.jsp">
                            <p><%= prod1Name%></p>
                            <p><%= prod1Type%></p>
                            <p><%= prod1Brand%></p>
                            <p>$<%= prod1Price%></p>
                            <input type="hidden" name="selectedProd" value="0">
                            <button class="btn btn-primary" type="submit">Select</button>
                        </form>
                    </div>
                    <%
                        }
                        if (session.getAttribute("prod1Name") != null) {
                    %>
                    <div class="col">
                        <%
                            String prod2Name = (String) session.getAttribute("prod1Name");
                            String prod2Type = (String) session.getAttribute("prod1Type");
                            String prod2Brand = (String) session.getAttribute("prod1Brand");
                            String prod2Price = (String) session.getAttribute("prod1Price");
                        %>
                        <form action="productView.jsp">
                            <p><%= prod2Name%></p>
                            <p><%= prod2Type%></p>
                            <p><%= prod2Brand%></p>
                            <p>$<%= prod2Price%></p>
                            <input type="hidden" name="selectedProd" value="1">
                            <button class="btn btn-primary" type="submit">Select</button>
                        </form>
                    </div>
                    <%
                        }
                        if (session.getAttribute("prod2Name") != null) {
                    %>
                    <div class="col">
                        <%
                            String prod3Name = (String) session.getAttribute("prod2Name");
                            String prod3Type = (String) session.getAttribute("prod2Type");
                            String prod3Brand = (String) session.getAttribute("prod2Brand");
                            String prod3Price = (String) session.getAttribute("prod2Price");
                        %>
                        <form action="productView.jsp">
                            <p><%= prod3Name%></p>
                            <p><%= prod3Type%></p>
                            <p><%= prod3Brand%></p>
                            <p>$<%= prod3Price%></p>
                            <input type="hidden" name="selectedProd" value="2">
                            <button class="btn btn-primary" type="submit">Select</button>
                        </form>
                    </div>
                    <%
                        }

                    %>
                </div>

                <div class="row p-4 g-10">
                    <%                        if (session.getAttribute("prod3Name") != null) {
                    %>
                    <div class="col">
                        <%
                            String prod4Name = (String) session.getAttribute("prod3Name");
                            String prod4Type = (String) session.getAttribute("prod3Type");
                            String prod4Brand = (String) session.getAttribute("prod3Brand");
                            String prod4Price = (String) session.getAttribute("prod3Price");
                        %>
                        <form action="productView.jsp">
                            <p><%= prod4Name%></p>
                            <p><%= prod4Type%></p>
                            <p><%= prod4Brand%></p>
                            <p>$<%= prod4Price%></p>
                            <input type="hidden" name="selectedProd" value="3">
                            <button class="btn btn-primary" type="submit">Select</button>
                        </form>
                    </div>
                    <%
                        }
                        if (session.getAttribute("prod4Name") != null) {
                    %>
                    <div class="col">
                        <%
                            String prod5Name = (String) session.getAttribute("prod4Name");
                            String prod5Type = (String) session.getAttribute("prod4Type");
                            String prod5Brand = (String) session.getAttribute("prod4Brand");
                            String prod5Price = (String) session.getAttribute("prod4Price");
                        %>
                        <form action="productView.jsp">
                            <p><%= prod5Name%></p>
                            <p><%= prod5Type%></p>
                            <p><%= prod5Brand%></p>
                            <p>$<%= prod5Price%></p>
                            <input type="hidden" name="selectedProd" value="4">
                            <button class="btn btn-primary" type="submit">Select</button>
                        </form>
                    </div>
                    <%
                        }
                        if (session.getAttribute("prod5Name") != null) {
                    %>
                    <div class="col">
                        <%
                            String prod6Name = (String) session.getAttribute("prod5Name");
                            String prod6Type = (String) session.getAttribute("prod5Type");
                            String prod6Brand = (String) session.getAttribute("prod5Brand");
                            String prod6Price = (String) session.getAttribute("prod5Price");
                        %>
                        <form action="productView.jsp">
                            <p><%= prod6Name%></p>
                            <p><%= prod6Type%></p>
                            <p><%= prod6Brand%></p>
                            <p>$<%= prod6Price%></p>
                            <input type="hidden" name="selectedProd" value="5">
                            <button class="btn btn-primary" type="submit">Select</button>
                        </form>
                    </div>
                    <%}
                    %>
                </div>

                <ul class="nav justify-content-center">
                    <li class="nav-item">
                        <form action="CatalogueController" method="POST">
                            <input type="submit" name="page" value="1">
                        </form>
                    </li>
                    <li class="nav-item">
                        <form action="CatalogueController" method="POST">
                            <input type="submit" name="page" value="2">
                        </form>
                    </li>
                    <li class="nav-item">
                        <form action="CatalogueController" method="POST">
                            <input type="submit" name="page" value="3">
                        </form>
                    </li>
                    <li class="nav-item">
                        <form action="CatalogueController" method="POST">
                            <input type="submit" name="page" value="4">
                        </form>
                    </li>
                </ul>
            </div>


        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>

