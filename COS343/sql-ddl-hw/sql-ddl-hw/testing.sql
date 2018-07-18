--INSERT statements for all the tables

--ability table
INSERT INTO missiontrack.ability (ability_id, ability_name)
    VALUES (1, 'wiring')

INSERT INTO missiontrack.ability (ability_id, ability_name)
    VALUES (2, 'cutting wood')

INSERT INTO missiontrack.ability (ability_id, ability_name)
    VALUES (3, 'work with kids')

	
--coordinator tables=
INSERT INTO missiontrack.coordinator (coordinator_id, phone_number, email, first_name, last_name)
    VALUES (1, '123-456-7890', 'havefun@yahoo.com', 'Billy', 'Graham')

INSERT INTO missiontrack.coordinator (coordinator_id, phone_number, email, first_name, last_name)
    VALUES (2, '098-765-4321', 'benice@gmail.com', 'Tim', 'Keller')

INSERT INTO missiontrack.coordinator (coordinator_id, phone_number, email, first_name, last_name)
    VALUES (3, '855-594-8747', 'hoangle@optionline.com', 'CS', 'Lewis')

	
--volunteer table
INSERT INTO missiontrack.volunteer (volunteer_id, username, volunteer_password, address, phone_number, email, city, state, zip_code, first_name, last_name)
    VALUES (1, 'username', 'password', '7840 San Carlos Lane', '774-462-9526', 'bdbrown@comcast.net', 'Pueblo', 'CO', '81001', 'Orville', 'Maldonado')

INSERT INTO missiontrack.volunteer (volunteer_id, username, volunteer_password, address, phone_number, email, city, state, zip_code, first_name, last_name)
    VALUES (2, 'hoppakerfa', '123456789', '9568 Greenview Road', '630-517-2074', 'lpalmer@hotmail.com', 'Tampa', 'FL', '33604', 'Sheila', 'Cannon')

INSERT INTO missiontrack.volunteer (volunteer_id, username, volunteer_password, address, phone_number, email, city, state, zip_code, first_name, last_name)
    VALUES (3, 'kidgamer', '987654321', '20 NE. Rockland Street', '132-295-7127', 'campware@outlook.com', 'New Windsor', 'NY', '12553', 'Andrew', 'Henry')

	
--country table
INSERT INTO missiontrack.country (country_id, country_name)
    VALUES (1, 'Nicaragua')

INSERT INTO missiontrack.country (country_id, country_name)
    VALUES (2, 'Rwanda')

INSERT INTO missiontrack.country (country_id, country_name)
    VALUES (3, 'Malaysia')

INSERT INTO missiontrack.country (country_id, country_name)
    VALUES (4, 'Albania')

INSERT INTO missiontrack.country (country_id, country_name)
    VALUES (5, 'Lebanon')

INSERT INTO missiontrack.country (country_id, country_name)
    VALUES (6, 'China')

	
--need table
INSERT INTO missiontrack.need (need_id, need_name, urgency)
    VALUES (1, 'Hurricane Relief', 'very high')

INSERT INTO missiontrack.need (need_id, need_name, urgency)
    VALUES (2, 'Teach English', 'moderate')

INSERT INTO missiontrack.need (need_id, need_name, urgency)
    VALUES (3, 'Wire homes', 'low')

	
--missions table
INSERT INTO missiontrack.missions (mission_id, mission_name, url, need_id)
    VALUES (1, 'Big Relief', 'www.bigrelief.com', 1)

INSERT INTO missiontrack.missions (mission_id, mission_name, url, need_id)
    VALUES (2, 'Teach English', 'www.esl.com', 2)

INSERT INTO missiontrack.missions (mission_id, mission_name, url, need_id)
    VALUES (3, 'Constructing Homes', 'www.albianiahomes.com', 3)

	
--skill table
INSERT INTO missiontrack.skill (skill_id, skill_name, description)
    VALUES (1, 'Commercial Electrition', 'Work on electricity commercially')

INSERT INTO missiontrack.skill (skill_id, skill_name, description)
    VALUES (2, 'Teacher', 'Teach kids')

INSERT INTO missiontrack.skill (skill_id, skill_name, description)
    VALUES (3, 'Forklift Driver', 'Drive Forklifts')

	
--notes table
INSERT INTO missiontrack.notes (note_id, note, coordinator_id, volunteer_id)
    VALUES (1, 'good worker', 1, 1)

INSERT INTO missiontrack.notes (note_id, note, coordinator_id, volunteer_id)
    VALUES (2, 'Pretty cool', 1, 2)

INSERT INTO missiontrack.notes (note_id, note, coordinator_id, volunteer_id)
    VALUES (3, 'Needs improvement', 2, 3)

	
--coordinator_volunteer table
INSERT INTO missiontrack.coordinator_volunteer (coordinator_id, volunteer_id, last_contacted)
    VALUES (1, 1, '2017-07-13')

INSERT INTO missiontrack.coordinator_volunteer (coordinator_id, volunteer_id, last_contacted)
    VALUES (1, 2, '2017-07-23')

INSERT INTO missiontrack.coordinator_volunteer (coordinator_id, volunteer_id, last_contacted)
    VALUES (2, 3, '2017-09-03')
	
	
--country_skill table
INSERT INTO missiontrack.country_skill (country_id, skill_id)
    VALUES (6, 2)

INSERT INTO missiontrack.country_skill (country_id, skill_id)
    VALUES (4, 1)

INSERT INTO missiontrack.country_skill (country_id, skill_id)
    VALUES (1, 3)

INSERT INTO missiontrack.country_skill (country_id, skill_id)
    VALUES (5, 2)

	
--mission_coordinator table
INSERT INTO missiontrack.mission_coordinator (mission_id, coordinator_id)
    VALUES (1, 1)

INSERT INTO missiontrack.mission_coordinator (mission_id, coordinator_id)
    VALUES (2, 2)

INSERT INTO missiontrack.mission_coordinator (mission_id, coordinator_id)
    VALUES (3, 3)

	
--mission_volunteer table
INSERT INTO missiontrack.mission_volunteer (mission_id, volunteer_id, level_of_interest)
    VALUES (1, 2, 'very high')

INSERT INTO missiontrack.mission_volunteer (mission_id, volunteer_id, level_of_interest)
    VALUES (2, 3, 'high')

INSERT INTO missiontrack.mission_volunteer (mission_id, volunteer_id, level_of_interest)
    VALUES (3, 1, 'moderate')

	
--need_skill table
INSERT INTO missiontrack.need_skill (need_id, skill_id)
    VALUES (1, 3)

INSERT INTO missiontrack.need_skill (need_id, skill_id)
    VALUES (2, 2)

INSERT INTO missiontrack.need_skill (need_id, skill_id)
    VALUES (3, 1)


--skill_ability	table
INSERT INTO missiontrack.skill_ability (skill_id, ability_id)
    VALUES (1, 1)

INSERT INTO missiontrack.skill_ability (skill_id, ability_id)
    VALUES (3, 2)

INSERT INTO missiontrack.skill_ability (skill_id, ability_id)
    VALUES (2, 3)


--volunteer_ability table
INSERT INTO missiontrack.volunteer_ability (volunteer_id, ability_id, experience)
    VALUES (1, 2, 'novice')

INSERT INTO missiontrack.volunteer_ability (volunteer_id, ability_id, experience)
    VALUES (1, 3, 'developing')

INSERT INTO missiontrack.volunteer_ability (volunteer_id, ability_id, experience)
    VALUES (2, 1, 'novice')

INSERT INTO missiontrack.volunteer_ability (volunteer_id, ability_id, experience)
    VALUES (2, 2, 'expert')

INSERT INTO missiontrack.volunteer_ability (volunteer_id, ability_id, experience)
    VALUES (3, 1, 'developing')

INSERT INTO missiontrack.volunteer_ability (volunteer_id, ability_id, experience)
    VALUES (3, 3, 'expert')

	
--Test statements for the database

--4a
SELECT missiontrack.country.country_name,  missiontrack.skill.skill_name
FROM missiontrack.country
  INNER JOIN missiontrack.country_skill ON missiontrack.country.country_id = missiontrack.country_skill.country_id
  INNER JOIN missiontrack.skill ON missiontrack.country_skill.skill_id = missiontrack.skill.skill_id
ORDER BY country_name, skill_name
--result is 4a.png

--4b
--The design of my database made doing this one very difficult to do. I realize now how I can optimize the database to do this test.

--4c
SELECT missiontrack.missions.mission_name, missiontrack.need.need_name, missiontrack.country.country_name, missiontrack.need.urgency
FROM missiontrack.missions
  INNER JOIN missiontrack.need ON missiontrack.missions.need_id = missiontrack.need.need_id
  INNER JOIN missiontrack.need_skill ON missiontrack.need.need_id = missiontrack.need_skill.need_id
  INNER JOIN missiontrack.skill ON missiontrack.need_skill.skill_id = missiontrack.skill.skill_id
  INNER JOIN missiontrack.country_skill ON missiontrack.skill.skill_id = missiontrack.country_skill.skill_id
  INNER JOIN missiontrack.country ON missiontrack.country_skill.country_id = missiontrack.country.country_id
--result is 4c.png

--4d
SELECT missiontrack.coordinator.first_name, missiontrack.coordinator.last_name, missiontrack.missions.mission_name, missiontrack.coordinator.phone_number, missiontrack.coordinator.email
FROM missiontrack.coordinator
  INNER JOIN missiontrack.mission_coordinator ON missiontrack.coordinator.coordinator_id = missiontrack.mission_coordinator.coordinator_id
  INNER JOIN missiontrack.missions ON missiontrack.mission_coordinator.mission_id = missiontrack.missions.mission_id
--result is 4d.png

--4e
SELECT missiontrack.coordinator.first_name, missiontrack.coordinator.last_name, missiontrack.volunteer.first_name, missiontrack.volunteer.last_name, missiontrack.coordinator_volunteer.last_contacted, missiontrack.notes.note
FROM missiontrack.coordinator
  INNER JOIN missiontrack.notes ON missiontrack.coordinator.coordinator_id = missiontrack.notes.coordinator_id
  INNER JOIN missiontrack.volunteer ON missiontrack.notes.volunteer_id = missiontrack.volunteer.volunteer_id
  INNER JOIN missiontrack.coordinator_volunteer ON missiontrack.volunteer.volunteer_id = missiontrack.coordinator_volunteer.volunteer_id
--result is 4e.png

