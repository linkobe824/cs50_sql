CREATE TABLE users (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE educational_institutions (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    type TEXT NOT NULL,
    location TEXT NOT NULL,
    year INTEGER NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE companies (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    industry_field TEXT NOT NULL,
    location TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE connected_users (
    id INTEGER,
    user_a_id INTEGER,
    user_b_id INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(user_a_id) REFERENCES users(id),
    FOREIGN KEY(user_b_id) REFERENCES users(id)
);

CREATE TABLE connected_schools (
    id INTEGER,
    student_id INTEGER,
    school_id INTEGER,
    started_date NUMERIC NOT NULL,
    finished_date NUMERIC,
    degree TEXT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(student_id) REFERENCES users(id),
    FOREIGN KEY(school_id) REFERENCES schools(id)
);

CREATE TABLE connected_companies (
    id INTEGER,
    company_id INTEGER,
    employee_id INTEGER,
    started_date NUMERIC NOT NULL,
    ended_date NUMERIC,
    title TEXT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(company_id) REFERENCES companies(id),
    FOREIGN KEY(employee_id) REFERENCES users(id)
);
