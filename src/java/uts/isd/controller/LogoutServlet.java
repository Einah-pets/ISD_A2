/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.*;
import uts.isd.model.dao.DBManager;
import java.time.LocalDateTime;  
import java.time.format.DateTimeFormatter;  
/**
 *
 * @author bluin
 */
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
        String userIDString = request.getParameter("userID");
        DBManager manager = (DBManager)session.getAttribute("manager");
//        User user = null;

        try{
//            user = manager.findUserEP(email, password);
//            if (user != null){
                //create accesslog
                //int userID = user.getUserID();
                int userID = Integer.parseInt(userIDString);
                LocalDateTime currentDateTime = LocalDateTime.now();
                String accessDate = currentDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                String accessTime = currentDateTime.format(DateTimeFormatter.ofPattern("HH:mm"));
                String userAction = "Logout";
                manager.addAccessLog(userID, accessDate, accessTime, userAction);
                //end session
                session.invalidate();
                request.getRequestDispatcher("logout.jsp").include(request, response);
//            }
//            else{
//                session.setAttribute("existErr","Error: User does not exist in the database.");
//                request.getRequestDispatcher("logout.jsp").include(request, response);
//            }
        }
        catch (SQLException | NullPointerException ex) {
            Logger.getLogger(LogoutServlet.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
        }
    }
}
