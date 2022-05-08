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
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");
        DBManager manager = (DBManager) session.getAttribute("manager");
        validator.clear(session);
        
        if(!validator.validateName(firstName)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("register.jsp").include(request, response);
        }
        else if(!validator.validateName(lastName)){
            session.setAttribute("nameErr","Incorrect name format");
            request.getRequestDispatcher("register.jsp").include(request, response);
        }
//        else if(!validator.validatePhone(phone)){
//            session.setAttribute("phoneErr","Incorrect phone format");
//            request.getRequestDispatcher("register.jsp").include(request, response);
//        }
        else if(!validator.validateEmail(email)){
            session.setAttribute("emailErr","Incorrect email format");
            request.getRequestDispatcher("register.jsp").include(request, response);
        }
        else if(!validator.validatePassword(password)){
            session.setAttribute("passwordErr","Incorrect password format");
            request.getRequestDispatcher("register.jsp").include(request, response);
        }
        else{
            try{
                User exist = manager.findUserE(email);
                if (exist != null){
                    session.setAttribute("existErr", "This user already exist in the database.");
                    request.getRequestDispatcher("register.jsp").include(request, response);
                }
                else{
                    manager.addUser(firstName, lastName, phone, email, password, userType);
                    User user = manager.findUserEP(email, password);
                    session.setAttribute("user", user);
                    request.getRequestDispatcher("main.jsp").include(request, response);
                }
            }
            catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    
}
