<%-- 
    Document   : ShippingEnterDetails
    Created on : 14/05/2022, 4:09:40 PM
    Author     : LaraStamboulian
--%>

<%@page import="uts.isd.model.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Enter Shipping Details </title>
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
                  
                        <h2>Shipping Details</h2>
                        <text> Please Enter your Shipping Details for your order.</text>
                        <br> </br>
                        
            <form action="ShippingEntering" method="POST">
              
              <table style="width:50%">
                  
                  
                  <tr><td>Street Number:</td><td><input type="integer" name="Delstreetnum" required="true"></td></tr>
                  <tr><td>Street Name:</td><td><input type="string" name="Delstreetname" required="true"></td></tr>
                  <tr><td>City:</td><td><input type="string" name="Delcity" required="true"></td></tr>
                  <tr><td>State:</td><td><input type="String" name="Delstate" required="true"></td></tr>
                  <tr><td>Country:</td><td><input type="String" name="Delcountry" required="true"></td></tr>
                  <tr><td> Delivery Status 
                      <th><select size="1" id="DelStatus" name="DelStatus" required="true">
                           
                              <option value="Standard">Standard</option>
                               <option value="Express">Express</option>
                          </select></th> </td> </tr>
                              
                <%--              <input list="Statuses">
                           <datalist id="statuses">
                             <option value="Standard">
                           </datalist>
                      </td> </tr>
                --%>
              
                
                  
                
                
              </table>
                
                <br> </br>
              
                <a class=" btn-primary nav-link" style="max-width:85px; color:white; border-radius: 5px "href="shippingTracking.jsp">Submit</a>

             </form>           
                                    
                        
    </body>
</html>
