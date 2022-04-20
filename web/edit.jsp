<%-- 
    Document   : edit
    Created on : 30/03/2022, 11:35:48 AM
    Author     : bluin
--%>

<%@page import="Users.Customer"%>
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
                      <a class="nav-link" href="main.jsp">Profile</a>
                    </li> 
                    <li class="nav-item">
                      <a class="nav-link" href="logout.jsp">Logout</a>
                    </li>  
                  </ul>          
                </div>
              </div>
            </nav>       
            
            <% 
                Customer customer = (Customer)session.getAttribute("customer");
            %>
            
            <h2>Edit your information:</h2>
            <form action="edit.jsp" method="post">
                <br>
                    <table>
                        <tr><td>Full name:</td><td><input type="text" name="name" required="true"></td></tr>
                        <tr><td>Email:</td><td><input type="text" name="email" required></td></tr>
                        <tr><td>Password:</td><td><input type="password" name="password" required></td></tr>
                        <tr><td>Date of birth:</td><td><input type="date" name="dob" required></td></tr>
                    </table>
                    <br>
                    <div>
                        <a href="main.jsp">Cancel</a>
                        <input type="submit" value="Edit">
                    </div>
            </form>
            <p>test</p>
    </body>
</html>
