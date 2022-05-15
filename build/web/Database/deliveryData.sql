/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  bluin
 * Created: 25/04/2022
 */

/**DATE FORMAT NEEDS TO BE CHANGED TO YEAY-MONTH-DAY
**/

INSERT INTO Delivery (deliveryType, deliveryDate,deliveryStatus,deliveryUnit,deliveryStreetNo,deliveryStreetName,deliveryCity,deliveryState,deliveryCountry) VALUES
('Standard','2022-05-07','NotFound',19,100,'Broadway St','Sydney','NSW','Australia'),
('Standard','2022-05-07','OrderRecieved',1,103,'Wolli Ave','Sydney','NSW','Australia'),
('Standard','2022-05-10','OutForDel',49,40,'North St','Sydney','NSW','Australia'),
('Standard','2022-05-14','OutForDel',35,63,'Yalgar St','Sydney','NSW','Australia'),
('Standard','2022-05-16','InTransit',75,50,'Bath Rd','Sydney','NSW','Australia'),
('Standard','2022-06-05','OrderRecieved',43,87,'Graham Ave','Sydney','NSW','Australia'),
('Standard','2022-06-07','OrderRecieved',1,200,'Garnet Rd','Sydney','NSW','Australia'),
('Standard','2022-06-11','InTransit',7,50,'Easton Ave','Sydney','NSW','Australia'),
('Standard','2022-06-07','OutForDel',32,40,'Ellis St','Sydney','NSW','Australia'),
('Standard','2022-06-14','OutForDel',46,13,'Evelyn St','Sydney','NSW','Australia'),
('Standard','2022-06-21','OutForDel',35,17,'Edward St','Sydney','NSW','Australia'),
('Express','2022-07-20','InTransit',1,19,'Corea St','Sydney','NSW','Australia'),
('Express','2022-07-22','OutForDel',9,103,'Houston St','Sydney','NSW','Australia'),
('Express','2022-07-28','InTransit',45,160,'Oxford St','Sydney','NSW','Australia'),
('Express','2022-08-03','InTransit',186,54,'High St','Sydney','NSW','Australia'),
('Express','2022-08-04','InTransit',193,74,'Kanning Ave','Sydney','NSW','Australia'),
('Express','2022-08-12','OutForDel',99,20,'Carter Cres','Sydney','NSW','Australia'),
('Express','2022-08-20','OutForDel',12,64,'Jones St','Sydney','NSW','Australia'),
('Express','2022-09-23','OrderRecieved',9,136,'Market St','Sydney','NSW','Australia'),
('Express','2022-09-24','NotFound',99,12,'Pitt St','Sydney','NSW','Australia');

