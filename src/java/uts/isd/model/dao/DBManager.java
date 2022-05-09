/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model.dao;

/**
 *
 * @author bluin
 */
import uts.isd.model.*;
import java.sql.*;
import java.util.ArrayList;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
 */
public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    //Online Access User Management
    //Find user by email and password in the database   
    public User findUserEP(String email, String password) throws SQLException {
        String fetch = "select * from users where email = '" + email + "' and password = '" + password + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String userEmail = rs.getString(5);
            String userPassword = rs.getString(6);

            if (userEmail.equals(email) && userPassword.equals(password)) {
                int userID = rs.getInt(1);
                String userFirstName = rs.getString(2);
                String userLastName = rs.getString(3);
                String userPhone = rs.getString(4);
                String userType = rs.getString(7);
                boolean userIsActive = rs.getBoolean(8);
                return new User(userID, userFirstName, userLastName, userPhone, userEmail, userPassword, userType, userIsActive);
            }
        }
        return null;
    }

    //Add a user-data into the database   
    public void addUser(String firstName, String lastName, String email, String password, String phone, String userType) throws SQLException {
        boolean isActive = true;
        st.executeUpdate("insert into users" + "values ('" + firstName + "', '" + lastName + "', '" + email + "', '" + password + "', '" + phone + "', '" + userType + "', '" + isActive + "')");
    }

    //Add a customer-data into the database
    public void addCustomer(String dateOfRegistration, int userID) throws SQLException {
        st.executeUpdate("insert into customer" + "values ('" + dateOfRegistration + "', '" + userID + "')");
    }

    //Add a staff-data into the database
    public void addStaff(String location, String staffRole, int userID) throws SQLException {
        st.executeUpdate("insert into staff" + "values ('" + location + "', '" + staffRole + "', '" + userID + "')");
    }

    //update a user details in the database   
    public void updateUser(String email, String name, String password, String gender, String favcol) throws SQLException {
        //code for update-operation   

    }

    //delete a user from the database   
    public void deleteUser(String email) throws SQLException {
        //code for delete-operation   

    }

    //arraylist
    //checkuser
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //STEPH's PART
    // NOTE: orderStatus = order confirmed = not cart
    //when customer put items in cart, order is created with orderStatus 
    //Add a new order into the database   
    public void addOrder(int userID, String dateOfOrder, int deliveryID) throws SQLException {
        boolean orderStatus = false;
        st.executeUpdate("insert into Orders (userID, orderStatus, dateOfOrder, deliveryID)" + " values (" + userID + ", " + orderStatus + ", '" + dateOfOrder + "', " + deliveryID + ")");
    }

    //update a order status 
    public void updateOrderStatus(boolean orderStatus) throws SQLException {
        //code for update-operation   
        st.executeUpdate("UPDATE orders SET orderStatus='" + orderStatus + "'");

    }
    
    public ArrayList <Order> getOrders(int userID) throws SQLException{
        String fetch = "select * from orders where userID="+userID;
        ResultSet rs = st.executeQuery(fetch);
        ArrayList <Order> orders = new ArrayList();
        
        while(rs.next()){
            int orderID = rs.getInt(1);
            boolean orderStatus = rs.getBoolean(3);
            String orderDate = rs.getString(4);
            int deliveryID = rs.getInt(5);
            orders.add(new Order(orderID, userID, orderStatus, orderDate, deliveryID));
        }
        return orders;
    }

    public Order getLastOrder() throws SQLException {
        String fetch1 = "select count(*) from Orders";
        ResultSet rs1 = st.executeQuery(fetch1);
        rs1.next();
        int totalOrders = rs1.getInt(1);
        //totalOrders -= 1;

        String fetch = "select * from Orders where orderID =" + totalOrders;
        ResultSet rs = st.executeQuery(fetch);

        if (rs.next()) {
            int orderID = rs.getInt(1);
            int userID = rs.getInt(2);
            boolean orderStatus = rs.getBoolean(3);
            String dateOfOrder = rs.getString(4);
            int deliveryID = rs.getInt(5);

            Order cart = new Order(orderID, userID, orderStatus, dateOfOrder, deliveryID);

            return cart;
        }
        return null;
    }

    //add product to order
    public void addOrderLine(int productID, int orderID) throws SQLException {
        st.executeUpdate("insert into orderline(productID, orderID, quantity)" + "values (" + productID + ", " + orderID + ", 1 )");
    }

    //change product quantity in order
    public void updateOrderLine(int productID, int orderID, int productQuantity) throws SQLException {
        st.executeUpdate("update orderline set quantity =" + productQuantity + " where productID = " + productID + " and orderID = " + orderID);
    }

    //delete product from order
    public void deleteOrderLine(int productID, int orderID) throws SQLException {
        st.executeUpdate("delete from orderline where productID =" + productID + " and orderID =" + orderID );
    }

    public ArrayList<OrderLine> fetchOrderLines(int orderID) throws SQLException {
        String fetch = "select * from orderline where orderID=" + orderID;
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<OrderLine> temp = new ArrayList();

        while (rs.next()) {
            int productID = rs.getInt(1);
            int quantity = rs.getInt(3);
            temp.add(new OrderLine(productID, orderID, quantity));
        }
        return temp;
    }

    public OrderLine findOrderLine(int orderID, int productID) throws SQLException{
        String fetch = "select * from orderline where orderID=" + orderID + " and productID=" + productID;
        ResultSet rs = st.executeQuery(fetch);

        while(rs.next()){
            return new OrderLine (rs.getInt(1),rs.getInt(2), rs.getInt(3));
        }
        return null;
    }

    //retrieve all products in an order
    public ArrayList<Product> fetchProducts(ArrayList<OrderLine> orderlines) throws SQLException {

        ArrayList<Product> temp = new ArrayList();

        for (int i = 0; i < orderlines.size(); i++) {
            int productID = orderlines.get(i).getProductID();

            String fetchProducts = "select * from product where productID =" + productID;
            ResultSet rs2 = st.executeQuery(fetchProducts);
            while (rs2.next()) {
                String productName = rs2.getString(2);
                String productType = rs2.getString(3);
                String productBrand = rs2.getString(4);
                double productPrice = rs2.getDouble(5);
                int productQuantity = rs2.getInt(6);
                String productDescription = rs2.getString(7);
                temp.add(new Product(productID, productName, productType, productBrand, productPrice, productQuantity, productDescription));

            }
        }
        return temp;        //array of products objects that are in the order
    }



    //find a product by id
    public Product findProduct(int productID) throws SQLException {
        String fetch = "select * from product where productID = '" + productID + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            int id = rs.getInt(1);

            if (id == productID) {
                String productName = rs.getString(2);
                String productType = rs.getString(3);
                String productBrand = rs.getString(4);
                double productPrice = rs.getDouble(5);
                int productQuantity = rs.getInt(6);
                String productDescription = rs.getString(7);
                return new Product(productID, productName, productType, productBrand, productPrice, productQuantity, productDescription);
            }
        }
        return null;
    }

    //fetch all the products in the database
    public ArrayList<Product> fetchAllProducts() throws SQLException {
        String fetch = "select * from product";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Product> temp = new ArrayList();
        while (rs.next()) {
            int productID = rs.getInt(1);
            String productName = rs.getString(2);
            String productType = rs.getString(3);
            String productBrand = rs.getString(4);
            double productPrice = rs.getDouble(5);
            int productQuantity = rs.getInt(6);
            String productDescription = rs.getString(7);
            temp.add(new Product(productID, productName, productType, productBrand, productPrice, productQuantity, productDescription));

        }
        return temp;        //array of all products in database
    }

}
