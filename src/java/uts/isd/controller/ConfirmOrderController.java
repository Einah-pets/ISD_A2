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
@WebServlet(name = "ConfirmOrderController", urlPatterns = {"/ConfirmOrderController"})
public class ConfirmOrderController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Order cart = (Order) session.getAttribute("cart");

        try {
            manager.updateOrderStatus(cart.getOrderID(), "Confirmed");
            request.getRequestDispatcher("confirmedCart.jsp").include(request, response);

        } catch (SQLException | NullPointerException ex) {
            Logger.getLogger(ConfirmOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
