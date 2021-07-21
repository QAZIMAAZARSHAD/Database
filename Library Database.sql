CREATE DATABASE library_demo;

USE library_demo;

CREATE TABLE readers
    (
       reader_id VARCHAR(30),
       fname VARCHAR(30),
       mname VARCHAR(30),
       lname VARCHAR(30),
       city VARCHAR(30),
       mobileno VARCHAR(30),
       occupation VARCHAR(35),
       dob DATE,
       CONSTRAINT readers_pk PRIMARY KEY(reader_id)
	);
    
INSERT INTO readers VALUES('001','Qazi','Maaz','Arshad','Bahraich','8922075023','Software Engineer','1999-12-7');
INSERT INTO readers VALUES('002','Daenerys',null,'Targareyn','Valeria','7622875098','Queen','1993-11-13');
INSERT INTO readers VALUES('003','Light',null,'Yagami','Tokyo','7654078883','God of New World','1997-12-6');
INSERT INTO readers VALUES('004','Walter',null,'White','Albuquerque','5642876528','Meth Cook','1969-12-1');
INSERT INTO readers VALUES('005','Shinchan',null,'Nohara','Tokyo','8976546501','Member - Kasukabe Defence Group','2006-12-29');
INSERT INTO readers VALUES('006','Mikasa',null,'Ackerman','Shiganshina','8765098754','Survey Corps Veteran','1997-12-20');
INSERT INTO readers VALUES('007','Randy','Keith','Orton','California','5763219087','Professional Wrestler','1972-12-3');
INSERT INTO readers VALUES('008','Professor','Albus','Dumbledore','Hogwarts','9876475023','Wizard','1809-12-17');

SELECT * FROM readers;

CREATE TABLE book
   (
      bid VARCHAR(30),
      bname VARCHAR(30),
      bdomain VARCHAR(30),
      CONSTRAINT book_pk PRIMARY KEY(bid)
   );
   
INSERT INTO book VALUES('01','A Song Of Ice And Fire','Fantasy');
INSERT INTO book VALUES('02','The Merchant Of Venice','Drama');
INSERT INTO book VALUES('03','A Brief Hitory of Time','Science');

CREATE TABLE active_readers
   (
      account_id VARCHAR(6),
      reader_id VARCHAR(6),
      bid VARCHAR(6),
      atype VARCHAR(10),
      astatus VARCHAR(10),
      CONSTRAINT active_readers_pk PRIMARY KEY(account_id),
      CONSTRAINT account_readerid_fk FOREIGN KEY(reader_id) REFERENCES readers(reader_id),
      CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES book(bid)
   );

INSERT INTO active_readers VALUES('0001','001','01','Deluxe','Active');
INSERT INTO active_readers VALUES('0003','003','02','Standard','Terminated');
INSERT INTO active_readers VALUES('0004','004','03','Premium','Active');

SELECT * FROM active_readers;

CREATE TABLE bookissue_details
   (
      issuenumber VARCHAR(6),
      account_id VARCHAR(6),
      bid VARCHAR(20),
      bookname VARCHAR(30),
      number_of_books_issued INT(10),
      CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(issuenumber),
      CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(account_id) REFERENCES active_readers(account_id)
   );
   
INSERT INTO bookissue_details VALUES('00001','0001','01','A Song Of Ice And Fire','1');
INSERT INTO bookissue_details VALUES('00002','0003','01','A Song Of Ice And Fire','7');
INSERT INTO bookissue_details VALUES('00003','0004','02','The Merchant Of Venice','0');

SELECT * FROM active_readers;

SELECT * FROM active_readers WHERE astatus='Terminated';

SELECT * FROM active_readers WHERE astatus='Active';

SELECT count(account_id) FROM active_readers WHERE atype='Premium';