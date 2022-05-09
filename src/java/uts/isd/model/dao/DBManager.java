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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
    
    //Online Access User Management //////////////////////////////////////////////////////////////////////////////////
    //Find user by email and password in the database   
    public User findUserEP(String email, String password) throws SQLException, NullPointerException {       
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
    
    //Find user by email only
    public User findUserE(String email) throws SQLException, NullPointerException {       
       String fetch = "select * from users where email = '" + email + "'";      
       ResultSet rs = st.executeQuery(fetch);
       
       while (rs.next()) {
           String userEmail = rs.getString(5); 
           
           if (userEmail.equals(email)){
                int userID = rs.getInt(1);
                String userFirstName = rs.getString(2);
                String userLastName = rs.getString(3);
                String userPhone = rs.getString(4);
                String userPassword = rs.getString(6);
                String userType = rs.getString(7);
                boolean userIsActive = rs.getBoolean(8);
                return new User(userID, userFirstName, userLastName, userPhone, userEmail, userPassword, userType, userIsActive);
           }
       }              
       return null;   
    }

    //Add a user-data into the database 
    public void addUser(String firstName, String lastName, String phone, String email, String password, String userType) throws SQLException, NullPointerException {  
        boolean isActive = true;
        st.executeUpdate("INSERT INTO users (firstName,lastName,phone,email,password,userType,isActive) VALUES ('"+ firstName +"', '" +lastName +"', '"+ phone +"', '"+ email +"', '"+ password +"', '"+ userType +"', "+ isActive +")");   
    }
    
    //Add a customer-data into the database
    public void addCustomer(String dateOfRegistration, int userID) throws SQLException, NullPointerException {  
        st.executeUpdate("INSERT INTO customer VALUES ('" + dateOfRegistration + "', " + userID + ")");   
    }
    
    //Add a staff-data into the database
    public void addStaff(String location, String staffRole, int userID) throws SQLException, NullPointerException {  
        st.executeUpdate("INSERT INTO staff VALUES ('" + location + "', '" + staffRole + "', " + userID + ")");   
    }
    
    //update a user details in the database   
    public void updateUser(String firstName, String lastName, String phone, String email, String password) throws SQLException, NullPointerException {       
       st.executeUpdate("UPDATE ISDUSER.users SET firstName ='"+ firstName +"', lastName ='"+ lastName +"', phone ='"+ phone +"', password ='"+ password +"' WHERE email='"+ email +"'");   
    } 
    
    //update a staff user details in the database
    public void updateStaff(int userID, String location, String staffRole) throws SQLException, NullPointerException {       
       st.executeUpdate("UPDATE ISDUSER.users SET location ='"+ location +"', staffRole ='"+ staffRole +"' WHERE userID = "+ userID +"");   
    } 

    //delete a user from the database 
//    public void deleteUser(int userID) throws SQLException, NullPointerException{       
//        st.executeUpdate("DELETE FROM ISDUSER.customer WHERE userID ="+ userID +""); 
//        st.executeUpdate("DELETE FROM ISDUSER.staff WHERE userID ="+ userID +""); 
//        st.executeUpdate("DELETE FROM ISDUSER.users WHERE userID ="+ userID +"");   
//    }
    
    //deactivate a user
    public void deactivateUser(String email) throws SQLException, NullPointerException {
        boolean isActive = false;
        st.executeUpdate("UPDATE ISDUSER.users SET isActive ="+ isActive +" WHERE email='"+ email +"'");   
    } 

    //checkuser with email and password
    public boolean checkUser(String email, String password) throws SQLException, NullPointerException {
        String fetch = "SELECT * FROM ISDUSER.users WHERE email ='"+ email +"' and password='"+ password+"'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()){
            String userEmail = rs.getString(5);
            String userPassword = rs.getString(6);
            if (userEmail.equals(email) && userPassword.equals(password)){
                return true;
            }
        }
        return false;
    }
    
    //Add a user access log
    public void addAccessLog(int userID, String userAction) throws SQLException, NullPointerException {
        LocalDateTime currentDateTime = LocalDateTime.now();
        String accessDate = currentDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String accessTime = currentDateTime.format(DateTimeFormatter.ofPattern("HH:mm"));
        st.executeUpdate("INSERT INTO ApplicationAccessLog (userID, accessDate, accessTime, userAction) VALUES ("+ userID +", '"+ accessDate +"', '"+ accessTime +"', '"+ userAction +"')");
    }
    
    //list all access logs for a specific user
    public ArrayList<AccessLog> fetchAllAccessLog(int userID) throws SQLException, NullPointerException {
        String fetch = "SELECT * FROM ApplicationAccessLog WHERE userID = "+ userID +"";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<AccessLog> accessLogArray = new ArrayList();
        
        while (rs.next()){
            int appAccessID = rs.getInt(1);
            String accessDate = rs.getString(3);
            String accessTime = rs.getString(4);
            String userAction = rs.getString(5);
            accessLogArray.add(new AccessLog(appAccessID, userID, accessDate, accessTime, userAction));
        }
        return accessLogArray;
    }
    
    //search access log for a specific user by date
    public ArrayList<AccessLog> fetchAccessLog(int userID, String accessDate) throws SQLException, NullPointerException {
        String fetch = "SELECT * FROM ApplicationAccessLog WHERE userID = "+ userID +" and accessDate = '"+ accessDate +"'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<AccessLog> accessLogArray = new ArrayList();
        
        while (rs.next()){
            int appAccessID = rs.getInt(1);
            String accessTime = rs.getString(4);
            String userAction = rs.getString(5);
            accessLogArray.add(new AccessLog(appAccessID, userID, accessDate, accessTime, userAction));
        }
        return accessLogArray;
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}