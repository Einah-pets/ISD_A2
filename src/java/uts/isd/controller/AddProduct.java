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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Product;
import uts.isd.model.dao.DBManager;

// Lara /////////////////////////////////////////////////////////////////////////
public class AddProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String productName = request.getParameter("productName");
        String productType = request.getParameter("productType");
        String productBrand = request.getParameter("productBrand");
        String productPrice = request.getParameter("productPrice");
        Double DproductPrice = Double.parseDouble(productPrice);
        String productQuantity = request.getParameter("productQuantity");
        Integer IproductQuantity = Integer.parseInt(productQuantity);
        String productDescription = request.getParameter("productDescription");
        validator.clear(session);
        Product product = null;
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        try{
                
            if (product ==null){
                //create product
                    manager.addProduct(productName, productType, productBrand, DproductPrice, IproductQuantity, productDescription);
                    request.getRequestDispatcher("CatalogueController").include(request, response);
                    
            }
            else
            {
                session.setAttribute("existErr", "This product already exist in the database.");
                request.getRequestDispatcher("main.jsp").include(request, response);
            }
            
            }
            
            catch (SQLException | NullPointerException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage() == null ? "User does not exist" : "welcome");
            }
                          

        if(!validator.validateName(productName)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("CatalogueController").include(request, response);
        }
        else if(!validator.validateName(productType)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("CatalogueController").include(request, response);
        }
        else if(!validator.validateName(productBrand)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("CatalogueController").include(request, response);
        }
        else if(!validator.validatePrice(productPrice)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("CatalgoueController").include(request, response);
        }
        else if(!validator.validateNumber(productQuantity)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("CatalgoueController").include(request, response);
        }
        else if(!validator.validateName(productDescription)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("CatalogueController").include(request, response);
        }
        
    }}
      
    



