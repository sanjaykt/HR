DROP SCHEMA IF EXISTS hr;

CREATE DATABASE hr;

USE hr;

DROP TABLE IF EXISTS `Status`;
DROP TABLE IF EXISTS User;
DR TA

CREATE TABLE `Status`
(
    `id`           TINYINT     NOT NULL AUTO_INCREMENT,
    `statusName`   VARCHAR(50) NOT NULL,
    `createdDate`  DATETIME(3) NOT NULL,
    `modifiedDate` DATETIME(3) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `nameUNIQUE` (`statusName`)
);

CREATE TABLE `User`
(
    id               INT(11)      NOT NULL AUTO_INCREMENT,
    firstName        varchar(128) NOT NULL,
    lastName         VARCHAR(128) NOT NULL,
    employeeId       varchar(128) NOT NULL,
    password         varchar(128) NOT NULL,
    officialEmail    VARCHAR(128) DEFAULT NULL,
    createdByUserId  INT(11)      NOT NULL,
    createdDate      datetime     NOT NULL,
    modifiedByUserId INT(11)      NOT NULL,
    modifiedDate     datetime     NOT NULL,
    statusId         TINYINT      NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY `officialEmailUNIQUE` (officialEmail),
    CONSTRAINT `UserStatusIdFk` FOREIGN KEY (`statusId`) REFERENCES `Status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE `TeachingWork`
(
    id                  int     not null auto_increment,
    week1               int     null,
    week2               int     null,
    week3               int     null,
    week4               int     null,
    week5               int     null,
    totalHours          int     null,
    taskCompleted       text    null,
    deliverables        text    null,
    achievementsOutcome text    null,
    createdByUserId     int     not null,
    modifiedByUserId    int     not null,
    statusId            tinyint not null,
    CONSTRAINT `TeachingWorkWeek1Fk` FOREIGN KEY (`week1`) REFERENCES `TeachingWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `TeachingWorkWeek2Fk` FOREIGN KEY (`week2`) REFERENCES `TeachingWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `TeachingWorkWeek3Fk` FOREIGN KEY (`week3`) REFERENCES `TeachingWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `TeachingWorkWeek4Fk` FOREIGN KEY (`week4`) REFERENCES `TeachingWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `TeachingWorkWeek5Fk` FOREIGN KEY (`week5`) REFERENCES `TeachingWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `TeachingWorkCreatedByUserIdFk` FOREIGN KEY (`createdByUserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `TeachingWorkModifiedByUserIdFk` FOREIGN KEY (`modifiedByUserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `TeachingWorkStatusIdFk` FOREIGN KEY (`statusId`) REFERENCES `Status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `TeachingWeek`
(
    id                   int     not null auto_increment,
    theory               int     null,
    tutorial_lab         int     null,
    preparation          int     null,
    bTechStudentGuidance int     null,
    phDStudentGuidance   int     null,
    statusId             TINYINT NOT NULL,
    createdByUserId      int     not null,
    modifiedByUserId     int     not null,
    CONSTRAINT `TeachingWeekCreatedByUserIdFk` FOREIGN KEY (`createdByUserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `TeachingModifiedByUserIdFk` FOREIGN KEY (`modifiedByUserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `TeachingWeekStatusIdFk` FOREIGN KEY (`statusId`) REFERENCES `Status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE `ResearchWork`
(
    id                  int     not null auto_increment,
    week1               int     null,
    week2               int     null,
    week3               int     null,
    week4               int     null,
    week5               int     null,
    totalHours          int     null,
    taskCompleted       text    null,
    deliverables        text    null,
    achievementsOutcome text    null,
    statusId            TINYINT NOT NULL,
    createdByUserId     int     not null,
    modifiedByUserId    int     not null,
    CONSTRAINT `ResearchWorkWeek1Fk` FOREIGN KEY (`week1`) REFERENCES `ResearchWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `ResearchWorkWeek2Fk` FOREIGN KEY (`week2`) REFERENCES `ResearchWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `ResearchWorkWeek3Fk` FOREIGN KEY (`week3`) REFERENCES `ResearchWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `ResearchWorkWeek4Fk` FOREIGN KEY (`week4`) REFERENCES `ResearchWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `ResearchWorkWeek5Fk` FOREIGN KEY (`week5`) REFERENCES `ResearchWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `ResearchWorkCreatedByUserIdFk` FOREIGN KEY (`createdByUserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `ResearchWorkModifiedByUserIdFk` FOREIGN KEY (`modifiedByUserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `ResearchWorkStatusIdFk` FOREIGN KEY (`statusId`) REFERENCES `Status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `ResearchWeek`
(
    id                         int     not null auto_increment,
    engineeringSolutionDev     int     null,
    researchWork               int     null,
    publicationProposalWriting int     null,
    statusId                   TINYINT NOT NULL,
    createdByUserId            int     not null,
    modifiedByUserId           int     not null,
    CONSTRAINT `ResearchWeekCreatedByUserIdFk` FOREIGN KEY (`createdByUserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `ResearchModifiedByUserIdFk` FOREIGN KEY (`modifiedByUserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `ResearchWeekStatusIdFk` FOREIGN KEY (`statusId`) REFERENCES `Status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `AdminWork`
(
    id                  int  not null auto_increment,
    week1               int  null,
    week2               int  null,
    week3               int  null,
    week4               int  null,
    week5               int  null,
    totalHours          int  null,
    taskCompleted       text null,
    deliverables        text null,
    achievementsOutcome text null,
    createdByUserId     int  not null,
    modifiedByUserId    int  not null,
    statusId            int  not null,
    CONSTRAINT `AdminWorkWeek1Fk` FOREIGN KEY (`week1`) REFERENCES `AdminWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `AdminWorkWeek2Fk` FOREIGN KEY (`week2`) REFERENCES `AdminWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `AdminWorkWeek3Fk` FOREIGN KEY (`week3`) REFERENCES `AdminWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `AdminWorkWeek4Fk` FOREIGN KEY (`week4`) REFERENCES `AdminWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `AdminWorkWeek5Fk` FOREIGN KEY (`week5`) REFERENCES `AdminWeek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `AdminWorkCreatedByUserIdFk` FOREIGN KEY (`createdByUserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `AdminWorkModifiedByUserIdFk` FOREIGN KEY (`modifiedByUserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `AdminWorkStatusIdFk` FOREIGN KEY (`statusId`) REFERENCES `Status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `AdminWeek`
(
    id               int     not null auto_increment,
    teamManagement   int     null,
    teamMeeting      int     null,
    otherMeeting     int     null,
    statusId         TINYINT NOT NULL,
    createdByUserId  int     not null,
    modifiedByUserId int     not null,
    CONSTRAINT `AdminWeekCreatedByUserIdFk` FOREIGN KEY (`createdByUserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `AdminWeekModifiedByUserIdFk` FOREIGN KEY (`modifiedByUserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `AdminWeekStatusIdFk` FOREIGN KEY (`statusId`) REFERENCES `Status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE `Record`
(
    id               int     not null auto_increment,
    userId           int     not null,
    employeeId       int     not null,
    reportingYear    int     not null,
    reportingMonth   int     not null,
    workingDays      int     not null,
    daysLeaveTaken   int     null,
    totalHours       int     null,
    averageHouse     int     null,
    teachingWorkId   int     null,
    researchWorkId   int     null,
    adminWorkId      int     null,
    statusId         TINYINT NOT NULL,
    createdByUserId  int     not null,
    modifiedByUserId int     not null,
    CONSTRAINT `RecordUserIdFk` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `RecordTeachingWorkIdFk` FOREIGN KEY (`teachingWorkId`) REFERENCES `TeachingWork` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `RecordResearchWorkIdFk` FOREIGN KEY (`researchWorkId`) REFERENCES `ResearchWork` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `RecordAdminWorkIdFk` FOREIGN KEY (`adminWorkId`) REFERENCES `AdminWork` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `RecordCreatedByUserIdFk` FOREIGN KEY (`createdByUserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `RecordModifiedByUserIdFk` FOREIGN KEY (`modifiedByUserId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `RecordStatusIdFk` FOREIGN KEY (`statusId`) REFERENCES `Status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
