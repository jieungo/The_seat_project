CREATE TABLE seat_users(
	name varchar2(100) not null,
	email varchar2(100) primary key,
	pwd varchar2(100) not null,
	phoneNumber varchar(20) not null,
	profile clob,
	tag clob,
	regdate date
);

create table store(
	num number primary key,
	owner varchar2(100) not null,
	storeName varchar2(100) not null,
	storeAddr clob not null,
	storePhone varchar2(100) not null,
	storeTag clob,
	openingTime clob,
	image_logo clob,
	image_1 clob,
	image_2 clob,
	image_3 clob,
	image_4 clob,
	storeOpen varchar2(10) not null,
	imageCheck varchar2(10),
	category clob,
	regdate date
);

create sequence store_seq;

CREATE TABLE storeMenu(
	num number primary key,
	storeNum number,
	storeName varchar2(100) not null,
	menuImage clob,
	menuName varchar2(100) not null,
	content clob,
	price number not null,
	best varchar2(10),
	category varchar2(100)
);

create sequence storeMenu_seq;

CREATE TABLE storeReview(
	num NUMBER PRIMARY KEY,
	storeNum number,
	storeName VARCHAR2(100) NOT NULL,
	writer VARCHAR2(100) NOT NULL,
	content VARCHAR2(100) NOT NULL,
	star NUMBER,
	targetNum number,
	imagePath clob,
	regdate DATE
);

CREATE SEQUENCE storeReview_seq;

CREATE TABLE order_(
	orderNum VARCHAR2(100),
	email VARCHAR2(100) not null,
	storeName VARCHAR2(100) not null,
	storeLogo VARCHAR2(100),
	num VARCHAR2(100),
	tableNum NUMBER,
	menu VARCHAR2(100),
	menuCount NUMBER,
	price NUMBER,
	amount NUMBER,
	regdate DATE
);

CREATE TABLE storeSeat(


);

CREATE TABLE info(
	num,
	writer,
	title,
	content,
	viewCount,
	regdate,
	rowNum
);

CREATE TABLE infoComment(
	
);