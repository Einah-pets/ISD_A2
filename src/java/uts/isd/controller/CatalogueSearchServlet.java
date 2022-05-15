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
import javax.servlet.annotation.WebServlet;
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
public class CatalogueSearchServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        Product product = (Product) session.getAttribute("product");
        String productName = request.getParameter("productName");
        DBManager manager = (DBManager) session.getAttribute("manager");
        ArrayList<Product> searchProductLogs;
        validator.clear(session);

     /*   if (!validator.validateName(productName)) {
            session.setAttribute("productName", "Incorrect name");
            request.getRequestDispatcher("StaffCatalogue.jsp").include(request, response);
        } else {*/
            try {
                searchProductLogs = manager.findProductN(productName);
                session.setAttribute("productLog", searchProductLogs);
                session.setAttribute("productLogProductName", "");
                request.getRequestDispatcher("StaffCatalogue.jsp").include(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(CatalogueSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
//}
