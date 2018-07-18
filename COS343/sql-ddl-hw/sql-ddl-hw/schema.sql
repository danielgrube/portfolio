--need table
CREATE TABLE missiontrack.need
(need_id INTEGER PRIMARY KEY,
  need_name VARCHAR(50),
  urgency VARCHAR(50),
  CHECK (urgency = 'very high' OR 
         urgency = 'high' OR 
         urgency = 'moderate' OR 
         urgency = 'low')
);

--skills table
CREATE TABLE missiontrack.skill
(skill_id INTEGER PRIMARY KEY,
  skill_name VARCHAR(50),
  description VARCHAR(256)
);

--country table
CREATE TABLE missiontrack.country
(country_id INTEGER PRIMARY KEY,
  country_name VARCHAR(50)
);

--ability table
CREATE TABLE missiontrack.ability
(ability_id INTEGER PRIMARY KEY,
  ability_name VARCHAR(50)
);

--coordinator table
CREATE TABLE missiontrack.coordinator
(coordinator_id INTEGER PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone_number VARCHAR(20),
  email VARCHAR(60)
);

--volunteer table
CREATE TABLE missiontrack.volunteer
(volunteer_id INTEGER PRIMARY KEY,
  username VARCHAR(50) UNIQUE,
  volunteer_password VARCHAR(50),
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  address VARCHAR(200),
  city VARCHAR(50),
  state VARCHAR(2),
  zip_code VARCHAR(5),
  phone_number VARCHAR(20),
  email VARCHAR(60)
);

--need_skill table
CREATE TABLE missiontrack.need_skill
(need_id INTEGER,
  skill_id INTEGER,
  FOREIGN KEY (need_id)
    REFERENCES missiontrack.need
      ON UPDATE CASCADE
      ON DELETE RESTRICT,
  FOREIGN KEY (skill_id)
    REFERENCES missiontrack.skill
      ON UPDATE CASCADE
      ON DELETE RESTRICT
);

--country_skill table
CREATE TABLE missiontrack.country_skill
(country_id INTEGER,
  skill_id INTEGER,
  FOREIGN KEY (country_id)
    REFERENCES missiontrack.country
      ON UPDATE CASCADE 
      ON DELETE RESTRICT 
);

--skill_ability table
CREATE TABLE missiontrack.skill_ability
(skill_id INTEGER,
  ability_id INTEGER,
  FOREIGN KEY (skill_id)
    REFERENCES missiontrack.skill
      ON UPDATE CASCADE 
      ON DELETE RESTRICT,
  FOREIGN KEY (ability_id)
    REFERENCES missiontrack.ability
      ON UPDATE CASCADE
      ON DELETE RESTRICT 
);

--volunteer_ability table
CREATE TABLE missiontrack.volunteer_ability
(volunteer_id INTEGER,
  ability_id INTEGER,
  experience VARCHAR(30),
  CHECK (experience = 'novice' OR
         experience = 'developing' OR 
         experience = 'expert'),
  FOREIGN KEY (ability_id)
    REFERENCES missiontrack.ability
      ON UPDATE CASCADE 
      ON DELETE RESTRICT,
  FOREIGN KEY (volunteer_id)
    REFERENCES missiontrack.volunteer
      ON UPDATE CASCADE 
      ON DELETE RESTRICT 
);

--missions table
CREATE TABLE missiontrack.missions
(mission_id INTEGER PRIMARY KEY,
  mission_name VARCHAR(50),
  url VARCHAR(60),
  need_id INTEGER,
  FOREIGN KEY (need_id)
    REFERENCES missiontrack.need
      ON UPDATE CASCADE 
      ON DELETE RESTRICT 
);

--mission_volunteer table
CREATE TABLE missiontrack.mission_volunteer
(mission_id INTEGER,
  volunteer_id INTEGER,
  level_of_interest VARCHAR(20),
  CHECK (level_of_interest = 'very high' OR 
         level_of_interest = 'high' OR 
         level_of_interest = 'moderate'),
  FOREIGN KEY (mission_id)
    REFERENCES missiontrack.missions
      ON UPDATE CASCADE 
      ON DELETE RESTRICT,
  FOREIGN KEY (volunteer_id)
    REFERENCES missiontrack.volunteer
      ON UPDATE CASCADE 
      ON DELETE RESTRICT 
);

--mission_coordinator table
CREATE TABLE missiontrack.mission_coordinator
(mission_id INTEGER,
  coordinator_id INTEGER,
  FOREIGN KEY (mission_id)
    REFERENCES missiontrack.missions
      ON UPDATE CASCADE 
      ON DELETE RESTRICT,
  FOREIGN KEY (coordinator_id)
    REFERENCES missiontrack.coordinator
      ON UPDATE CASCADE 
      ON DELETE RESTRICT
);

--coordinator_volunteer table
CREATE TABLE missiontrack.coordinator_volunteer
(coordinator_id INTEGER,
  volunteer_id INTEGER,
  last_contacted DATE,
  FOREIGN KEY (coordinator_id)
    REFERENCES missiontrack.coordinator
      ON UPDATE CASCADE 
      ON DELETE RESTRICT,
  FOREIGN KEY (volunteer_id)
    REFERENCES missiontrack.volunteer
      ON UPDATE CASCADE 
      ON DELETE RESTRICT 
);

--notes_table
CREATE TABLE missiontrack.notes
(note_id INTEGER PRIMARY KEY,
  note VARCHAR(256),
  coordinator_id INTEGER,
  volunteer_id INTEGER,
  FOREIGN KEY (coordinator_id)
    REFERENCES missiontrack.coordinator
      ON UPDATE CASCADE 
      ON DELETE RESTRICT,
  FOREIGN KEY (volunteer_id)
    REFERENCES missiontrack.volunteer
      ON UPDATE CASCADE 
      ON DELETE RESTRICT 
);