/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;

import java.util.ArrayList;

import java.sql.Connection;

import java.sql.SQLException;

import java.util.logging.Level;

import java.util.logging.Logger;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import uts.isd.model.Order;

import uts.isd.model.OrderLine;

import uts.isd.model.User;

import uts.isd.model.dao.*;

import uts.isd.model.dao.DBManager;

/**
 *
 * @author Wisam
 */
public class PaymentController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        //User currentUser = (User) session.getAttribute("user");
        Order cart = (Order) session.getAttribute("cart");
        
        Double amount = (Double) session.getAttribute("totalPrice");
        ArrayList<OrderLine> orderlinesInCart = (ArrayList) session.getAttribute("orderlinesInCart");
        int orderID = orderlinesInCart.get(orderlinesInCart.size()-1).getOrderID();
        //int orderID = Integer.parseInt(request.getParameter("orderID"));
        
        
        try {
            manager.addPayment(orderID, amount);
            request.getRequestDispatcher("addCard.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CreditCardController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
