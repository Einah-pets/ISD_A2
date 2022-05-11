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
import java.util.*;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author bluin
 */
public class UserDeactivateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        User user = (User) session.getAttribute("user");

        try {
            //deactivate
            String email = user.getEmail();
            manager.deactivateUser(email);
            //create deactivate access log
            int userID = user.getUserID();
            manager.addAccessLog(userID, "Deactivate");

            //cancel all orders for this user
            ArrayList<Order> orders = manager.getOrders(userID,null,null);
            for (Order o : orders) {
                manager.updateOrderStatus(o.getOrderID(),"Cancelled");
            }

            //end
            session.invalidate();
            request.getRequestDispatcher("userDeactivateSuccess.jsp").include(request, response);
        } catch (SQLException | NullPointerException ex) {
            Logger.getLogger(UserDeactivateServlet.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
        }

    }
}
