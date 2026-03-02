BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Admin" (
	"admin_id"	INTEGER NOT NULL,
	"email"	TEXT,
	"department"	TEXT,
	PRIMARY KEY("admin_id")
);
CREATE TABLE IF NOT EXISTS "Club" (
	"club_id"	SERIAL,
	"name"	TEXT,
	"category"	VARCHAR(20) CHECK("category" IN ('academic', 'cultural', 'sports', 'service')),
	"description"	TEXT,
	PRIMARY KEY("club_id")
);
CREATE TABLE IF NOT EXISTS "Event" (
	"event_id"	SERIAL,
	"club_id"	INT,
	"title"	TEXT,
	"datetime"	TIMESTAMP,
	"location"	TEXT,
	"capacity"	INT,
	"type"	VARCHAR(20) CHECK("type" IN ('social', 'academic', 'fundraiser')),
	PRIMARY KEY("event_id")
);
CREATE TABLE IF NOT EXISTS "EventSubmission" (
	"submission_id"	SERIAL,
	"event_id"	INT,
	"submitted_by"	INT,
	"reviewed_by"	INT,
	"status"	VARCHAR(10) CHECK("status" IN ('pending', 'approved', 'rejected')),
	"submitted_date"	DATE,
	"review_notes"	TEXT,
	PRIMARY KEY("submission_id")
);
CREATE TABLE IF NOT EXISTS "Membership" (
	"membership_id"	SERIAL,
	"student_id"	INT,
	"club_id"	INT,
	"role"	VARCHAR(10) CHECK("role" IN ('officer', 'member')),
	"joined_date"	DATE,
	PRIMARY KEY("membership_id")
);
CREATE TABLE IF NOT EXISTS "RSVP" (
	"rsvp_id"	SERIAL,
	"student_id"	INT,
	"event_id"	INT,
	"status"	VARCHAR(15) CHECK("status" IN ('confirmed', 'waitlisted', 'cancelled')),
	"timestamp"	TIMESTAMP,
	PRIMARY KEY("rsvp_id")
);
CREATE TABLE IF NOT EXISTS "Student" (
	"student_id"	SERIAL,
	"name"	TEXT,
	"email"	TEXT,
	"year"	VARCHAR(20) CHECK("year" IN ('freshman', 'sophomore', 'junior', 'senior')),
	"major"	TEXT,
	PRIMARY KEY("student_id")
);
CREATE TABLE IF NOT EXISTS "User" (
	"user_id"	SERIAL,
	"email"	TEXT,
	"password_hash"	TEXT,
	"role"	VARCHAR(10) CHECK("role" IN ('student', 'officer', 'admin', 'advisor')),
	"created_at"	TIMESTAMP,
	PRIMARY KEY("user_id")
);
INSERT INTO "Admin" VALUES (1,'admin01@northeastern.edu','Student Affairs');
INSERT INTO "Admin" VALUES (2,'admin02@northeastern.edu','Finance Office');
INSERT INTO "Admin" VALUES (3,'admin03@northeastern.edu','Campus Life');
INSERT INTO "Admin" VALUES (4,'admin04@northeastern.edu','Academic Affairs');
INSERT INTO "Admin" VALUES (5,'admin05@northeastern.edu','Housing & Residential Life');
INSERT INTO "Club" VALUES (NULL,'Computer Science Club','academic','A club for students interested in coding and technology');
INSERT INTO "Club" VALUES (NULL,'Cultural Fusion','cultural','Celebrating diversity through food, music, and events');
INSERT INTO "Club" VALUES (NULL,'Intramural Soccer','sports','Casual and competitive soccer for all skill levels');
INSERT INTO "Club" VALUES (NULL,'Community Helpers','service','Volunteering and community outreach organization');
INSERT INTO "Club" VALUES (NULL,'Finance Society','academic','Networking and learning for future finance professionals');
INSERT INTO "Club" VALUES (NULL,'Dance Collective','cultural','A performance group for all styles of dance');
INSERT INTO "Club" VALUES (NULL,'Debate Team','academic','Competitive and recreational debate for all students');
INSERT INTO "Club" VALUES (NULL,'Green Campus','service','Promoting sustainability and environmental awareness');
INSERT INTO "Club" VALUES (NULL,'Computer Science Club','academic','A club for students interested in coding and technology');
INSERT INTO "Club" VALUES (NULL,'Cultural Fusion','cultural','Celebrating diversity through food, music, and events');
INSERT INTO "Club" VALUES (NULL,'Intramural Soccer','sports','Casual and competitive soccer for all skill levels');
INSERT INTO "Club" VALUES (NULL,'Community Helpers','service','Volunteering and community outreach organization');
INSERT INTO "Club" VALUES (NULL,'Finance Society','academic','Networking and learning for future finance professionals');
INSERT INTO "Club" VALUES (NULL,'Dance Collective','cultural','A performance group for all styles of dance');
INSERT INTO "Club" VALUES (NULL,'Debate Team','academic','Competitive and recreational debate for all students');
INSERT INTO "Club" VALUES (NULL,'Green Campus','service','Promoting sustainability and environmental awareness');
INSERT INTO "Event" VALUES (NULL,1,'Hackathon 2025','2025-03-15 09:00:00','Shillman Hall 105',100,'academic');
INSERT INTO "Event" VALUES (NULL,2,'International Food Festival','2025-04-01 12:00:00','Curry Student Center',200,'social');
INSERT INTO "Event" VALUES (NULL,3,'Spring Soccer Tournament','2025-04-20 10:00:00','Parsons Field',60,'social');
INSERT INTO "Event" VALUES (NULL,4,'Community Clean Up Day','2025-03-22 08:00:00','Boston Common',50,'fundraiser');
INSERT INTO "Event" VALUES (NULL,5,'Finance Networking Night','2025-03-10 18:00:00','Dodge Hall 310',80,'academic');
INSERT INTO "Event" VALUES (NULL,6,'Spring Dance Showcase','2025-05-01 19:00:00','Blackman Auditorium',300,'social');
INSERT INTO "Event" VALUES (NULL,7,'Debate Championships','2025-04-05 14:00:00','West Village H 210',75,'academic');
INSERT INTO "Event" VALUES (NULL,8,'Earth Day Festival','2025-04-22 11:00:00','Centennial Common',150,'fundraiser');
INSERT INTO "Event" VALUES (NULL,1,'Hackathon 2025','2025-03-15 09:00:00','Shillman Hall 105',100,'academic');
INSERT INTO "Event" VALUES (NULL,2,'International Food Festival','2025-04-01 12:00:00','Curry Student Center',200,'social');
INSERT INTO "Event" VALUES (NULL,3,'Spring Soccer Tournament','2025-04-20 10:00:00','Parsons Field',60,'social');
INSERT INTO "Event" VALUES (NULL,4,'Community Clean Up Day','2025-03-22 08:00:00','Boston Common',50,'fundraiser');
INSERT INTO "Event" VALUES (NULL,5,'Finance Networking Night','2025-03-10 18:00:00','Dodge Hall 310',80,'academic');
INSERT INTO "Event" VALUES (NULL,6,'Spring Dance Showcase','2025-05-01 19:00:00','Blackman Auditorium',300,'social');
INSERT INTO "Event" VALUES (NULL,7,'Debate Championships','2025-04-05 14:00:00','West Village H 210',75,'academic');
INSERT INTO "Event" VALUES (NULL,8,'Earth Day Festival','2025-04-22 11:00:00','Centennial Common',150,'fundraiser');
INSERT INTO "EventSubmission" VALUES (NULL,1,1,6,'approved','2025-01-10','Looks great, approved!');
INSERT INTO "EventSubmission" VALUES (NULL,2,3,6,'approved','2025-01-12','Approved, ensure food safety guidelines are followed');
INSERT INTO "EventSubmission" VALUES (NULL,3,4,7,'approved','2025-01-15','Approved pending field reservation confirmation');
INSERT INTO "EventSubmission" VALUES (NULL,4,5,7,'approved','2025-01-18','Great initiative, approved');
INSERT INTO "EventSubmission" VALUES (NULL,5,1,6,'pending','2025-01-20',NULL);
INSERT INTO "EventSubmission" VALUES (NULL,6,7,7,'approved','2025-01-22','Approved, great turnout expected');
INSERT INTO "EventSubmission" VALUES (NULL,7,3,6,'rejected','2025-01-25','Venue not available, please resubmit with alternate location');
INSERT INTO "EventSubmission" VALUES (NULL,8,5,7,'pending','2025-01-28',NULL);
INSERT INTO "EventSubmission" VALUES (NULL,1,1,6,'approved','2025-01-10','Looks great, approved!');
INSERT INTO "EventSubmission" VALUES (NULL,2,3,6,'approved','2025-01-12','Approved, ensure food safety guidelines are followed');
INSERT INTO "EventSubmission" VALUES (NULL,3,4,7,'approved','2025-01-15','Approved pending field reservation confirmation');
INSERT INTO "EventSubmission" VALUES (NULL,4,5,7,'approved','2025-01-18','Great initiative, approved');
INSERT INTO "EventSubmission" VALUES (NULL,5,1,6,'pending','2025-01-20',NULL);
INSERT INTO "EventSubmission" VALUES (NULL,6,7,7,'approved','2025-01-22','Approved, great turnout expected');
INSERT INTO "EventSubmission" VALUES (NULL,7,3,6,'rejected','2025-01-25','Venue not available, please resubmit with alternate location');
INSERT INTO "EventSubmission" VALUES (NULL,8,5,7,'pending','2025-01-28',NULL);
INSERT INTO "Membership" VALUES (NULL,1,1,'officer','2024-09-01');
INSERT INTO "Membership" VALUES (NULL,2,1,'member','2024-09-05');
INSERT INTO "Membership" VALUES (NULL,3,2,'officer','2024-09-02');
INSERT INTO "Membership" VALUES (NULL,4,3,'member','2024-09-10');
INSERT INTO "Membership" VALUES (NULL,5,4,'officer','2024-09-03');
INSERT INTO "Membership" VALUES (NULL,6,5,'member','2024-09-07');
INSERT INTO "Membership" VALUES (NULL,7,6,'officer','2024-09-01');
INSERT INTO "Membership" VALUES (NULL,8,7,'member','2024-09-12');
INSERT INTO "Membership" VALUES (NULL,9,8,'officer','2024-09-04');
INSERT INTO "Membership" VALUES (NULL,10,2,'member','2024-09-09');
INSERT INTO "Membership" VALUES (NULL,1,1,'officer','2024-09-01');
INSERT INTO "Membership" VALUES (NULL,2,1,'member','2024-09-05');
INSERT INTO "Membership" VALUES (NULL,3,2,'officer','2024-09-02');
INSERT INTO "Membership" VALUES (NULL,4,3,'member','2024-09-10');
INSERT INTO "Membership" VALUES (NULL,5,4,'officer','2024-09-03');
INSERT INTO "Membership" VALUES (NULL,6,5,'member','2024-09-07');
INSERT INTO "Membership" VALUES (NULL,7,6,'officer','2024-09-01');
INSERT INTO "Membership" VALUES (NULL,8,7,'member','2024-09-12');
INSERT INTO "Membership" VALUES (NULL,9,8,'officer','2024-09-04');
INSERT INTO "Membership" VALUES (NULL,10,2,'member','2024-09-09');
INSERT INTO "RSVP" VALUES (NULL,1,1,'confirmed','2025-02-01 10:00:00');
INSERT INTO "RSVP" VALUES (NULL,2,1,'confirmed','2025-02-02 11:00:00');
INSERT INTO "RSVP" VALUES (NULL,3,2,'confirmed','2025-02-03 09:00:00');
INSERT INTO "RSVP" VALUES (NULL,4,3,'waitlisted','2025-02-04 14:00:00');
INSERT INTO "RSVP" VALUES (NULL,5,4,'confirmed','2025-02-05 08:00:00');
INSERT INTO "RSVP" VALUES (NULL,6,5,'cancelled','2025-02-06 16:00:00');
INSERT INTO "RSVP" VALUES (NULL,7,6,'confirmed','2025-02-07 12:00:00');
INSERT INTO "RSVP" VALUES (NULL,8,7,'waitlisted','2025-02-08 13:00:00');
INSERT INTO "RSVP" VALUES (NULL,9,8,'confirmed','2025-02-09 10:30:00');
INSERT INTO "RSVP" VALUES (NULL,10,2,'confirmed','2025-02-10 11:45:00');
INSERT INTO "RSVP" VALUES (NULL,1,1,'confirmed','2025-02-01 10:00:00');
INSERT INTO "RSVP" VALUES (NULL,2,1,'confirmed','2025-02-02 11:00:00');
INSERT INTO "RSVP" VALUES (NULL,3,2,'confirmed','2025-02-03 09:00:00');
INSERT INTO "RSVP" VALUES (NULL,4,3,'waitlisted','2025-02-04 14:00:00');
INSERT INTO "RSVP" VALUES (NULL,5,4,'confirmed','2025-02-05 08:00:00');
INSERT INTO "RSVP" VALUES (NULL,6,5,'cancelled','2025-02-06 16:00:00');
INSERT INTO "RSVP" VALUES (NULL,7,6,'confirmed','2025-02-07 12:00:00');
INSERT INTO "RSVP" VALUES (NULL,8,7,'waitlisted','2025-02-08 13:00:00');
INSERT INTO "RSVP" VALUES (NULL,9,8,'confirmed','2025-02-09 10:30:00');
INSERT INTO "RSVP" VALUES (NULL,10,2,'confirmed','2025-02-10 11:45:00');
INSERT INTO "Student" VALUES (NULL,'Alice Johnson','alice.johnson@northeastern.edu','freshman','Computer Science');
INSERT INTO "Student" VALUES (NULL,'Bob Smith','bob.smith@northeastern.edu','sophomore','Business');
INSERT INTO "Student" VALUES (NULL,'Carol White','carol.white@northeastern.edu','junior','Psychology');
INSERT INTO "Student" VALUES (NULL,'David Lee','david.lee@northeastern.edu','senior','Mechanical Engineering');
INSERT INTO "Student" VALUES (NULL,'Emma Davis','emma.davis@northeastern.edu','freshman','Biology');
INSERT INTO "Student" VALUES (NULL,'Frank Miller','frank.miller@northeastern.edu','sophomore','Finance');
INSERT INTO "Student" VALUES (NULL,'Grace Wilson','grace.wilson@northeastern.edu','junior','Political Science');
INSERT INTO "Student" VALUES (NULL,'Henry Brown','henry.brown@northeastern.edu','senior','Data Science');
INSERT INTO "Student" VALUES (NULL,'Isla Martinez','isla.martinez@northeastern.edu','freshman','Nursing');
INSERT INTO "Student" VALUES (NULL,'Jake Taylor','jake.taylor@northeastern.edu','sophomore','Economics');
INSERT INTO "Student" VALUES (NULL,'Alice Johnson','alice.johnson@northeastern.edu','freshman','Computer Science');
INSERT INTO "Student" VALUES (NULL,'Bob Smith','bob.smith@northeastern.edu','sophomore','Business');
INSERT INTO "Student" VALUES (NULL,'Carol White','carol.white@northeastern.edu','junior','Psychology');
INSERT INTO "Student" VALUES (NULL,'David Lee','david.lee@northeastern.edu','senior','Mechanical Engineering');
INSERT INTO "Student" VALUES (NULL,'Emma Davis','emma.davis@northeastern.edu','freshman','Biology');
INSERT INTO "Student" VALUES (NULL,'Frank Miller','frank.miller@northeastern.edu','sophomore','Finance');
INSERT INTO "Student" VALUES (NULL,'Grace Wilson','grace.wilson@northeastern.edu','junior','Political Science');
INSERT INTO "Student" VALUES (NULL,'Henry Brown','henry.brown@northeastern.edu','senior','Data Science');
INSERT INTO "Student" VALUES (NULL,'Isla Martinez','isla.martinez@northeastern.edu','freshman','Nursing');
INSERT INTO "Student" VALUES (NULL,'Jake Taylor','jake.taylor@northeastern.edu','sophomore','Economics');
INSERT INTO "User" VALUES (NULL,'alice.johnson@northeastern.edu','hashed_pw_001','officer','2024-08-15 10:00:00');
INSERT INTO "User" VALUES (NULL,'bob.smith@northeastern.edu','hashed_pw_002','student','2024-08-16 11:00:00');
INSERT INTO "User" VALUES (NULL,'carol.white@northeastern.edu','hashed_pw_003','officer','2024-08-17 09:30:00');
INSERT INTO "User" VALUES (NULL,'david.lee@northeastern.edu','hashed_pw_004','student','2024-08-18 14:00:00');
INSERT INTO "User" VALUES (NULL,'emma.davis@northeastern.edu','hashed_pw_005','officer','2024-08-19 08:45:00');
INSERT INTO "User" VALUES (NULL,'admin01@northeastern.edu','hashed_pw_006','admin','2024-08-01 09:00:00');
INSERT INTO "User" VALUES (NULL,'admin02@northeastern.edu','hashed_pw_007','admin','2024-08-01 09:00:00');
INSERT INTO "User" VALUES (NULL,'advisor01@northeastern.edu','hashed_pw_008','advisor','2024-08-01 10:00:00');
INSERT INTO "User" VALUES (NULL,'frank.miller@northeastern.edu','hashed_pw_009','student','2024-08-20 12:00:00');
INSERT INTO "User" VALUES (NULL,'grace.wilson@northeastern.edu','hashed_pw_010','officer','2024-08-21 13:00:00');
INSERT INTO "User" VALUES (NULL,'alice.johnson@northeastern.edu','hashed_pw_001','officer','2024-08-15 10:00:00');
INSERT INTO "User" VALUES (NULL,'bob.smith@northeastern.edu','hashed_pw_002','student','2024-08-16 11:00:00');
INSERT INTO "User" VALUES (NULL,'carol.white@northeastern.edu','hashed_pw_003','officer','2024-08-17 09:30:00');
INSERT INTO "User" VALUES (NULL,'david.lee@northeastern.edu','hashed_pw_004','student','2024-08-18 14:00:00');
INSERT INTO "User" VALUES (NULL,'emma.davis@northeastern.edu','hashed_pw_005','officer','2024-08-19 08:45:00');
INSERT INTO "User" VALUES (NULL,'admin01@northeastern.edu','hashed_pw_006','admin','2024-08-01 09:00:00');
INSERT INTO "User" VALUES (NULL,'admin02@northeastern.edu','hashed_pw_007','admin','2024-08-01 09:00:00');
INSERT INTO "User" VALUES (NULL,'advisor01@northeastern.edu','hashed_pw_008','advisor','2024-08-01 10:00:00');
INSERT INTO "User" VALUES (NULL,'frank.miller@northeastern.edu','hashed_pw_009','student','2024-08-20 12:00:00');
INSERT INTO "User" VALUES (NULL,'grace.wilson@northeastern.edu','hashed_pw_010','officer','2024-08-21 13:00:00');
COMMIT;
