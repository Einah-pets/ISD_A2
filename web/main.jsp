<%-- 
    Document   : main
    Created on : 30/03/2022, 11:13:01 AM
    Author     : bluin
--%>

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Main Page</title>
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
                <li class="nav-item">
                  <a class="nav-link" href="main.jsp">Main</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="AccessLogViewServlet">Access Log</a>
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
                    <%
                        if (session.getAttribute("user") != null) {
                    %>
                    <li class="nav-item">
                        <form action="OrderHistoryController" method="POST">
                            <input type="submit" class="btn btn-light" value="Order History">
                        </form>
                    </li>
                    <%}%>
                <li class="nav-item">
                  <a class="nav-link" href="LogoutServlet?userID=<%= user.getUserID()%>">Logout</a>
                </li>   
              </ul>          
            </div>
          </div>
        </nav>
        

        <br>
        <h3>Your profile</h3>
        
        <table class="table">
          <thead class="table-light"><th>First Name</th><th>Last Name</th><th>Phone</th><th>Email</th><th>Password</th></thead>
        <tr><td>${user.firstName}</td><td>${user.lastName}</td><td>${user.phone}</td><td>${user.email}</td><td><input type="password" disabled value="${user.password}"></td></tr>    
        </table>

        <div>
            <a href="UserEditServlet?email='<%=user.getEmail()%>'&password='<%=user.getPassword()%>'" class="btn btn-primary">Edit profile</a>
            <a href="userDeactivate.jsp" class="btn btn-secondary" style="float: right;">Deactivate account</a>
        </div>
        
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
