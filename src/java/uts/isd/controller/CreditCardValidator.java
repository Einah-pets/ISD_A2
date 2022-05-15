/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;
import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Wisam
 */
public class CreditCardValidator implements Serializable {
    private String nameOnCardPattern = "^[a-zA-z ]{2,30}$";
    private String creditCardNoPattern = "^[0-9]{16}$";
    private String cvvPattern = "^[0-9]{3}$";
    
    
    public CreditCardValidator() {
    }
    
    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }
    
    public boolean validateNameOnCard(String nameOnCard) {
        return validate(nameOnCardPattern, nameOnCard);
    }
    
    public boolean validateCreditCardNo(String creditCardNo) {
        return validate(creditCardNoPattern, creditCardNo);
    }
    
    public boolean validateCVV(String cvv) {
        return validate(cvvPattern, cvv);
    }
    
    public void clear(HttpSession session){
        session.setAttribute("nameOnCardErr","Enter Name on Card");
        session.setAttribute("creditCardNoErr","Enter Credit Card No.");
        session.setAttribute("cvvErr","Enter CVV");
    }
}
