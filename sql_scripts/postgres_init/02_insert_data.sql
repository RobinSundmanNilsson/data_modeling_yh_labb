SET search_path TO yrkesco;

-- Campus
INSERT INTO Campus (campus_name, address) VALUES
    ('Stockholm', 'Djurgårdsvägen 38-40, 115 21 Stockholm'),
    ('Göteborg', 'Linnégatan 5, 413 04 Göteborg');

-- Program
INSERT INTO Program (program_name, description) VALUES
    ('Data Engineering', 'Focus on building data pipelines, storage solutions, and analytics systems.'),
    ('UX Design', 'Designing user-centered experiences with research and interaction.'),
    ('Fullstack Development', 'Develop complete web applications with frontend and backend technologies.');

-- Courses
INSERT INTO Course (course_name, course_code, credits, description, course_type) VALUES
    ('Python for Data', 'PY101', 20, 'Learn Python for data wrangling and scripting.', 'program'),
    ('Database Modeling', 'DB202', 25, 'Model data with ER diagrams and normalization.', 'program'),
    ('UX Research Methods', 'UX201', 15, 'Fundamentals of UX research and user testing.', 'program'),
    ('Interaction Design', 'UX301', 20, 'Prototyping and designing for interaction.', 'program'),
    ('Web Development Basics', 'FS101', 20, 'HTML, CSS, and JavaScript basics.', 'program'),
    ('Backend with Node.js', 'FS202', 25, 'APIs and backend logic using Node.js.', 'program'),
    ('API Development', 'API301', 30, 'Build and document RESTful APIs.', 'standalone');

-- Program_Course
INSERT INTO Program_Course (program_id, course_id) VALUES
    (1, 1), (1, 2),
    (2, 3), (2, 4),
    (3, 5), (3, 6);

-- Class (6 programklasser + 1 fristående klass)
INSERT INTO Class (class_name, start_date, end_date, program_id, campus_id) VALUES
    ('DE25A', '2025-08-15', '2027-06-15', 1, 1),
    ('DE25B', '2025-08-15', '2027-06-15', 1, 2),
    ('UX25A', '2025-08-20', '2027-06-20', 2, 1),
    ('UX25B', '2025-08-20', '2027-06-20', 2, 2),
    ('FS25A', '2025-08-25', '2027-06-25', 3, 1),
    ('FS25B', '2025-08-25', '2027-06-25', 3, 2),
    ('API26A', '2026-01-15', '2026-03-30', NULL, 1);

-- Student (28 st)
INSERT INTO Student (first_name, last_name, address, email) VALUES
    ('Anna', 'Lund', 'Adressgatan 1', 'anna.lund@example.com'),
    ('Erik', 'Svensson', 'Adressgatan 2', 'erik.svensson@example.com'),
    ('Maja', 'Andersson', 'Adressgatan 3', 'maja.andersson@example.com'),
    ('Leo', 'Karlsson', 'Adressgatan 4', 'leo.karlsson@example.com'),
    ('Sofie', 'Blom', 'Adressgatan 5', 'sofie.blom@example.com'),
    ('Hanna', 'Olsson', 'Adressgatan 6', 'hanna.olsson@example.com'),
    ('Isak', 'Berg', 'Adressgatan 7', 'isak.berg@example.com'),
    ('Tobias', 'Nyström', 'Adressgatan 8', 'tobias.nyström@example.com'),
    ('Lina', 'Dahl', 'Adressgatan 9', 'lina.dahl@example.com'),
    ('Felix', 'Persson', 'Adressgatan 10', 'felix.persson@example.com'),
    ('Emilia', 'Wikström', 'Adressgatan 11', 'emilia.wikström@example.com'),
    ('Oscar', 'Lind', 'Adressgatan 12', 'oscar.lind@example.com'),
    ('Nora', 'Ek', 'Adressgatan 13', 'nora.ek@example.com'),
    ('Albin', 'Sund', 'Adressgatan 14', 'albin.sund@example.com'),
    ('Ella', 'Norén', 'Adressgatan 15', 'ella.norén@example.com'),
    ('Axel', 'Franzén', 'Adressgatan 16', 'axel.franzén@example.com'),
    ('Mira', 'Hellström', 'Adressgatan 17', 'mira.hellström@example.com'),
    ('Olle', 'Hed', 'Adressgatan 18', 'olle.hed@example.com'),
    ('Stina', 'Borg', 'Adressgatan 19', 'stina.borg@example.com'),
    ('Jonas', 'Eliasson', 'Adressgatan 20', 'jonas.eliasson@example.com'),
    ('Tilde', 'Ström', 'Adressgatan 21', 'tilde.ström@example.com'),
    ('David', 'Holm', 'Adressgatan 22', 'david.holm@example.com'),
    ('Freja', 'Nyberg', 'Adressgatan 23', 'freja.nyberg@example.com'),
    ('Max', 'Gran', 'Adressgatan 24', 'max.gran@example.com'),
    ('Klara', 'Viklund', 'Adressgatan 25', 'klara.viklund@example.com'),
    ('Emil', 'Lindén', 'Adressgatan 26', 'emil.lindén@example.com'),
    ('Agnes', 'Hall', 'Adressgatan 27', 'agnes.hall@example.com'),
    ('Joel', 'Norberg', 'Adressgatan 28', 'joel.norberg@example.com');

-- Student_Registration
INSERT INTO Student_Registration (student_id, class_id, start_date, end_date, registration_status) VALUES
    (1, 1, '2025-08-15', NULL, 'active'),
    (2, 1, '2025-08-15', NULL, 'active'),
    (3, 1, '2025-08-15', NULL, 'active'),
    (4, 1, '2025-08-15', NULL, 'active'),
    (5, 2, '2025-08-15', NULL, 'active'),
    (6, 2, '2025-08-15', NULL, 'active'),
    (7, 2, '2025-08-15', NULL, 'active'),
    (8, 2, '2025-08-15', NULL, 'active'),
    (9, 3, '2025-08-15', NULL, 'active'),
    (10, 3, '2025-08-15', NULL, 'active'),
    (11, 3, '2025-08-15', NULL, 'active'),
    (12, 3, '2025-08-15', NULL, 'active'),
    (13, 4, '2025-08-15', NULL, 'active'),
    (14, 4, '2025-08-15', NULL, 'active'),
    (15, 4, '2025-08-15', NULL, 'active'),
    (16, 4, '2025-08-15', NULL, 'active'),
    (17, 5, '2025-08-15', NULL, 'active'),
    (18, 5, '2025-08-15', NULL, 'active'),
    (19, 5, '2025-08-15', NULL, 'active'),
    (20, 5, '2025-08-15', NULL, 'active'),
    (21, 6, '2025-08-15', NULL, 'active'),
    (22, 6, '2025-08-15', NULL, 'active'),
    (23, 6, '2025-08-15', NULL, 'active'),
    (24, 6, '2025-08-15', NULL, 'active'),
    (25, 7, '2025-08-15', NULL, 'active'),
    (26, 7, '2025-08-15', NULL, 'active'),
    (27, 7, '2025-08-15', NULL, 'active'),
    (28, 7, '2025-08-15', NULL, 'active');

-- Instructor (7st)
INSERT INTO Instructor (first_name, last_name, email) VALUES
    ('Sara', 'Nilsson', 'sara.nilsson@example.com'),
    ('Oskar', 'Ekman', 'oskar.ekman@example.com'),
    ('Jenny', 'Bergström', 'jenny.bergstrom@example.com'),
    ('Ali', 'Hassan', 'ali.hassan@example.com'),
    ('Mats', 'Thorsen', 'mats.thorsen@apiexperts.se'),
    ('Elin', 'Sjöberg', 'elin.sjoberg@example.com'),
    ('Karin', 'Holm', 'karin.holm@example.com');

-- Consultant
INSERT INTO Consultant (company_name, org_number, vat_registered, address, hourly_rate) VALUES
    ('PixelPartner AB', '556677-8899', TRUE, 'Huvudgatan 99', 950.00),
    ('UXPro AB', '556799-4321', TRUE, 'Designgatan 3', 875.00),
    ('APIExperts AB', '556999-1111', TRUE, 'Teknikgatan 12', 990.00);

-- Employment
INSERT INTO Employment (instructor_id, consultant_id, start_date, end_date) VALUES
    (NULL, NULL, '2024-06-01', NULL),  -- Lena
    (NULL, NULL, '2024-06-01', NULL),  -- Per
    (NULL, NULL, '2025-01-01', NULL),  -- Eva
    (1, NULL, '2024-06-01', NULL),     -- Sara
    (2, NULL, '2024-06-01', NULL),     -- Oskar
    (3, 2, '2024-06-01', NULL),        -- Jenny (UXPro AB)
    (4, 1, '2024-06-01', NULL),        -- Ali (PixelPartner AB)
    (5, 3, '2024-12-01', NULL),        -- Mats (APIExperts)
    (6, NULL, '2024-06-01', NULL),     -- Elin
    (7, NULL, '2024-06-01', NULL);     -- Karin

-- Education_Manager
INSERT INTO Education_Manager (first_name, last_name, email, phone_number, employment_id) VALUES
    ('Lena', 'Johansson', 'lena.johansson@example.com', '0701234567', 1),
    ('Per', 'Nilsson', 'per.nilsson@example.com', '0731234567', 2),
    ('Eva', 'Strand', 'eva.strand@example.com', '0723334567', 3);

-- Education_Manager_Assignment
INSERT INTO Education_Manager_Assignment (manager_id, class_id, start_date, end_date) VALUES
    (1, 1, '2025-08-01', NULL),
    (1, 3, '2025-08-01', NULL),
    (1, 5, '2025-08-01', NULL),
    (2, 2, '2025-08-01', NULL),
    (2, 4, '2025-08-01', NULL),
    (2, 6, '2025-08-01', NULL),
    (3, 7, '2026-01-01', NULL);

-- Instructor_Course
INSERT INTO Instructor_Course (instructor_id, course_id, teaching_period, hours_allocated) VALUES
    (1, 1, 'HT25', 60),
    (2, 2, 'VT26', 70),
    (3, 3, 'HT25', 50),
    (4, 4, 'VT26', 55),
    (5, 7, 'VT26', 60),
    (6, 5, 'HT25', 65),
    (7, 6, 'VT26', 75);

-- Sensitive_Personal_Info (Students)
INSERT INTO Sensitive_Personal_Info (social_security_number, student_id, employment_id) VALUES
    ('19900101-1000', 1, NULL),
    ('19900202-1001', 2, NULL),
    ('19900303-1002', 3, NULL),
    ('19900404-1003', 4, NULL),
    ('19900505-1004', 5, NULL),
    ('19900606-1005', 6, NULL),
    ('19900707-1006', 7, NULL),
    ('19900808-1007', 8, NULL),
    ('19900909-1008', 9, NULL),
    ('19901010-1009', 10, NULL),
    ('19901111-1010', 11, NULL),
    ('19901212-1011', 12, NULL),
    ('19900113-1012', 13, NULL),
    ('19900214-1013', 14, NULL),
    ('19900315-1014', 15, NULL),
    ('19900416-1015', 16, NULL),
    ('19900517-1016', 17, NULL),
    ('19900618-1017', 18, NULL),
    ('19900719-1018', 19, NULL),
    ('19900820-1019', 20, NULL),
    ('19900921-1020', 21, NULL),
    ('19901022-1021', 22, NULL),
    ('19901123-1022', 23, NULL),
    ('19901224-1023', 24, NULL),
    ('19900125-1024', 25, NULL),
    ('19900226-1025', 26, NULL),
    ('19900327-1026', 27, NULL),
    ('19900428-1027', 28, NULL);

-- Sensitive_Personal_Info (Employees)
INSERT INTO Sensitive_Personal_Info (social_security_number, student_id, employment_id) VALUES
    ('19790101-5555', NULL, 1),
    ('19780202-6666', NULL, 2),
    ('19770503-7777', NULL, 3),
    ('19800101-1111', NULL, 4),
    ('19810202-2222', NULL, 5),
    ('19820301-3333', NULL, 6),
    ('19830401-4444', NULL, 7),
    ('19840501-8888', NULL, 8),
    ('19850502-9999', NULL, 9),
    ('19860606-0000', NULL, 10);