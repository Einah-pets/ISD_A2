/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
import uts.isd.model.*;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author Stephanie
 */
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {

    private DBConnector db;

    private DBManager manager;

    private Connection conn;

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        //manager = (DBManager) session.getAttribute("manager");

        Order cart;
        ArrayList<OrderLine> orderLines;
        ArrayList<Product> products;
        //User currentUser = (User) session.getAttribute("user");

        try {
            db = new DBConnector();
            conn = db.openConnection();
            manager = new DBManager(conn);
            int userID;

            //create cart if doesn't exist
            if (session.getAttribute("cart") == null) {
                //check if user registered or anonymous
                
//                if (currentUser != null) {
//                    //int userID = currentUser.getUserID();}
//                    
//                }
//                else {
                     userID = 21;
                //}

                String date = "2022-05-05";
                int deliveryID = 1;
                manager.addOrder(userID, date, deliveryID);
                Order mycart = (Order) manager.getLastOrder();
                session.setAttribute("cart", mycart);
            }

            //add selected product to cart
            cart = (Order) session.getAttribute("cart");

            //set list of orderlines in cart into session
//            orderLines = manager.fetchOrderLines(cart.getOrderID());
//            session.setAttribute("orderlinesInCart", orderLines);
            OrderLine ol = manager.findOrderLine(cart.getOrderID(), Integer.parseInt(request.getParameter("productID")) + 1);

            if (ol == null) {
                manager.addOrderLine(Integer.parseInt(request.getParameter("productID")) + 1, cart.getOrderID());
            } else {
                manager.updateOrderLine(Integer.parseInt(request.getParameter("productID")) + 1, cart.getOrderID(), ol.getQuantity() + 1);

            }
            orderLines = manager.fetchOrderLines(cart.getOrderID());
            session.setAttribute("orderlinesInCart", orderLines);
            //set list of products in cart into session
            products = manager.fetchProducts(orderLines);
            session.setAttribute("productsInCart", products);

            request.getRequestDispatcher("cart.jsp").include(request, response);

        } catch (SQLException ex) {

            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);

        } catch (ClassNotFoundException ex) {
        }

    }

}
