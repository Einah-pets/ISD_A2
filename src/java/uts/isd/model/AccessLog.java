/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model;

/**
 *
 * @author bluin
 */

public class AccessLog {
    private int userID;
    private String accessDate;
    private String accessTime; 
    private String userAction;

    public AccessLog(int userID, String accessDate, String accessTime, String userAction){
        this.userID = userID;
        this.accessDate = accessDate;
        this.accessTime = accessTime;
        this.userAction = userAction;
    }   
    
    public int getUserID() {
        return userID;
    }

    public String getAccessDate() {
        return accessDate;
    }

    public String getAccessTime() {
        return accessTime;
    }

    public String getUserAction() {
        return userAction;
    }
    

}
