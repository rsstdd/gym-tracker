-- Add comments to the gym_track database schema for better documentation

-- Comments for muscles table
COMMENT ON TABLE muscles IS 'Table containing information about muscles';
COMMENT ON COLUMN muscles.id IS 'Primary key, unique identifier for each muscle';
COMMENT ON COLUMN muscles.name IS 'Name of the muscle';

-- Comments for exercises table
COMMENT ON TABLE exercises IS 'Table containing information about exercises';
COMMENT ON COLUMN exercises.id IS 'Primary key, unique identifier for each exercise';
COMMENT ON COLUMN exercises.name IS 'Name of the exercise';
COMMENT ON COLUMN exercises.description IS 'Description of the exercise';
COMMENT ON COLUMN exercises.equipment IS 'Equipment required for the exercise';
COMMENT ON COLUMN exercises.difficulty_level IS 'Difficulty level of the exercise';

-- Comments for exercises_muscles table
COMMENT ON TABLE exercises_muscles IS 'Table mapping exercises to specific muscles';
COMMENT ON COLUMN exercises_muscles.exercise_id IS 'Foreign key, references the exercises table';
COMMENT ON COLUMN exercises_muscles.muscle_id IS 'Foreign key, references the muscles table';
COMMENT ON COLUMN exercises_muscles.efficacy_rating IS 'Rating of the exercise''s efficacy for the specific muscle';

-- Comments for programs table
COMMENT ON TABLE programs IS 'Table containing information about workout programs';
COMMENT ON COLUMN programs.id IS 'Primary key, unique identifier for each program';
COMMENT ON COLUMN programs.name IS 'Name of the workout program';
COMMENT ON COLUMN programs.description IS 'Description of the workout program';
COMMENT ON COLUMN programs.created_by IS 'Foreign key, references the users table';

-- Comments for programs_exercises table
COMMENT ON TABLE programs_exercises IS 'Table mapping programs to specific exercises';
COMMENT ON COLUMN programs_exercises.program_id IS 'Foreign key, references the programs table';
COMMENT ON COLUMN programs_exercises.exercise_id IS 'Foreign key, references the exercises table';

-- Comments for programs_split table
COMMENT ON TABLE programs_split IS 'Table containing information about program splits';
COMMENT ON COLUMN programs_split.id IS 'Primary key, unique identifier for each program split';

-- Comments for workouts table
COMMENT ON TABLE workouts IS 'Table containing information about workout sessions';
COMMENT ON COLUMN workouts.id IS 'Primary key, unique identifier for each workout session';
COMMENT ON COLUMN workouts.program_id IS 'Foreign key, references the programs table';
COMMENT ON COLUMN workouts.session_date IS 'The date of the workout session';
COMMENT ON COLUMN workouts.session_name IS 'The name of the workout session';

-- Comments for progress_tracking table
COMMENT ON TABLE progress_tracking IS 'Table containing information about users'' progress tracking';
COMMENT ON COLUMN progress_tracking.id IS 'Primary key, unique identifier for each progress entry';
COMMENT ON COLUMN progress_tracking.users_id IS 'Foreign key, references the users table';
COMMENT ON COLUMN progress_tracking.exercise_id IS 'Foreign key, references the exercises table';

-- Comments for users table
COMMENT ON TABLE users IS 'Table containing information about users';
COMMENT ON COLUMN users.id IS 'Primary key, unique identifier for each user';
COMMENT ON COLUMN users.username IS 'Username of the user';
COMMENT ON COLUMN users.email IS 'Email of the user';
