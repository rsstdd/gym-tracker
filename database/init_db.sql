-- Initialize the database schema by creating all necessary tables and constraints

-- Create muscles table
\i ./schema/muscles.sql

-- Create exercises table
\i ./schema/exercises.sql

-- Create exercises_muscles table
\i ./schema/exercises_muscles.sql

-- Create users table
\i ./schema/users.sql

-- Create programs table
\i ./schema/programs.sql

-- Create programs_split table
\i ./schema/programs_split.sql

-- Create programs_exercises table
\i ./schema/programs_exercises.sql

-- Create progress_tracking table
\i ./schema/progress_tracking.sql

-- Create workouts table
\i ./schema/workouts.sql

-- Create workouts table
\i ./schema/workouts.sql

-- Add constraints
\i ./schema/add_constraints.sql

-- Add indexes to improve query performance
\i ./schema/add_indexes.sql

-- Add comments for better documentation
\i ./schema/add_comments.sql

-- Seed initial data
\i ./seeds/users_seed.sql
\i ./seeds/exercises_seed.sql
\i ./seeds/muscles_seed.sql
\i ./seeds/exercises_muscles_seed.sql
\i ./seeds/programs_seed.sql
\i ./seeds/program_splits_seed.sql
\i ./seeds/programs_exercises_seed.sql
\i ./seeds/user_programs_seed.sql
\i ./seeds/workouts_seed.sql
\i ./seeds/session_exercises_seed.sql
\i ./seeds/progress_tracking_seed.sql
