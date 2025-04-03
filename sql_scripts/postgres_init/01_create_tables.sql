CREATE SCHEMA IF NOT EXISTS yrkesco;
SET search_path TO yrkesco;

CREATE TABLE Campus (
    campus_id SERIAL PRIMARY KEY,
    campus_name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL
);

CREATE TABLE Program (
    program_id SERIAL PRIMARY KEY,
    program_name VARCHAR(250) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE Class (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(10),
    start_date DATE,
    end_date DATE,
    program_id INTEGER REFERENCES Program(program_id),
    campus_id INTEGER NOT NULL REFERENCES Campus(campus_id)
);

CREATE TABLE Student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    email VARCHAR(250) NOT NULL
);

CREATE TABLE Student_Registration (
    registration_id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES Student(student_id),
    class_id INTEGER NOT NULL REFERENCES Class(class_id),
    start_date DATE,
    end_date DATE,
    registration_status VARCHAR NOT NULL
);

CREATE TABLE Course (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(250) NOT NULL,
    course_code VARCHAR(25) NOT NULL,
    credits INTEGER NOT NULL,
    description TEXT NOT NULL,
    course_type VARCHAR NOT NULL
);

CREATE TABLE Program_Course (
    program_id INTEGER NOT NULL REFERENCES Program(program_id),
    course_id INTEGER NOT NULL REFERENCES Course(course_id),
    PRIMARY KEY (program_id, course_id)
);

CREATE TABLE Instructor (
    instructor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(250) NOT NULL
);

CREATE TABLE Instructor_Course (
    instructor_id INTEGER NOT NULL REFERENCES Instructor(instructor_id),
    course_id INTEGER NOT NULL REFERENCES Course(course_id),
    teaching_period VARCHAR(10),
    hours_allocated INTEGER,
    PRIMARY KEY (instructor_id, course_id)
);

CREATE TABLE Consultant (
    consultant_id SERIAL PRIMARY KEY,
    company_name VARCHAR(250) NOT NULL,
    org_number VARCHAR(13) NOT NULL,
    vat_registered BOOLEAN NOT NULL,
    address VARCHAR(100) NOT NULL,
    hourly_rate NUMERIC NOT NULL
);

CREATE TABLE Employment (
    employment_id SERIAL PRIMARY KEY,
    instructor_id INTEGER REFERENCES Instructor(instructor_id),
    consultant_id INTEGER REFERENCES Consultant(consultant_id),
    start_date DATE,
    end_date DATE
);

CREATE TABLE Education_Manager (
    manager_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(250) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    employment_id INTEGER NOT NULL REFERENCES Employment(employment_id)
);

CREATE TABLE Education_Manager_Assignment (
    assignment_id SERIAL PRIMARY KEY,
    manager_id INTEGER REFERENCES Education_Manager(manager_id),
    class_id INTEGER REFERENCES Class(class_id),
    start_date DATE,
    end_date DATE
);

CREATE TABLE Sensitive_Personal_Info (
    sensitive_info_id SERIAL PRIMARY KEY,
    social_security_number VARCHAR(13) NOT NULL UNIQUE,
    student_id INTEGER REFERENCES Student(student_id),
    employment_id INTEGER REFERENCES Employment(employment_id)
);
