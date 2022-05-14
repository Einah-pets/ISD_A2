/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package unit.test;

import junit.framework.Assert;

import org.junit.Test;

import static org.junit.Assert.*;

import uts.isd.model.*;

/**
 *
 * @author Stephanie
 */
public class OrderLineTest {

    private OrderLine orderline;
    int productID=1;
    int orderID=1;
    int quantity=1;
    
    public OrderLineTest(){
        orderline = new OrderLine(productID,orderID,quantity);
    }
    
    @Test
    public void testReturnProductID(){
        int id = orderline.getProductID();
        assertEquals(productID,id);
    }
    
    @Test
    public void testReturnOrderID(){
        int id = orderline.getOrderID();
        assertEquals(orderID,id);
    }
    
    @Test
    public void testReturnQuantity(){
        int qty = orderline.getQuantity();
        assertEquals(quantity,qty);
    }
    
    @Test
    public void testUpdateQuantity(){
        orderline.setQuantity(2);
        int qty = orderline.getQuantity();
        assertEquals(2,qty);
    }
    
}
