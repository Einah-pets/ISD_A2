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

public class AddProductServlet extends HttpServlet {
//  @Override
    protected void doPOST(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Validator validator = new Validator();
        String IproductID = request.getParameter("productID"); 
        Integer productID = Integer.parseInt(IproductID);
        String productName = request.getParameter("productName");
        String productType = request.getParameter("productType");
        String productBrand = request.getParameter("productBrand");
        String DproductPrice = request.getParameter("productPrice");
        Double productPrice = Double.parseDouble(DproductPrice);
        String IproductQuantity = request.getParameter("productQuantity");
        Integer productQuantity = Integer.parseInt(IproductQuantity);
        String productDescription = request.getParameter("productDescription");
        validator.clear(session);
        
        DBManager manager = (DBManager) session.getAttribute("manager");
       // Product product = new Product(productID, productName, productType, productBrand, productPrice, productQuantity, productDescription);
    
        
        try{
           Product product = manager.findProductN(productName);
             
            if (product != null){
                //create product
                    session.setAttribute("product", product);
                    request.getRequestDispatcher("ProductEdit.jsp").include(request, response);    
                   
                    manager.addProduct(productName, productType, productBrand, productPrice, productQuantity, productDescription);
                    request.getRequestDispatcher("addProduct.jsp").include(request, response);
                    
            }
            else
            {
                session.setAttribute("existErr", "This product already exist in the database.");
                request.getRequestDispatcher("addProduct.jsp").include(request, response);
                request.getRequestDispatcher("ProductEdit.jsp").include(request, response);
            } 
            
            }
            
            catch (SQLException ex) {
            Logger.getLogger(UserEditServlet.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getErrorCode() + " and " + ex.getMessage());
        }
        
        request.getRequestDispatcher("addProduct.jsp").include(request, response);
        request.getRequestDispatcher("ProductEdit.jsp").include(request, response);
                          
/*
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
       /* else if(!validator.validateName(productPrice)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("CatalgoueController").include(request, response);
        }
       /* else if(!validator.validateName(productQuantity)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("CatalgoueController").include(request, response);
}
        else if(!validator.validateName(productDescription)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("CatalogueController").include(request, response);
        }
*/
        
    }}


    



