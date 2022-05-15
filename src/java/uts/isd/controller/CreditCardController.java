/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;

import java.sql.Connection;

import java.sql.SQLException;

import java.util.ArrayList;

import java.util.logging.Level;

import java.util.logging.Logger;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import uts.isd.model.Order;

import uts.isd.model.OrderLine;

import uts.isd.model.dao.*;

import uts.isd.model.dao.DBManager;

/**
 *
 * @author Wisam
 */
public class CreditCardController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Order cart = (Order) session.getAttribute("cart");
        
        //Initialising the data variables of a credit card to the received input


        String nameOnCard = request.getParameter("nameOnCard");
        long creditCardNo = Long.parseLong(request.getParameter("creditCardNo"));
        String expirationDate = request.getParameter("expirationDate");
        int cvv = Integer.parseInt(request.getParameter("cvv"));
        

        //The last order line in the cart is the order that the user is paying for
        ArrayList<OrderLine> orderlinesInCart = (ArrayList) session.getAttribute("orderlinesInCart");
        int orderID = orderlinesInCart.get(orderlinesInCart.size()-1).getOrderID();

        User currentUser = (User) session.getAttribute("user");
        ArrayList<Order> orders;

        try {
            //Adds credit card record to the database
            manager.addCreditCard(nameOnCard, creditCardNo, expirationDate, cvv);

            //Updates payment status from "in-progress" to "complete" (boolean false to true)
            manager.updatePayment(orderID);
            //reset cart
            session.setAttribute("cart", null);
//            update order history
//            orders = manager.getAllOrders(currentUser.getUserID());
//            session.setAttribute("previousOrders", orders);

            request.getRequestDispatcher("paycomplete.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CreditCardController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
}
