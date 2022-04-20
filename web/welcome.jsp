<%-- 
    Document   : welcome
    Created on : 23/03/2022, 10:35:54 AM
    Author     : bluin
--%>

<%@page import="Users.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Welcome Page</title>
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
                    <li class="nav-item">
                      <a class="nav-link" href="logout.jsp">Logout</a>
                    </li>  
                  </ul>          
                </div>
              </div>
            </nav>       
                   
           
            <%
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
            %>
            
            <p>Welcome to IoTBay <%= name%></p>
            <p>Your email is: <%= email %></p>
            <p>Your password is: <%= password %></p>
            <p>Your DOB is: <%= dob %></p>
            
            <%
              Customer customer = new Customer(name,email,password,dob);
              session.setAttribute("customer", customer);
            %>
            
        </div>
            
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
