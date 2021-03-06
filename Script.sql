DROP TABLE CUSTOMER;
DROP TABLE BRANCH;
DROP TABLE EMPLOYEE;
DROP TABLE SERVICE_ORDER;
DROP TABLE PRODUCT;
DROP TABLE BUY_ORDER;
DROP TABLE ARTIST;
DROP TABLE ALBUM;
DROP TABLE INSTRUMENT;
DROP TABLE TRACK;
DROP TABLE STORED;



alter session set nls_language='ENGLISH';
alter session set nls_date_format='DD-MON-YYYY'; 

CREATE TABLE CUSTOMER(
    CUST_ID NUMBER,
    NAME VARCHAR2(30) NOT NULL,
    GENDER VARCHAR2(20),
    PHONE_NUMBER VARCHAR2(15) NOT NULL UNIQUE,
    ADDRESS VARCHAR2(50),
    E_MAIL VARCHAR2(30) UNIQUE,
    CONSTRAINT customer_pk PRIMARY KEY (CUST_ID)
    
);

CREATE TABLE BRANCH(
    BRANCH_ID NUMBER,
    ADDRESS VARCHAR2(50) NOT NULL UNIQUE,
    EMPLOYEE_COUNT NUMBER NOT NULL,
    TOTAL_SELL_NUMBER NUMBER DEFAULT 0,
    CONSTRAINT branch_id_pk PRIMARY KEY (BRANCH_ID)
);

CREATE TABLE EMPLOYEE(
    EMP_ID NUMBER,
    BRANCH_ID NUMBER,
    GENDER VARCHAR2(10),
    NAME VARCHAR2(30) NOT NULL,
    BIRTH_DATE DATE NOT NULL,
    START_DATE DATE NOT NULL,
    ADDRESS VARCHAR2(50),
    PHONE_NUMBER VARCHAR2(15) NOT NULL UNIQUE,
    E_MAIL VARCHAR2(50) UNIQUE,
    SALES_AMOUNT NUMBER DEFAULT 0,
    TITLE VARCHAR2(20) DEFAULT 'SALESMAN',
    SALARY FLOAT DEFAULT 4250.0,
    CONSTRAINT empid_pk PRIMARY KEY (EMP_ID),
    CONSTRAINT fk_branch_id FOREIGN KEY (BRANCH_ID) 
      references BRANCH (BRANCH_ID)

);
CREATE TABLE SERVICE_ORDER(
    S_ORDER_ID NUMBER,
    CUST_ID INT,
    EMP_ID INT,
    STATUS VARCHAR2(30) DEFAULT 'IN PROCESS',
    ORDER_DATE DATE DEFAULT TRUNC(SYSDATE), 
    EXPECTED_DATE DATE NOT NULL,
    PROBLEM VARCHAR2(50) NOT NULL,
    PRICE FLOAT NOT NULL,
    INST_TYPE VARCHAR2(30) NOT NULL,
    CONSTRAINT sorderid_pk PRIMARY KEY (S_ORDER_ID),
    CONSTRAINT s_fk_cust_id FOREIGN KEY (CUST_ID)
      references CUSTOMER (CUST_ID),
    CONSTRAINT s_fk_emp_id FOREIGN KEY (EMP_ID) 
      references EMPLOYEE (EMP_ID)  
);


CREATE TABLE PRODUCT(
    PROD_ID NUMBER,
    PROD_NAME VARCHAR2(100) NOT NULL,
    PRICE FLOAT NOT NULL,
    PROD_DATE DATE,
    CONSTRAINT prod_id_pk PRIMARY KEY (PROD_ID)
);

CREATE TABLE BUY_ORDER(
    B_ORDER_ID NUMBER,
    PROD_ID NUMBER,
    CUST_ID NUMBER,
    EMP_ID NUMBER,
    ORDER_DATE DATE DEFAULT TRUNC(SYSDATE),
    CONSTRAINT b_order_id_pk PRIMARY KEY (B_ORDER_ID),
    CONSTRAINT b_fk_prod_id FOREIGN KEY (PROD_ID)
      references PRODUCT (PROD_ID),
    CONSTRAINT b_fk_cust_id FOREIGN KEY (CUST_ID) 
      references CUSTOMER (CUST_ID),
    CONSTRAINT b_fk_emp_id FOREIGN KEY (EMP_ID) 
      references EMPLOYEE (EMP_ID)
);

CREATE TABLE ARTIST(
   ARTIST_ID NUMBER,
   BIRTH_DATE DATE,
   NAME VARCHAR2(30) NOT NULL,
   CONSTRAINT artist_id_pk PRIMARY KEY (ARTIST_ID)
);
CREATE TABLE ALBUM(
    ALBUM_ID NUMBER NOT NULL REFERENCES PRODUCT(PROD_ID),
    ARTIST_ID NUMBER,
    GENRE VARCHAR2(100),
    MEDIA VARCHAR2(20),
    CONSTRAINT album_prod_id_pk PRIMARY KEY (ALBUM_ID),
    CONSTRAINT fk_artist_id FOREIGN KEY (ARTIST_ID) 
	references ARTIST (ARTIST_ID)
);

CREATE TABLE INSTRUMENT(
    INS_ID NUMBER NOT NULL REFERENCES PRODUCT(PROD_ID),
    TYPE VARCHAR2(30),
    BRAND_NAME VARCHAR2(50),
    CONSTRAINT ins_prod_id_pk PRIMARY KEY (INS_ID)
);


CREATE TABLE TRACK(
    TRACK_ID NUMBER,
    ALBUM_ID INT,
    TITLE VARCHAR2(50) NOT NULL,
    LENGTH FLOAT,
    CONSTRAINT track_id_pk PRIMARY KEY (TRACK_ID),
    CONSTRAINT fk_prod_id FOREIGN KEY (ALBUM_ID) 
      references PRODUCT (PROD_ID)
);
CREATE TABLE STORED(
    STORED_ID NUMBER,
    BRANCH_ID NUMBER,
    PROD_ID NUMBER,
    UPDATE_DATE DATE NOT NULL,
    PROD_COUNT NUMBER NOT NULL,
    INSTOCK NUMBER(1,0) DEFAULT 1,
    CONSTRAINT pk_stored_id PRIMARY KEY (STORED_ID),
    CONSTRAINT fk_st_branch_id FOREIGN KEY (BRANCH_ID)
        references BRANCH(BRANCH_ID),
    CONSTRAINT fk_st_prod_id FOREIGN KEY (PROD_ID)
        references PRODUCT(PROD_ID)    
);




INSERT ALL
INTO CUSTOMER values(1, 'Ekin Eri??', 'Female', '05378694852', 'K??????kyal??/??zmir', 'ekineris@gmail.com')
INTO CUSTOMER values(2, '????kr?? G??zel', 'Male', '05549610154', 'Buca/??zmir', 'sukruguzel@gmail.com')
INTO CUSTOMER values(3, 'Faik Burak T??redi', 'Male', '05334140224', 'Urla/??zmir', 'fburakturedi@gmail.com')
INTO CUSTOMER values(4, 'Osman Nevfel ??nl??', 'Male', '05324563695', 'Bornova/??zmir', 'osmanunlu@gmail.com')
INTO CUSTOMER values(5, 'Su ??etiner', 'Female', '05367822230', 'Moda/??stanbul', 'sucetiner@gmail.com')
INTO CUSTOMER values(6, 'Yunus G??ner', 'Male', '05334142216', 'Pendik/??stanbul', 'eyguner@gmail.com')
INTO CUSTOMER values(7, 'Nurg??l Tosun', 'Female', '05367416766', 'Karaba??lar/??zmir', 'nurgultosun@gmail.com')
INTO CUSTOMER values(8, 'Ata Y??lmaz??elik', 'Male', '05174148455', 'G??zelbah??e/??zmir', 'atayilmazcelik@hotmail.com')
INTO CUSTOMER values(9, 'Duru Kalay', 'Female', '05672008496', 'Be??ikta??/??stanbul', 'durukalay@gmail.com')
INTO CUSTOMER values(10, 'Ezgi Yel??i', 'Female', '05515807184', 'G??zelyal??/??zmir', 'ezgiyelci@gmail.com')
INTO CUSTOMER values(11, 'Bar???? ??zkaya', 'Male', '05549303097', 'Narl??dere/??zmir', 'barisozkaya@hotmail.com')
INTO CUSTOMER values(12, 'G??ktu?? K??se', 'Male', '05324456500', 'Ka????thane/??stanbul', 'goktugkose@gmail.com')
INTO CUSTOMER values(13, 'Mert Girgin', 'Male', '05422203087', 'Konak/??zmir', 'mertgirgin@gmail.com')
INTO CUSTOMER values(14, 'Melisa I????kl??', 'Female', '05482334995', 'Anadoluhisar??/??stanbul', 'melisaisikli@hotmail.com')
INTO CUSTOMER values(15, 'Birke ??nal', 'Female', '05621282665', 'Kar????yaka/??zmir', 'birkeonal@gmail.com')
INTO CUSTOMER values(16, 'Gamze Aytekin', 'Female', '05223351914', 'Kad??k??y/??stanbul', 'gamzeaytekin@gmail.com')
INTO CUSTOMER values(17, 'Ege Kervan', 'Male', '05323650858', 'Kar????yaka/??zmir', 'egekervan@hotmail.com')
INTO CUSTOMER values(18, 'Berk Baysal', 'Male', '05523211502', 'Buca/??zmir', 'berkbaysal@gmail.com')
INTO CUSTOMER values(19, 'Hande Akarsu', 'Female', '05523220162', 'Karata??/??zmir', 'handeakarsu@gmail.com')
INTO CUSTOMER values(20, 'Mert G??n??iner', 'Male', '05847148488', 'Bornova/??zmir', 'mertgunciner@hotmail.com')
INTO CUSTOMER values(21, 'Ahmet Aratar', 'Male', '05534112134', 'Konak/??zmir', 'ahmetaratar@hotmail.com')
INTO CUSTOMER values(22, 'Pelin Kar', 'Female', '05314339987', 'Ba??c??lar/??stanbul', 'pelinkar@hotmail.com')
INTO CUSTOMER values(23, 'Sena Parlak', 'Female', '05429532543', 'Kar????yaka/??zmir', 'senaparlak@hotmail.com')
INTO CUSTOMER values(24, 'O??uz Kardan', 'Male', '05534556731', 'Adalar/??stanbul', 'oguzkardan@hotmail.com')
INTO CUSTOMER values(25, 'Burak Ka??ar', 'Male', '05316662110', '????yol/??zmir', 'burakacar@hotmail.com')
INTO CUSTOMER values(26, 'Harun Y??ld??r', 'Male', '05549887123', 'Kad??k??y/??stanbul', 'harunyildir@hotmail.com')
INTO CUSTOMER values(27, 'Melisa Sakl??d??r', 'Female', '05333456776', 'Be??ikta??/??stanbul', 'melisasaklidir@hotmail.com')
INTO CUSTOMER values(28, 'Tu??ba ??zkale', 'Female', '05549600123', 'Bostanl??/??zmir', 'tugbaozkale@hotmail.com')
INTO CUSTOMER values(29, 'Harun Y??lan', 'Male', '05345600671', 'Bornova/??zmir', 'harunyilan@hotmail.com')
INTO CUSTOMER values(30, 'Ekin Emre Atasayar', 'Male', '05079814588', 'Ba??ak??ehir/??stanbul', 'ekinatasayar@hotmail.com')
INTO CUSTOMER values(31, 'Efe Kocata??', 'Male', '05846588412', 'G??ztepe/??zmir', 'efe.kocatas@hotmail.com')
INTO CUSTOMER values(32, 'Aylin Eren', 'Female', '05483184488', 'Be??ikta??/??stanbul', 'ayleren@hotmail.com')
INTO CUSTOMER values(33, 'Sezgi Yal????nkaya', 'Female', '05337131315', 'Ni??anta????/??zmir', 'yalcinkayasezgi@gmail.com')
INTO CUSTOMER values(34, 'Irmak G??nay', 'Female', '05825148019', 'Mavi??ehir/??zmir', 'irmakkgunayy@gmail.com')
INTO CUSTOMER values(35, 'Tugay ??im??ek', 'Male', '05451928858', 'Maltepe/??stanbul', 'tugay_simsek@hotmail.com')
INTO CUSTOMER values(36, '??afak Salda', 'Male', '05587128434', 'Moda/??stanbul', 'shafaksalda@hotmail.com')
INTO CUSTOMER values(37, 'Egemen Zorlu', 'Male', '05824786441','Bal??ova/??zmir','egemenzorlu94@hotmail.com')
INTO CUSTOMER values(38, 'Ba??ak Dizer', 'Female', '05847148498', 'Arnavutk??y/??stanbul', 'dizerbasak@gmail.com')
INTO CUSTOMER values(39, '??pek Atasever', 'Female', '05845448328', 'Emirgan/??stanbul', 'ipeekatasever@hotmail.com')
INTO CUSTOMER values(40, 'Beren Durmaz', 'Female', '05327362418', 'Alsancak/??zmir', 'berendurmaz89@gmmail.com')



INTO BRANCH VALUES (1, 'Kad??k??y/??stanbul', 2, 10)
INTO BRANCH VALUES (2, 'Ba??c??lar/??stanbul', 1, 5)
INTO BRANCH VALUES (3, 'Be??ikta??/??stanbul', 2, 18)
INTO BRANCH VALUES (4, 'Avc??lar/??stanbul', 2, 13)
INTO BRANCH VALUES (5, 'Adalar/??stanbul', 1, 3)
INTO BRANCH VALUES (6, 'Ata??ehir/??stanbul', 2, 1)
INTO BRANCH VALUES (7, 'Bah??elievler/??stanbul', 2, 11)
INTO BRANCH VALUES (8, 'Ba??ak??ehir/??stanbul', 1, 6)
INTO BRANCH VALUES (9, 'Bak??rk??y/??stanbul', 1, 2)
INTO BRANCH VALUES (10, 'Beykoz/??stanbul', 2, 16)
INTO BRANCH VALUES (11, 'Kartal/??stanbul', 1, 9)
INTO BRANCH VALUES (12, 'Maltepe/??stanbul', 2, 17)
INTO BRANCH VALUES (13, 'Konak/??zmir', 2, 22)
INTO BRANCH VALUES (14, 'Buca/??zmir', 2, 24)
INTO BRANCH VALUES (15, 'Karaba??lar/??zmir', 1, 8)
INTO BRANCH VALUES (16, 'Gaziemir/??zmir', 2, 19)
INTO BRANCH VALUES (17, 'Seferihisar/??zmir', 1, 3)
INTO BRANCH VALUES (18, 'Bostanl??/??zmir', 2, 15)
INTO BRANCH VALUES (19, 'Kar????yaka/??zmir', 2, 7)
INTO BRANCH VALUES (20, 'Menemen/??zmir', 1, 2)

INTO ARTIST VALUES(1,'02-APR-1970', 'Red Hot Chili Peppers')
INTO ARTIST VALUES(2,'06-MAY-1975', 'Vance Joy')
INTO ARTIST VALUES(3,'15-FEB-1980', 'Coldplay')
INTO ARTIST VALUES(4,'12-APR-1987', 'Arctic Monkeys')
INTO ARTIST VALUES(5,'28-OCT-1981', 'Metallica')
INTO ARTIST VALUES(6,'16-JAN-1972', 'Tarkan')
INTO ARTIST VALUES(7,'19-MAR-1968', 'Serdar Orta??')
INTO ARTIST VALUES(8,'22-SEP-1975', 'Iron Maiden')
INTO ARTIST VALUES(9,'17-APR-1955', 'M??sl??m G??rses')
INTO ARTIST VALUES(10,'02-APR-1960', 'Queen')
INTO ARTIST VALUES(11,'01-JUL-1976', 'Kaan Tang??ze')
INTO ARTIST VALUES(12,'26-AUG-1974', 'Teoman')
INTO ARTIST VALUES(13,'30-NOV-1984', 'Manga')
INTO ARTIST VALUES(14,'07-APR-1964', 'AC/DC')
INTO ARTIST VALUES(15,'09-JUN-1960', 'Joan Jett')
INTO ARTIST VALUES(16,'23-SEP-1954', 'Bon Jovi')
INTO ARTIST VALUES(17,'05-MAR-1956', 'Nirvana')
INTO ARTIST VALUES(18,'14-FEB-1973', 'Sagopa Kajmer')
INTO ARTIST VALUES(19,'13-MAY-1976', 'Ceza')
INTO ARTIST VALUES(20,'26-AUG-1989', 'Ezhel')


INTO EMPLOYEE values (1,2,'Female','Nehir Alada??','22-AUG-1972','05-JAN-2020','Ba??c??lar/??stanbul','05313864925','nehir_aladag@hotmail.com',5,DEFAULT,DEFAULT)
INTO EMPLOYEE values (2,1,'Female','Deniz Gen??','19-MAY-1974','04-APR-2016','Zeytinburnu/??stanbul','05316529922','dnzgnc@hotmail.com',3,'REPAIRMAN',6150.50)
INTO EMPLOYEE values (3,1,'Male','Bartu?? Al','07-AUG-1984','05-JAN-2010','Sefak??y/??stanbul','05031182495','bartug@hotmail.com',7,DEFAULT,DEFAULT)
INTO EMPLOYEE values (4,3,'Male','Can ??zt??rk','06-OCT-1994','18-AUG-2021','Florya/??stanbul','05031167491','canozturk@hotmail.com',14,DEFAULT,DEFAULT)
INTO EMPLOYEE values (5,3,'Female','Ceylin Pak','18-OCT-1988','05-NOV-2021','Beylikd??z??/??stanbul','05311825294','pamuk_seker_ceylin@hotmail.com',4,DEFAULT,DEFAULT)
INTO EMPLOYEE values (6,4,'Male','Cenk ??ekirge','07-JUL-1991','05-MAY-2010','??sk??dar/??stanbul','05306924125','cenkkk@hotmail.com',0,'MANAGER',10200)
INTO EMPLOYEE values (7,4,'Male','Semih ??ent??rk','27-JUL-1992','25-MAY-2021','Silivri/??stanbul','05437465256','fb_semih_senturk@hotmail.com',13,DEFAULT,DEFAULT)
INTO EMPLOYEE values (8,5,'Male','Kemal Y??r????','17-JUL-1995','26-NOV-2021','G??rp??nar/??stanbul','05312651789','yoruckemal@hotmail.com',3,DEFAULT,DEFAULT)
INTO EMPLOYEE values (9,6,'Female','Didem Selvili','21-JUN-1996','16-SEP-2021','Yeditepe/??stanbul','05536998777','didemselvili@hotmail.com',1,DEFAULT,DEFAULT)
INTO EMPLOYEE values (10,6,'Male','G??khan Tun??','17-JUL-1995','16-NOV-2011','Bah??elievler/??stanbul','05312981165','g??khantuncl@hotmail.com',0,'MANAGER',10200)
INTO EMPLOYEE values (11,7,'Female','Merve Sayg??','23-AUG-1980','12-OCT-2012','Levent/??stanbul','05356868925','merve-saygi@gmail.com',6,DEFAULT,DEFAULT)
INTO EMPLOYEE values (12,7,'Male','Erdal Din??er','18-NOV-1988','03-APR-2017','K??????k??ekmece/??stanbul','05314529822','erdaldincer@hotmail.com',5,'REPAIRMAN',6150.50)
INTO EMPLOYEE values (13,8,'Female','Ece Bucak','04-APR-1991','13-MAY-2011','Fatih/??stanbul','05356548956','bucakece@gmail.com',6,DEFAULT,DEFAULT)
INTO EMPLOYEE values (14,9,'Male','Eren Erdem','01-JAN-1983','03-MAR-2008','Bak??rk??y/??stanbul','05314239896','erennerdem@hotmail.com',2,DEFAULT,DEFAULT)
INTO EMPLOYEE values (15,10,'Male','Tekin I????k','13-JUN-1975','09-NOV-2008','??sk??dar/??stanbul','05458239366','tekin_isik@gmail.com',5,DEFAULT,DEFAULT)
INTO EMPLOYEE values (16,10,'Male','Can ??zzet','06-DEC-1989','14-DEC-2011','??mraniye/??stanbul','05332438597','izzetcan@gmail.com',11,DEFAULT,DEFAULT)
INTO EMPLOYEE values (17,11,'Male','G??rhan Y??lmaz','16-OCT-1979','15-NOV-2002','Maltepe/??stanbul','05301698765','gurhnnylmz@gmail.com',9,'REPAIRMAN',6150.50)
INTO EMPLOYEE values (18,12,'Female','A??elya ??ensoy','19-OCT-1977','15-OCT-2011','Maltepe/??stanbul','05332356597','sensoyacelyan@hotmail.com',7,'REPAIRMAN',6150.50)
INTO EMPLOYEE values (19,12,'Male','G??ker ??z','26-SEP-1989','15-APR-2012','Maltepe/??stanbul','05336938527','gokerozz@gmail.com',10,DEFAULT,DEFAULT)
INTO EMPLOYEE values (20,19,'Male','Tu??berk Araz','12-APR-1989','10-FEB-2013','Kar????yaka/Izmir','05324783412','tugberkaraz@hotmail.com',5,'MANAGER',10200)
INTO EMPLOYEE values (21,19,'Female','Aylin Ka??a','14-SEP-1995','18-MAY-2018','Bostanl??/Izmir','05546214286','aylinkaca@hotmail.com',2,DEFAULT,DEFAULT)
INTO EMPLOYEE values (22,18,'Female','Pelin Asa','24-AUG-1978','20-DEC-2014','Konak/Izmir','05534127236','pelinasa@hotmail.com',9,'REPAIRMAN',6150.50)
INTO EMPLOYEE values (23,18,'Female','Serpil Kara','10-SEP-1990','25-SEP-2018','Kar????yaka/Izmir','05425332165','serpilkara@hotmail.com',6,DEFAULT,DEFAULT)
INTO EMPLOYEE values (24,17,'Male','O??ulcan Tar','30-APR-1992','25-JAN-2019','Seferihisar/Izmir','05546219981','ogulcantar@hotmail.com',3,DEFAULT,DEFAULT)
INTO EMPLOYEE values (25,16,'Female','Kalin Tok??a','12-APR-1980','03-MAY-2010','Karaba??lar/Izmir','05333451222','kalintokca@hotmail.com',14,'MANAGER',10200)
INTO EMPLOYEE values (26,16,'Male','Ahmet Karacan','20-SEP-1991','02-JAN-2016','Konak/Izmir','05545431219','ahmetkaracan@hotmail.com',5,DEFAULT,DEFAULT)
INTO EMPLOYEE values (27,15,'Male','Mehmet Kuru','26-AUG-1996','13-FEB-2019','Konak/Izmir','05424233459','mehmetkuru@hotmail.com',8,DEFAULT,DEFAULT)
INTO EMPLOYEE values (28,14,'Female','Serap Ad??g??zel','12-MAR-1996','30-JUN-2017','Konak/Izmir','05335556121','serapadiguzel@hotmail.com',18,'MANAGER',10200)
INTO EMPLOYEE values (29,14,'Male','Mehmet Top??u','14-JUL-1979','10-JUL-2013','Kar????yaka/Izmir','05546653279','mehmettopcu@hotmail.com',6,'REPAIRMAN', 6150.50)
INTO EMPLOYEE values (30,13,'Male','Serdar Ta??k??ran','05-NOV-1975','12-DEC-2005','Konak/Izmir','05311236284','serdartaskiran@hotmail.com',10,DEFAULT,DEFAULT)
INTO EMPLOYEE values (31,13,'Female','Ekin Araz','14-SEP-1990','01-JAN-2011','Konak/Izmir','05534331455','ekinaraz@hotmail.com',12,'MANAGER',10200)
INTO EMPLOYEE values (32,20,'Female','Gizem Sana','10-MAY-1985','02-JAN-2016','Alia??a/Izmir','05334256734','gizemsana@hotmail.com',2,DEFAULT,DEFAULT)

INTO PRODUCT values (1,'Kramer Guitars Focus Electric Player Pack Black',192.40*20,'24-JUN-2014')
INTO INSTRUMENT values(1,'Guitar','Kramer')

INTO PRODUCT values (2,'Yamaha U10A gebraucht, Bj. "93 Snr.',5033.60*20,'17-JAN-1993')
INTO INSTRUMENT values(2,'Piano','Yamaha')

INTO PRODUCT values (3,'Kozmos KDA-30 NAT Acoustic Guitar',1912.40,'09-MAY-2017')
INTO INSTRUMENT values(3,'Guitar','Kozmos')

INTO PRODUCT values(4,'Barcelona LF 4100 CEQ Electro Acoustic Guitar',2016.50,'11-APR-2016')
INTO INSTRUMENT values(4,'Guitar','Barcelona')

INTO PRODUCT values(5,'Kangson KJ220S-TL Acoustic Guitar',1737.0,'16-SEP-2019')
INTO INSTRUMENT values(5,'Guitar','Kangson')

INTO PRODUCT values(6,'Kangson KD100-VS Acoustic Guitar',1737.0,'16-SEP-2019')
INTO INSTRUMENT values(6,'Guitar','Kangson')

INTO PRODUCT values (7,'Yamaha F310P NA Acoustic Guitar',5033.60*20,'08-MAY-2011')
INTO INSTRUMENT values(7,'Guitar','Yamaha')

INTO PRODUCT values (8,'Yamaha APX600BL Thin-Line Cutaway Electro Acoustic Guitar',15033.60,'28-MAR-2014')
INTO INSTRUMENT values(8,'Guitar','Yamaha')

INTO PRODUCT values (9,'Sonor AQ2 Snare 14"x6" TQZ Titanium Quartz',209.45*20,'08-MAY-2011')
INTO INSTRUMENT values(9,'Drum','Sonor')

INTO PRODUCT values (10,'DW Design Acryl Snare 14"x5" Clear',310.08*20,'17-JUL-2019')
INTO INSTRUMENT values(10,'Drum','DW')

INTO PRODUCT values (11,'Tama TWS1455-RSC Star Walnut Snare 14"x5,5"',503.36*20,'17-JAN-2019')
INTO INSTRUMENT values(11,'Drum','Tama')

INTO PRODUCT values (12,'Sonor ProLite Snare PL 1405 SDW 14"x5" Nussbaum',562.18*20,'11-OCT-2020')
INTO INSTRUMENT values(12,'Drum','Sonor')

INTO PRODUCT values (13,'Primavera 90 - 3/4 Violinen Set inkl. Case und Bogen',68.10*20,'22-FEB-2020')
INTO INSTRUMENT values(13,'Violin','Primavera')

INTO PRODUCT values (14,'Monzani Violinset Cantabile 10 4/4',68.10*20,'10-JAN-2020')
INTO INSTRUMENT values(14,'Violin','Monzani')

INTO PRODUCT values (15,'Eastman Westbury VF005 Violin Outfit 3/4 Antiqued',352.14*20,'01-MAY-2009')
INTO INSTRUMENT values(15,'Violin','Eastman')

INTO PRODUCT values (16,'Schimmel FRIDOLIN F 121',4193.30*20,'05-NOV-2018')
INTO INSTRUMENT values(16,'Piano','Schimmel')

INTO PRODUCT values (17,'B??sendorfer 200 Gr.Piano, Black polished Bench',80193.30*20,'01-JAN-2014')
INTO INSTRUMENT values(17,'Piano','B??sendorfer')

INTO PRODUCT values (18,'Stentor Student I Cellogarnitur 1/8',363.0*20,'04-APR-2017')
INTO INSTRUMENT values(18,'Cello','Stentor')

INTO PRODUCT values (19,'Gewa Cellogarnitur Allegro 4/4',748.30*20,'09-MAY-2020')
INTO INSTRUMENT values(19,'Cello','Gewa')

INTO PRODUCT values (20,'Jupiter JFL700WRXE Flute',713.20*20,'16-JUN-2018')
INTO INSTRUMENT values(20,'Flute','Jupiter')

INTO PRODUCT values (21,'Californication',300,'08-JUN-1999')
INTO ALBUM values (21,1,'Funk Rock/Rock','CD')
INTO TRACK values(1,21,'Around The World',239)
INTO TRACK values(2,21,'Parallel Universe',269)

INTO PRODUCT values (22,'Live at Red Rocks Amphitheatre',300,'16-NOV-2018')
INTO ALBUM values (22,2,'Alternative Rock','CD')
INTO TRACK values(3,22,'Riptide',224)
INTO TRACK values(4,22,'Lay It On Me',240)

INTO PRODUCT values (23,'A Head Full of Dreams',300,'04-DEC-2015')
INTO ALBUM values (23,3,'Pop/Alternative Rock/Pop Rock','CD')
INTO TRACK values(5,23,'A Head Ful Of Dreams',223)
INTO TRACK values(6,23,'Birds',229)

INTO PRODUCT values (24,'Tranquility Base Hotel & Casino',300,'11-MAY-2018')
INTO ALBUM values (24,4,'Lounge/Glam Rock/Space age pop','CD')
INTO TRACK values(7,24,'Star Treatment',354)
INTO TRACK values(8,24,'One Point Perspective',208)

INTO PRODUCT values (25,'Ride the Lightning',300,'27-JUL-1984')
INTO ALBUM values (25,5,'Metal','CD')
INTO TRACK values(9,25,'Fade to Black',418)
INTO TRACK values(10,25,'Escape',245)

INTO PRODUCT values (26,'Dudu',300,'01-JUL-2003')
INTO ALBUM values (26,6,'Pop','CD')
INTO TRACK values(11,26,'Dudu',418)
INTO TRACK values(12,26,'G??l??mse Kaderine',265)

INTO PRODUCT values (27,'Bilsem ki',300,'21-OCT-1999')
INTO ALBUM values (27,7,'Pop','CD')
INTO TRACK values(13,27,'Asr??n Hatas??',298)
INTO TRACK values(14,27,'Seninki',265)

INTO PRODUCT values (28,'Fear of the Dark',300,'11-MAY-1992')
INTO ALBUM values (28,8,'Heavy Metal','CD')
INTO TRACK values(15,28,'Fear Of The Dark',436)
INTO TRACK values(16,28,'Wasting Love',351)

INTO PRODUCT values (29,'A??k Tesad??fleri Sever',300,'15-APR-2006')
INTO ALBUM values (29,9,'Arabesque','CD')
INTO TRACK values(17,29,'Bir ??m??r Yetmez',243)
INTO TRACK values(18,29,'Hayat Berbat',191)

INTO PRODUCT values (30,'A Night at the Opera',300,'21-NOV-1975')
INTO ALBUM values (30,10,'Rock/Opera/Hard Rock/Heavy Metal/Pop','CD')
INTO TRACK values(19,30,'Lazing On A Sunday Afternoon',68)
INTO TRACK values(20,30,'Bohemian Rhapsody',320)

INTO PRODUCT values (31,'G??lge Etme',300,'22-SEP-2015')
INTO ALBUM values (31,11,'Rock','CD')
INTO TRACK values(21,31,'G??lge Etme',177)
INTO TRACK values(22,31,'Bekle Dedi Gitti',277)

INTO PRODUCT values (32,'Renkli R??yalar Oteli',300,'5-JAN-2006')
INTO ALBUM values (32,12,'Pop','CD')
INTO TRACK values(23,32,'Renkli R??yalar Oteli',266)
INTO TRACK values(24,32,'A??k K??r??nt??lar??',278)

INTO PRODUCT values (33,'??ehr-i H??z??n',300,'5-JAN-2006')
INTO ALBUM values (33,13,'Alternative Rock/Nu Metal','CD')
INTO TRACK values(25,33,'Beni Benimle B??rak',210)
INTO TRACK values(26,33,'D??nyan??n Sonuna Do??mu??um',260)

INTO PRODUCT values (34,'Back in Black',300,'25-JUL-1985')
INTO ALBUM values (34,14,'Hard Rock','CD')
INTO TRACK values(27,34,'Hells Bells',312)
INTO TRACK values(28,34,'What Do You Do For Money Honey',215)

INTO PRODUCT values (35,'First Sessions',300,'22-DEC-2015')
INTO ALBUM values (35,15,'Hard Rock/Rock','CD')
INTO TRACK values(29,35,'You Dont Know What You Got',241)
INTO TRACK values(30,35,'I Want You',161)

INTO PRODUCT values (36,'Crush',300,'13-JUN-2000')
INTO ALBUM values (36,16,'Hard Rock/Rock/Pop/Heavy Metal/Pop Rock/ALternative Rock/Glam Metal','CD')
INTO TRACK values(31,36,'Thank You For Loving Me',309)
INTO TRACK values(32,36,'Mystery Train',315)

INTO PRODUCT values (37,'Nevermind',300,'24-SEP-1994')
INTO ALBUM values (37,17,'Grunge','CD')
INTO TRACK values(33,37,'Smells Like Teen Spirit',301)
INTO TRACK values(34,37,'Come as You Are',219)

INTO PRODUCT values (38,'Ahmak Islatan',300,'20-MAR-2014')
INTO ALBUM values (38,18,'Hip-Hop/Rap','CD')
INTO TRACK values(35,38,'Kanvas',314)
INTO TRACK values(36,38,'Zorla G??zellik',324)

INTO PRODUCT values (39,'Rapstar',300,'12-AUG-2004')
INTO ALBUM values (39,19,'Hip-Hop/Rap','CD')
INTO TRACK values(37,39,'Holocaust',208)
INTO TRACK values(38,39,'Ben A??lamazken',243)

INTO PRODUCT values (40,'Lights Out',300,'15-NOV-2019')
INTO ALBUM values (40,20,'Trap/Rap','CD')
INTO TRACK values(39,40,'Kapat I????klar??n??',160)
INTO TRACK values(40,40,'Kendini Kaybet',215)



INTO SERVICE_ORDER VALUES(1, 5, 2,'IN REPAIR', '25-DEC-2021', '30-DEC-2021', 'Changing guitar strings',30.90, 'Guitar')
INTO SERVICE_ORDER VALUES(2, 6, 12,'IN PROCESS', '27-DEC-2021', '05-JAN-2022', 'Changing electronic drum pad',150.20, 'Drum')
INTO SERVICE_ORDER VALUES(3, 22, 17,'IN REPAIR', '15-DEC-2021', '08-JAN-2022', 'Maintenance electronic drum pad',75.60, 'Drum')
INTO SERVICE_ORDER VALUES(4, 24,12, 'READY', '20-DEC-2021', '27-DEC-2021', 'Maintenance of violin strings',50.75, 'Violin')
INTO SERVICE_ORDER VALUES(5, 1,22, DEFAULT, '24-DEC-2021', '10-JAN-2022', 'Maintenance of piano',250.75, 'Piano')
INTO SERVICE_ORDER VALUES(6, 9,18, 'IN REPAIR', '01-DEC-2021', '15-JAN-2022', 'Changing piano key',150.90, 'Piano')
INTO SERVICE_ORDER VALUES(7, 8,29, 'READY', '15-DEC-2021', '26-DEC-2021', 'Changing snare mesh',290.99, 'Drum')
INTO SERVICE_ORDER VALUES(8, 26,12, 'IN MAINTENANCE', '30-NOV-2021', '31-DEC-2021', 'Maintenance of cello',99.95, 'Cello')
INTO SERVICE_ORDER VALUES(9, 30,18, 'DELIVERED', '12-APR-2020', '20-APR-2020', 'Changing all violin strings ',235.50, 'Violin')
INTO SERVICE_ORDER VALUES(10, 25,22, 'DELIVERED', '06-JAN-2018', '15-JAN-2018', 'Changing electro guitar bridge',600.90, 'Guitar')
INTO SERVICE_ORDER VALUES(11, 27,18, 'READY', '22-DEC-2021', '27-DEC-2021', 'Guitar neck intonation',250.89, 'Guitar')
INTO SERVICE_ORDER VALUES(12, 2,22, 'DELIVERED', '27-MAY-2019', '07-JUN-2019', 'Changing keys of piano ',120.99, 'Piano')
INTO SERVICE_ORDER VALUES(13, 3,29, 'DELIVERED', '01-JUL-2020', '20-JUL-2020', 'Changing guitar strings',200.10, 'Guitar')
INTO SERVICE_ORDER VALUES(14, 7,29, DEFAULT, '27-DEC-2021', '15-JAN-2022', 'Changing electronic drum tom',400.99, 'Drum')
INTO SERVICE_ORDER VALUES(15, 21,22, 'IN MAINTENANCE', '25-DEC-2021', '31-DEC-2021', 'Maintenance of flute',450.00, 'Flute')
INTO SERVICE_ORDER VALUES(16, 28,29, 'DELIVERED', '25-JUN-2019', '10-JUL-2019', 'Maintenance of violin strings',79.90, 'Violin')
INTO SERVICE_ORDER VALUES(17, 10,22, DEFAULT, '25-DEC-2021', '31-DEC-2021', 'Maintenance of flute',99.90, 'Flute')
INTO SERVICE_ORDER VALUES(18, 23,22,'DELIVERED', '20-FEB-2020', '27-FEB-2020', 'Changing guitar strings',49.90, 'Guitar')
INTO SERVICE_ORDER VALUES(19, 7,29,'IN REPAIR', '20-DEC-2021', '08-JAN-2022', 'Setting up guitar bridge',450.90, 'Guitar')
INTO SERVICE_ORDER VALUES(20, 4,29,'IN REPAIR', '18-DEC-2021', '30-DEC-2021', 'Changing pedal beater',149.90, 'Drum')



INTO STORED values(1, 4, 3, '10-MAY-2017', 2,DEFAULT)
INTO STORED values(2, 7, 10, '25-JUL-2019', 3,DEFAULT)
INTO STORED values(3, 1, 12, '11-OCT-2020', 1,DEFAULT)
INTO STORED values(4, 15, 7, '30-MAY-2011', 4,DEFAULT)
INTO STORED values(5, 19, 5, '26-SEP-2019', 1,DEFAULT)
INTO STORED values(6, 2, 9, '10-MAY-2011', 3,DEFAULT)
INTO STORED values(7, 3, 14, '29-JAN-2020', 1,DEFAULT)
INTO STORED values(8, 18, 17, '08-JAN-2014', 1,DEFAULT)
INTO STORED values(9, 20, 15, '01-MAY-2009', 4,DEFAULT)
INTO STORED values(10, 3, 4, '12-APR-2016', 1,DEFAULT)
INTO STORED values(11, 17, 11, '23-JAN-2019', 3,DEFAULT)
INTO STORED values(12, 11, 13, '25-FEB-2020', 3,DEFAULT)
INTO STORED values(13, 6, 6, '18-SEP-2019', 1,DEFAULT)
INTO STORED values(14, 8, 19, '11-MAY-2020', 4,DEFAULT)
INTO STORED values(15, 1, 12, '13-OCT-2020', 2,DEFAULT)
INTO STORED values(16, 2, 16, '14-NOV-2018', 3,DEFAULT)
INTO STORED values(17, 15, 15, '30-MAY-2009', 5,DEFAULT)
INTO STORED values(18, 4, 7, '12-MAY-2011', 4,DEFAULT)
INTO STORED values(19, 9, 8, '29-MAR-2014', 1,DEFAULT)
INTO STORED values(20, 17, 3, '20-MAY-2017', 3,DEFAULT)


INTO BUY_ORDER values(1, 31, 11, 30, '03-AUG-2020')
INTO BUY_ORDER values(2, 16, 19, 31, '09-APR-2004')
INTO BUY_ORDER values(3, 13, 32, 04, '12-JUL-2012')
INTO BUY_ORDER values(4, 14, 36, 02, '19-JAN-2006')
INTO BUY_ORDER values(5, 37, 13, 30, '04-FEB-2014')
INTO BUY_ORDER values(6, 39, 16, 03, '08-JUN-2019')
INTO BUY_ORDER values(7, 17, 18, 29, '14-SEP-2018')
INTO BUY_ORDER values(8, 10, 20, 21, '25-DEC-2016')
INTO BUY_ORDER values(9, 34, 33, 05, '29-MAR-2012')
INTO BUY_ORDER values(10, 26, 39, 13, '31-DEC-2017')
INTO BUY_ORDER values(11, 12, 34, 23, '20-JUN-2010')
INTO BUY_ORDER values(12, 02, 15, 20, '18-NOV-2008')
INTO BUY_ORDER values(13, 15, 31, 27, '23-AUG-2007')
INTO BUY_ORDER values(14, 09, 38, 14, '12-JAN-2015')
INTO BUY_ORDER values(15, 25, 12, 05, '09-AUG-2003')
INTO BUY_ORDER values(16, 20, 17, 32, '18-APR-2020')
INTO BUY_ORDER values(17, 03, 14, 16, '19-NOV-2005')
INTO BUY_ORDER values(18, 21, 35, 18, '14-FEB-2020')
INTO BUY_ORDER values(19, 18, 40, 25, '03-OCT-2015')
INTO BUY_ORDER values(20, 08, 37, 24, '13-FEB-2014')

SELECT * FROM dual;

CREATE OR REPLACE TRIGGER UPDATE_INFOS
BEFORE INSERT ON BUY_ORDER
for each row
DECLARE
b_id BUY_ORDER.EMP_ID%TYPE;
BEGIN
SELECT BRANCH_ID INTO b_id FROM EMPLOYEE where EMP_ID = :new.EMP_ID;
if( b_id is not null) then
UPDATE STORED SET PROD_COUNT = PROD_COUNT-1 WHERE b_id = BRANCH_ID AND PROD_ID = :new.PROD_ID;
UPDATE STORED SET UPDATE_DATE = TRUNC(SYSDATE) WHERE b_id = BRANCH_ID AND PROD_ID = :new.PROD_ID;
UPDATE EMPLOYEE SET SALES_AMOUNT = SALES_AMOUNT+1 WHERE b_id = BRANCH_ID AND EMP_ID = :new.EMP_ID;
END IF;
END;

/
CREATE OR REPLACE TRIGGER BonusSalary
BEFORE UPDATE OR INSERT OF SALES_AMOUNT on EMPLOYEE
FOR EACH ROW
WHEN (NEW.SALES_AMOUNT >50)
BEGIN
IF (:old.TITLE = 'REPAIRMAN' or :old.TITLE = 'MANAGER') THEN
:new.SALARY := :old.SALARY*1.25;
ELSE
:new.SALARY := :old.SALARY*1.15;
END IF;
END;

/



CREATE OR REPLACE TRIGGER changeStockInfo
BEFORE UPDATE ON STORED
for each row
when (NEW.PROD_COUNT = 0)
BEGIN
:new.INSTOCK := 0;
END;

/

CREATE OR REPLACE TRIGGER PromoteEmp
    BEFORE UPDATE OR INSERT on EMPLOYEE
    FOR EACH ROW 
    WHEN (EXTRACT(YEAR FROM TRUNC(SYSDATE)) - EXTRACT(YEAR FROM old.START_DATE) >= 15)
    BEGIN
		IF(:old.TITLE = 'SALESMAN') THEN
        :new.TITLE := 'MANAGER';
		:new.SALARY := 10200;
		ELSIF (:old.TITLE ='REPAIRMAN') THEN 
			:new.SALARY := :old.SALARY*1.20;
		
		END IF;
    END;
