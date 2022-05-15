/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;
/**
 *
 * @author bluin
 */

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
       
        DBManager manager = (DBManager) session.getAttribute("manager");
        validator.clear(session);
        User user = null;

        if (!validator.validateEmail(email)) {
            session.setAttribute("emailErr","Incorrect email format");
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
        else if (!validator.validatePassword(password)) {
            session.setAttribute("passwordErr","Incorrect password format");
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
        else{
            try {
                user = manager.findUserEP(email, password);
                if (user != null && user.isActive() ){ 
                    session.setAttribute("user", user);
                    request.getRequestDispatcher("main.jsp").include(request, response);
                    //create accesslog
                    int userID = user.getUserID();
//                    LocalDateTime currentDateTime = LocalDateTime.now();
//                    String accessDate = currentDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//                    String accessTime = currentDateTime.format(DateTimeFormatter.ofPattern("HH:mm"));
//                    String userAction = "Login";
                    manager.addAccessLog(userID, "Login");
                }


                else if (user != null && !user.isActive()){
                    session.setAttribute("existErr","Error: This user has been deactivated.");
                    request.getRequestDispatcher("login.jsp").include(request, response);
                }
                else {
                    session.setAttribute("existErr","Error: User does not exist in the database.");
                    request.getRequestDispatcher("login.jsp").include(request, response);
                }
            }
            catch (SQLException | NullPointerException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage() == null ? "User does not exist" : "welcome");
            }
        }
    }
}
