/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  bluin
 * Created: 23/04/2022
 */

CREATE TABLE Users (
    userID int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    firstName varchar(20),
    lastName varchar(20),
    phone varchar(10),
    email varchar(30),
    password varchar(30),
    PRIMARY KEY (userID)
);

CREATE TABLE Customer (
    customerID int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    dateOfRegistration date,
    userID int,
    PRIMARY KEY (customerID),
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);

CREATE TABLE Staff (
    staffID int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    location varchar(15),
    staffRole varchar(15),
    userID int,
    PRIMARY KEY (staffID)
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);

CREATE TABLE Product (
    productID int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    productName varchar(100),
    productType varchar(100),
    productBrand varchar(50),
    productPrice double,
    productQuantity int,
    productDescription varchar(1000),
    PRIMARY KEY (productID)
);

CREATE TABLE Orders (
    orderID int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    customerID int,
    orderStatus boolean,
    dateOfOrder date,
    deliveryID int,
    PRIMARY KEY (orderID),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID) ON DELETE CASCADE,
    FOREIGN KEY (deliveryID) REFERENCES Delivery(deliveryID) ON DELETE CASCADE
);

CREATE TABLE OrderLine (
    productID int NOT NULL,
    orderID int NOT NULL,
    quantity int,
    PRIMARY KEY (productID, orderID),
    FOREIGN KEY (productID) REFERENCES Product(productID) ON DELETE CASCADE,
    FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON DELETE CASCADE
);

CREATE TABLE Delivery (
    deliveryID int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    deliveryType varchar(10),
    deliveryDate date,
    deliveryStatus boolean,
    deliveryUnit int,
    deliveryStreetNo int,
    deliveryStreetName varchar(50),
    deliveryCity varchar(50),
    deliveryState varchar(3),
    deliveryCountry (varchar(50),
    PRIMARY KEY (deliveryID)
);

CREATE TABLE Payment (
    paymentID int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    orderID int,
    amount double,
    paymentStatus boolean,
    paymentType varchar(20)
    cardID int,
    PRIMARY KEY (paymentID),
    FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON DELETE CASCADE
    FOREIGN KEY (cardID) REFERENCES CreditCard(cardID) ON DELETE CASCADE
);

CREATE TABLE CreditCard (
    cardID int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    nameOnCard varchar(50),
    creditCardNo bigint,
    expirationDate Date,
    CVV int,
    PRIMARY KEY (cardID),
);

CREATE TABLE ApplicationAccessLog (
    appAccessID int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    userID int,
    accessDate date,
    accessTime time,
    userAction varchar(20),
    PRIMARY KEY (appAccessID),
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);

-- CREATE TABLE Afterpay (
--     afterpayID int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
--     afterpayUsername varchar(50),
--     afterpayPassword varchar(50),
--     paymentID int,
--     PRIMARY KEY (afterpayID),
--     FOREIGN KEY (paymentID) references Payment(paymentID) ON DELETE CASCADE
-- );
-- 
-- CREATE TABLE paypal (
--     paypalID int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
--     paypalUsername varchar(50),
--     paypalPassword varchar(50),
--     paymentID int,
--     PRIMARY KEY (paypalID),
--     FOREIGN KEY (paymentID) references Payment(paymentID) ON DELETE CASCADE
-- );

-- CREATE TABLE Refund (
--     refundID int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
--     customerID int,
--     orderID int,
--     refundStatus boolean,
--     PRIMARY KEY (refundID),
--     FOREIGN KEY (customerID) REFERENCES Customer(customerID) ON DELETE CASCADE,
--     FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON DELETE CASCADE
-- );

