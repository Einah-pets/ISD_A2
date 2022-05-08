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
public class UserDeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
//        int userID = request.getIntHeader("userID");
//        String firstName = request.getParameter("firstName");
//        String lastName = request.getParameter("lastName");
//        String phone = request.getParameter("phone");
        String email = request.getParameter("email"); 
        String password = request.getParameter("password");
//        String userType = request.getParameter("userType");
//        boolean isActive = true;
        DBManager manager = (DBManager) session.getAttribute("manager");
//        User user = new User(userID, firstName, lastName, phone, email, password, userType, isActive);
        
        try{
            User user = manager.findUserEP(email, password);
            if (user != null){
                //add log?
                manager.deleteUser(email);
                session.invalidate();
                request.getRequestDispatcher("userDeleteSuccess.jsp").include(request, response);
            }
        }
        catch (SQLException | NullPointerException ex) {
            Logger.getLogger(UserDeleteServlet.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage() == null ? "User does not exist" : "welcome");
        }
        //response.sendRedirect("userDeleteSuccess.jsp");
    }
}
