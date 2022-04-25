/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  bluin
 * Created: 25/04/2022
 */

/**customerID int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    dateOfRegistration date,
    userID int,
    PRIMARY KEY (customerID),
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
*/

INSERT INTO Customer (dateOfRegistration, userID) VALUES
('01/01/2022',21),
('01/01/2022',22),
('01/01/2022',23),
('08/01/2022',24),
('08/01/2022',25),
('16/01/2022',27),
('25/01/2022',28),
('25/01/2022',29),
('02/02/2022',30),
('06/02/2022',31),
('06/02/2022',32),
('01/03/2022',33),
('01/03/2022',34),
('30/03/2022',35),
('30/03/2022',36),
('07/05/2022',37),
('12/05/2022',38),
('20/05/2022',39),
('28/05/2022',40);
