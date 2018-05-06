USE MASTER
GO
DROP DATABASE dbs_Library
GO
CREATE DATABASE dbs_Library
GO
USE dbs_Library

CREATE TABLE tbl_Publisher (
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(50) NOT NULL,
	publisher_phone VARCHAR(50) NOT NULL,
);


CREATE TABLE tbl_Book (
	book_id INT PRIMARY KEY IDENTITY (1,1),
	book_title  VARCHAR(50) NOT NULL,
	book_publisher VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_id FOREIGN KEY REFERENCES tbl_Publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE,
);


CREATE TABLE tbl_Author (
	Book_id INT NOT NULL CONSTRAINT fk_books_id FOREIGN KEY REFERENCES tbl_Book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(50) NOT NULL

);

CREATE TABLE tbl_Library_Branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(50) NOT NULL
);



CREATE TABLE tbl_Book_Copies (
	
	Book_Id INT NOT NULL CONSTRAINT fk_copies_id FOREIGN KEY REFERENCES tbl_Book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	Branch_Id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_Library_Branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	No_Of_Copies INT NOT NULL
);

CREATE TABLE tbl_Borrower (
	card_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(50) NOT NULL,
	borrower_phone VARCHAR(50) nOT NULL
);
	

CREATE TABLE tbl_Loans (
	books_checked_out INT NOT NULL,
	book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_Book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branchs_id FOREIGN KEY REFERENCES tbl_Library_Branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_id INT NOT NULL CONSTRAINT fk_card_id FOREIGN KEY REFERENCES tbl_Borrower(card_id) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out DATE NOT NULL,
	due_date DATE NOt NULL
);

	Insert INTO tbl_Publisher
		(publisher_name, publisher_address, publisher_phone)
		VALUES
		('Tribe Books','4745 Walling Way','903-675-2256'),
		('Horror Books Publishing','2226 Regal Drive','553-346-7869'),
		('Tor Books','1134 Tuvan street','704-567-7796'),
		('Allen & Unwin','56783 Grand Street','669-832-5554'),
		('Amulet Books','6262 bee way','567-891-1116'),
		('Chicken Books','5534 Axe and 12th','345-213-567'),
		('Plant Publishers','P Sherman, 42 Wallaby Way, Sydney','402-764-7899'),
		('Cook Books','4345 Chowmein Rd','688-665-6656'),
		('Spirtual Books','4399 Orange Chicken Rd ','789-101-1112'),
		('Faber & Faber','22248 Heming Way','503-801-9256'),
		('Covici Friede','3456 Calaroga Drive','503-227-2755'),
		('Richard Bently','88923 Prindle Rd','875-667-7862')
		;
		SELECT * FROM tbl_Publisher;

	INSERT INTO tbl_Book
		(book_title, book_publisher)
		VALUES
		('The Lost Tribe','Tribe Books'),
		('I.T.','Horror Books Publishing'),
		('The Gunslinger','Horror Books publishing'),
		('The Name of the Wind','Tor Books'),
		('The Wise Mans Fear','Tor Books'),
		('Dune','Tor Books'),
		('Mistborn','Tor Books'),
		('The Hobbit','Allen & Unwin'),
		('The Lord of the Rings','Allen & Unwin'),
		('Diary of  Wimpy Kid','Amulet Books'),
		('Oh, The Places You''ll Go!','Amulet Books'),
		('Chickens 101','Chicken Books'),
		('Plant species','Plant publishers'),
		('Herbs','Plant Publishers'),
		('H.P Lovecraft Stories','Horror Books Publishing'),
		('Cooking good food','Cook Books'),
		('Meditation','Spirtual books'),
		('The lord of the flies','Faber & Faber'),
		('Of mice and Men','Covici Friede'),
		('Moby Dick','Richard Bently')
	;
Select * From tbl_Book;

	INSERT INTO tbl_Author
		(Book_id, author_name)
		VALUES
		(1,'John Smith'),
		(2,'Stephan King'),
		(3,'Stephan King'),
		(4,'Patrick Rothfuss'),
		(5,'Patrick Rothfuss'),
		(6,'Frank Herbert'),
		(7,'Brandon Sanderson'),
		(8,'J.R.Tolkien'),
		(10,'Jeff Kinney'),
		(11,'DR. Suess'),
		(12,'Josh chickman'),
		(13,'Stacy wang'),
		(14,'Stacy wang'),
		(9,'J.R.Tolkien'),
		(15,'H.P. Lovecraft'),
		(16,'Sam spark'),
		(17,'Stan charles'),
		(18,'William Golding'),
		(19,'John Steinbeck'),
		(20,'Herman Melville')
		;
		Select * From tbl_Author;

		INSERT INTO tbl_Library_Branch 
			(branch_name, branch_address)
			VALUES
			('Sharpstown','44442 seerway'),
			('Portland','20401 sw Bridge'),
			('New York','23456 NE serpen'),
			('Central','12345 West')
		;
		SELECT * FROM tbl_Library_Branch;


		INSERT INTO tbl_Book_Copies 
		(Book_Id, Branch_Id, No_Of_Copies)
		VALUES
		(1,1,1),
		(2,1,2), 
		(3,1,3),
		(4,1,4),
		(5,1,5),
		(6,1,6), 
		(7,1,7), 
		(8,1,8), 
		(9,1,9), 
		(10,1,1),
		(11,1,11),
		(12,1,12),
		(13,1,12),
		(14,1,12),
		(15,1,12),
		(16,1,12),
		(17,1,12),
		(18,1,12),
		(19,1,12),
		(20,1,12),
		(1,2,10),
		(2,2,10),
		(3,2,10),
		(4,2,10),
		(5,2,10),
		(6,2,10),
		(7,2,10),
		(8,2,10),
		(9,2,10),
		(10,2,10),
		(11,2,10),
		(12,2,10),
		(13,2,10),
		(14,2,10),
		(15,2,10),
		(16,2,10),
		(17,2,10),
		(18,2,10),
		(19,2,10),
		(20,2,10),
		(1,3,10),
		(2,3,10),
		(3,3,10),
		(4,3,10),
		(5,3,10),
		(6,3,10),
		(7,3,10),
		(8,3,10),
		(9,3,10),
		(10,3,10),
		(11,3,10),
		(12,3,10),
		(13,3,10),
		(14,3,10),
		(15,3,10),
		(16,3,10),
		(17,3,10),
		(18,3,10),
		(19,3,10),
		(20,3,10),
		(1,4,10),
		(2,4,10),
		(3,4,10),
		(4,4,10),
		(5,4,10),
		(6,4,10),
		(7,4,10),
		(8,4,10),
		(9,4,10),
		(10,4,10),
		(11,4,10),
		(12,4,10),
		(13,4,10),
		(14,4,10),
		(15,4,10),
		(16,4,10),
		(17,4,10),
		(18,4,10),
		(19,4,10),
		(20,4,10)
	Select * From tbl_Book_Copies; 

	INSERT INTO tbl_Borrower
	(borrower_name, borrower_address, borrower_phone)
	VALUES
	('John Smith','235234','502-227-6742'),
	('Sue Shuper','342323','402-548-3883'),
	('Rick Heinz ','324234','205-473-2782'), 
	('Dirk Turner','234234','628-265-2900'), 
	('Jess Ham','234232','220-228-4628'), 
	('Hector Smith','56766','385-232-6574'), 
	('Patrick Roosevelt','3453','345-264-6784'), 
	('James Rein','645645','503-556-6749')
	Select * From tbl_Borrower; 


	INSERT INTO tbl_Loans
	(books_checked_out, book_id, branch_id, card_id, date_out, due_date)
	VALUES
	(5,1,1,1, GETDATE()-1,GETDATE()),
	(3,2,1,1,GETDATE()-5,GETDATE()),
	(4,3,4,1,GETDATE()-4,GETDATE()+1),
	(7,4,4,1,GETDATE()-2,GETDATE()+3),
	(8,5,1,1,GETDATE(),GETDATE()+5),
	(7,6,2,2,GETDATE()-2,GETDATE()+7),
	(1,7,3,3,GETDATE()+1,GETDATE()+6),
	(0,8,4,4,GETDATE()-5,GETDATE()+1),
	(3,9,1,4,GETDATE()-5,GETDATE()+3),
	(5,10,2,5,GETDATE()-3,GETDATE()+1),
	(1,11,3,3,GETDATE()-4,GETDATE()+4),
	(5,12,4,3,GETDATE()-2,GETDATE()+1),
	(3,13,1,5,GETDATE()-1,GETDATE()+3),
	(2,14,2,6,GETDATE()-1,GETDATE()+1),
	(1,15,3,6,GETDATE()-1,GETDATE()+2),
	(1,16,4,5,GETDATE()-2,GETDATE()+3),
	(2,17,1,7,GETDATE()-3,GETDATE()+1),
	(3,18,2,1,GETDATE()-5,GETDATE()+2),
	(1,19,3,1,GETDATE()-2,GETDATE()+3),
	(3,20,4,6,GETDATE()-5,GETDATE()+4)
	SELECT * FROM tbl_Loans;

	SELECT No_Of_Copies FROM tbl_Book_Copies
	INNER JOIN tbl_Book ON tbl_Book.book_id= tbl_Book_Copies.Book_Id
	INNER JOIN tbl_Library_Branch ON tbl_Library_Branch.branch_id = tbl_Book_Copies.Branch_Id
	Where book_title = 'The Lost Tribe' AND branch_name = 'Sharpstown'

		SELECT No_Of_Copies  FROM tbl_Book_Copies
	INNER JOIN tbl_Book ON tbl_Book.book_id= tbl_Book_Copies.Book_Id
	INNER JOIN tbl_Library_Branch ON tbl_Library_Branch.branch_id = tbl_Book_Copies.Branch_Id
	Where book_title = 'The Lost Tribe' 
	
	SELECT borrower_name FROM tbl_Borrower
	INNER JOIN tbl_Loans ON tbl_Loans.card_id = tbl_Borrower.card_id
	WHERE books_checked_out = 0

	SELECT borrower_name, borrower_address, book_title, due_date, book_title, branch_name FROM tbl_Loans
	INNER JOIN tbl_Library_Branch ON tbl_Library_Branch.branch_id = tbl_Loans.branch_id
	INNER JOIN tbl_Borrower ON tbl_Borrower.card_id = tbl_Loans.card_id
	INNER JOIN tbl_Book ON tbl_Book.book_id = tbl_Loans.book_id
	WHERE branch_name = 'Sharpstown'  AND due_date = CURRENT_TIMESTAMP;


	SELECT  branch_name, SUM(books_checked_out) AS total_loans FROM tbl_Loans
		INNER JOIN tbl_Library_Branch ON tbl_Library_Branch.branch_id = tbl_Loans.branch_id
	GROUP BY branch_name;
	
	
	SELECT borrower_name, borrower_address, borrower_phone, books_checked_out FROM tbl_Borrower
	INNER JOIN tbl_Loans ON tbl_Loans.card_id = tbl_Borrower.card_id
	WHERE books_checked_out >= 5;

	
	SELECT book_title, No_Of_Copies FROM tbl_Author
	INNER JOIN tbl_Book_Copies ON tbl_Book_Copies.Book_Id = tbl_Author.Book_id
	INNER JOIN tbl_Library_Branch ON tbl_Library_Branch.branch_id = tbl_Book_Copies.Branch_Id
	INNER JOIN tbl_Book ON tbl_Book.book_id = tbl_Author.Book_id
	WHERE author_name = 'Stephan King' AND branch_name = 'Central';
	