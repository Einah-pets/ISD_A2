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
public class UpdateProductServlet extends HttpServlet {
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
        AddProduct product = new AddProduct();
        //productName, productType, productBrand, productPrice, productQuantity, productDescription);
        
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
        else if(!validator.validatePrice(productPrice)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("AddProduct.jsp").include(request, response);
        }
        else if(!validator.validateNumber(productQuantity)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("AddProduct.jsp").include(request, response);
}
        else if(!validator.validateName(productDescription)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("AddProduct.jsp").include(request, response);
        }
        
        else{
            try{
                if (product != null){
                     Double DproductPrice = Double.parseDouble(productPrice);
                     Integer IproductQuantity = Integer.parseInt(productQuantity);
                    session.setAttribute("product", product);
                    manager.addProduct(productName, productType, productBrand, DproductPrice, IproductQuantity, productDescription);
                    session.setAttribute("updated", "Information successfully updated.");
                    request.getRequestDispatcher("AddProduct.jsp").include(request, response);
                 //   product = manager.findProduct(productID);
                    session.setAttribute("product", product);
                }
                else{
                    session.setAttribute("updated", "Information update was not successful.");
                    request.getRequestDispatcher("AddProduct.jsp").include(request, response);
                }
            }
            catch (SQLException ex) {
                Logger.getLogger(UserUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("StaffCatalogue.jsp");
        }
    }
}
