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
public class InputCardCheck extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        //Order cart = (Order) session.getAttribute("cart");
        CreditCardValidator ccValidator = new CreditCardValidator();
        ccValidator.clear(session);
        
        //Initialising the data variables of a credit card to the received input
        String nameOnCard = request.getParameter("nameOnCard");
        String creditCardNo = request.getParameter("creditCardNo");
        String expirationDate = request.getParameter("expirationDate");
        String cvv = request.getParameter("cvv");
        
        if(!ccValidator.validateNameOnCard(nameOnCard)){
            session.setAttribute("nameOnCardErr","Incorrect name format");
            request.getRequestDispatcher("addCard.jsp").include(request, response);
        }
        else if(!ccValidator.validateCreditCardNo(creditCardNo)){
            session.setAttribute("creditCardNoErr","Incorrect number format");
            request.getRequestDispatcher("addCard.jsp").include(request, response);
        } 
        else if(!ccValidator.validateCVV(cvv)){
            session.setAttribute("cvvErr","Incorrect cvv format");
            request.getRequestDispatcher("addCard.jsp").include(request, response);
        } else {
            request.getRequestDispatcher("confirmpayment.jsp").include(request, response);
        }
        
    }
}
