/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.*;
import uts.isd.model.dao.*;

/**
 *
 * @author Stephanie
 */
@WebServlet(name = "OrderHistoryController", urlPatterns = {"/OrderHistoryController"})
public class OrderHistoryController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        DBManager manager = (DBManager) session.getAttribute("manager");

        User currentUser = (User) session.getAttribute("user");
        ArrayList<Order> orders;

        try {

            orders = manager.getAllOrders(currentUser.getUserID());

            session.setAttribute("previousOrders", orders);

            request.getRequestDispatcher("orderHistory.jsp").include(request, response);

        } catch (NullPointerException | SQLException ex) {

            Logger.getLogger(OrderHistoryController.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}
