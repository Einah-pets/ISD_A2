/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package unit.test;

import junit.framework.Assert;
import org.junit.Test;
import static org.junit.Assert.*;
import uts.isd.model.AccessLog;

/**
 *
 * @author bluin
 */
public class LogTest {

    private AccessLog testLog;
    int appAccessID = 1;
    int userID = 2;
    String accessDate = "2022-10-03";
    String accessTime = "18:00"; 
    String userAction = "Login";

    public LogTest(){
        testLog = new AccessLog(appAccessID, userID, accessDate, accessTime, userAction);
    }

    @Test
    public void testGetAppAccessID() {
        int accessIDT = testLog.getAppAccessID();
        assertEquals(appAccessID, accessIDT);
    }

    @Test
    public void testGetUserID() {
        int userT = testLog.getUserID();
        assertEquals(userID, userT);
    }

    @Test
    public void testGetAccessDate() {
        String dateT = testLog.getAccessDate();
        assertEquals(accessDate, dateT);
    }

    @Test
    public void testGetAccessTime() {
        String timeT = testLog.getAccessTime();
        assertEquals(accessTime, timeT);
    }

    @Test
    public void testGetUserAction() {
        String actionT = testLog.getUserAction();
        assertEquals(userAction, actionT);
    }


}
