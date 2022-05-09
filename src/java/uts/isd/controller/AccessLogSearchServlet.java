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
public class AccessLogSearchServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        User user = (User) session.getAttribute("user");
        String accessDate = request.getParameter("accessDate");
        DBManager manager = (DBManager) session.getAttribute("manager");
        ArrayList<AccessLog> searchUserLogs;
        validator.clear(session);

        if (!validator.validateDate(accessDate)) {
            session.setAttribute("dateErr", "Incorrect date format");
            request.getRequestDispatcher("accessLog.jsp").include(request, response);
        } 
        else {
            try {
                searchUserLogs = manager.fetchAccessLog(user.getUserID(), accessDate);
                session.setAttribute("accessLog", searchUserLogs);
                session.setAttribute("accessLogDateErr", "");
                request.getRequestDispatcher("accessLog.jsp").include(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(AccessLogSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
