/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
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
@WebServlet(name = "CatalogueController", urlPatterns = {"/CatalogueController"})
public class CatalogueController extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        DBManager manager = (DBManager) session.getAttribute("manager");

        ArrayList<Product> products;
        int page = Integer.parseInt(request.getParameter("page"));
        session.setAttribute("page", page);
        try {


            products = manager.fetchAllProducts();

            session.setAttribute("allProducts", products);

            for (int i = 0; i < 6; i++) {
                if ((page * 6 - (6 - i) < products.size())) {
                    Product prod = products.get(page * 6 - (6 - i));
                    session.setAttribute("prod" + i + "ID", prod.getProductID());
                    session.setAttribute("prod" + i + "Name", prod.getProductName());
                    session.setAttribute("prod" + i + "Type", prod.getProductType());
                    session.setAttribute("prod" + i + "Brand", prod.getProductBrand());
                    session.setAttribute("prod" + i + "Price", Double.toString(prod.getProductPrice()));
                    session.setAttribute("prod" + i + "Quantity", prod.getProductQuantity());
                    session.setAttribute("prod" + i + "Description", prod.getProductDescription());
                } else {
                    session.setAttribute("prod" + i + "ID", null);
                    session.setAttribute("prod" + i + "Name", null);
                    session.setAttribute("prod" + i + "Type", null);
                    session.setAttribute("prod" + i + "Brand", null);
                    session.setAttribute("prod" + i + "Price", null);
                    session.setAttribute("prod" + i + "Quantity", null);
                    session.setAttribute("prod" + i + "Description", null);
                }
            }
            request.getRequestDispatcher("catalogue.jsp").include(request, response);

        } catch (SQLException ex) {

            Logger.getLogger(CatalogueController.class.getName()).log(Level.SEVERE, null, ex);

        } 

    }

}
