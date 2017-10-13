DROP DATABASE IF EXISTS schedulesharp;
CREATE DATABASE schedulesharp;
 
use schedulesharp;
 
CREATE TABLE Admin (
    UserName VARCHAR(30) NOT NULL,
    PassWord VARCHAR(30) NOT NULL,
    SingleLogin INT,
    PRIMARY KEY (UserName)
);
 
insert into Admin values
('spain', 'barcelona', 0),
('admin', '1', 0),
('sasuke', 'uchiha', 0),
('multimedialab', '9515', 0),
('nike', 'jordan', 0);
 
CREATE TABLE School (
    SchoolID INT NOT NULL AUTO_INCREMENT,
    SchoolName VARCHAR(50) NOT NULL, 
    Semester INT,
    Days INT,
    Period INT,
    RangeLunch VARCHAR(5),
    PRIMARY KEY (SchoolID)
);
 
insert into School values
(null, 'School for the Talented and Gifted', 4, 7, 12, '1-12'),
(null, 'BASIS Scottsdale', 2, 4, 6, '3-4'),
(null, 'Gwinnett School', 3, 6, 11, '2-6'),
(null, 'Thomas Jefferson High School', 4, 5, 10, '3-8'),
(null, 'Pine View School', 1, 4, 6, '1-6');
 
CREATE TABLE Student (
    StudentID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50) NOT NULL,
    UserName VARCHAR(30) NOT NULL,
    PassWord VARCHAR(30) NOT NULL,
    Email VARCHAR(100),
    Approved INT,
    SSchoolID INT,
    SingleLogin INT,
    PRIMARY KEY (StudentID,SSchoolID),
    FOREIGN KEY (SSchoolID) references School(SchoolID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
 
insert into Student values
(null, 'chaehoon', 'lim', 'sizplay', '1234', 'sizplay@gmail.com', 0, 1, 0),
(null, 'richie', 'chan', 'richie', '0000', 'rchan41@gmail.com', 1, 1, 0),
(null, 'minjung', 'lee', 'mjlee', '1111', 'mjlee918@gmail.com', 0, 2, 0),
(null, 'nikhil', 'nair', 'nnair', '2222', 'nikhil.nair@stonybrook.edu', 0, 1, 0),
(null, 'naruto', 'uzumaki', 'narutouzumaki', '1212', 'na.uzumaki@gmail.com', 0, 1, 0);
 
CREATE TABLE Friend (
    Student1ID INT,
    Student2ID INT,
    request BOOLEAN,
    PRIMARY KEY (Student1ID, Student2ID),
    FOREIGN KEY (Student1ID) references Student(StudentID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    FOREIGN KEY (Student2ID) references Student(StudentID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
 
insert into Friend values
(2, 1, true),
(4, 2, true),
(1, 3, true),
(4, 1, false);


 
CREATE TABLE Course (
    CourseID VARCHAR(8),
    CName VARCHAR(30) NOT NULL,
    CSchoolID INT,
    PRIMARY KEY (CourseID, CSchoolID),
    FOREIGN KEY (CSchoolID) references School(SchoolID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
 
CREATE TABLE Instructor (
    InStructorName VARCHAR(50),
    ISchoolID INT NOT NULL,
    ICourseID VARCHAR(8),
    ISectionID INT,
    PRIMARY KEY (InStructorName, ISchoolID, ICourseID, ISectionID),
    FOREIGN KEY (ISchoolID) references School(SchoolID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    FOREIGN KEY (ICourseID) references Course(CourseID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
 
 
CREATE TABLE Section (
    SectionID INT,
    SCourseID VARCHAR(8),
    SSchoolID INT,
    SYear INT,
    SSemester INT,
    SInstructorName VARCHAR(50),
    PRIMARY KEY (SectionID, SCourseID, SSchoolID),
    FOREIGN KEY (SCourseID) references Course(CourseID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    FOREIGN KEY (SSchoolID) references School(SchoolID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
 
 
CREATE TABLE AssignedSchedule (
    AScheduleID INT NOT NULL AUTO_INCREMENT,
    ASchoolID INT NOT NULL,
    ACourseID VARCHAR(8),
    ASectionID INT,
    ACourseName VARCHAR(30),
    AInstName VARCHAR(50),
    ABlocks VARCHAR(10),
    AYear INT,
    ASemester INT,
    PRIMARY KEY (AScheduleID, ASchoolID, ACourseID, ASectionID)
);

insert into AssignedSchedule values
(null, 1, 'CHE101', 1, 'Chemistry 1', 'Barack Obama', '1_1,1_2',2015,3), 
(null, 1, 'CHE102', 1, 'Chemistry 2', 'Angelina Jolie', '1_1,3_1',2015,3), 
(null, 1, 'CHE103', 1, 'Chemistry 3', 'Tom Cruise', '1_2,3_2',2015,3), 
(null, 1, 'MAT101', 1, 'Algebra 1', 'Marilyn Monroe', '2_2,2_3',2015,3), 
(null, 1, 'MAT102', 1, 'Algebra 2', 'Beyonce', '4_1,4_2',2015,3), 
(null, 1, 'MAT103', 1, 'Algebra 3', 'Leonardo DiCaprio', '3_3,5_3',2015,3),
(null, 1, 'ENG101', 1, 'English 1', 'Taylor Swift', '3_3,4_3',2015,3), 
(null, 1, 'ENG102', 1, 'English 2', 'Barack Obama', '1_4,3_4',2015,3), 
(null, 1, 'ENG103', 1, 'English 3', 'Angelina Jolie', '1_3,1_4',2015,3), 
(null, 1, 'ENG104', 1, 'English 4', 'Tom Cruise', '2_4,4_4',2015,3), 
(null, 1, 'HIS101', 1, 'American History 1', 'Marilyn Monroe','1_3,3_3',2015,3), 
(null, 1, 'HIS102', 1, 'American History 2', 'Beyonce','2_1,2_3',2015,3), 
(null, 1, 'HIS103', 1, 'American History 3', 'Leonardo DiCaprio', '3_3,3_4',2015,3), 
(null, 1, 'PHY101', 1, 'Physiology 1', 'Taylor Swift', '5_1,5_2',2015,3), 
(null, 1, 'PHY102', 1, 'Physiology 2', 'Barack Obama', '4_3,4_4',2015,3), 
(null, 1, 'PHY103', 1, 'Physiology 3', 'Tom Cruise', '2_5,5_5',2015,3), 
(null, 1, 'LIT101', 1, 'Literature 1', 'Angelina Jolie', '2_4,4_4',2015,3), 
(null, 1, 'LIT102', 1, 'Literature 2', 'Marilyn Monroe', '1_3,2_3',2015,3), 
(null, 1, 'LIT103', 1, 'Literature 3', 'Beyonce', '3_5,4_5',2015,3), 
(null, 1, 'HUM101', 1, 'Humanities 1', 'Leonardo DiCaprio', '2_4,5_4',2015,3), 
(null, 1, 'HUM102', 1, 'Humanities 2', 'Taylor Swift', '1_3,2_3',2015,3);
 
 CREATE TABLE SBlock (
    BlockID INT AUTO_INCREMENT,
    BStudID INT,
    BAssignID INT,
    BBlockNum VARCHAR(10),
    BYear INT,
    BSemester INT,
    BColor INT,
    PRIMARY KEY (BlockID, BStudID, BAssignID),
    FOREIGN KEY (BStudID) references Student(StudentID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    FOREIGN KEY (BAssignID) references AssignedSchedule(AScheduleID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
insert into SBlock values
(null, 1, 1, '1_1', 2015, 3, 2),
(null, 1, 1, '1_2', 2015, 3, 2),
(null, 2, 1, '1_1', 2015, 3, 3),
(null, 2, 1, '1_2', 2015, 3, 3),
(null, 2, 6, '3_3', 2015, 3, 1),
(null, 2, 6, '5_3', 2015, 3, 1);

 
CREATE TABLE DesiredSchedule (
    DScheduleID INT NOT NULL AUTO_INCREMENT,
    DSchoolID INT NOT NULL,
    DStudentID INT NOT NULL,
    DSectionID INT,
    DCourse VARCHAR(10),
    DBlock VARCHAR(10),
    DYear INT,
    DSemester INT,
    PRIMARY KEY (DScheduleID, DSchoolID, DStudentID, DSectionID),
    FOREIGN KEY (DSchoolID) references School(SchoolID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    FOREIGN KEY (DStudentID) references Student(StudentID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    FOREIGN KEY (DSectionID) references Section(SectionID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
