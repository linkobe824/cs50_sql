CREATE TABLE IF NOT EXISTS "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL CHECK(LENGTH("password") >= 8),
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "type" TEXT NOT NULL CHECK("type" IN ("Elementary School", "Middle School", "High School",
                                          "Lower School", "Upper School", "College", "University")),
    "location" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "industry_type" TEXT NOT NULL CHECK("industry_type" IN ("Education", "Technology", "Finance")),
    "location" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

-- Conexiones

CREATE TABLE IF NOT EXISTS "conecction_users" (
    "id" INTEGER,
    "user_id" INTEGER,
    "follow_user_id" INTEGER,
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("follow_user_id") REFERENCES "users"("id"),
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "connection_schools" (
    "id" INTEGER,
    "student_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "type" TEXT NOT NULL CHECK("type" IN ("Bachelor", "MBA", "Phd")),
    PRIMARY KEY ("id"),
    FOREIGN KEY ("student_id") REFERENCES "users"("id"),
    FOREIGN KEY ("school_id") REFERENCES "schools"("id")
);

CREATE TABLE IF NOT EXISTS "connection_companies" (
    "id" INTEGER,
    "employee_id" INTEGER,
    "company_id" INTEGER,
    "title" TEXT NOT NULL,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("employee_id") REFERENCES "users"("id"),
    FOREIGN KEY ("company_id") REFERENCES "companies"("id")
);