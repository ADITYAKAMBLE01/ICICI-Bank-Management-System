create database ICIC_BANK_MANAGEMENT;
USE ICIC_BANK_MANAGEMENT;
create table Account_Type (
Account_no int primary key,
Type_Account varchar(255),
Manager_id int,
Department_name varchar(255),
Opening_Date date);

insert into Account_Type (Account_no, Type_Account, Manager_id, Department_name, Opening_Date) values
(12345,"Saving",20,"Account","2003-04-23"),
(67899,"loan",21,"loan","2004-05-24"),
(10112,"Saving",22,"HR","2006-01-04"),
(13145,"loan",23,"Admin","2003-04-23"),
(15167,"current",24,"Sales","2004-05-24"),
(18190,"business",25,"Security","2006-01-04"),
(20210,"loan",26,"Account","2003-04-23"),
(22230,"Saving",27,"Loan","2004-05-24"),
(24250,"loan",28,"HR","2006-01-04"),
(26270,"current",29,"Admin","2003-04-23"),
(28290,"business",30,"Sales","2004-05-24"),
(30310,"current",31,"Security","2006-01-04"),
(32330,"Saving",32,"Account","2003-04-23"),
(34350,"loan",33,"Loan","2004-05-24"),
(36370,"current",34,"HR","2006-01-04"),
(38390,"current",35,"Admin","2003-04-23"),
(40410,"business",36,"Sales","2004-05-24"),
(42430,"loan",37,"Security","2006-01-04"),
(44450,"Saving",38,"Account","2003-04-23"),
(46470,"loan",39,"Loan","2004-05-24"),
(48490,"Saving",40,"HR","2006-01-04");

SELECT * FROM Account_type;

create table Department ( 
Department_id int primary key,
Department_name varchar (255),
Manager_id int,
Employee_id int,
Account_no int,
foreign key (Account_no) references Account_Type(Account_no) on delete cascade
on update cascade );

insert into Department (Department_id, Department_name, Manager_id, Employee_id, Account_no) values
(1,"Account",20,50,12345),
(8,"Loan",21,51,67899),
(11,"HR",22,52,10112),
(16,"Admin",23,53,13145),
(19,"Sales",24,54,15167),
(21,"Security",25,55,18190);

select * from Department;

create table Bank_Details (
Branch_code int Primary key,
Address varchar(255),
Department_id int,
Branch_name varchar(255),
State varchar(255),
foreign key (Department_id) references Department(Department_id) on delete cascade
on update cascade );

insert into Bank_Details (Branch_code,Address,Department_id,Branch_name,State) values
(100,"Nagpur",1,"ICIC_N","Maharashtra"),
(101,"Pune",1,"ICIC_P","Maharashtra"),
(102,"Mumbai",1,"ICIC_M","Maharashtra"),
(103,"delhi",1,"ICIC_D","DEL"),
(104,"Mumbai",1,"ICIC_M","Maharashtra"),
(105,"delhi",1,"ICIC_D","DEL"),
(106,"Nagpur",1,"ICIC_N","Maharashtra"),
(107,"Pune",8,"ICIC_P","Maharashtra"),
(108,"Mumbai",8,"ICIC_M","Maharashtra"),
(109,"Nagpur",8,"ICIC_N","Maharashtra"),
(110,"Pune",11,"ICIC_P","Maharashtra"),
(111,"Mumbai",11,"ICIC_M","Maharashtra"),
(112,"delhi",11,"ICIC_D","DEL"),
(113,"Nagpur",11,"ICIC_N","Maharashtra"),
(114,"Pune",11,"ICIC_P","Maharashtra"),
(115,"Mumbai",16,"ICIC_M","Maharashtra"),
(116,"Nagpur",16,"ICIC_N","Maharashtra"),
(117,"Pune",16,"ICIC_P","Maharashtra"),
(118,"Mumbai",19,"ICIC_M","Maharashtra"),
(119,"delhi",19,"ICIC_D","DEL"),
(120,"Pune",21,"ICIC_P","Maharashtra");

select * from Bank_details;

create table Job_details (
Job_id VARCHAR(255) Primary key,
Department_id int,
Branch_code int,
foreign key (Department_id) references Department(Department_id) on delete cascade on update cascade,
foreign key (Branch_code) references Bank_Details(Branch_code) on delete cascade on update cascade);

insert into Job_details (Job_id, Department_id, Branch_code) values
("ST_CLERK",1,101),
("ST_MAN",8,108),
("FI_ACCOUNT",11,113),
("SA_REP",19,118);

select * from Job_details;

create table Employees (
Employee_id int primary key,
First_name varchar(255),
Department_id int,
Manager_id int,
Job_id varchar(255),
Email varchar(255),
Hire_Date date,
Phone_no VARCHAR(255),
Salary int,
foreign key (Department_id) references Department(Department_id) on delete cascade on update cascade,
foreign key (Job_id) references Job_details(Job_id) on delete cascade on update cascade);

insert into Employees 
(Employee_id, First_name, Department_id, Manager_id, Job_id, Email, Hire_date, Phone_no, Salary) values
(50,"Samuel",1,20,"ST_CLERK","SMCCAIN","2007-11-23","650.505.1876",3800),
(51,"Allan",8,21,"ST_CLERK","SSEWALL","2004-01-30","650.505.2876",3600),
(52,"Irene",11,22,"ST_CLERK","SSTILES","2004-03-04","650.505.3876",2900),
(53,"Kevin",16,23,"ST_CLERK","STOBIAS","2004-08-01","650.505.4876",2500),
(54,"Julia",19,24,"ST_CLERK","SVOLLMAN","2005-03-10","650.501.1876",4000),
(55,"Donald",21,25,"ST_CLERK","TFOX","2005-12-15","650.501.2876",3900),
(56,"Christopher",1,26,"ST_CLERK","TGATES","2006-11-03","650.501.3876",3200),
(57,"TJ",8,27,"ST_MAN","TJOLSON","2005-11-11","650.501.4876",2800),
(58,"Lisa",11,28,"ST_MAN","TRAJS","2007-03-19","650.507.9811",3100),
(59,"Karen",16,29,"ST_MAN","VJONES","2008-01-24","650.507.9822",3000),
(60,"Valli",19,30,"ST_MAN","VPATABAL","2008-02-23","650.507.9833",2600),
(61,"Joshua",21,31,"ST_MAN","WGIETZ","2003-05-01","650.507.9844",6400),
(62,"Randall",1,32,"FI_ACCOUNT","WSMITH","2005-10-10","515.123.4444",6200),
(63,"Hazel",8,33,"FI_ACCOUNT","WTAYLOR","2007-11-16","515.123.5555",11500),
(64,"Luis",11,34,"FI_ACCOUNT","JNAYER","2005-07-16","603.123.6666",10000),
(65,"Trenna",16,35,"FI_ACCOUNT","JPATEL","2006-09-28","515.123.7777",9600),
(66,"Den",19,36,"FI_ACCOUNT","JRUSSEL","2007-01-14","515.123.8888",7400),
(67,"Michael",21,37,"SA_REP","JSEO","2008-03-08","515.123.8080",7300),
(68,"John",1,38,"SA_REP","JTAYLOR","2005-08-20","011.44.1346.329268",6100),
(69,"Nandita",8,39,"SA_REP","JWHALEN","2005-10-30","011.44.1346.529268",11000),
(70,"Ismael",11,40,"SA_REP","KCHUNG","2005-02-16","011.44.1346.52",8800);

select * FROM Employees;

create table Customer (Account_no int primary key,
First_name varchar(255),
City varchar(255),
Branch_code int,
Employee_id int,
Phone_no varchar(255),
Atm_no int unique,
Exp_date date,
Pin_no int unique,
foreign key (Branch_code) references Bank_Details(Branch_code) on delete cascade on update cascade,
foreign key (Employee_id) references Employees(Employee_id) on delete cascade on update cascade);

insert into customer (Account_no, First_name, City, Branch_code, Employee_id, Phone_no, Atm_no, Exp_date, Pin_no) values
(12345,"Samuel","Nagpur",100,50,"650.505.1876",423705689,"2006-04-23",5689),
(67899,"Allan","Pune",101,51,"650.505.2876",423568971,"2007-05-24",8971),
(10112,"Irene","Mumbai",102,52,"650.505.3876",423432253,"2008-01-04",12253),
(13145,"Kevin","delhi",103,53,"650.505.4876",423295535,"2006-01-24",15535),
(15167,"Julia","Mumbai",104,54,"650.501.1876",423158817,"2006-02-23",18817),
(18190,"Donald","delhi",105,55,"650.501.2876",423022099,"2007-06-21",22099),
(20210,"Christopher","Nagpur",106,56,"650.501.3876",422885381,"2008-02-03",25381),
(22230,"TJ","Pune",107,57,"650.501.4876",422748663,"2004-01-27",28663),
(24250,"Lisa","Mumbai",108,58,"650.507.9811",422611945,"2005-02-20",31945),
(26270,"Karen","Nagpur",109,59,"650.507.9822",422475227,"2006-06-24",35227),
(28290,"Valli","Pune",110,60,"650.507.9833",422338509,"2007-02-07",38509),
(30310,"Joshua","Mumbai",111,61,"650.507.9844",422201791,"2008-01-13",41791),
(32330,"Randall","delhi",112,62,"515.123.4444",422065073,"2003-09-17",45073),
(34350,"Hazel","Nagpur",113,63,"515.123.5555",421928355,"2004-02-17",48355),
(36370,"Luis","Pune",114,64,"603.123.6666",421791637,"2005-08-17",51637),
(38390,"Trenna","Mumbai",115,65,"515.123.7777",421654919,"2002-06-07",54919),
(40410,"Den","Nagpur",116,66,"515.123.8888",421518201,"2002-06-07",58201),
(42430,"Michael","Pune",117,67,"515.123.8080",421381483,"2002-06-07",61483),
(44450,"John","Mumbai",118,68,"011.44.1346.329268",421244765,"2002-06-07",64765),
(46470,"Nandita","delhi",119,69,"011.44.1346.529268",421108047,"2008-04-21",68047),
(48490,"Ismael","Pune",120,70,"011.44.1346.52",420971329,"2005-03-11",71329);

select * from customer;