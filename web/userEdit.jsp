<%-- 
    Document   : edit
    Created on : 30/03/2022, 11:35:48 AM
    Author     : bluin
--%>

<%@page import="uts.isd.model.User"%>
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
                User user = (User) session.getAttribute("user");
                String updated = (String) session.getAttribute("updated");
                String updatePasswordErr = (String) session.getAttribute("updatePasswordErr");
                String updateNameErr = (String) session.getAttribute("updateNameErr");
                String updatePhoneErr = (String) session.getAttribute("updatePhoneErr");
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

                <div class="container">
                    <div class="row">
                        <div class="col">
                        </div>
                        <br>
                        <div class="col">
                            <h3>Edit your information:</h3>
                            <%=(updated != null ? updated : "")%>
                            <%=(updatePasswordErr != null ? updatePasswordErr : "")%>
                            <%=(updateNameErr != null ? updateNameErr : "")%>
                            <%=(updatePhoneErr != null ? updatePhoneErr : "")%>
                            <form action="UserUpdateServlet" method="post">
                                <br>
                                <table>
                                    <tr><td>Email: (Cannot be edited)</td></tr>
                                    <tr><td><input type="text" name="email" value="${user.email}" required="true" readonly="readonly"></td></tr>
                                    <tr><td>First name:</td></tr>
                                    <tr>
                                        <td><input type="text" name="firstName" value="${user.firstName}" required="true"></td>
                                        <td><small class="form-text text-muted">Example: Jane</small></td>
                                    </tr>
                                    <tr><td>Last name:</td></tr>
                                    <tr>
                                        <td><input type="text" name="lastName" value="${user.lastName}" required="true"></td>
                                        <td><small class="form-text text-muted">Example: Doe</small></td>
                                    </tr>
                                    <tr><td>Phone:</td></tr>
                                    <tr>
                                        <td><input type="text" name="phone" value="${user.phone}" required="true"></td>
                                        <td><small class="form-text text-muted">Must contain 10 digits</small></td>
                                    </tr>
                                    <tr><td>Password:</td></tr>
                                    <tr>
                                        <td><input type="password" name="password" value="${user.password}" required="true"></td>
                                        <td><small class="form-text text-muted">Must contain letters and digits</small></td>
                                    </tr>
                                </table>
                                <br>
                                <div>
                                    <a href="main.jsp">Cancel</a>
                                    <input type="submit" class="btn btn-primary" value="Update">
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
