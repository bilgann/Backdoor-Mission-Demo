-- Dummy Data for Backdoor Mission Demo
-- Run these INSERT statements in your Supabase SQL editor to populate the database

-- ========================================
-- INSERT CLIENTS
-- ========================================
INSERT INTO client (full_name, gender, nickname, birth_year) VALUES
('John Smith', 'M', 'Johnny', 1985),
('Maria Garcia', 'F', 'Mari', 1992),
('David Chen', 'M', NULL, 1978),
('Sarah Johnson', 'F', 'SJ', 1990),
('Michael Brown', 'M', 'Mike', 1988),
('Jennifer Wilson', 'F', 'Jen', 1995),
('Robert Taylor', 'M', 'Rob', 1982),
('Lisa Anderson', 'F', NULL, 1987),
('James Martinez', 'M', 'Jimmy', 1993),
('Patricia Thomas', 'F', 'Pat', 1980),
('William Jackson', 'M', 'Will', 1975),
('Elizabeth White', 'F', 'Liz', 1991),
('Christopher Harris', 'M', 'Chris', 1986),
('Linda Martin', 'F', NULL, 1989),
('Daniel Thompson', 'M', 'Dan', 1994),
('Barbara Garcia', 'F', 'Barb', 1983),
('Matthew Robinson', 'M', 'Matt', 1996),
('Susan Clark', 'F', 'Sue', 1981),
('Joseph Rodriguez', 'M', 'Joe', 1984),
('Jessica Lewis', 'F', 'Jess', 1997);

-- ========================================
-- INSERT WASHROOM RECORDS
-- ========================================
INSERT INTO washroom_records (client_id, washroom_type, time_in, time_out, date) VALUES
(1, 'A', '2026-01-20 09:15:00', '2026-01-20 09:30:00', '2026-01-20'),
(2, 'B', '2026-01-20 10:00:00', '2026-01-20 10:12:00', '2026-01-20'),
(3, 'A', '2026-01-21 11:30:00', '2026-01-21 11:45:00', '2026-01-21'),
(4, 'B', '2026-01-21 13:00:00', '2026-01-21 13:15:00', '2026-01-21'),
(5, 'A', '2026-01-22 08:45:00', '2026-01-22 09:00:00', '2026-01-22'),
(6, 'B', '2026-01-22 14:20:00', '2026-01-22 14:35:00', '2026-01-22'),
(7, 'A', '2026-01-23 10:10:00', '2026-01-23 10:25:00', '2026-01-23'),
(8, 'B', '2026-01-23 15:30:00', '2026-01-23 15:42:00', '2026-01-23'),
(9, 'A', '2026-01-24 09:00:00', '2026-01-24 09:18:00', '2026-01-24'),
(10, 'B', '2026-01-24 11:45:00', '2026-01-24 12:00:00', '2026-01-24'),
(11, 'A', '2026-01-25 08:30:00', '2026-01-25 08:45:00', '2026-01-25'),
(12, 'B', '2026-01-25 10:15:00', NULL, '2026-01-25');

-- ========================================
-- INSERT COAT CHECK RECORDS
-- ========================================
INSERT INTO coat_check_records (client_id, bin_no, time_in, time_out, date) VALUES
(1, 5, '2026-01-20 09:00:00', '2026-01-20 17:00:00', '2026-01-20'),
(2, 12, '2026-01-20 09:30:00', '2026-01-20 16:45:00', '2026-01-20'),
(3, 8, '2026-01-21 10:00:00', '2026-01-21 18:00:00', '2026-01-21'),
(4, 15, '2026-01-21 11:15:00', '2026-01-21 17:30:00', '2026-01-21'),
(5, 3, '2026-01-22 08:30:00', '2026-01-22 16:00:00', '2026-01-22'),
(6, 22, '2026-01-22 09:45:00', '2026-01-22 18:15:00', '2026-01-22'),
(7, 7, '2026-01-23 10:00:00', '2026-01-23 17:45:00', '2026-01-23'),
(8, 18, '2026-01-23 11:00:00', '2026-01-23 16:30:00', '2026-01-23'),
(9, 11, '2026-01-24 09:15:00', '2026-01-24 17:00:00', '2026-01-24'),
(10, 25, '2026-01-24 10:30:00', '2026-01-24 18:00:00', '2026-01-24'),
(11, 4, '2026-01-25 08:45:00', '2026-01-25 16:15:00', '2026-01-25'),
(12, 16, '2026-01-25 09:00:00', NULL, '2026-01-25'),
(13, 20, '2026-01-25 10:00:00', NULL, '2026-01-25');

-- ========================================
-- INSERT SANCTUARY RECORDS
-- ========================================
INSERT INTO sanctuary_records (client_id, date, time_in, time_out, purpose_of_visit, if_serviced) VALUES
(1, '2026-01-20', '2026-01-20 09:00:00', '2026-01-20 10:30:00', 'Needed warm place to rest', true),
(2, '2026-01-20', '2026-01-20 10:00:00', '2026-01-20 12:00:00', 'Looking for resources', true),
(3, '2026-01-21', '2026-01-21 11:00:00', '2026-01-21 13:30:00', 'Mental health support', true),
(4, '2026-01-21', '2026-01-21 14:00:00', '2026-01-21 15:45:00', 'Food assistance', true),
(5, '2026-01-22', '2026-01-22 09:00:00', '2026-01-22 11:00:00', 'Social services inquiry', true),
(6, '2026-01-22', '2026-01-22 13:00:00', '2026-01-22 15:00:00', 'Housing information', true),
(7, '2026-01-23', '2026-01-23 10:00:00', '2026-01-23 12:30:00', 'Crisis support', true),
(8, '2026-01-23', '2026-01-23 14:00:00', '2026-01-23 16:00:00', 'Medical referral', true),
(9, '2026-01-24', '2026-01-24 09:30:00', '2026-01-24 11:30:00', 'Job search assistance', true),
(10, '2026-01-24', '2026-01-24 13:00:00', '2026-01-24 15:30:00', 'Legal aid information', true),
(11, '2026-01-25', '2026-01-25 09:00:00', '2026-01-25 10:45:00', 'Counseling', true),
(12, '2026-01-25', '2026-01-25 11:00:00', NULL, 'General support', false);

-- ========================================
-- INSERT CLINIC RECORDS
-- ========================================
INSERT INTO clinic_records (client_id, date, purpose_of_visit) VALUES
(1, '2026-01-20 14:00:00', 'General health checkup'),
(2, '2026-01-20 15:30:00', 'Wound care'),
(3, '2026-01-21 10:00:00', 'Prescription refill'),
(4, '2026-01-21 11:30:00', 'Blood pressure check'),
(5, '2026-01-22 09:00:00', 'Flu symptoms'),
(6, '2026-01-22 14:00:00', 'Dental pain'),
(7, '2026-01-23 10:30:00', 'Foot care'),
(8, '2026-01-23 13:00:00', 'Mental health consultation'),
(9, '2026-01-24 11:00:00', 'Respiratory issues'),
(10, '2026-01-24 15:00:00', 'Skin condition'),
(11, '2026-01-25 09:30:00', 'Medication consultation'),
(12, '2026-01-25 14:00:00', 'Health screening');

-- ========================================
-- INSERT SAFE SLEEP RECORDS
-- ========================================
INSERT INTO safe_sleep_records (client_id, bed_no, is_occupied, date) VALUES
(1, 3, false, '2026-01-20 20:00:00'),
(2, 7, false, '2026-01-20 21:00:00'),
(3, 12, false, '2026-01-21 19:30:00'),
(4, 5, false, '2026-01-21 20:30:00'),
(5, 9, false, '2026-01-22 19:00:00'),
(6, 14, false, '2026-01-22 21:30:00'),
(7, 2, false, '2026-01-23 20:00:00'),
(8, 11, false, '2026-01-23 19:45:00'),
(9, 6, false, '2026-01-24 20:15:00'),
(10, 16, false, '2026-01-24 21:00:00'),
(11, 8, true, '2026-01-25 19:30:00'),
(12, 13, true, '2026-01-25 20:00:00'),
(13, 4, true, '2026-01-25 20:30:00');

-- ========================================
-- INSERT ACTIVITY RECORDS
-- ========================================
INSERT INTO activity_records (activity_name, date, start_time, end_time, attendance) VALUES
('Art Therapy Workshop', '2026-01-20', '2026-01-20 14:00:00', '2026-01-20 16:00:00', 8),
('Community Dinner', '2026-01-20', '2026-01-20 18:00:00', '2026-01-20 19:30:00', 25),
('Job Skills Training', '2026-01-21', '2026-01-21 10:00:00', '2026-01-21 12:00:00', 12),
('Music Circle', '2026-01-21', '2026-01-21 15:00:00', '2026-01-21 16:30:00', 6),
('Yoga and Mindfulness', '2026-01-22', '2026-01-22 09:00:00', '2026-01-22 10:00:00', 10),
('Financial Literacy Workshop', '2026-01-22', '2026-01-22 13:00:00', '2026-01-22 15:00:00', 15),
('Cooking Class', '2026-01-23', '2026-01-23 11:00:00', '2026-01-23 13:00:00', 9),
('Movie Night', '2026-01-23', '2026-01-23 19:00:00', '2026-01-23 21:00:00', 18),
('Meditation Session', '2026-01-24', '2026-01-24 08:00:00', '2026-01-24 09:00:00', 7),
('Creative Writing', '2026-01-24', '2026-01-24 14:00:00', '2026-01-24 16:00:00', 5),
('Breakfast Community Gathering', '2026-01-25', '2026-01-25 08:00:00', '2026-01-25 09:30:00', 22),
('Computer Skills Class', '2026-01-25', '2026-01-25 13:00:00', '2026-01-25 15:00:00', 11);

-- ========================================
-- INSERT CLIENT ACTIVITY RECORDS
-- ========================================
-- Note: activity_id values depend on auto-increment, adjust if needed
INSERT INTO client_activity (client_id, activity_id, date, score) VALUES
-- Art Therapy Workshop (activity_id 1)
(1, 1, '2026-01-20 14:30:00', 9),
(2, 1, '2026-01-20 14:35:00', 8),
(3, 1, '2026-01-20 14:40:00', 10),

-- Community Dinner (activity_id 2)
(1, 2, '2026-01-20 18:15:00', NULL),
(2, 2, '2026-01-20 18:20:00', NULL),
(4, 2, '2026-01-20 18:25:00', NULL),
(5, 2, '2026-01-20 18:30:00', NULL),

-- Job Skills Training (activity_id 3)
(3, 3, '2026-01-21 10:15:00', 8),
(5, 3, '2026-01-21 10:20:00', 9),
(6, 3, '2026-01-21 10:25:00', 7),

-- Music Circle (activity_id 4)
(7, 4, '2026-01-21 15:10:00', 10),
(8, 4, '2026-01-21 15:15:00', 9),

-- Yoga and Mindfulness (activity_id 5)
(1, 5, '2026-01-22 09:05:00', 8),
(9, 5, '2026-01-22 09:10:00', 9),
(10, 5, '2026-01-22 09:15:00', 10),

-- Financial Literacy Workshop (activity_id 6)
(2, 6, '2026-01-22 13:10:00', 7),
(11, 6, '2026-01-22 13:15:00', 8),
(12, 6, '2026-01-22 13:20:00', 9),

-- Cooking Class (activity_id 7)
(4, 7, '2026-01-23 11:10:00', 10),
(13, 7, '2026-01-23 11:15:00', 9),

-- Movie Night (activity_id 8)
(1, 8, '2026-01-23 19:10:00', NULL),
(5, 8, '2026-01-23 19:15:00', NULL),
(14, 8, '2026-01-23 19:20:00', NULL),

-- Meditation Session (activity_id 9)
(6, 9, '2026-01-24 08:05:00', 8),
(15, 9, '2026-01-24 08:10:00', 9),

-- Creative Writing (activity_id 10)
(7, 10, '2026-01-24 14:10:00', 7),
(16, 10, '2026-01-24 14:15:00', 8),

-- Breakfast Community Gathering (activity_id 11)
(3, 11, '2026-01-25 08:10:00', NULL),
(8, 11, '2026-01-25 08:15:00', NULL),
(17, 11, '2026-01-25 08:20:00', NULL),
(18, 11, '2026-01-25 08:25:00', NULL),

-- Computer Skills Class (activity_id 12)
(9, 12, '2026-01-25 13:10:00', 8),
(19, 12, '2026-01-25 13:15:00', 9),
(20, 12, '2026-01-25 13:20:00', 10);

-- ========================================
-- VERIFICATION QUERIES (optional - uncomment to run)
-- ========================================
-- SELECT COUNT(*) as total_clients FROM client;
-- SELECT COUNT(*) as total_washroom_records FROM washroom_records;
-- SELECT COUNT(*) as total_coat_check_records FROM coat_check_records;
-- SELECT COUNT(*) as total_sanctuary_records FROM sanctuary_records;
-- SELECT COUNT(*) as total_clinic_records FROM clinic_records;
-- SELECT COUNT(*) as total_safe_sleep_records FROM safe_sleep_records;
-- SELECT COUNT(*) as total_activities FROM activity_records;
-- SELECT COUNT(*) as total_client_activities FROM client_activity;
