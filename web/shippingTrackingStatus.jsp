<%-- 
    Document   : shippingTrackingStatus
    Created on : 14 May 2022, 1:41:30 pm
    Author     : AlineStamboulian
--%>
<%--
    Through typing their order number, users can find the state of their order.
    After shippingTracking is clicked.
    4 states:
        - Not found
        - Order Recieved
        - In Transit
        - Out for Delivery
--%>

<%@page import="uts.isd.model.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Tracking Order</title>
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

            <br>
            <h3>Tracking Your Order</h3>
            <br>
            
            
<%
    //num to be subbed for String value of deliverystatus
   
    int num =1;
            if (num == 1)
            {
            %>
                <div class="stepper-wrapper">
                <div class="stepper-item active">
                  <div class="step-counter">0</div>
                  <div class="step-name">Not Found</div>
                </div>
                <div class="stepper-item completed">
                  <div class="step-counter">1</div>
                  <div class="step-name">In Transit</div>
                </div>
                <div class="stepper-item completed">
                  <div class="step-counter">2</div>
                  <div class="step-name">Out for Delivery</div>
                </div>
                <div class="stepper-item completed">
                  <div class="step-counter">3</div>
                  <div class="step-name">Order Recieved</div>
                </div>
              </div>
                <text> Your order unfortunately can't be found within our database. </text>
                <br></br>
                <a class=" btn-primary nav-link" style="max-width:90px; color:white; border-radius: 5px "href="shippingTracking.jsp">Go Back</a>
               
            <% }else if (num ==2)
                { %>
                 <div class="stepper-wrapper">
                <div class="stepper-item completed">
                  <div class="step-counter">0</div>
                  <div class="step-name">Not Found</div>
                </div>
                <div class="stepper-item active">
                  <div class="step-counter">1</div>
                  <div class="step-name">In Transit</div>
                </div>
                <div class="stepper-item completed">
                  <div class="step-counter">2</div>
                  <div class="step-name">Out for Delivery</div>
                </div>
                <div class="stepper-item completed">
                  <div class="step-counter">3</div>
                  <div class="step-name">Order Recieved</div>
                </div>
              </div>
                       
                
                      
                       
            <% } else if (num == 3)
                { %>
                 <div class="stepper-wrapper">
                <div class="stepper-item completed">
                  <div class="step-counter">0</div>
                  <div class="step-name">Not Found</div>
                </div>
                <div class="stepper-item completed">
                  <div class="step-counter">1</div>
                  <div class="step-name">In Transit</div>
                </div>
                <div class="stepper-item active">
                  <div class="step-counter">2</div>
                  <div class="step-name">Out for Delivery</div>
                </div>
                <div class="stepper-item completed">
                  <div class="step-counter">3</div>
                  <div class="step-name">Order Recieved</div>
                </div>
              </div>       
                
                
                             
             <% } else  
                { %>
                  <div class="stepper-wrapper">
                <div class="stepper-item completed">
                  <div class="step-counter">0</div>
                  <div class="step-name">Not Found</div>
                </div>
                <div class="stepper-item completed">
                  <div class="step-counter">1</div>
                  <div class="step-name">In Transit</div>
                </div>
                <div class="stepper-item completed">
                  <div class="step-counter">2</div>
                  <div class="step-name">Out for Delivery</div>
                </div>
                <div class="stepper-item active">
                  <div class="step-counter">3</div>
                  <div class="step-name">Order Recieved</div>
                </div>
              </div>
                
                <% }%> 
             
                        <style>
            .stepper-item.active .step-counter{
                background-color: blue;
                color:white;
            }

            .stepper-item.completed .step-counter {
              background-color: #ccc;
              color: white;
            }

            .stepper-wrapper .stepper-item.active{
              color: black;
            }

            .stepper-wrapper .stepper-item.completed{
              color: black;
            }

            .stepper-wrapper {
          font-family: Arial;
          margin-top: 50px;
          display: flex;
          justify-content: space-between;
          margin-bottom: 20px;
          color: white;
        }

        .stepper-item {
          position: relative;
          display: flex;
          flex-direction: column;
          align-items: center;
          flex: 1;
        }

        .stepper-item::after {
          position: absolute;
          content: "";
          border-bottom: 3px solid #ccc;
          width: 100%;
          top: 20px;
          left: 50%;
          z-index: 2;
        }

        .stepper-item .step-counter {
          position: relative;
          z-index: 5;
          display: flex;
          justify-content: center;
          align-items: center;
          width: 40px;
          height: 40px;
          border-radius: 50%;
          background: #ccc;
          margin-bottom: 6px;
        }

        .stepper-item.active::after {
          position: absolute;
          content: "";
          border-bottom: 5px solid #ccc;
          width: 100%;
          top: 20px;
          left: 50%;
          z-index: 3;
        }

        .stepper-item.completed::after {
          position: absolute;
          content: "";
          border-bottom: 5px solid #ccc;
          width: 100%;
          top: 20px;
          left: 50%;
          z-index: 3;
        }

        .stepper-item:last-child::after {
          content: none;
        }

            </style>
            
            
    </body>
</html>













