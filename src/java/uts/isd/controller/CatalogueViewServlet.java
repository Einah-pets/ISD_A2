/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.*;
import uts.isd.model.dao.DBManager;
/**
 *
 * @author bluin
 */
public class CatalogueViewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Product product = (Product) session.getAttribute("product");
        DBManager manager = (DBManager) session.getAttribute("manager");
        ArrayList<Product> allProductLogs;
        
        try{
            allProductLogs = manager.fetchAllProducts();
            //product.getProductID()
            session.setAttribute("Product", allProductLogs);
            session.setAttribute("ProductName", "");
            request.getRequestDispatcher("StaffCatalogue.jsp").include(request, response);
        }
        catch (SQLException ex) {
            Logger.getLogger(AccessLog.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
