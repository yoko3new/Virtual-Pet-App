{\rtf1\ansi\ansicpg936\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Select the database\
USE pet_care_db;\
\
-- Create User table\
CREATE TABLE User (\
    user_id INT PRIMARY KEY,\
    user_name VARCHAR(255),\
    password VARCHAR(255),\
    email VARCHAR(255),\
    created_by DATETIME,\
    updated_dy DATETIME\
);\
\
-- Create Pet table\
CREATE TABLE Pet (\
    pet_id INT PRIMARY KEY,\
    user_id INT,\
    pet_type VARCHAR(50),\
    name VARCHAR(255),\
    birthday DATETIME,\
    age DECIMAL(5,2),\
    health_status VARCHAR(255),\
    mood_status VARCHAR(255),\
    created_by DATETIME,\
    updated_dy DATETIME,\
    FOREIGN KEY (user_id) REFERENCES User(user_id)\
);\
\
-- Create Technical Support table\
CREATE TABLE Technical_Support (\
    ticket_id INT PRIMARY KEY,\
    user_id INT,\
    ticket_desc VARCHAR(500),\
    is_solved BOOLEAN,\
    created_by DATETIME,\
    updated_dy DATETIME,\
    FOREIGN KEY (user_id) REFERENCES User(user_id)\
);\
\
-- Create Notification table\
CREATE TABLE Notification (\
    notification_id INT PRIMARY KEY,\
    user_id INT,\
    message VARCHAR(500),\
    is_read BOOLEAN,\
    created_by DATETIME,\
    updated_dy DATETIME,\
    FOREIGN KEY (user_id) REFERENCES User(user_id)\
);\
\
-- Create Achievement table\
CREATE TABLE Achievement (\
    achievement_id INT PRIMARY KEY,\
    user_id INT,\
    achievement_type VARCHAR(100),\
    achievement_date DATETIME,\
    created_by DATETIME,\
    updated_dy DATETIME,\
    FOREIGN KEY (user_id) REFERENCES User(user_id)\
);\
\
-- Create Social Feature table\
CREATE TABLE Social_Feature (\
    social_id INT PRIMARY KEY,\
    user_id INT,\
    friend_id INT,\
    share_content VARCHAR(500),\
    created_by DATETIME,\
    updated_dy DATETIME,\
    FOREIGN KEY (user_id) REFERENCES User(user_id)\
);\
\
-- Create Pet Care Checklist table\
CREATE TABLE Pet_Care_Checklist (\
    check_list INT PRIMARY KEY,\
    pet_id INT,\
    task_desc VARCHAR(500),\
    task_type VARCHAR(100),\
    is_completed BOOLEAN,\
    is_optional BOOLEAN,\
    created_by DATETIME,\
    updated_dy DATETIME,\
    FOREIGN KEY (pet_id) RE\
}