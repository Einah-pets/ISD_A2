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
import uts.isd.model.Product;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

// Lara /////////////////////////////////////////////////////////////////////////
//@WebServlet(name = "AddProductServlet", urlPatterns = {"/AddProductServlet"})

public class ShippingTrackingServlet extends HttpServlet {
//  @Override
    protected void doPOST(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Validator validator = new Validator();
        String ideliveryid = request.getParameter("deliveryid"); 
        Integer deliveryid = Integer.parseInt(ideliveryid);
        String deliverystatus = request.getParameter("deliverystatus");
        String deliveryDate = request.getParameter("deliveryDate");
        String deliveryType = request.getParameter("deliveryType");
        validator.clear(session);
        
         request.getRequestDispatcher("shippingTrackingStatus.jsp").include(request, response);
        
        
       
    }}


    



