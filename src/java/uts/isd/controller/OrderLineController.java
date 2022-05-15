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
@WebServlet(name = "OrderLineController", urlPatterns = {"/OrderLineController"})
public class OrderLineController extends HttpServlet {



    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        DBManager manager = (DBManager) session.getAttribute("manager");

        User currentUser = (User) session.getAttribute("user");

        try {
 
            
            int orderID = Integer.parseInt(request.getParameter("orderID"));
            
            ArrayList <Product> products = new ArrayList();
            ArrayList <OrderLine> orderLines = new ArrayList();
            ArrayList quantities = new ArrayList();
            
            orderLines = manager.fetchOrderLines(orderID);
            for(int i=0; i<orderLines.size();i++){
                products.add(manager.findProduct(orderLines.get(i).getProductID()));
                quantities.add(manager.findOrderLine(orderID,orderLines.get(i).getProductID()).getQuantity());
            }
            session.setAttribute("productsInPrevOrder",products);
            session.setAttribute("quantities",quantities);

            request.getRequestDispatcher("orderSummary.jsp").include(request, response);

        } catch (SQLException ex) {

            Logger.getLogger(OrderLineController.class.getName()).log(Level.SEVERE, null, ex);

        } 
    }

}
