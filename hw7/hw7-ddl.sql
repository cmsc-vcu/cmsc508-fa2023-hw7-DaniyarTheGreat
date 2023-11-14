# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS roels;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int not null,
    skills_name varchar(255) not null,
    skills_description varchar(255) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    skills_time_commitment int,
    PRIMARY KEY (skills_id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, skills_name, skills_description, skills_tag) values
    (1, 'music', "plays well guitar", 'Skill 1'),
    (2, 'art', 'draws masterpice of art', 'Skill 2'),
    (3, 'photograph memory', 'memorizes everything one sees', 'Skill 3'),
    (4, 'chatter box', 'extreamly extrovert, talks non-stop', 'Skill 4'),
    (5, 'cook', 'makes the best ramen', 'Skill 5'),
    (6, 'martial art', 'experienced mma fighter', 'Skill 6'),
    (7, 'dream interpretation', 'gives almost accurate dream analysis', 'Skill 7'),
    (8, '10x coder', 'codes anything in 10 times speed', 'Skill 8');

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL,
    people_first_name varchar(256),
    people_last_name varchar(256) NOT NULL,
    people_email varchar(256),
    people_linkedin_url varchar(256),
    people_headshot_url varchar(256),
    people_discrod_handle varchar(256),
    people_brief_bio varchar(256),
    people_date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id,people_first_name,people_last_name,people_email,people_date_joined) values 
    (1,'John', 'Person 1', 'Jhon123@gmail.com', '2021-07-18'),
    (2, 'James', 'Person 2', 'James123@gmail.com', '2020-01-23'),
    (3, 'Zac', 'Person 3', 'Zac123@gmail.com','2019-03-20'),
    (4, 'Mark', 'Person 4', 'Mark123@gmail.com', '1998-12-21'),
    (5, 'Clark', 'Person 5', 'Clark123@gmail.com','1920-06-01'),
    (6, 'Sean', 'Person 6', 'Sean123@gmail.com','1886-11-11'),
    (7, 'York', 'Person 7', 'York123@gmail.com', '1536-02-01'),
    (8, 'HTTP', 'Person 8', 'HTTP123@gmail.com', '1856-05-01'),
    (9, 'REST', 'Person 9', 'REST123@gmail.com', '1256-10-01'),
    (10, 'API', 'Person 10', 'API123@gmail.com', '756-04-01');



# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can be NULL. ID can be auto_increment.

CREATE TABLE peopleskills(
    id int auto_increment,
    skills_id int,
    people_id int, 
    date_acquired date default (current_date),
    primary key (id),
    foreign key (skills_id) references skills (skills_id),
    foreign key (people_id) references people (people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
insert into peopleskills (people_id, skills_id) values
    (1,1),
    (1,3),
    (1,6),
    (2,3),
    (2,4),
    (2,5),
    (3,1),
    (3,5),
    (5,3),
    (5,6),
    (6,2),
    (6,3),
    (6,4),
    (7,3),
    (7,5),
    (7,6),
    (8,1),
    (8,3),
    (8,5),
    (8,6),
    (9,2),
    (9,5),
    (9,6),
    (10,1),
    (10,4),
    (10,5);

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles(
    role_id int,
    name varchar(256),
    sort_priority int,
    PRIMARY KEY (role_id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles (role_id, name, sort_priority) values
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles(
    id int not null auto_increment,
    people_id int not null,
    role_id int not null,
    date_assigned date not null default (current_date),
    PRIMARY KEY (id),
    foreign key (role_id) references roles (role_id),
    foreign key (people_id) references people (people_id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles (people_id, role_id) values
    (1, 2),
    (2, 5),
    (2, 6),
    (3, 2),
    (3, 4),
    (4, 3),
    (5, 3),
    (6, 2),
    (6, 1),
    (7, 1),
    (8 ,1),
    (8, 4),
    (9, 2),
    (10, 1),
    (10, 2);

