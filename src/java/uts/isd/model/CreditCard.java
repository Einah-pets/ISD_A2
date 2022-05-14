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
public class CreditCard {
    private int cardID;
    private String nameOnCard;
    private int creditCardNo;
    private String expirationDate;
    private int CVV;

    public CreditCard(int cardID, String nameOnCard, int creditCardNo, String expirationDate, int CVV) {
        this.cardID = cardID;
        this.nameOnCard = nameOnCard;
        this.creditCardNo = creditCardNo;
        this.expirationDate = expirationDate;
        this.CVV = CVV;
    }
    

    public int getCardID() {
        return cardID;
    }

    /*public void setCardID(int cardID) {
        this.cardID = cardID;
    }*/

    public String getNameOnCard() {
        return nameOnCard;
    }

    public void setNameOnCard(String nameOnCard) {
        this.nameOnCard = nameOnCard;
    }

    public int getCreditCardNo() {
        return creditCardNo;
    }

    public void setCreditCardNo(int creditCardNo) {
        this.creditCardNo = creditCardNo;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    public int getCVV() {
        return CVV;
    }

    public void setCVV(int CVV) {
        this.CVV = CVV;
    }
    
    
}
