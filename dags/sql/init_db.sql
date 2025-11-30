CREATE TABLE IF NOT EXISTS races (
    race_id VARCHAR PRIMARY KEY,
    race_date DATE,
    race_name VARCHAR,
    course_id VARCHAR,
    course_name VARCHAR,
    race_number INTEGER,
    distance INTEGER,
    course_type VARCHAR,
    direction VARCHAR,
    weather VARCHAR,
    track_condition VARCHAR,
    start_time TIME,
    grade VARCHAR,
    entry_count INTEGER
);

CREATE TABLE IF NOT EXISTS horses (
    horse_id VARCHAR PRIMARY KEY,
    horse_name VARCHAR,
    birth_date DATE,
    gender VARCHAR,
    coat_color VARCHAR,
    sire_id VARCHAR,
    dam_id VARCHAR,
    trainer_id VARCHAR,
    owner_id VARCHAR,
    breeder_id VARCHAR
);

CREATE TABLE IF NOT EXISTS jockeys (
    jockey_id VARCHAR PRIMARY KEY,
    jockey_name VARCHAR,
    jockey_home VARCHAR
);

CREATE TABLE IF NOT EXISTS trainers (
    trainer_id VARCHAR PRIMARY KEY,
    trainer_name VARCHAR,
    trainer_home VARCHAR
);

CREATE TABLE IF NOT EXISTS race_results (
    race_id VARCHAR,
    horse_id VARCHAR,
    jockey_id VARCHAR,
    trainer_id VARCHAR,
    rank INTEGER,
    bracket_number INTEGER,
    horse_number INTEGER,
    time DOUBLE,
    margin VARCHAR,
    passing_rank VARCHAR,
    last_3f DOUBLE,
    jockey_weight DOUBLE,
    horse_weight DOUBLE,
    horse_weight_change INTEGER,
    odds DOUBLE,
    popularity INTEGER,
    FOREIGN KEY (race_id) REFERENCES races(race_id),
    FOREIGN KEY (horse_id) REFERENCES horses(horse_id),
    FOREIGN KEY (jockey_id) REFERENCES jockeys(jockey_id),
    FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id)
);
