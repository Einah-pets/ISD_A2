/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.*;
import uts.isd.model.dao.DBManager;
import java.util.*;

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
        boolean qtyCheck = true;

        try {
            ArrayList<OrderLine> ol = manager.fetchOrderLines(cart.getOrderID());

            for (OrderLine p : ol) {
                if (p.getQuantity() > manager.findProduct(p.getProductID()).getProductQuantity()) {
                    String err = "Quantity selected for " + manager.findProduct(p.getProductID()).getProductName() + " is invalid - Insufficient inventory";
                    session.setAttribute("orderErr", err);
                    qtyCheck = false;
                }
            }
            if (qtyCheck) {
                session.setAttribute("orderErr",null);
                manager.updateOrderStatus(cart.getOrderID(), "Confirmed");
                
                //update stock
                for (OrderLine product: ol){
                    manager.updateStock(product.getProductID(), manager.findProduct(product.getProductID()).getProductQuantity()-product.getQuantity());
                }
                
                
                request.getRequestDispatcher("confirmedCart.jsp").include(request, response);
            } else {
                request.getRequestDispatcher("cart.jsp").include(request, response);

            }

        } catch (SQLException | NullPointerException ex) {
            Logger.getLogger(ConfirmOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
