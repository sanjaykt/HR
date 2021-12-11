DROP SCHEMA IF EXISTS hr;

CREATE DATABASE hr;

USE hr;

DROP TABLE IF EXISTS Users;
CREATE TABLE Users
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
    statusId         INT(11)      NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (officialEmail)
);

