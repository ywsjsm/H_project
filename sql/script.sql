CREATE TABLE `board` (
  `board_no` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` mediumtext,
  `category_no` int unsigned DEFAULT NULL,
  `imageName` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `userNo` int DEFAULT NULL,
  `readCount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`board_no`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8


CREATE TABLE `comment` (
  `reply_no` int unsigned NOT NULL AUTO_INCREMENT,
  `Board_no` int unsigned DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `userPw` varchar(255) DEFAULT NULL,
  `user_no` varchar(255) NOT NULL,
  PRIMARY KEY (`reply_no`),
  KEY `comment_ibfk_1` (`Board_no`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`Board_no`) REFERENCES `board` (`board_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8


CREATE TABLE `user` (
  `userId` varchar(255) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userPassword` varchar(255) DEFAULT NULL,
  `regDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `userNo` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `userNo_UNIQUE` (`userNo`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8


CREATE TABLE `withdrawaluser` (
  `userNo` int unsigned NOT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`userNo`),
  UNIQUE KEY `userNo_UNIQUE` (`userNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8