<%-- 
    Document   : userDelete
    Created on : 08/05/2022, 2:35:37 PM
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
        <title>Confirm User Delete</title>
    </head>
    <body>
        <%
            User user = (User)session.getAttribute("user");
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
        
        <br>
        <p>Are you sure you want to delete your account?</p>
<!--        <br>
        <div>
            <a href="main.jsp">Cancel</a>
            <a href="UserDeleteServlet?email='</%=user.getEmail()%>'&password='</%=user.getPassword()%>'" class="btn btn-secondary">Delete account</a>
        </div>-->
                
        <form action="UserDeleteServlet" method="post">
            <input type="hidden" name="email" value="${user.email}" required="true" >
            <input type="hidden" name="password" value="${user.password}" required="true">
        
            <br>
            <div>
                <a href="main.jsp">Cancel</a>
                <input type="submit" class="btn btn-primary" value="Delete account">
            </div>
        </form>
        
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
