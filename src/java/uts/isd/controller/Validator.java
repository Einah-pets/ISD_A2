/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bluin
 */
public class Validator implements Serializable {

    private String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";
    private String namePattern = "([A-Z][a-z]*)";
    private String passwordPattern = "[a-z0-9]{4,}";
    private String phonePattern = "^[0-9]{10}$";
    private String datePattern = "^\\d{4}\\-(0[1-9]|1[012])\\-(0[1-9]|[12][0-9]|3[01])$";

    public Validator() {
    }

    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }

    public boolean checkEmpty(String email, String password) {
        return email.isEmpty() || password.isEmpty();
    }

    public boolean validateEmail(String email) {
        return validate(emailPattern, email);
    }

    public boolean validateName(String name) {
        return validate(namePattern, name);
    }

    public boolean validatePassword(String password) {
        return validate(passwordPattern, password);
    }
    
    public boolean validatePhone(String phone) {
        return validate(phonePattern, phone);
    }
    
    public boolean validateDate(String date) {
        return validate(datePattern, date);
    }
    
    public void clear(HttpSession session){
        session.setAttribute("emailErr","Enter email");
        session.setAttribute("passwordErr","Enter password");
        session.setAttribute("existErr","");
        session.setAttribute("firstNameErr","Enter first name");
        session.setAttribute("lastNameErr","Enter last name");
        session.setAttribute("phoneErr","Enter phone number");
        session.setAttribute("updated","");
        session.setAttribute("updatePasswordErr","");
        session.setAttribute("updateNameErr","");
        session.setAttribute("updatePhoneErr","");
        session.setAttribute("dateErr","");
    }
}
