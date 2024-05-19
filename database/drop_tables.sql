-- Drop tables in the correct order to avoid foreign key constraint violations
-- Drop exercises_muscles table
DROP TABLE IF EXISTS exercises_muscles CASCADE;
-- Drop exercises_sessions table
DROP TABLE IF EXISTS exercises_sessions CASCADE;
-- Drop workouts table
DROP TABLE IF EXISTS workouts CASCADE;
-- Drop programs_exercise table
DROP TABLE IF EXISTS programs_exercises CASCADE;
-- Drop programs_split table
DROP TABLE IF EXISTS programs_split CASCADE;
-- Drop progress_tracking table
DROP TABLE IF EXISTS progress_tracking CASCADE;
-- Drop exercises table
DROP TABLE IF EXISTS exercises CASCADE;
-- Drop muscles table
DROP TABLE IF EXISTS muscles CASCADE;
-- Drop programs table
DROP TABLE IF EXISTS programs CASCADE;
-- Drop users table
DROP TABLE IF EXISTS users CASCADE;
-- Drop users_programs table
DROP TABLE IF EXISTS users_programs CASCADE;
