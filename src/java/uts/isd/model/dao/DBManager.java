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
        st.executeUpdate("insert into users" + "values ('" + firstName + "', '" + lastName + "', '" + email + "', '" + password + "', '" + phone + "', '" + userType + "', '" + isActive + "')");   
    }
    
    //Add a customer-data into the database
    public void addCustomer(String dateOfRegistration, int userID) throws SQLException {  
        st.executeUpdate("insert into customer" + "values ('" + dateOfRegistration + "', '" + userID + "')");   
    }
    
    //Add a staff-data into the database
    public void addStaff(String location, String staffRole, int userID) throws SQLException {  
        st.executeUpdate("insert into staff" + "values ('" + location + "', '" + staffRole + "', '" + userID + "')");   
    }
    
    //update a user details in the database   
    public void updateUser( String email, String name, String password, String gender, String favcol) throws SQLException {       
       //code for update-operation   

    }       

    //delete a user from the database   
    public void deleteUser(String email) throws SQLException{       
       //code for delete-operation   

    }

    //arraylist
    
    //checkuser
    
    
}