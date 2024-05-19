# Database Schema

This schema provides a comprehensive structure for tracking user progress, managing predefined and custom workout programs, and monitoring exercise performance and exertion levels.

## 1. Users Table

### Purpose: Stores information about the users of the application

- **id**: SERIAL PRIMARY KEY
- **username**: VARCHAR(255) NOT NULL UNIQUE
- **email**: VARCHAR(255) NOT NULL UNIQUE
- **password_hash**: VARCHAR(255) NOT NULL

### 2. Exercises Table

#### Purpose: Stores information about different exercises available in the application

- **id**: SERIAL PRIMARY KEY
- **name**: VARCHAR(255) NOT NULL
- **description**: TEXT
- **equipment**: VARCHAR(255)
- **difficulty_level**: VARCHAR(50)

### 3. Muscles Table

#### Purpose: Stores information about the different muscles targeted by exercises

- **id**: SERIAL PRIMARY KEY
- **name**: VARCHAR(255) NOT NULL

### 4. ExercisesMuscles Table

#### Purpose: Establishes a many-to-many relationship between exercises and muscle groups

- **exercise_id**: INTEGER REFERENCES Exercises(id)
- **muscle_id**: INTEGER REFERENCES Muscles(id)
- **efficacy_rating**: INTEGER
- **PRIMARY KEY** (exercise_id, muscle_id)
- **FOREIGN KEY** (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE
- **FOREIGN KEY** (muscle_id) REFERENCES muscles(id) ON DELETE CASCADE

### 5. ProgramSplits Table

- **id**: SERIAL PRIMARY KEY
- **program_id**: INTEGER REFERENCES Programs(id)
- **name**: VARCHAR(255) NOT NULL -- Name or description of the split/session
- **day_of_week**: INTEGER NOT NULL CHECK (day_of_week BETWEEN 1 AND 7) -- Day of the week (1 = Monday, 7 = Sunday)

### 6. Programs Table

#### Purpose: Stores information about different workout programs (strength, hypertrophy, or custom)

- **id**: SERIAL PRIMARY KEY
- **name**: VARCHAR(255) NOT NULL
- **type**: VARCHAR(50) NOT NULL -- 'Hypertrophy', 'Strength', or 'Custom'
- **description**: TEXT
- **duration_weeks**: INTEGER NOT NULL -- Program duration in weeks
- **created_by_user_id**: INTEGER REFERENCES Users(id) -- NULL for predefined programs

### 7. ProgramExercises Table

#### Purpose: Stores the exercises included in each program, along with the prescribed sets and reps

- **id**: SERIAL PRIMARY KEY
- **split_id**: INTEGER REFERENCES ProgramSplits(id)
- **exercise_id**: INTEGER REFERENCES Exercises(id)
- **sets**: INTEGER NOT NULL
- **reps**: INTEGER NOT NULL

### 8. UserPrograms Table

#### Purpose: Tracks which programs users are participating in and their start and end dates

- **user_id**: INTEGER REFERENCES Users(id)
- **program_id**: INTEGER REFERENCES Programs(id)
- **start_date**: DATE NOT NULL
- **end_date**: DATE
- **PRIMARY KEY** (user_id, program_id)

### 9. ExerciseSessions Table

#### Purpose: Stores information about each exercise session, including the user, program, and date

- **id**: SERIAL PRIMARY KEY
- **user_id**: INTEGER REFERENCES Users(id)
- **program_id**: INTEGER REFERENCES Programs(id)
- **date**: DATE NOT NULL

### 10. SessionExercises Table

#### Purpose: Tracks individual exercises performed within each session, including sets, reps, weight, rpe, and exertion metric

- **id**: SERIAL PRIMARY KEY
- **session_id**: INTEGER REFERENCES ExerciseSessions(id)
- **exercise_id**: INTEGER REFERENCES Exercises(id)
- **sets**: INTEGER NOT NULL
- **reps**: INTEGER NOT NULL
- **weight**: FLOAT NOT NULL
- **rpe**: INTEGER -- Rate of percieved exertion
- **exertion_metric**: VARCHAR(50) -- Additional exertion metric

### 11. ProgressTracking Table

#### Purpose: Records user progress over time for each exercise, tracking sets, reps, weight, rpe, exertion metric, and notes

- **id**: SERIAL PRIMARY KEY
- **user_id**: INTEGER REFERENCES Users(id)
- **exercise_id**: INTEGER REFERENCES Exercises(id)
- **date**: DATE NOT NULL
- **sets**: INTEGER NOT NULL
- **reps**: INTEGER NOT NULL
- **weight**: FLOAT NOT NULL
- **rpe**: INTEGER -- Rate of percieved exertion
- **exertion_metric**: VARCHAR(50) -- Additional exertion metric
- **notes**: TEXT

## Table: workouts

The `workouts` table stores information about workout sessions linked to programs. Each workout session can have multiple exercises associated with it.

### Columns

- `id`: Primary key, unique identifier for each workout session.
- `program_id`: Foreign key, references the `programs` table.
- `session_date`: The date of the workout session.
- `session_name`: The name of the workout session.

## Commands

### How to Execute the Commands

1. **Connect to the Database:** Use `psql -U rsstdd -d gym_track` to connect` to the database.
1. **Print All Tables**: Use `psql -U rsstdd -d gym_track -f ./print_all_tables.sql | more` to view all tables.
1. **Add Indexes**: Use `psql -U rsstdd -d gym_track -f ./schema/add_indexes.sql` to add indexes.
1. **Add Comments**: Use `psql -U rsstdd -d gym_track -f ./schema/add_comments.sql` to add comments.
1. **Drop Tables**: Use `psql -U rsstdd -d gym_track -f ./drop_tables.sql` to drop all tables.
1. **Initialize Schema**: Use `psql -U rsstdd -d gym_track -f ./init_db.sql` to initialize the schema.
1. **Seed Data**: Use `psql -U rsstdd -d gym_track -f ./seeds/<seed_file>.sql for each seed file` to populate the database with initial data.
1. **Backup Database**: Use `pg_dump -U rsstdd -d gym_track -F c -b -v -f ./backup/gym_track.backup` to create a backup.
1. **Restore Database**: Use `pg_restore -U rsstdd -d gym_track -v ./backup/gym_track.backup` to restore from a backup.
1. **List Tables**: Use `psql -U rsstdd -d gym_track -c "\dt"` to list all tables.
1. **Describe Table**: Use `psql -U rsstdd -d gym_track -c "\d exercises"` to describe the structure of the exercises table.

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

# Additional useful commands:

# Initialize the database schema, add constraints, create indexes, add comments, and seed the initial data
psql -U rsstdd -d gym_track -f ./init_db.sql | more

# Create tables in the database
psql -U rsstdd -d gym_track -f ./schema/muscles.sql
psql -U rsstdd -d gym_track -f ./schema/exercises.sql
psql -U rsstdd -d gym_track -f ./schema/exercises_muscles.sql
psql -U rsstdd -d gym_track -f ./schema/users.sql
psql -U rsstdd -d gym_track -f ./schema/programs.sql
psql -U rsstdd -d gym_track -f ./schema/programs_split.sql
psql -U rsstdd -d gym_track -f ./schema/programs_exercises.sql
psql -U rsstdd -d gym_track -f ./schema/progress_tracking.sql
psql -U rsstdd -d gym_track -f ./schema/workouts.sql
psql -U rsstdd -d gym_track -f ./schema/workouts_exercises.sql
psql -U rsstdd -d gym_track -f ./schema/users_programs.sql

# Add constraints to the tables
psql -U rsstdd -d gym_track -f ./schema/add_constraints.sql

# Add indexes to the tables
psql -U rsstdd -d gym_track -f ./schema/add_indexes.sql

# Add comments to the schema
psql -U rsstdd -d gym_track -f ./schema/add_comments.sql

# Seed the database with initial data
psql -U rsstdd -d gym_track -f ./seeds/users_seed.sql
psql -U rsstdd -d gym_track -f ./seeds/exercises_seed.sql
psql -U rsstdd -d gym_track -f ./seeds/muscles_seed.sql
psql -U rsstdd -d gym_track -f ./seeds/exercises_muscles_seed.sql
psql -U rsstdd -d gym_track -f ./seeds/programs_seed.sql
psql -U rsstdd -d gym_track -f ./seeds/programs_splits_seed.sql
psql -U rsstdd -d gym_track -f ./seeds/programs_exercises_seed.sql
psql -U rsstdd -d gym_track -f ./seeds/users_programs_seed.sql
psql -U rsstdd -d gym_track -f ./seeds/workouts_seed.sql
psql -U rsstdd -d gym_track -f ./seeds/workouts_exercises_seed.sql
psql -U rsstdd -d gym_track -f ./seeds/progress_tracking_seed.sql

# Backup the database to a file
pg_dump -U rsstdd -d gym_track -F c -b -v -f ./backup/gym_track.backup

# Restore the database from a backup file
pg_restore -U rsstdd -d gym_track -v ./backup/gym_track.backup

# List all tables in the current database
psql -U rsstdd -d gym_track -c "\dt"

# Describe the structure of a specific table (e.g., exercises)
psql -U rsstdd -d gym_track -c "SELECT * FROM exercises;"
psql -U rsstdd -d gym_track -c "SELECT * FROM muscles;"
psql -U rsstdd -d gym_track -c "SELECT * FROM users_programs;"

psql -U rsstdd -d gym_track -c "SELECT * FROM muscles;"
psql -U rsstdd -d gym_track -c "SELECT * FROM exercises;"
psql -U rsstdd -d gym_track -c "SELECT * FROM exercises_muscles;"
psql -U rsstdd -d gym_track -c "SELECT * FROM users;"
psql -U rsstdd -d gym_track -c "SELECT * FROM programs;"
psql -U rsstdd -d gym_track -c "SELECT * FROM programs_split;"
psql -U rsstdd -d gym_track -c "SELECT * FROM programs_exercises;"
psql -U rsstdd -d gym_track -c "SELECT * FROM progress_tracking;"

psql -U rsstdd -d gym_track -c "SELECT * FROM workouts;"
psql -U rsstdd -d gym_track -c "SELECT * FROM workouts_exercises;"
psql -U rsstdd -d gym_track -c "SELECT * FROM users_programs;"


psql -U rsstdd -d gym_track -c "SELECT COUNT(*) FROM exercises;"

```
