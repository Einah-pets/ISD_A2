<%-- 
    Document   : register
    Created on : 23/03/2022, 10:11:20 AM
    Author     : bluin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Registration Page</title>
    </head>
    <body>
        <%
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passwordErr = (String) session.getAttribute("passwordErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String phoneErr = (String) session.getAttribute("phoneErr");
        %>

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


            <div class="container" >
                <div class="row" >
                    <div class="col">
                    </div>
                    <div class="col" >
                        <h2>Create your account:</h2>
                        <%=(existErr != null ? existErr : "")%>
                        <form action="RegisterServlet" method="post" >
                            <br>

                            <table>
                                <tr><td>First name:</td></tr>
                                <tr>
                                    <td><input type="text" class="form-control" placeholder="<%=(nameErr != null ? nameErr : "Enter first name")%>" name="firstName" required="true"></td>
                                    <td><small class="form-text text-muted">Example: Jane</small></td>
                                </tr>
                                <tr><td>Last name:</td></tr>
                                <tr>
                                    <td><input type="text" class="form-control" placeholder="<%=(nameErr != null ? nameErr : "Enter last name")%>" name="lastName" required="true"></td>
                                    <td><small class="form-text text-muted">Example: Doe</small></td>
                                </tr>
                                <tr><td>Email:</td></tr>
                                <tr>
                                    <td><input type="text" class="form-control" placeholder="<%=(emailErr != null ? emailErr : "Enter email")%>" name="email" required></td>
                                    <td><small class="form-text text-muted">Example: jane@uts.com</small></td>
                                </tr>
                                <tr><td>Password:</td></tr>
                                <tr>
                                    <td><input type="password" class="form-control" placeholder="<%=(passwordErr != null ? passwordErr : "Enter password")%>" name="password" required></td>
                                    <td><small class="form-text text-muted">Must contain letters and digits</small></td>
                                </tr>
                                <tr><td>Phone:</td></tr> 
                                <tr>
                                    <td><input type="text" class="form-control" placeholder="<%=(phoneErr != null ? phoneErr : "Enter phone")%>" name="phone" required></td>
                                    <td><small class="form-text text-muted">Must contain 10 digits</small></td>
                                </tr>
                                <tr><td><label for="userType">Role:</label></td></tr>
                                <tr><td>
                                        <select id="userType" name="userType" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                            <option value="Customer">Customer</option>
                                            <option value="Staff">Staff</option>
                                        </select>
                                    </td></tr> 
                            </table>

                            <br>
                            <div>
                                <a href="index.jsp">Cancel</a>
                                <input type="submit" class="btn btn-primary" value="Register">
                            </div>
                        </form>
                    </div>
                    <div class="col">
                    </div>
                </div>
            </div>


        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
