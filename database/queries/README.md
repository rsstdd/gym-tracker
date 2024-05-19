# Gym Track Database Queries

## Running SQL Queries

### User Management

```bash
# Register a new user
psql -U rsstdd -d gym_track -f ./queries/users/user_registration.sql

# Authenticate a user
psql -U rsstdd -d gym_track -f ./queries/users/user_authentication.sql

# Get user profile
psql -U rsstdd -d gym_track -f ./queries/users/get_user_profile.sql

# Update user profile
psql -U rsstdd -d gym_track -f ./queries/users/update_user_profile.sql

# Get user's current program
psql -U rsstdd -d gym_track -f ./queries/users/get_user_current_program.sql
```

## Exercise Database

```bash
# Add a new exercise
psql -U rsstdd -d gym_track -f ./queries/exercises/add_new_exercise.sql

# Count all exercises
psql -U rsstdd -d gym_track -f ./queries/exercises/count_exercises.sql

# Get all exercises
psql -U rsstdd -d gym_track -f ./queries/exercises/get_all_exercises.sql

# Get exercise by ID
psql -U rsstdd -d gym_track -f ./queries/exercises/get_exercises_by_id.sql

# Get exercises by muscle group
psql -U rsstdd -d gym_track -f ./queries/exercises/get_exercises_by_muscle_group.sql

```

## Workout Programs

```bash
# Create a new program
psql -U rsstdd -d gym_track -f ./queries/workout-programs/create_new_program.sql

# Get all programs
psql -U rsstdd -d gym_track -f ./queries/workout-programs/get_all_programs.sql

# Get program by ID
psql -U rsstdd -d gym_track -f ./queries/workout-programs/get_program_by_id.sql

# Update a program
psql -U rsstdd -d gym_track -f ./queries/workout-programs/update_program.sql

# Delete a program
psql -U rsstdd -d gym_track -f ./queries/workout-programs/delete_program.sql

# Get program splits
psql -U rsstdd -d gym_track -f ./queries/workout-programs/get_program_splits.sql

# Add program splits
psql -U rsstdd -d gym_track -f ./queries/workout-programs/add_program_splits.sql

# Get program exercises
psql -U rsstdd -d gym_track -f ./queries/workout-programs/get_program_exercises.sql

```

## Workout Tracking

```bash
# Log a workout session
psql -U rsstdd -d gym_track -f ./queries/workout-tracking/log_workout_session.sql

# Get all workouts for a user
psql -U rsstdd -d gym_track -f ./queries/workout-tracking/get_all_workouts_user.sql

# Get workout by ID
psql -U rsstdd -d gym_track -f ./queries/workout-tracking/get_workout_by_id.sql

# Log an exercise in a workout
psql -U rsstdd -d gym_track -f ./queries/workout-tracking/log_exercise_in_workout.sql

# Get exercises for a workout
psql -U rsstdd -d gym_track -f ./queries/workout-tracking/get_exercises_for_a_workout.sql

# Update workout exercise
psql -U rsstdd -d gym_track -f ./queries/workout-tracking/update_workout_exercise.sql

# Delete workout exercise
psql -U rsstdd -d gym_track -f ./queries/workout-tracking/delete_workout_exercise.sql
```

## Progress Tracking

```bash
# Log user progress
psql -U rsstdd -d gym_track -f ./queries/progress-tracking/log_user_progress.sql

# Get progress for a user
psql -U rsstdd -d gym_track -f ./queries/progress-tracking/get_progress_for_user.sql

# Get progress for an exercise
psql -U rsstdd -d gym_track -f ./queries/progress-tracking/get_progress_for_exercise.sql

# Update progress entry
psql -U rsstdd -d gym_track -f ./queries/progress-tracking/update_progress_entry.sql

# Delete progress entry
psql -U rsstdd -d gym_track -f ./queries/progress-tracking/delete_progress_entry.sql

```

## Additional Useful Commands

```bash
# Connect to the gym_track database as the rsstdd user
psql -U rsstdd -d gym_track

# Print all tables and pipe the output to more for easier viewing
psql -U rsstdd -d gym_track -f ./print_all_tables.sql | more

# Add indexes to the gym_track database to improve query performance
psql -U rsstdd -d gym_track -f ./schema/add_indexes.sql

# Add comments to the gym_track database schema for better documentation
psql -U rsstdd -d gym_track -f ./schema/add_comments.sql

# Add constraints to the gym_track database schema to enforce data integrity
psql -U rsstdd -d gym_track -f ./schema/add_constraints.sql

# Drop all tables in the gym_track database, including dependent objects
psql -U rsstdd -d gym_track -f ./drop_tables.sql && psql -U rsstdd -d gym_track -c "\dt"

# Initialize the database schema, add constraints, create indexes, add comments, and seed the initial data
psql -U rsstdd -d gym_track -f ./init_db.sql | more

# Create tables in the database
psql -U rsstdd -d gym_track -f ./schema/muscles.sql
psql -U rsstdd -d gym_track -f ./schema/exercises.sql
psql -U rsstdd -d gym_track -f
```
