/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model;

/**
 *
 * @author bluin
 */
public class Order {
    private int orderID;
    private int userID;
    private boolean orderStatus;
    private String dateOfOrder;
    private int deliveryID;
            
                      

    //initialise constructor
    public Order(int orderID, int userID, boolean orderStatus, String dateOfOrder, int deliveryID) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderStatus = orderStatus;
        this.dateOfOrder = dateOfOrder;
        this.deliveryID = deliveryID;
    }       
    
    //getter setters
    public int getOrderID() {
        return orderID;
    }

    public int getUserID() {
        return userID;
    }

    public boolean getOrderStatus() {
        return orderStatus;
    }  
    
    public void setOrderStatus(boolean orderStatus){
        this.orderStatus = orderStatus;
    }
    
    public String getDateOfOrder(){
        return dateOfOrder;
    }
    
    public void setDateOfOrder(String dateOfOrder){
        this.dateOfOrder = dateOfOrder;
    }
    
    public int getDeliveryID(){
        return deliveryID;
    }
   
}
