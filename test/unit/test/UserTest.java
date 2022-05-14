/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package unit.test;

import junit.framework.Assert;
import org.junit.Test;
import static org.junit.Assert.*;
import uts.isd.model.User;

/**
 *
 * @author bluin
 */
public class UserTest {

    private User user;
    int userID = 1;
    String firstName = "Aa";
    String lastName = "Bb";
    String phone = "";
    String email = "aaa@aaa.aaa";
    String password = "aaa123";
    String userType = "Customer";
    boolean isActive = true;

    public UserTest() {
        user = new User(userID, firstName, lastName, phone, email, password, userType, isActive);
    }

    @Test
    public void testGetUserID() {
        int idT = user.getUserID();
        assertEquals(userID, idT);
    }

    @Test
    public void testGetFName() {
        String fnameT = user.getFirstName();
        assertEquals(firstName, fnameT);
    }

    @Test
    public void testGetLName() {
        String lnameT = user.getLastName();
        assertEquals(lastName, lnameT);
    }

    @Test
    public void testGetPhoneID() {
        String phoneT = user.getPhone();
        assertEquals(phone, phoneT);
    }

    @Test
    public void testGetEmail() {
        String emailT = user.getEmail();
        assertEquals(email, emailT);
    }

    @Test
    public void testGetPassword() {
        String passwordT = user.getPassword();
        assertEquals(password, passwordT);
    }

    @Test
    public void testUserType() {
        String typeT = user.getUserType();
        assertEquals(userType, typeT);
    }

    @Test
    public void testGetIsActive() {
        boolean activeT = user.isActive();
        assertEquals(isActive, activeT);
    }

}
