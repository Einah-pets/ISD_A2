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
public class AccessLogViewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = request.getParameter("userID");
        DBManager manager = (DBManager) session.getAttribute("manager");
        ArrayList<AccessLog> allUserLogs;
        
        try{
            allUserLogs = manager.fetchAllAccessLog(Integer.parseInt(userID));
            session.setAttribute("accessLog", allUserLogs);
            session.setAttribute("accessLogDateErr", "");
            request.getRequestDispatcher("accessLog.jsp").include(request, response);
        }
        catch (SQLException ex) {
            Logger.getLogger(AccessLog.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
