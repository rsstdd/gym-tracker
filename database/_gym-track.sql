-- Create the Users table
CREATE TABLE Users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL
);
-- Create the Exercises table
CREATE TABLE Exercises (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  equipment VARCHAR(255),
  difficulty_level VARCHAR(50)
);
-- Create the Muscles table
CREATE TABLE Muscles (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);
-- Create the ExerciseMuscles table
CREATE TABLE ExerciseMuscles (
  exercise_id INTEGER REFERENCES Exercises(id),
  muscle_id INTEGER REFERENCES Muscles(id),
  efficacy_rating INTEGER,
  PRIMARY KEY (exercise_id, muscle_id)
);
-- Create the Programs table
CREATE TABLE Programs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(50) NOT NULL CHECK (type IN ('Hypertrophy', 'Strength', 'Custom')),
  description TEXT,
  duration_weeks INTEGER NOT NULL,
  -- Program duration in weeks
  created_by_user_id INTEGER REFERENCES Users(id) -- NULL for predefined programs
);
-- Create the ProgramSplits table
CREATE TABLE ProgramSplits (
  id SERIAL PRIMARY KEY,
  program_id INTEGER REFERENCES Programs(id),
  name VARCHAR(255) NOT NULL,
  -- Name or description of the split/session
  day_of_week INTEGER NOT NULL CHECK (
    day_of_week BETWEEN 1 AND 7
  ) -- Day of the week (1 = Monday, 7 = Sunday)
);
-- Create the ProgramExercises table
CREATE TABLE ProgramExercises (
  id SERIAL PRIMARY KEY,
  split_id INTEGER REFERENCES ProgramSplits(id),
  exercise_id INTEGER REFERENCES Exercises(id),
  sets INTEGER NOT NULL,
  reps INTEGER NOT NULL
);
-- Create the UserPrograms table
CREATE TABLE UserPrograms (
  user_id INTEGER REFERENCES Users(id),
  program_id INTEGER REFERENCES Programs(id),
  start_date DATE NOT NULL,
  end_date DATE,
  PRIMARY KEY (user_id, program_id)
);
-- Create the ExerciseSessions table
CREATE TABLE ExerciseSessions (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES Users(id),
  program_id INTEGER REFERENCES Programs(id),
  split_id INTEGER REFERENCES ProgramSplits(id),
  -- New field to link to the specific split/session
  date DATE NOT NULL
);
-- Create the SessionExercises table
CREATE TABLE SessionExercises (
  id SERIAL PRIMARY KEY,
  session_id INTEGER REFERENCES ExerciseSessions(id),
  exercise_id INTEGER REFERENCES Exercises(id),
  sets INTEGER NOT NULL,
  reps INTEGER NOT NULL,
  weight FLOAT NOT NULL,
  rir INTEGER,
  -- Reps in Reserve
  exertion_metric VARCHAR(50) -- Additional exertion metric
);
-- Create the ProgressTracking table
CREATE TABLE ProgressTracking (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES Users(id),
  exercise_id INTEGER REFERENCES Exercises(id),
  date DATE NOT NULL,
  sets INTEGER NOT NULL,
  reps INTEGER NOT NULL,
  weight FLOAT NOT NULL,
  rir INTEGER,
  -- Reps in Reserve
  exertion_metric VARCHAR(50),
  -- Additional exertion metric
  notes TEXT
);
-- Create indexes to improve query performance
CREATE INDEX idx_users_username ON Users(username);
CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_exercises_name ON Exercises(name);
CREATE INDEX idx_exercise_sessions_user_date ON ExerciseSessions(user_id, date);
CREATE INDEX idx_progress_tracking_user_date ON ProgressTracking(user_id, date);
-- Add comments to tables and columns for better readability
COMMENT ON TABLE Users IS 'Stores user information including username, email, and password hash.';
COMMENT ON COLUMN Users.username IS 'Unique username chosen by the user.';
COMMENT ON COLUMN Users.email IS 'Unique email address of the user.';
COMMENT ON COLUMN Users.password_hash IS 'Hashed password for authentication purposes.';
COMMENT ON TABLE Exercises IS 'Stores information about different exercises available in the application.';
COMMENT ON COLUMN Exercises.name IS 'Name of the exercise.';
COMMENT ON TABLE Muscles IS 'Stores information about specific muscles targeted by exercises.';
COMMENT ON COLUMN Muscles.name IS 'Name of the specific muscle (e.g., Pectoralis Major, Biceps Brachii).';
COMMENT ON TABLE ExerciseMuscles IS 'Establishes a many-to-many relationship between exercises and specific muscles.';
COMMENT ON COLUMN ExerciseMuscles.efficacy_rating IS 'Rating of the exercise''s effectiveness for the specific muscle.';
COMMENT ON TABLE Programs IS 'Stores information about different workout programs (strength, hypertrophy, or custom).';
COMMENT ON COLUMN Programs.type IS 'Type of program (e.g., Hypertrophy, Strength, Custom).';
COMMENT ON COLUMN Programs.duration_weeks IS 'Duration of the program in weeks.';
COMMENT ON COLUMN Programs.created_by_user_id IS 'References the user who created the program (NULL for predefined programs).';
COMMENT ON TABLE ProgramSplits IS 'Stores information about the splits or sessions for each program.';
COMMENT ON COLUMN ProgramSplits.name IS 'Name or description of the split/session.';
COMMENT ON COLUMN ProgramSplits.day_of_week IS 'Day of the week for the split/session (1 = Monday, 7 = Sunday).';
COMMENT ON TABLE ProgramExercises IS 'Stores the exercises included in each split/session, along with the prescribed sets and reps.';
COMMENT ON TABLE UserPrograms IS 'Tracks which programs users are participating in and their start and end dates.';
COMMENT ON TABLE ExerciseSessions IS 'Stores information about each exercise session, including the user, program, split, and date.';
COMMENT ON TABLE SessionExercises IS 'Tracks individual exercises performed within each session, including sets, reps, weight, RIR, and exertion metric.';
COMMENT ON COLUMN SessionExercises.rir IS 'Reps in Reserve, indicating how many more reps could have been performed.';
COMMENT ON COLUMN SessionExercises.exertion
