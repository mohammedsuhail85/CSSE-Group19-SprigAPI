CREATE TABLE Authorized_Employee( 
	ID VARCHAR(10),
	
	Type VARCHAR(20) NOT NULL ,
	Name VARCHAR(30) NOT NULL ,
	Password VARCHAR(255) NOT NULL,
	Mobile_Number VARCHAR(10) NOT NULL,
	
	CONSTRAINT pk_Authorized_Employee PRIMARY KEY(ID)
);

CREATE TABLE Item ( 
	ID INT AUTO_INCREMENT,
	
	Name VARCHAR(30),
	Price DOUBLE NOT NULL,
	Item_Policy VARCHAR(255) NULL,
	Item_Comment VARCHAR(150) NULL,
	
	CONSTRAINT pk_Item PRIMARY KEY(ID)
);

CREATE TABLE Supplier(
	ID INT AUTO_INCREMENT,
	
	Name VARCHAR(30) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone_Number VARCHAR(10) NOT NULL,
	Email VARCHAR(255) NULL,
	Bank_Account_Number VARCHAR(50) NOT NULL,
	
	CONSTRAINT pk_Supplier PRIMARY KEY(ID)
);

CREATE TABLE Policy ( 
	ID INT AUTO_INCREMENT,
	Manager_ID VARCHAR(10) NOT NULL,
	
	Type VARCHAR(20),
	Value DOUBLE,
	
	CONSTRAINT pk_Policy PRIMARY KEY(ID),
	CONSTRAINT fk_Policy_Manager FOREIGN KEY (Manager_ID) REFERENCES Authorized_Employee(ID)
);

CREATE TABLE Site ( 
	ID INT AUTO_INCREMENT,
	Site_Manager_ID VARCHAR(10) NOT NULL,
	
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	
	CONSTRAINT pk_Site PRIMARY KEY(ID),
	CONSTRAINT fk_Site_Site_Manager FOREIGN KEY (Site_Manager_ID) REFERENCES Authorized_Employee(ID)
);


CREATE TABLE Purchase_Order ( 
	ID INT AUTO_INCREMENT,
	Site_Manager_ID VARCHAR(10) NOT NULL,
	Manager_ID VARCHAR(10) NULL,
	Supplier_ID INT NULL,
	
	Status VARCHAR(30) NOT NULL,
	Order_Comment VARCHAR(150) NULL,
	Initiated_Date DATE NOT NULL,
	Expected_Date DATE NOT NULL,
	
	CONSTRAINT pk_Purchase_Order PRIMARY KEY(ID),
	CONSTRAINT fk_Purchase_Order_Site_Manager FOREIGN KEY (Site_Manager_ID) REFERENCES Authorized_Employee(ID),
	CONSTRAINT fk_Purchase_Order_Manager FOREIGN KEY (Manager_ID) REFERENCES Authorized_Employee(ID),
	CONSTRAINT fk_Purchase_Order_Supplier FOREIGN KEY (Supplier_ID) REFERENCES Supplier(ID)
);

CREATE TABLE Invoice ( 
	ID INT AUTO_INCREMENT,
	Purchase_Order_ID INT NOT NULL,
	Supplier_ID INT NOT NULL,

	Total_Price DOUBLE NOT NULL,
	Invoice_Comment VARCHAR(150) NULL,
	Issue_Date DATE NOT NULL,
	
	CONSTRAINT pk_Invoice PRIMARY KEY(ID),
	CONSTRAINT fk_Invoice_Purchase_Order FOREIGN KEY (ID) REFERENCES Purchase_Order(ID),
	CONSTRAINT fk_Invoice_Supplier FOREIGN KEY (Supplier_ID) REFERENCES Supplier(ID)
);

CREATE TABLE Goods_Receipt ( 

	ID INT AUTO_INCREMENT,
	Purchase_Order_ID INT NOT NULL,
	Supplier_ID INT NOT NULL,
	
	Status VARCHAR(30) NULL,
	Goods_Receipt_Comment VARCHAR(150) NULL,
	Issue_Date DATE NOT NULL,
	
	CONSTRAINT pk_Goods_Receipt PRIMARY KEY(ID),
	CONSTRAINT fk_Goods_Receipt_Purchase_Order FOREIGN KEY (Purchase_Order_ID) REFERENCES Purchase_Order(ID),
	CONSTRAINT fk_Goods_Receipt_Supplier FOREIGN KEY (Supplier_ID) REFERENCES Supplier(ID)
);

CREATE TABLE Goods_Receipt_Item ( 
	Goods_Receipt_ID INT NOT NULL,
	Item_ID INT NOT NULL,
	
	Quantity INT NOT NULL,
	
	CONSTRAINT pk_Goods_Receipt_Item PRIMARY KEY(Goods_Receipt_ID, Item_ID),
	CONSTRAINT fk_Goods_Receipt_Item_Goods_Receipt FOREIGN KEY (Goods_Receipt_ID) REFERENCES Goods_Receipt(ID),
	CONSTRAINT fk_Goods_Receipt_Item_Item FOREIGN KEY (Item_ID) REFERENCES Item(ID)
);

CREATE TABLE Purchase_Order_Item ( 

	Purchase_Order_ID INT NOT NULL,
	Item_ID INT NOT NULL,
	
	Quantity INT NOT NULL,
	
	CONSTRAINT pk_Goods_Receipt_Item PRIMARY KEY(Purchase_Order_ID, Item_ID),
	CONSTRAINT fk_Purchase_Order_Item_Purchase_Order FOREIGN KEY (Purchase_Order_ID) REFERENCES Purchase_Order(ID),
	CONSTRAINT fk_Purchase_Order_Item_Item FOREIGN KEY (Item_ID) REFERENCES Item(ID)
);

INSERT INTO Authorized_Employee 
(ID, Type, Name, Password, Mobile_Number)
VALUES 
('sm1', 'Site Manager', 'Jhon', 'jhon1234', '0771231234'),
('mg1', 'Manager', 'Bruce', 'bruce1234', '0779119110')
;

INSERT INTO Item 
(ID, Name, Price, Item_Policy, Item_Comment)
VALUES 
(NULL, 'Steel Bars', 20000, NULL, NULL),
(NULL, 'Cement', 6000, 'min=5', 'Holciem Cement')
;
INSERT INTO Supplier 
(ID, Name, Address, Phone_Number, Email, Bank_Account_Number) 
VALUES 
(NULL, 'ABC Company', 'Colombo', '0779119110', 'abc@gmail.com', '1234-1245-9876-5738'), 
(NULL, 'Blue Ocean', 'Kandy', '0778181422', 'blue.ocean@gmail.com', '9876-9876-1234-1234')
;
INSERT INTO Policy
(ID, Manager_ID, Type, Value)
VALUES
(NULL, 'mg1', 'max', 200000)
;
INSERT INTO Site
(ID, Site_Manager_ID, Name, Address)
VALUES
(NULL, 'sm1', 'SL Tower', 'Kandy'),
(NULL, 'sm1', 'SLIIT Main Building', 'Malabe')
;
INSERT INTO Purchase_Order
(ID, Site_Manager_ID, Manager_ID, Supplier_ID, Status, Order_Comment, Initiated_Date, Expected_Date)
VALUES
(NULL, 'sm1', NULL, NULL, 'Pending For Approval', NULL, '2018-10-01', '2018-10-05'),
(NULL, 'sm1', 'mg1', 1, 'Approved', 'Check for s-lon pipes', '2018-09-29', '2018-10-06')
 ;
 INSERT INTO `purchase_order` (`ID`, `Site_Manager_ID`, `Manager_ID`, `Supplier_ID`, `Status`, `Order_Comment`, `Initiated_Date`, `Expected_Date`) VALUES (1, 'sm1', 'mg1', '1', 'MANAGER_APPROVED', NULL, '2018-10-05', '2018-10-15');
 INSERT INTO `purchase_order_item` (`Purchase_Order_ID`, `Item_ID`, `Quantity`) VALUES ('1', '1', '5');
 INSERT INTO `purchase_order_item` (`Purchase_Order_ID`, `Item_ID`, `Quantity`) VALUES ('1', '2', '5');
 
