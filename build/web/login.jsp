<%-- 
    Document   : index
    Created on : 23/03/2022, 10:04:47 AM
    Author     : bluin
--%>

<%@page import="uts.isd.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Home Page</title>
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
                                <form action="CatalogueController" method="POST">
                                    <input type="hidden" value="1" name="page">
                                    <input type="submit" class="btn btn-light" value="Catalogue">
                                </form>
                            </li> 
                             <li class="nav-item">
                                <a class="nav-link" href="cart.jsp">Cart</a>
                            </li>
                <li class="nav-item">
                  <a class="nav-link" href="register.jsp">Register</a>
                </li>  
                <li class="nav-item">
                  <a class="nav-link" href="login.jsp">Login</a>
                </li>   
    <%--            <li class="nav-item">
                  <a class="nav-link" href="AddProduct.jsp">Add Product</a>
                </li>  
    --%>
                 
              </ul>          
            </div>
          </div>
        </nav>
        
        <% 
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passwordErr = (String) session.getAttribute("passwordErr");
        %>
                
        <div class="container">
                <div class="row">
                  <div class="col">
                  </div>
                  <div class="col">
                        <h2>Login:</h2>
                        <%=(existErr != null ? existErr : "")%>
                        <form method="post" action="LoginServlet">
                            <br>
                            <table>
                                <tr><td>Email:</td><td><input type="text" placeholder="<%=(emailErr != null ? emailErr : "Enter email")%>" name="email" required="true"></td></tr>
                                <tr><td>Password:</td><td><input type="password" placeholder="<%=(passwordErr != null ? passwordErr : "Enter password")%>" name="password" required></td></tr>                    
                            </table>
                            <br>
                            <div>
                                <a href="index.jsp">Cancel</a>
                                <input class="btn btn-primary" type="submit" value="Login">
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
