-- Add indexes to improve query performance
-- Add index for exercises_muscles table
CREATE INDEX IF NOT EXISTS idx_exercises_muscles_exercise_id ON exercises_muscles (exercise_id);
CREATE INDEX IF NOT EXISTS idx_exercises_muscles_muscle_id ON exercises_muscles (muscle_id);
-- Add index for programs_exercises table
CREATE INDEX IF NOT EXISTS idx_programs_exercises_exercise_id ON programs_exercises (exercise_id);
CREATE INDEX IF NOT EXISTS idx_programs_exercises_program_id ON programs_exercises (program_id);
-- Add index for programs_split table
CREATE INDEX IF NOT EXISTS idx_programs_split_program_id ON programs_split (program_id);
-- Add index for workouts table
CREATE INDEX IF NOT EXISTS idx_workouts_program_id ON workouts (program_id);
CREATE INDEX IF NOT EXISTS idx_workouts_exercise_id ON workouts (exercise_id);
-- Add index for workouts table
CREATE INDEX IF NOT EXISTS idx_workouts_session_id ON workouts (workouts_id);
CREATE INDEX IF NOT EXISTS idx_workouts_exercise_id ON workouts (exercise_id);
-- Add index for progress_tracking table
CREATE INDEX IF NOT EXISTS idx_progress_tracking_user_id ON progress_tracking (users_id);
CREATE INDEX IF NOT EXISTS idx_progress_tracking_exercise_id ON progress_tracking (exercise_id);
