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
/**
 *
 * @author bluin
 */
public class ProductDeleteServley extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
       //String IproductID = request.getParameter("productID"); 
        //Integer productID = Integer.parseInt(IproductID);
        String productName = request.getParameter("productName");
        String productType = request.getParameter("productType");
        String productBrand = request.getParameter("productBrand");
        String productPrice = request.getParameter("productPrice");
        //Double productPrice = Double.parseDouble(DproductPrice);
        String productQuantity = request.getParameter("productQuantity");
        //Integer productQuantity = Integer.parseInt(IproductQuantity);
        String productDescription = request.getParameter("productDescription");
        validator.clear(session);
        
        DBManager manager = (DBManager) session.getAttribute("manager");
        try {
            manager.deleteProduct(productName);
            //productName, productType, productBrand, productPrice, productQuantity, productDescription);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDeleteServley.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException ex) {
            Logger.getLogger(ProductDeleteServley.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(!validator.validateName(productName)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("AddProduct.jsp").include(request, response);
        }
        else if(!validator.validateName(productType)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("AddProduct.jsp").include(request, response);
        }
        else if(!validator.validateName(productBrand)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("AddProduct.jsp").include(request, response);
        }
        else if(!validator.validateName(productPrice)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("AddProduct.jsp").include(request, response);
        }
        else if(!validator.validateName(productQuantity)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("AddProduct.jsp").include(request, response);
}
        else if(!validator.validateName(productDescription)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("AddProduct.jsp").include(request, response);
        }
        
        else{
            
            response.sendRedirect("StaffCatalogue.jsp");
        }
    }
}
