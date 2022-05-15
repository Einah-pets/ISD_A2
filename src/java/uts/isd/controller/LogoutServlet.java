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
import uts.isd.model.dao.DBManager;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import uts.isd.model.User;

/**
 *
 * @author bluin
 */
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        User user = (User) session.getAttribute("user");

        try {
            //create accesslog
            int userID = user.getUserID();
            manager.addAccessLog(userID, "Logout");
            //end session
            session.invalidate();
            //reset cart
            if (session.getAttribute("cart") != null) {
                session.setAttribute("cart", null);
            }
            request.getRequestDispatcher("logout.jsp").include(request, response);
        } catch (SQLException | NullPointerException ex) {
            Logger.getLogger(LogoutServlet.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
        }

    }
}
