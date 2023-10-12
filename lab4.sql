SET SERVEROUT ON
SET VERIFY OFF
/*
CREATE TABLE  borrower(roll_no NUMBER , name VARCHAR2(25), dateofissue DATE,name_of_book VARCHAR2(25), status VARCHAR2(20));

CREATE TABLE fine(roll_no NUMBER,date_of_return DATE,amt NUMBER);

SQL> INSERT INTO borrower VALUES(31,'ASHISH',TO_DATE('01-08-2023','DD-MM-YYYY'),'DBMS','I');

1 row created.

SQL> INSERT INTO borrower VALUES(32,'SAURABH',TO_DATE('15-08-2023','DD-MM-YYYY'),'TOC','');

1 row created.

SQL> INSERT INTO borrower VALUES(33,'SUCHITA',TO_DATE('24-08-2023','DD-MM-YYYY'),'SPOS','I');

1 row created.

SQL> INSERT INTO borrower VALUES(34,'VASHAVAVI',TO_DATE('26-08-2023','DD-MM-YYYY'),'CNS','I');

1 row created.

SQL> INSERT INTO borrower VALUES(35,'AYUSH',TO_DATE('09-09-2023','DD-MM-YYYY'),'IOT','I');

1 row created.
*/
DECLARE 
	i_roll_no NUMBER;
	name_of_book VARCHAR2(25);
	no_of_days NUMBER;
	return_date DATE := TO_DATE(SYSDATE,'DD-MM-YYYY');
	temp NUMBER;
	doi DATE;
	fine NUMBER;
BEGIN
	i_roll_no := &i_roll_no;
	name_of_book := '&nameofbook';
	dbms_output.put_line(return_date);
	SELECT to_date(borrower.dateofissue,'DD-MM-YYYY') INTO doi FROM borrower WHERE borrower.roll_no = i_roll_no AND borrower.name_of_book = name_of_book;
	no_of_days := return_date-doi;
	dbms_output.put_line(no_of_days);
	IF (no_of_days >15 AND no_of_days <=30) THEN
		fine := 5*no_of_days;
		
	ELSIF (no_of_days>30 ) THEN
		temp := no_of_days-30;
		fine := 150 + temp*50;
	END IF;
	dbms_output.put_line(fine);
	INSERT INTO fine VALUES(i_roll_no,return_date,fine);
	UPDATE borrower SET status = 'R' WHERE borrower.roll_no = i_roll_no;
	
	
END;
/