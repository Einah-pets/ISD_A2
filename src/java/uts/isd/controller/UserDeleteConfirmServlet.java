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
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;
/**
 *
 * @author bluin
 */

public class UserDeleteConfirmServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        try{
            User user = manager.findUserEP(email, password);
            if (user != null){
                session.setAttribute("user", user);
                request.getRequestDispatcher("userDelete.jsp").include(request, response);
            }
            else{
                session.setAttribute("existErr","Error: User does not exist in the database.");
                request.getRequestDispatcher("userDelete.jsp").include(request, response);
            } 
        }
        catch (SQLException ex) {
            Logger.getLogger(UserDeleteConfirmServlet.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getErrorCode() + " and " + ex.getMessage());
        }
        response.sendRedirect("userDelete.jsp");
    }
}