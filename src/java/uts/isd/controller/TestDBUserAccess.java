/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.sql.*;
import java.util.*;
import java.util.logging.*;
import uts.isd.model.AccessLog;
import uts.isd.model.User;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author bluin
 */
public class TestDBUserAccess {
    private static Scanner in = new Scanner(System.in);
    private DBConnector connector;
    private Connection conn;
    private DBManager db;

    public static void main(String[] args) throws SQLException{
        (new TestDBUserAccess()).runQueries();
    }
    
    public TestDBUserAccess() {
        try {
            connector = new DBConnector();
            conn = connector.openConnection();
            db = new DBManager(conn);
        } 
        catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestDBUserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private char readChoice(){
        System.out.println("Operation CRUDS or * to exit: ");
        return in.nextLine().charAt(0);
    }
    
    private void runQueries() throws SQLException{
        char c;
        
        while ((c = readChoice()) != '*'){
            switch(c){
                case 'c': testAddUser(); break;
                case 'r': testRead(); break;
                case 'u': testUpdate(); break;
                case 'd': testDelete(); break;
                case 's': showAllAccessLog(); break;
                case 'a': testAddAccessLog(); break;
                case 'b': showAllAccessLogDate(); break;
                default: System.out.println("Unknown command"); break;
            }
        }
    }
    
    //testAdd for user
    private void testAddUser(){
        System.out.print("User fName: ");
        String fName = in.nextLine();
        System.out.print("User lName: ");
        String lName = in.nextLine();
        System.out.print("User phone: ");
        String phone = in.nextLine();
        System.out.print("User email: ");
        String email = in.nextLine();
        System.out.print("User password: ");
        String password = in.nextLine();
        System.out.print("User userType: ");
        String userType = in.nextLine();
        
        try {
            db.addUser ( fName, lName, phone, email, password, userType);
        }
        catch (SQLException ex){
            Logger.getLogger(TestDBUserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        System.out.println("User is added to the database.");
    }
       
    //testRead for user
    private void testRead()throws SQLException {
        System.out.println("User email: ");
        String email = in.nextLine();
        System.out.println("User password: ");
        String password = in.nextLine();
        
        User user = db.findUserEP(email, password);
        if (user != null){
            System.out.println("User "+ user.getFirstName() +" "+ user.getLastName()+" exists.");
        }
        else{
            System.out.println("No such user.");
        }
    }
    
    //testUpdate for user
    private void testUpdate(){
        System.out.println("User email: ");
        String email = in.nextLine();
        System.out.println("User password: ");
        String password = in.nextLine();
        
        try{
            if (db.checkUser(email, password)){
                System.out.println("First name: ");
                String firstName = in.nextLine();
                System.out.println("Last name: ");
                String lastName = in.nextLine();
                System.out.println("Phone: ");
                String phone = in.nextLine();
                System.out.println("Password: ");
                String newPassword = in.nextLine();
                db.updateUser(firstName,lastName,phone,email,newPassword);
            }
            else{
                System.out.println("No such user.");
            }
        }
        catch (SQLException ex){
            Logger.getLogger(TestDBUserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //testDelete for user
//    private void testDelete(){
//        System.out.println("User ID: ");
//        int userID = in.nextInt();
//        in.nextLine();
//
//        try{
//                db.deleteUser(userID);
//        }
//        catch (SQLException ex){
//            Logger.getLogger(TestDBUserAccess.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    
    //testDelete for user as deactivate
        private void testDelete(){
        System.out.println("User email: ");
        String email = in.nextLine();

        try{
            db.deactivateUser(email);
        }
        catch (SQLException ex){
            Logger.getLogger(TestDBUserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //testAdd for access Log
    private void testAddAccessLog(){
        System.out.print("UserID: ");
        int userID = in.nextInt();
        in.nextLine();
//        System.out.println("Access date: ");
//        String accessDate = in.nextLine();
//        System.out.print("Access time: ");
//        String accessTime = in.nextLine();
        System.out.print("User action: ");
        String userAction = in.nextLine();
               
        try {
            db.addAccessLog(userID, userAction );
        }
        catch (SQLException ex){
            Logger.getLogger(TestDBUserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        System.out.println("Access log added to the database.");
    }
    
    //showAll for a user's access log
    private void showAllAccessLog(){
        System.out.print("UserID: ");
        int userID = in.nextInt();
        in.nextLine();
        
        try{
            ArrayList<AccessLog> accessLogs = db.fetchAllAccessLog(userID);
            System.out.println("Logs:");
            accessLogs.stream().forEach((log) -> {
                System.out.printf("%-20s %-20s %-20s \n", log.getAccessDate(), log.getAccessTime(), log.getUserAction());
            });
        }
        catch (SQLException ex){
            Logger.getLogger(TestDBUserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //showAll for a user's access log at a specific date
    private void showAllAccessLogDate(){
        System.out.print("UserID: ");
        int userID = in.nextInt();
        in.nextLine();
        System.out.print("Date: ");
        String accessDate = in.nextLine();
        
        try{
            ArrayList<AccessLog> accessLogs = db.fetchAccessLog(userID, accessDate);
            System.out.println("Logs:");
            accessLogs.stream().forEach((log) -> {
                System.out.printf("%-20s %-20s %-20s \n", log.getAccessDate(), log.getAccessTime(), log.getUserAction());
            });
        }
        catch (SQLException ex){
            Logger.getLogger(TestDBUserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
