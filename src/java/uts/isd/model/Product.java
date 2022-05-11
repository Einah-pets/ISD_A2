/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model;

/**
 *
 * @author bluin
 */
public class Product {
    private int productID;
    private String productName;
    private String productType;
    private String productBrand;
    private double productPrice;
    private int productQuantity;
    private String productDescription;
            
                      

    //initialise constructor
    public Product(int productID, String productName, String productType, String productBrand, double productPrice, int productQuantity, String productDescription) {
        this.productID = productID;
        this.productName = productName;
        this.productType = productType;
        this.productBrand = productBrand;
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
        this.productDescription = productDescription;
    }       
    
    //getter setters
    public int getProductID() {
        return productID;
    }
    
    public String getProductName(){
        return productName;
    }
    
    public void setProductName(String productName){
        this.productName = productName;
    }
    
    public String getProductType(){
        return productType;
    }
    
    public void setProductType(String productType){
        this.productType = productType;
    }
    
    public String getProductBrand(){
        return productBrand;
    }
    
    public void setProductBrand(String productBrand){
        this.productBrand = productBrand;
    }
    
    public double getProductPrice(){
        return productPrice;
    }
    
    public void setProductPrice(double productPrice){
        this.productPrice = productPrice;
    }
    
    public int getProductQuantity(){
        return productQuantity;
    }
    
    public void setProductQuantity(int productQuantity){
        this.productQuantity = productQuantity;
    }
    
    public String getProductDescription(){
        return productDescription;
    }
    
    public void setProductDescription(String productDescription){
        this.productDescription = productDescription;
    }


   
}
