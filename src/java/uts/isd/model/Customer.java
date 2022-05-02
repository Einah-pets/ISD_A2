/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model;

/**
 *
 * @author bluin
 */
public class Customer {
    private String dateOfRegistration;
    private int userID;

    //initialise constructor
    public Customer(String dateOfRegistration, int userID) {
        this.dateOfRegistration = dateOfRegistration;
        this.userID = userID;
    }       
    
    //getter setters
    public String getDateOfRegistration() {
        return dateOfRegistration;
    }

    public void setDateOfRegistration(String dateOfRegistration) {
        this.dateOfRegistration = dateOfRegistration;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }  
   
}
