/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model.dao;

/**
 *
 * @author bluin
 */

import uts.isd.model.User;
import java.sql.*;
import java.util.ArrayList;
import uts.isd.model.AccessLog;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class DBManager {
    private Statement st;

    public DBManager(Connection conn) throws SQLException {       
       st = conn.createStatement();   
    }
    
    //Online Access User Management
    //Find user by email and password in the database   
    public User findUserEP(String email, String password) throws SQLException {       
       String fetch = "select * from users where email = '" + email + "' and password = '" + password + "'";      
       ResultSet rs = st.executeQuery(fetch);
       
       while (rs.next()) {
           String userEmail = rs.getString(5); 
           String userPassword = rs.getString(6); 
           
           if (userEmail.equals(email) && userPassword.equals(password)){
                int userID = rs.getInt(1);
                String userFirstName = rs.getString(2);
                String userLastName = rs.getString(3);
                String userPhone = rs.getString(4);
                String userType = rs.getString(7);
                boolean userIsActive = rs.getBoolean(8);
                return new User(userID, userFirstName, userLastName, userPhone, userEmail, userPassword, userType, userIsActive);
           }
       }              
       return null;   
    }

    //Add a user-data into the database   
    public void addUser(String firstName, String lastName, String email, String password, String phone, String userType) throws SQLException {  
        boolean isActive = true;
        st.executeUpdate("INSERT INTO users" + "VALUES ('" + firstName + "', '" + lastName + "', '" + email + "', '" + password + "', '" + phone + "', '" + userType + "', '" + isActive + "')");   
    }
    
    //Add a customer-data into the database
    public void addCustomer(String dateOfRegistration, int userID) throws SQLException {  
        st.executeUpdate("INSERT INTO customer" + "VALUES ('" + dateOfRegistration + "', '" + userID + "')");   
    }
    
    //Add a staff-data into the database
    public void addStaff(String location, String staffRole, int userID) throws SQLException {  
        st.executeUpdate("INSERT INTO staff" + "VALUES ('" + location + "', '" + staffRole + "', '" + userID + "')");   
    }
    
    //update a user details in the database   
    public void updateUser( String firstName, String lastName, String password, String phone) throws SQLException {       
       st.executeUpdate("UPDATE ISDUSER.users SET firstName ='"+ firstName +"', lastName ='"+ lastName +"', password ='"+ password +"', phone ='"+ phone +"'");   
    } 
    
    //update a staff user details in the database
     public void updateStaff( String location, String staffRole) throws SQLException {       
       st.executeUpdate("UPDATE ISDUSER.users SET location ='"+ location +"', staffRole ='"+ staffRole +"'");   
    } 

    //delete a user from the database   
    public void deleteUser(int userID) throws SQLException{       
        st.executeUpdate("DELETE FROM ISDUSER.customer WHERE userID ='"+ userID +"'");  
        st.executeUpdate("DELETE FROM ISDUSER.staff WHERE userID ='"+ userID +"'");  
        st.executeUpdate("DELETE FROM ISDUSER.users WHERE userID ='"+ userID +"'");   
    }

    //arraylist
    public ArrayList<AccessLog> fetchAccessLog() throws SQLException {
        String fetch = "SELECT * FROM accessLog";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<User> accessLogArray = new ArrayList();
        
        while (rs.next()){
            int appAccessID = rs.getInt(1);
            int userID = rs.getInt(2);
            String accessDate = rs.getString(3);
            String accessTime = rs.getString(4);
            String userAction = rs.getString(5)
            
        }
    
    }
    
    //checkuser
    public boolean checkUser(String email, String password) throws SQLException {
        String fetch = "SELECT * FROM ISDUSER.users WHERE email =";
    }
    
    
}