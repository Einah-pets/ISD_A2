/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  bluin
 * Created: 25/04/2022
 */

--Customer users
INSERT INTO Users (firstName,lastName,phone,email,password,userType,isActive) VALUES 
('Anonymous','User','','','','Customer',true),
('Denis','Samar','0433333332','denis.s@student.uts.edu.au','deniss123','Customer',true),
('Howard','Sander','0433333333','howard.s@student.uts.edu.au','howards123','Customer',true),
('Lyona','Ibarion','0433333334','Lyona.i@student.uts.edu.au','lyonai123','Customer',true),
('Om','Parisi','0433333335','om.p@student.uts.edu.au','omp123','Customer',true),
('Mei','Kiefer','0433333336','mei.k@student.uts.edu.au','meik123','Customer',true),
('Audrea','Das','0433333337','audrea.d@student.uts.edu.au','audread123','Customer',true),
('Paul','Newman','0433333338','paul.n@student.uts.edu.au','pauln123','Customer',true),
('Moran','Klein','0433333339','moran.k@student.uts.edu.au','morank123','Customer',true),
('Irma','doe','0433333330','irma.d@student.uts.edu.au','irmad123','Customer',true),
('Azad','Keo','0444444441','azad.k@student.uts.edu.au','azadk123','Customer',true),
('Daisy','Rhoda','0444444442','daysi.r@student.uts.edu.au','daisyr123','Customer',true),
('Ivan','Burel','0444444443','ivan.b@student.uts.edu.au','ivanb123','Customer',true),
('Nusa','Jamie','0444444444','nusa.j@student.uts.edu.au','nusaj123','Customer',true),
('Eliza','Artsen','0444444445','eliza.a@student.uts.edu.au','elizaa123','Customer',true),
('Kaapo','Coste','0444444446','kappo.c@student.uts.edu.au','kaapoc123','Customer',false),
('Ines','Dirix','0444444447','ines.d@student.uts.edu.au','inesd123','Customer',false),
('Kaya','Ngoc','0444444448','kaya.n@student.uts.edu.au','kayan123','Customer',false),
('Ryu','Himura','0444444449','ryu.h@student.uts.edu.au','ryuh123','Customer',false),
('Rajeev','Morish','0444444440','rajeev.m@student.uts.edu.au','rajeevm123','Customer',false);

--Staff users
INSERT INTO Users (firstName,lastName,phone,email,password,userType,isActive) VALUES 
('Anna','Barton','0411111111','anna.b@uts.edu.au','annab123','Staff',true),
('Alvena','Nurten','0411111112','alvena.n@uts.edu.au','alvenan123','Staff',true),
('Simon','Mirja','0411111113','simon.m@uts.edu.au','simonm123','Staff',true),
('Warren','Chi','0411111114','warren.c@uts.edu.au','warrenc123','Staff',true),
('Sophie','Tran','0411111115','sophie.t@uts.edu.au','sophiet123','Staff',true),
('Petter','Volkov','0411111116','petter.v@uts.edu.au','petterv123','Staff',true),
('Emma','Hud','0411111117','emma.h@uts.edu.au','emmah123','Staff',true),
('Teresa','Bray','0411111118','teresa.b@uts.edu.au','teresab123','Staff',true),
('Nick','Smith','0411111119','nick.s@uts.edu.au','nicks123','Staff',true),
('Christian','Sepi','0411111110','christian.s@uts.edu.au','christians123','Staff',true),
('Dexter','Suha','0422222221','dexter.s@uts.edu.au','dexters123','Staff',true),
('Demi','Thomson','0422222222','demi.t@uts.edu.au','demit123','Staff',true),
('Susana','Gehrin','0422222223','susana.g@uts.edu.au','susanag123','Staff',true),
('Wei','Min','0422222224','wei.m@uts.edu.au','weim123','Staff',true),
('Emilio','Backus','0422222225','emilio.b@uts.edu.au','emiliob123','Staff',true),
('Hope','Lee','0422222226','hope.l@uts.edu.au','hopel123','Staff',false),
('Katherina','Senft','0422222227','katherina.s@uts.edu.au','katherinas123','Staff',false),
('Mathilde','Dufort','0422222228','mathilde.d@uts.edu.au','mathilded123','Staff',false),
('Anya','Holgeir','0422222229','anya.h@uts.edu.au','anyah123','Staff',false),
('Yuko','Okamoto','0422222220','yuko.o@uts.edu.au','yulkoo123','Staff',false);



