<%-- 
    Document   : confirmpayment
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

            <%
                String nameOnCard = request.getParameter("nameOnCard");
                //session.setAttribute("nameOnCard", nameOnCard);

                //long creditCardNo = request.getParameter("creditCardNo");
                long creditCardNo = Long.parseLong(request.getParameter("creditCardNo"));
                //session.setAttribute("creditCardNo", creditCardNo);

                String expirationDate = request.getParameter("expirationDate");
                //session.setAttribute("expirationDate", expirationDate);

                int cvv = Integer.parseInt(request.getParameter("cvv"));
                //session.setAttribute("cvv", cvv);
            %>

            <br>
            <% Double amount = (Double) session.getAttribute("totalPrice");%>
            <h3>$<%=amount%></h3>
            <h3>Confirm payment?</h3>

            <table class="table">
                <thead class="table-light"><th>Owner</th><th>Card Number</th><th>Expiration Date</th><th>CVV</th></thead>
                <tr><td><%=nameOnCard%></td><td><%=creditCardNo%></td><td><%=expirationDate%></td><td><%=cvv%></td></tr>    
            </table>

            <br>

            <form action="CreditCardController" method="POST">

                <input type="hidden" name="nameOnCard" value="<%=nameOnCard%>">
                <input type="hidden" name="creditCardNo" value="<%=creditCardNo%>">
                <input type="hidden" name="expirationDate" value="<%=expirationDate%>">
                <input type="hidden" name="cvv" value="<%=cvv%>">

                <div>
                    <a href="addCard.jsp">Back</a>
                    <input type="submit" class="btn btn-primary" value="Pay">
                </div>
            </form>

        </div>
    </body>
</html>
