/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model;


/**
 *
 * @author AlineStamboulian
 */
public class Delivery {
    public int deliveryid;
    public char deliveryType;
    public String deliveryDate;
    public boolean deliveryNotFound;
    public boolean deliveryOrderRecieved;
    public boolean deliveryInTransit;
    public boolean deliveryOutforDel;
    public int deliveryUnit;
    public int deliveryStreetNo;
    public char deliveryStreetName;
    public char deliveryCity;
    public char deliveryState;
    public char deliveryCountry;
    
          
    //initialise constructor
    public Delivery(int deliveryid, char deliveryType, String deliveryDate, boolean deliveryNotFound, boolean deliveryOrderRecieved, boolean deliveryInTransit, boolean deliveryOutforDel, int deliveryUnit, int deliveryStreetNo, char deliveryStreetName, char deliveryCity, char deliveryState, char deliveryCountry) {
        this.deliveryid = deliveryid;
        this.deliveryType = deliveryType;
        this.deliveryDate = deliveryDate;
        this.deliveryNotFound = deliveryNotFound;
        this.deliveryOrderRecieved = deliveryOrderRecieved;
        this.deliveryInTransit = deliveryInTransit;
        this.deliveryOutforDel = deliveryOutforDel;
        this.deliveryUnit = deliveryUnit;
        this.deliveryStreetNo = deliveryStreetNo;
        this.deliveryStreetName = deliveryStreetName;
        this.deliveryCity = deliveryCity;
        this.deliveryState = deliveryState;
        this.deliveryCountry = deliveryCountry;
        
    }       
    
    //getter setters
    public int getDeliveryID() {
        return deliveryid;
    }
    
    public char getdeliveryType(){
        return deliveryType;
    }
    public void setdeliveryType(char deliveryType){
        this.deliveryType = deliveryType;
    }

    public String getdeliveryDate(){
        return deliveryDate;
    }
    public void setdeliveryDate(String deliveryDate){
        this.deliveryDate = deliveryDate;
    }

    public boolean getdeliveryNotFound(){
        return deliveryNotFound;
    }
    public void setdeliveryNotFound(boolean deliveryNotFound){
        this.deliveryNotFound = deliveryNotFound;
    }

    public boolean getdeliveryOrderRecieved(){
        return deliveryOrderRecieved;
    }
    public void setdeliveryOrderRecieved(boolean deliveryOrderRecieved){
        this.deliveryOrderRecieved = deliveryOrderRecieved;
    }
    

    public boolean getdeliveryInTransit(){
        return deliveryInTransit;
    }
    public void setdeliveryInTransit(boolean deliveryInTransit){
        this.deliveryInTransit = deliveryInTransit;
    }
    
    public boolean getdeliveryOutforDel(){
        return deliveryOutforDel;
    }
    public void setdeliveryOutforDel(boolean deliveryOutforDel){
        this.deliveryOutforDel = deliveryOutforDel;
    }
    
    public int getdeliveryUnit(){
        return deliveryUnit;
    }
    public void setdeliveryUnit(int deliveryUnit){
        this.deliveryUnit = deliveryUnit;
    }
    
    public int getdeliveryStreetNo(){
        return deliveryStreetNo;
    }
    public void setdeliveryStreetNo(int deliveryStreetNo){
        this.deliveryStreetNo = deliveryStreetNo;
    }
    
    public char getdeliveryStreetName(){
        return deliveryStreetName;
    }
    public void setdeliveryStreetName(char deliveryStreetName){
        this.deliveryStreetName = deliveryStreetName;
    }

    public char getdeliveryCity(){
        return deliveryCity;
    }
    public void setdeliveryCity(char deliveryCity){
        this.deliveryCity = deliveryCity;
    }
    
    public char getdeliveryState(){
        return deliveryState;
    }
    public void setdeliveryState(char deliveryState){
        this.deliveryState = deliveryState;
    }
    

    public char getdeliveryCountry(){
        return deliveryCountry;
    }
    public void setdeliveryCountry(char deliveryCountry){
        this.deliveryCountry = deliveryCountry;
    }
    
   
}

