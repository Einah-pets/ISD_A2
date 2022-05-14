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
public class OrderTest {

    private Order order;
    int orderID=1;
    int userID=1;
    String orderStatus="Test";
    String dateOfOrder="2022-05-14";
    int deliveryID=1;

    public OrderTest() {
        order = new Order(orderID, userID, orderStatus, dateOfOrder, deliveryID);
    }
    
    @Test
    public void testReturnOrderID(){
        int id = order.getOrderID();
        assertEquals(orderID,id);
    }
    
    @Test
    public void testReturnUserID(){
        int id = order.getUserID();
        assertEquals(userID,id);
    }
    
    @Test
    public void testReturnOrderStatus(){
        String status = order.getOrderStatus();
        assertEquals(orderStatus, status);
    }
    
    @Test
    public void testReturnDateOfOrder(){
        String date = order.getDateOfOrder();
        assertEquals(dateOfOrder,date);
    }
    
    @Test
    public void testReturnDeliveryID(){
        int id = order.getDeliveryID();
        assertEquals(deliveryID, id);
    }
    
    @Test
    public void testUpdateStatus(){
        order.setOrderStatus("Updated");
        String status = order.getOrderStatus();
        assertEquals("Updated", status);
    }
}
