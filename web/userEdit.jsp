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
                User user = (User)session.getAttribute("user");
                String updated = (String)session.getAttribute("updated");
                String updatePasswordErr = (String) session.getAttribute("updatePasswordErr");
                String updateNameErr = (String) session.getAttribute("updateNameErr");
                //String phoneErr = (String) session.getAttribute("phoneErr");
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
                                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="main.jsp">Main</a>
                                </li> 
                                <li class="nav-item">
                                    <a class="nav-link" href="accessLog.jsp">Access Log</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="LogoutServlet">Logout</a>
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
                            <%=(updatePasswordErr != null ? updatePasswordErr : "")%>
                            <%=(updateNameErr != null ? updateNameErr : "")%>
                            <form action="UserUpdateServlet" method="post">
                                <br>
                                <table>
                                    <tr><td>Email:</td><td><input type="text" name="email" value="${user.email}" required="true" readonly="readonly"></td></tr>
                                    <tr><td>First name:</td><td><input type="text" name="firstName" value="${user.firstName}" required="true"></td></tr>
                                    <tr><td>Last name:</td><td><input type="text" name="lastName" value="${user.lastName}" required="true"></td></tr>
                                    <tr><td>Phone:</td><td><input type="text" name="phone" value="${user.phone}" required="true"></td></tr>
                                    <tr><td>Password:</td><td><input type="password" name="password" value="${user.password}" required="true"></td></tr>
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
