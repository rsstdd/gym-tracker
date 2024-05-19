-- Ensure all necessary columns are present before adding constraints
-- Add foreign key constraints for exercises_muscles table if they don't already exist
DO $$ BEGIN IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_exercises_muscles_exercise'
    AND table_name = 'exercises_muscles'
) THEN
ALTER TABLE exercises_muscles
ADD CONSTRAINT fk_exercises_muscles_exercise FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE;
END IF;
IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_exercises_muscles_muscle'
    AND table_name = 'exercises_muscles'
) THEN
ALTER TABLE exercises_muscles
ADD CONSTRAINT fk_exercises_muscles_muscle FOREIGN KEY (muscle_id) REFERENCES muscles(id) ON DELETE CASCADE;
END IF;
END $$;
-- Ensure the program_id column exists in programs_exercises table
ALTER TABLE programs_exercises
ADD COLUMN IF NOT EXISTS program_id INT;
-- Add foreign key constraints for programs_exercises table
DO $$ BEGIN IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_programs_exercises_program'
    AND table_name = 'programs_exercises'
) THEN
ALTER TABLE programs_exercises
ADD CONSTRAINT fk_programs_exercises_program FOREIGN KEY (program_id) REFERENCES programs(id) ON DELETE CASCADE;
END IF;
IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_programs_exercises_exercise'
    AND table_name = 'programs_exercises'
) THEN
ALTER TABLE programs_exercises
ADD CONSTRAINT fk_programs_exercises_exercise FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE;
END IF;
END $$;
-- Ensure the program_id column exists in programs_split table
ALTER TABLE programs_split
ADD COLUMN IF NOT EXISTS program_id INT;
-- Add foreign key constraints for programs_split table
DO $$ BEGIN IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_programs_split_program'
    AND table_name = 'programs_split'
) THEN
ALTER TABLE programs_split
ADD CONSTRAINT fk_programs_split_program FOREIGN KEY (program_id) REFERENCES programs(id) ON DELETE CASCADE;
END IF;
END $$;
-- Ensure the exercise_id column exists in workouts table
ALTER TABLE workouts
ADD COLUMN IF NOT EXISTS exercise_id INT;
-- Add foreign key constraints for workouts table
DO $$ BEGIN IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_workouts_exercise'
    AND table_name = 'workouts'
) THEN
ALTER TABLE workouts
ADD CONSTRAINT fk_workouts_exercise FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE;
END IF;
IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_workouts_session'
    AND table_name = 'workouts'
) THEN
ALTER TABLE workouts
ADD CONSTRAINT fk_workouts_session FOREIGN KEY (sessions_id) REFERENCES programs_split(id) ON DELETE CASCADE;
END IF;
END $$;
-- Add foreign key constraints for workouts table
DO $$ BEGIN IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_workouts_session'
    AND table_name = 'workouts'
) THEN
ALTER TABLE workouts
ADD CONSTRAINT fk_workouts_session FOREIGN KEY (sessions_id) REFERENCES programs_split(id) ON DELETE CASCADE;
END IF;
IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_workouts_exercise'
    AND table_name = 'workouts'
) THEN
ALTER TABLE workouts
ADD CONSTRAINT fk_workouts_exercise FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE;
END IF;
END $$;
-- Add foreign key constraints for progress_tracking table
DO $$ BEGIN IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_progress_tracking_user'
    AND table_name = 'progress_tracking'
) THEN
ALTER TABLE progress_tracking
ADD CONSTRAINT fk_progress_tracking_user FOREIGN KEY (users_id) REFERENCES users(id) ON DELETE CASCADE;
END IF;
IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_progress_tracking_exercise'
    AND table_name = 'progress_tracking'
) THEN
ALTER TABLE progress_tracking
ADD CONSTRAINT fk_progress_tracking_exercise FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE;
END IF;
END $$;
-- Ensure the created_by column exists in programs table
ALTER TABLE programs
ADD COLUMN IF NOT EXISTS created_by INT;
-- Add foreign key constraints for programs table
DO $$ BEGIN IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_programs_user'
    AND table_name = 'programs'
) THEN
ALTER TABLE programs
ADD CONSTRAINT fk_programs_user FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE CASCADE;
END IF;
END $$;
-- Create users_programs table and add foreign key constraints
CREATE TABLE IF NOT EXISTS users_programs (
  users_id INT NOT NULL,
  program_id INT NOT NULL,
  PRIMARY KEY (users_id, program_id),
  FOREIGN KEY (users_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (program_id) REFERENCES programs(id) ON DELETE CASCADE
);
-- Add foreign key constraints for workouts table
DO $$ BEGIN IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_workouts_program'
    AND table_name = 'workouts'
) THEN
ALTER TABLE workouts
ADD CONSTRAINT fk_workouts_program FOREIGN KEY (program_id) REFERENCES programs(id) ON DELETE CASCADE;
END IF;
END $$;
-- Ensure the exercise_id column exists in workouts table
ALTER TABLE workouts
ADD COLUMN IF NOT EXISTS exercise_id INT;
-- Ensure the workouts column exists in workouts table
ALTER TABLE workouts
ADD COLUMN IF NOT EXISTS workouts_id INT;
-- Add foreign key constraints for workouts table
DO $$ BEGIN IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_workouts_exercise'
    AND table_name = 'workouts'
) THEN
ALTER TABLE workouts
ADD CONSTRAINT fk_workouts_exercise FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE;
END IF;
IF NOT EXISTS (
  SELECT 1
  FROM information_schema.table_constraints
  WHERE constraint_name = 'fk_workouts_session'
    AND table_name = 'workouts'
) THEN
ALTER TABLE workouts
ADD CONSTRAINT fk_workouts_session FOREIGN KEY (workouts) REFERENCES programs_split(id) ON DELETE CASCADE;
END IF;
END $$;
