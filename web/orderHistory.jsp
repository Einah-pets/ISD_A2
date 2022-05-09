<%-- 
    Document   : orderHistory
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
        <title>order History Page</title>
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
                                <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                            </li>
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
                            <li class="nav-item">
                                <a class="nav-link" href="logout.jsp">Logout</a>
                            </li>   
                            <li class="nav-item">
                                <a class="nav-link" href="cart.jsp">Cart</a>
                            </li>
                            <%
                                if (session.getAttribute("user") != null) {
                            %>
                            <li class="nav-item">
                                <form action="orderHistoryController" method="POST">
                                    <input type="submit" class="btn btn-light" value="Order History">
                                </form>
                            </li>  
                            <%}%>
                        </ul>          
                    </div>
                </div>
            </nav>

            <div class="container">
                <table class="table">
                    <thead class="table-light">
                    <th>Order ID</th>
                    <th>Order Status</th>
                    <th>Date of Order</th>
                    <th>Delivery ID</th>
                    <th>Products</th>
                    </thead>
                    <%
                        ArrayList <Order> previousOrders = (ArrayList) session.getAttribute("previousOrders");
                        for (int i = 0; i < previousOrders.size(); i++) {
                    %>
                    <tr>
                        <td><%=previousOrders.get(i).getOrderID()%></td>
                        <td><%=previousOrders.get(i).getOrderStatus()%></td>
                        <td><%=previousOrders.get(i).getDateOfOrder()%></td>
                        <td><%=previousOrders.get(i).getDeliveryID()%></td>
                        <td>
                            <form action="OrderLineController" method="POST">
                                <input type="hidden" name="orderID" value="<%=previousOrders.get(i).getOrderID()%>"
                                <input type="submit" name="acttion" value="See all products">
                            </form>
                        </td>
                    </tr>    
                    <%}%>
                </table>
            </div>



        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>