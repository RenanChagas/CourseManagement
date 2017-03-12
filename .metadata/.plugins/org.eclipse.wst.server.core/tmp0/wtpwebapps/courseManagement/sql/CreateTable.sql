create table APP_USER (
   id BIGINT NOT NULL AUTO_INCREMENT,
   username VARCHAR(30) NOT NULL,
   password VARCHAR(100) NOT NULL,
   first_name VARCHAR(30) NOT NULL,
   last_name  VARCHAR(30) NOT NULL,
   email VARCHAR(30) NOT NULL,
   job_desc VARCHAR(50) NOT NULL,
   state VARCHAR(30) NOT NULL,  
   PRIMARY KEY (id),
   UNIQUE (username)
);

create table USER_PROFILE(
   id BIGINT NOT NULL AUTO_INCREMENT,
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);

/* JOIN TABLE for MANY-TO-MANY relationship*/
CREATE TABLE APP_USER_USER_PROFILE (
    user_id BIGINT NOT NULL,
    user_profile_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, user_profile_id),
    CONSTRAINT FK_APP_USER FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_USER_PROFILE FOREIGN KEY (user_profile_id) REFERENCES USER_PROFILE (id)
);

/* Populate USER_PROFILE Table */
INSERT INTO USER_PROFILE(type)
VALUES ('USER');
 
INSERT INTO USER_PROFILE(type)
VALUES ('ADMIN');
 
INSERT INTO USER_PROFILE(type)
VALUES ('MANAGER');

/* Populate one Admin User which will further create other users for the application using GUI */
INSERT INTO APP_USER(username, password, first_name, last_name, email, state, job_desc)
VALUES ('admin','$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm', 'admin','admin','admin@teste.com', 'Active', 'admin');
 
 
/* Populate JOIN Table */
INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id)
  SELECT user.id, profile.id FROM app_user user, user_profile profile
  where user.username='admin' and profile.type='ADMIN';
  
/* Create TEAM table */
create table TEAM(
   id BIGINT NOT NULL AUTO_INCREMENT,
   team_name VARCHAR(30) NOT NULL,
   team_desc VARCHAR(200) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (team_name)
);

/* Populate Teams */
INSERT INTO TEAM(team_name, team_desc)
VALUES ('Globo','Team responsible for handling all Globo System using Java/Oracle');

/* Relation nxn APP_USER X TEAM */
CREATE TABLE APP_USER_TEAM (
    user_id BIGINT NOT NULL,
    team_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, team_id),
    CONSTRAINT FK_APP_USER_TEAM FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_TEAM_APP_USER FOREIGN KEY (team_id) REFERENCES TEAM (id)
);

/* Create Department */
create table DEPARTMENT(
   id BIGINT NOT NULL AUTO_INCREMENT,
   name VARCHAR(30) NOT NULL,
   desc VARCHAR(200) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (name)
);
 