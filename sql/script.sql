create database h_project;
use h_project;

create table User(
	userId varchar(255) primary key,
    userEmail varchar(255),
    userName varchar(255),
    userPassword varchar(255),
    regDate	dateTime default now()
);

desc User;
select * from User;

create table Board(
	board_no int unsigned auto_increment,
    title varchar(255),
    content varchar(255),
    category_no int unsigned,
    imageName varchar(255),
    userName varchar(255),
    userId varchar(255), 
    regdate datetime default now(),
	primary key (board_no),
    Foreign key(userId) references User(userId)
);

desc Board;
select * from Board;

create table Comment(
	reply_no int unsigned auto_increment,
    Board_no int unsigned,
    userId varchar(255),
    content varchar(255),
    primary key (reply_no),
    Foreign key(board_no) references Board(board_no)
);

desc Comment;
select * from Comment;