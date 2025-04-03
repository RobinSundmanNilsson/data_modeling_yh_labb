-- Lista alla program och deras tillhörande kurser:
SELECT
    p.program_name,
    c.course_name,
    c.course_code
FROM
    Program p
JOIN Program_Course pc ON p.program_id = pc.program_id
JOIN Course c ON pc.course_id = c.course_id
ORDER BY
    p.program_name, c.course_name;

-- Visa alla kurser som ingår i ett specifikt program, t.ex "Data Engineering":
SELECT
    p.program_name,
    c.course_name,
    c.course_code,
    c.credits
FROM
    Program p
JOIN Program_Course pc ON p.program_id = pc.program_id
JOIN Course c ON pc.course_id = c.course_id
WHERE
    p.program_name = 'Data Engineering';

-- Räkna antal kurser per program:
SELECT
    p.program_name,
    COUNT(pc.course_id) AS number_of_courses
FROM
    Program p
JOIN Program_Course pc ON p.program_id = pc.program_id
GROUP BY
    p.program_name
ORDER BY
    p.program_name;

-- Lista alla fristående kurser:
SELECT
    course_name,
    course_code,
    credits
FROM
    Course
WHERE
    course_type = 'standalone';

-- Vem undervisar i en viss kurs? T.ex "API Development":
SELECT
    c.course_name,
    i.first_name,
    i.last_name,
    i.email
FROM
    Course c
JOIN Instructor_Course ic ON c.course_id = ic.course_id
JOIN Instructor i ON ic.instructor_id = i.instructor_id
WHERE
    c.course_name = 'API Development';

-- Vilka går i en specifik klass? T.ex "DE25A":
SELECT
    s.first_name,
    s.last_name,
    s.email,
    c.class_name
FROM
    Student s
JOIN Student_Registration sr ON s.student_id = sr.student_id
JOIN Class c ON sr.class_id = c.class_id
WHERE
    c.class_name = 'DE25A';

-- Räkna antal studenter per klass:
SELECT
    c.class_name,
    COUNT(sr.student_id) AS number_of_students
FROM
    Class c
LEFT JOIN Student_Registration sr ON c.class_id = sr.class_id
GROUP BY
    c.class_name
ORDER BY
    c.class_name;

-- Lista alla studenter, vilket program samt klass de tillhör och vid vilket campus de studerar:
SELECT
    s.first_name,
    s.last_name,
    s.email,
    c.class_name,
    p.program_name,
    cp.campus_name
FROM
    Student s
JOIN Student_Registration sr ON s.student_id = sr.student_id
JOIN Class c ON sr.class_id = c.class_id
JOIN Program p ON c.program_id = p.program_id
JOIN Campus cp ON c.campus_id = cp.campus_id
ORDER BY
    p.program_name, c.class_name, s.first_name;

-- Lista alla instruktörer och vilka kurser de undervisar:
SELECT
    i.first_name,
    i.last_name,
    c.course_name,
    p.program_name,
    ic.teaching_period,
    ic.hours_allocated
FROM
    Instructor i
JOIN Instructor_Course ic ON i.instructor_id = ic.instructor_id
JOIN Course c ON ic.course_id = c.course_id
LEFT JOIN Program_Course pc ON c.course_id = pc.course_id
LEFT JOIN Program p ON pc.program_id = p.program_id
ORDER BY
    p.program_name;

-- Lista alla instruktörer som är konsulter:
SELECT
    i.first_name,
    i.last_name,
    ct.company_name
FROM
    Instructor i
JOIN Employment e ON i.instructor_id = e.instructor_id
JOIN Consultant ct ON e.consultant_id = ct.consultant_id;

-- Lista alla instruktörer som är konsulter, vilka kurser de undervisar
-- och till vilket program kursen tillhör. Hämtar även ut annan andvändbar info:
SELECT
    i.first_name,
    i.last_name,
    ct.company_name,
    c.course_name,
    p.program_name,
    ic.teaching_period,
    ic.hours_allocated
FROM
    Instructor i
JOIN Employment e ON i.instructor_id = e.instructor_id
JOIN Consultant ct ON e.consultant_id = ct.consultant_id
JOIN Instructor_Course ic ON i.instructor_id = ic.instructor_id
JOIN Course c ON ic.course_id = c.course_id
LEFT JOIN Program_Course pc ON c.course_id = pc.course_id
LEFT JOIN Program p ON pc.program_id = p.program_id
ORDER BY
    ct.company_name, i.first_name, c.course_name;

-- Lista utbildningsledare för varje klass:
SELECT
    c.class_name,
    em.first_name AS manager_first_name,
    em.last_name AS manager_last_name,
    em.email
FROM
    Class c
JOIN Education_Manager_Assignment ema ON c.class_id = ema.class_id
JOIN Education_Manager em ON ema.manager_id = em.manager_id
ORDER BY
    c.class_name;

-- Vilken utbildningsledare ansvarar för en viss klass? T.ex "FS25A":
SELECT
    c.class_name,
    em.first_name AS manager_first_name,
    em.last_name AS manager_last_name,
    em.email AS manager_email
FROM
    Class c
JOIN Education_Manager_Assignment ema ON c.class_id = ema.class_id
JOIN Education_Manager em ON ema.manager_id = em.manager_id
WHERE
    c.class_name = 'FS25A';

-- Lista klasser som en viss utbildningsledare ansvarar för (t.ex Per Nilsson):
SELECT
    em.first_name,
    em.last_name,
    c.class_name
FROM
    Education_Manager em
JOIN Education_Manager_Assignment ema ON em.manager_id = ema.manager_id
JOIN Class c ON ema.class_id = c.class_id
WHERE
    em.first_name = 'Per' AND em.last_name = 'Nilsson';

-- Hämta känsliga personuppgifter för alla studenter:
SELECT
    s.first_name,
    s.last_name,
    spi.social_security_number
FROM
    Student s
JOIN Sensitive_Personal_Info spi ON s.student_id = spi.student_id;

-- Hämta känsliga personuppgifter för alla anställda:
SELECT
    e.employment_id,
    spi.social_security_number
FROM
    Employment e
JOIN Sensitive_Personal_Info spi ON e.employment_id = spi.employment_id;

-- Hämta känsliga personuppgifter för alla anställda; 
-- (inkludera info så som "Konsult", "Instruktör" och "Utbildningsledare"):
SELECT
    e.employment_id,
    spi.social_security_number,
    COALESCE(i.first_name, em.first_name) AS first_name,
    COALESCE(i.last_name, em.last_name) AS last_name,
    CASE
        WHEN ct.consultant_id IS NOT NULL THEN 'Konsult'
        WHEN em.manager_id IS NOT NULL THEN 'Utbildningsledare'
        ELSE 'Instruktör'
    END AS role
FROM
    Employment e
JOIN Sensitive_Personal_Info spi ON e.employment_id = spi.employment_id
LEFT JOIN Instructor i ON e.instructor_id = i.instructor_id
LEFT JOIN Consultant ct ON e.consultant_id = ct.consultant_id
LEFT JOIN Education_Manager em ON e.employment_id = em.employment_id
ORDER BY
    e.employment_id;

-- Lista antal studenter per program:
SELECT
    p.program_name,
    COUNT(sr.student_id) AS student_count
FROM
    Program p
JOIN Class c ON p.program_id = c.program_id
JOIN Student_Registration sr ON c.class_id = sr.class_id
GROUP BY
    p.program_name
ORDER BY
    student_count DESC;

-- Lista utbildningsledare och hur många klasser de ansvarar för:
SELECT
    em.first_name,
    em.last_name,
    COUNT(ema.class_id) AS number_of_classes
FROM
    Education_Manager em
JOIN Education_Manager_Assignment ema ON em.manager_id = ema.manager_id
GROUP BY
    em.manager_id
ORDER BY
    number_of_classes DESC;

-- Visa vilka kurser som är fristående:
SELECT
    c.course_name,
    c.course_code
FROM
    Course c
LEFT JOIN Program_Course pc ON c.course_id = pc.course_id
WHERE
    pc.program_id IS NULL;

-- Lista alla klasser och antal studerande studenter:
SELECT
    c.class_name,
    COUNT(sr.student_id) AS number_of_students
FROM
    Class c
LEFT JOIN Student_Registration sr ON c.class_id = sr.class_id
GROUP BY
    c.class_id
ORDER BY
    number_of_students DESC;

-- Lista alla kurser och hur många timmar som tilldelats per lärare:
SELECT
    i.first_name,
    i.last_name,
    c.course_name,
    ic.hours_allocated
FROM
    Instructor i
JOIN Instructor_Course ic ON i.instructor_id = ic.instructor_id
JOIN Course c ON ic.course_id = c.course_id
ORDER BY
    ic.hours_allocated;

-- Lista antal kurser per kurskategori (program vs. standalone):
SELECT
    course_type,
    COUNT(*) AS number_of_courses
FROM
    Course
GROUP BY
    course_type;