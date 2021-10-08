-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 08, 2021 at 03:29 PM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `description` varchar(5000) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `name`, `description`) VALUES
(1, 'java', 'java is programming language use for android application'),
(2, 'python', 'python is programming language use for AI'),
(3, 'php', 'website design');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `ptitle` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pcontent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pcode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ppic` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default.png',
  `pdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `catid` int NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`pid`, `ptitle`, `pcontent`, `pcode`, `ppic`, `pdate`, `catid`, `uid`) VALUES
(15, 'Java Control Statements | Control Flow in Java', 'Java compiler executes the code from top to bottom. The statements in the code are executed according to the order in which they appear. However, Java provides statements that can be used to control the flow of Java code. Such statements are called control flow statements. It is one of the fundamental features of Java, which provides a smooth flow of program.\r\n', 'public class Student {    \r\npublic static void main(String[] args) {    \r\nint x = 10;    \r\nint y = 12;    \r\nif(x+y > 20) {    \r\nSystem.out.println(\"x + y is greater than 20\");    \r\n}    \r\n}      \r\n}     ', 'if1.png', '2021-10-08 13:57:25', 1, 16),
(14, 'About java', 'Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. It is a general-purpose programming language intended to let programmers write once, run anywhere (WORA),[17] meaning that compiled Java code can run on all platforms that support Java without the need for recompilation.[18] Java applications are typically compiled to bytecode that can run on any Java virtual machine (JVM) regardless of the underlying computer architecture. The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them. The Java runtime provides dynamic capabilities (such as reflection and runtime code modification) that are typically not available in traditional compiled languages. As of 2019, Java was one of the most popular programming languages in use according to GitHub,[19][20] particularly for client-server web applications, with a reported 9 million developers.', 'class Simple{  \r\n    public static void main(String args[]){  \r\n     System.out.println(\"Hello Java\");  \r\n    }  \r\n}  ', 'java.jpg', '2021-10-08 13:54:34', 1, 16),
(16, 'Constructors in Java', 'In Java, a constructor is a block of codes similar to the method. It is called when an instance of the class is created. At the time of calling constructor, memory for the object is allocated in the memory.\r\n\r\nIt is a special type of method which is used to initialize the object.\r\n\r\nEvery time an object is created using the new() keyword, at least one constructor is called.\r\n\r\nIt calls a default constructor if there is no constructor available in the class. In such case, Java compiler provides a default constructor by default.\r\n\r\nThere are two types of constructors in Java: no-arg constructor, and parameterized constructor.\r\n\r\nNote: It is called constructor because it constructs the values at the time of object creation. It is not necessary to write a constructor for a class. It is because java compiler creates a default constructor if your class doesn\'t have any.', '//Java Program to create and call a default constructor class Bike1{  \r\n//creating a default constructor  \r\nBike1(){System.out.println(\"Bike is created\");}  \r\n//main method  \r\npublic static void main(String args[]){  \r\n//calling a default constructor  \r\nBike1 b=new Bike1();  \r\n}  \r\n}  ', 'java-constructor.png', '2021-10-08 13:59:59', 1, 16),
(17, 'Why to Learn Python?', 'Python is a high-level, interpreted, interactive and object-oriented scripting language. Python is designed to be highly readable. It uses English keywords frequently where as other languages use punctuation, and it has fewer syntactical constructions than other languages.\r\n\r\nPython is a MUST for students and working professionals to become a great Software Engineer specially when they are working in Web Development Domain.', '', 'pydownload.png', '2021-10-08 14:04:27', 2, 16),
(18, 'Loops in Python', 'In general, statements are executed sequentially: The first statement in a function is executed first, followed by the second, and so on. There may be a situation when you need to execute a block of code several number of times.\r\n\r\nProgramming languages provide various control structures that allow for more complicated execution paths.\r\n\r\nA loop statement allows us to execute a statement or group of statements multiple times. The following diagram illustrates a loop statement', '# Program to find the sum of all numbers stored in a list\r\n\r\n# List of numbers\r\nnumbers = [6, 5, 3, 8, 4, 2, 5, 4, 11]\r\n\r\n# variable to store the sum\r\nsum = 0\r\n\r\n# iterate over the list\r\nfor val in numbers:\r\n    sum = sum+val\r\n\r\nprint(\"The sum is\", sum)\r\n', 'loop_architecture.jpg', '2021-10-08 14:06:31', 2, 16),
(19, 'Why Php?', 'PHP is a recursive acronym for \"PHP: Hypertext Preprocessor\".\r\n\r\nPHP is a server side scripting language that is embedded in HTML. It is used to manage dynamic content, databases, session tracking, even build entire e-commerce sites.\r\n\r\nIt is integrated with a number of popular databases, including MySQL, PostgreSQL, Oracle, Sybase, Informix, and Microsoft SQL Server.\r\n\r\nPHP is pleasingly zippy in its execution, especially when compiled as an Apache module on the Unix side. The MySQL server, once started, executes even very complex queries with huge result sets in record-setting time.\r\n\r\nPHP supports a large number of major protocols such as POP3, IMAP, and LDAP. PHP4 added support for Java and distributed object architectures (COM and CORBA), making n-tier development a possibility for the first time.\r\n\r\nPHP is forgiving: PHP language tries to be as forgiving as possible.\r\n\r\nPHP Syntax is C-Like.', '', 'photo-1599507593499-a3f7d7d97667.jpg', '2021-10-08 14:09:25', 3, 16);

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

DROP TABLE IF EXISTS `userdata`;
CREATE TABLE IF NOT EXISTS `userdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `about` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '''hey, I am using Wblog''',
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `profile` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`id`, `fname`, `lname`, `email`, `password`, `gender`, `about`, `regdate`, `profile`) VALUES
(16, 'samir', 'Thorave', 'errordetect01@gmail.com', 'aaa', 'Male', 'i am developer\r\n                                    \r\n                                            \r\n                                            ', '2021-09-27 04:21:30', 'ragav.jpeg'),
(20, 'sagar', 'Thorave', 'sagar@gmail.com', 'sagar', 'Male', 'hii\r\n                                    \r\n                                    \r\n                                    \r\n                                    \r\n                                    \r\n                                    ', '2021-09-30 08:41:06', 'browser.png'),
(22, 'ram', 'sharma', 'ramudada@gmail.com', 'ramu', 'Male', 'hii i am here\r\n                                    ', '2021-09-30 13:40:17', 'thepro.jpeg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
