/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

    private DBConnector db;

    private DBManager manager;

    private Connection conn;

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        //DBManager manager = (DBManager) session.getAttribute("manager");

        try {
            db = new DBConnector();
            conn = db.openConnection();
            manager = new DBManager(conn);

            Order cart = (Order) session.getAttribute("cart");
            OrderLine ol = manager.findOrderLine(cart.getOrderID(), Integer.parseInt(request.getParameter("productID")));

            switch (request.getParameter("action")) {
                case "+":
                    manager.updateOrderLine(Integer.parseInt(request.getParameter("productID")), cart.getOrderID(), ol.getQuantity() + 1);
                    break;
                case "-":
                    if (ol.getQuantity() > 1) {
                        manager.updateOrderLine(Integer.parseInt(request.getParameter("productID")), cart.getOrderID(), ol.getQuantity() - 1);
                    }
                    break;
                case "X":
                    manager.deleteOrderLine(Integer.parseInt(request.getParameter("productID")), cart.getOrderID());
                    break;
                default:
                    break;
            }

            ArrayList<OrderLine> orderLines = manager.fetchOrderLines(cart.getOrderID());
            session.setAttribute("orderlinesInCart", orderLines);
            ArrayList<Product> products = manager.fetchProducts(orderLines);
            session.setAttribute("productsInCart", products);

            request.getRequestDispatcher("cart.jsp").include(request, response);

        } catch (SQLException ex) {

            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);

        } catch (ClassNotFoundException ex) {
        }

    }

}
