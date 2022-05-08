<%-- 
    Document   : accessLog
    Created on : 08/05/2022, 3:01:24 PM
    Author     : bluin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.*"%>
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
            ArrayList<AccessLog> userAccessLog = (ArrayList<AccessLog>) session.getAttribute("accessLog");
            String accessLogDateErr = (String) session.getAttribute("accessLogDateErr");
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
            <h3>Your access log</h3>
            <br>
            <div>
                <label class="label">Search log by date: YYYY-MM-DD<input class="input" type="text" placeholder="<%=(accessLogDateErr != null ? accessLogDateErr : "")%>" name="accessDate"></label>
            </div>
            <table class="table">
                <thead class="table-light"><th>User ID</th><th>Access ID</th><th>Access date</th><th>Access time</th><th>Action</th></thead>
                <%
                    for (AccessLog logs : userAccessLog) {
                %>
                <tr><td>${logs.appAccessID}</td><td>${logs.userID}</td><td>${logs.accessDate}</td><td>${logs.accessTime}</td><td>${logs.userAction}</td></tr>
                <%
                    }
                %>
            </table>

        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
