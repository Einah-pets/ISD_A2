<%-- 
    Document   : register
    Created on : 23/03/2022, 10:11:20 AM
    Author     : bluin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                      <a class="nav-link" href="register.jsp">Register</a>
                    </li>  
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="login.jsp">Login</a>
                    </li>   
                    <li class="nav-item">
                                <form action="CatalogueController" method="POST">
                                    <input type="hidden" value="1" name="page">
                                    <input type="submit" class="btn btn-light" value="Catalogue">
                                </form>
                            </li>  
                  </ul>          
                </div>
              </div>
            </nav>

            
            <div class="container">
                <div class="row">
                  <div class="col">
                  </div>
                  <div class="col">
                        <h2>Create your account:</h2>
                        <%=(existErr != null ? existErr : "")%>
                        <form action="RegisterServlet" method="post">
                            <br>
                            <table>
                                <tr><td>First name:</td><td><input type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter first name")%>" name="firstName" required="true"></td></tr>
                                <tr><td>Last name:</td><td><input type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter last name")%>" name="lastName" required="true"></td></tr>
                                <tr><td>Email:</td><td><input type="text" placeholder="<%=(emailErr != null ? emailErr : "Enter email")%>" name="email" required></td></tr>
                                <tr><td>Password:</td><td><input type="password" placeholder="<%=(passwordErr != null ? passwordErr : "Enter password")%>" name="password" required></td></tr>
                                <tr><td>Phone:</td><td><input type="text" placeholder="<%=(phoneErr != null ? phoneErr : "Enter phone")%>" name="phone" required></td></tr> 
                                <tr><td><label for="userType">Role:</label></td><td>
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
