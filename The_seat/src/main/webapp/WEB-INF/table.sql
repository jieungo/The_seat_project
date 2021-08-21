CREATE TABLE users(
	email VARCHAR2(100) PRIMARY KEY,
	pwd VARCHAR2(100) NOT NULL,
	tag VARCHAR2(100),
	profile VARCHAR2(100),
	regdate DATE
);

CREATE TABLE store(
	num,
	owner,
	storeName,
	storeAddr,
	storeTag,
	openTime,
	image_1,
	image_2,
	image_3,
	image_4
);

CREATE TABLE storeMenu(
	num,
	storeName,
	item,
	content,
	price,
	best
);

CREATE TABLE storeReview(
	num,
	storeName,
	writer,
	content,
	star,
	targetNum,
	regdate
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