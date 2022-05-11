/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model;

/**
 *
 * @author bluin
 */
public class OrderLine {
    private int productID;
    private int orderID;
    private int quantity;

                      

    //initialise constructor
    public OrderLine(int productID, int orderID, int quantity) {
        this.productID = productID;
        this.orderID = orderID;
        this.quantity = quantity;

    }       
    
    //getter setters
    public int getProductID() {
        return productID;
    }
    
    public int getOrderID() {
        return orderID;
    }

    public int getQuantity(){
        return quantity;
    }
    
    public void setQuantity(int quantity){
        this.quantity = quantity;
    }



   
}
