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
public class UserUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        int userID = request.getIntHeader("userID");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email"); 
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");
        boolean isActive = true;
        DBManager manager = (DBManager) session.getAttribute("manager");
        validator.clear(session);
        User user = new User(userID, firstName, lastName, phone, email, password, userType, isActive);    
        
        if(!validator.validateName(firstName)){
            session.setAttribute("updateNameErr","Incorrect first name format");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        }
        else if(!validator.validateName(lastName)){
            session.setAttribute("updateNameErr","Incorrect last name format");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        }
        else if(!validator.validatePhone(phone)){
            session.setAttribute("updatePhoneErr","Incorrect phone format");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        }
        else if(!validator.validatePassword(password)){
            session.setAttribute("updatePasswordErr","Incorrect password format");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
        }
        else{
            try{
                if (user != null){
                    session.setAttribute("user", user);
                    manager.updateUser(firstName, lastName, phone, email, password);
                    session.setAttribute("updated", "Information successfully updated.");
                    request.getRequestDispatcher("userEdit.jsp").include(request, response);
                    user = manager.findUserE(email);
                    session.setAttribute("user", user);
                }
                else{
                    session.setAttribute("updated", "Information update was not successful.");
                    request.getRequestDispatcher("userEdit.jsp").include(request, response);
                }
            }
            catch (SQLException ex) {
                Logger.getLogger(UserUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("userEdit.jsp");
        }
    }
}
