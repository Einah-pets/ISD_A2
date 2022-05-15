/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

/**
 *
 * @author Wisam
 */
public class Payment {
    private int paymentId;
    private int orderId;
    private double amount;
    private boolean paymentStatus;
    private String paymentType;
    private int userId;

    public Payment(int paymentId, int orderId, double amount, boolean paymentStatus, String paymentType, int userId) {
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.amount = amount;
        this.paymentStatus = paymentStatus;
        this.paymentType = paymentType;
        this.userId = userId;
    }

    public int getPaymentId() {
        return paymentId;
    }

    /*public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }*/

    public int getOrderId() {
        return orderId;
    }

    /*public void setOrderId(int orderId) {
        this.orderId = orderId;
    }*/

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public boolean isPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(boolean paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public int getUserId() {
        return userId;
    }
    
}

