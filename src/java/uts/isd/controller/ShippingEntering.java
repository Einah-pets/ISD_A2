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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Delivery;
import uts.isd.model.dao.*;
import uts.isd.model.dao.DBManager;
/**
 *
 * @author AlineStamboulian
 */
public class ShippingEntering extends HttpServlet{
        
            
    protected void doPOST(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        String deliveryStreetNo = request.getParameter("deliveryStreetNo");
        String deliveryStreetName = request.getParameter("deliveryStreetName");
        String deliveryCity = request.getParameter("deliveryCity");
        String deliveryState= request.getParameter("deliveryState");
        String deliveryCountry = request.getParameter("deliveryCountry");
        String deliveryStatus= request.getParameter("deliveryStatus");
        String deliveryType= request.getParameter("deliveryType");
        
        
         try {
            manager.addDeliveryDetails (deliveryType, deliveryStreetNo, deliveryStreetName, deliveryCity, deliveryState, deliveryCountry);
            request.getRequestDispatcher("shippingTracking.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CreditCardController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
      
    }
   
    
}
