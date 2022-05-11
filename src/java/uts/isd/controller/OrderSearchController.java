/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Order;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author Stephanie
 */
@WebServlet(name = "OrderSearchController", urlPatterns = {"/OrderSearchController"})
public class OrderSearchController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        DBManager manager = (DBManager) session.getAttribute("manager");

        User currentUser = (User) session.getAttribute("user");
        ArrayList<Order> orders;
        int userID = currentUser.getUserID();
        String date = request.getParameter("dateOfOrderSearch");
        String orderID = request.getParameter("orderIDSearch");

        try {

            orders = manager.getOrders(userID, date, orderID);

            session.setAttribute("previousOrders", orders);

            request.getRequestDispatcher("orderHistory.jsp").include(request, response);

        } catch (NullPointerException | SQLException ex) {

            Logger.getLogger(OrderHistoryController.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

}
