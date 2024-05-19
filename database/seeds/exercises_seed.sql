-- This script assumes hypothetical IDs for both exercise and muscles
-- Seed data for the exercise table with popular exercise, including Olympic weightlifting and powerlifting exercise
-- Ensure the table is empty before seeding
TRUNCATE TABLE exercises RESTART IDENTITY;
-- Insert seed data with popular exercise
INSERT INTO exercises (name, description, equipment, difficulty_level)
VALUES -- Olympic weightlifting exercise
  (
    'Snatch',
    'A full-body Olympic lift that involves lifting the barbell from the ground to overhead in one motion.',
    'Barbell',
    'Advanced'
  ),
  (
    'Clean and Jerk',
    'A full-body Olympic lift that involves lifting the barbell from the ground to the shoulders (clean) and then overhead (jerk).',
    'Barbell',
    'Advanced'
  ),
  (
    'Clean',
    'An Olympic lift that involves lifting the barbell from the ground to the shoulders.',
    'Barbell',
    'Advanced'
  ),
  (
    'Jerk',
    'An Olympic lift that involves lifting the barbell from the shoulders to overhead.',
    'Barbell',
    'Advanced'
  ),
  -- Powerlifting exercise
  (
    'Bench Press',
    'A compound exercise targeting the chest, shoulders, and triceps.',
    'Barbell',
    'Intermediate'
  ),
  (
    'Squat',
    'A compound exercise targeting the quadriceps, hamstrings, and glutes.',
    'Barbell',
    'Advanced'
  ),
  (
    'Deadlift',
    'A compound exercise targeting the lower back, glutes, and hamstrings.',
    'Barbell',
    'Advanced'
  ),
  -- Popular compound exercise
  (
    'Overhead Press',
    'A compound exercise targeting the shoulders and triceps.',
    'Barbell',
    'Intermediate'
  ),
  (
    'Pull-Up',
    'A compound exercise targeting the back and biceps.',
    'Bodyweight',
    'Intermediate'
  ),
  (
    'Dumbbell Bench Press',
    'A compound exercise targeting the chest, shoulders, and triceps.',
    'Dumbbell',
    'Intermediate'
  ),
  (
    'Incline Bench Press',
    'A compound exercise targeting the upper chest, shoulders, and triceps.',
    'Barbell',
    'Intermediate'
  ),
  (
    'Dumbbell Shoulder Press',
    'A compound exercise targeting the shoulders and triceps.',
    'Dumbbell',
    'Intermediate'
  ),
  (
    'Barbell Row',
    'A compound exercise targeting the back and biceps.',
    'Barbell',
    'Intermediate'
  ),
  (
    'Dumbbell Row',
    'A compound exercise targeting the back and biceps.',
    'Dumbbell',
    'Intermediate'
  ),
  (
    'Front Squat',
    'A compound exercise targeting the quadriceps, hamstrings, and glutes.',
    'Barbell',
    'Advanced'
  ),
  (
    'Lunge',
    'A compound exercise targeting the quadriceps, hamstrings, and glutes.',
    'Bodyweight',
    'Beginner'
  ),
  (
    'Bulgarian Split Squat',
    'A compound exercise targeting the quadriceps, hamstrings, and glutes.',
    'Dumbbell',
    'Intermediate'
  ),
  (
    'Hip Thrust',
    'A compound exercise targeting the glutes.',
    'Barbell',
    'Intermediate'
  ),
  -- Popular isolation exercise
  (
    'Bicep Curl',
    'An isolation exercise targeting the biceps.',
    'Dumbbell',
    'Beginner'
  ),
  (
    'Tricep Extension',
    'An isolation exercise targeting the triceps.',
    'Dumbbell',
    'Beginner'
  ),
  (
    'Lateral Raise',
    'An isolation exercise targeting the shoulders.',
    'Dumbbell',
    'Beginner'
  ),
  (
    'Leg Curl',
    'An isolation exercise targeting the hamstrings.',
    'Machine',
    'Beginner'
  ),
  (
    'Leg Extension',
    'An isolation exercise targeting the quadriceps.',
    'Machine',
    'Beginner'
  ),
  (
    'Calf Raise',
    'An isolation exercise targeting the calves.',
    'Machine',
    'Beginner'
  ),
  (
    'Chest Fly',
    'An isolation exercise targeting the chest.',
    'Dumbbell',
    'Beginner'
  ),
  (
    'Hammer Curl',
    'An isolation exercise targeting the biceps.',
    'Dumbbell',
    'Beginner'
  ),
  (
    'Preacher Curl',
    'An isolation exercise targeting the biceps.',
    'Dumbbell',
    'Beginner'
  ),
  (
    'Skull Crusher',
    'An isolation exercise targeting the triceps.',
    'Barbell',
    'Intermediate'
  ),
  (
    'Cable Tricep Extension',
    'An isolation exercise targeting the triceps.',
    'Cable',
    'Beginner'
  ),
  (
    'Cable Bicep Curl',
    'An isolation exercise targeting the biceps.',
    'Cable',
    'Beginner'
  ),
  (
    'Face Pull',
    'An isolation exercise targeting the rear deltoids.',
    'Cable',
    'Intermediate'
  ),
  (
    'Seated Calf Raise',
    'An isolation exercise targeting the calves.',
    'Machine',
    'Beginner'
  ),
  (
    'Standing Calf Raise',
    'An isolation exercise targeting the calves.',
    'Machine',
    'Beginner'
  ),
  (
    'Concentration Curl',
    'An isolation exercise targeting the biceps.',
    'Dumbbell',
    'Beginner'
  ),
  (
    'Tricep Kickback',
    'An isolation exercise targeting the triceps.',
    'Dumbbell',
    'Beginner'
  ),
  (
    'Incline Dumbbell Curl',
    'An isolation exercise targeting the biceps.',
    'Dumbbell',
    'Beginner'
  ),
  (
    'Reverse Curl',
    'An isolation exercise targeting the biceps and forearms.',
    'Barbell',
    'Beginner'
  ),
  -- Popular core exercise
  (
    'Plank',
    'A core exercise targeting the abs, lower back, and shoulders.',
    'Bodyweight',
    'Beginner'
  ),
  (
    'Russian Twist',
    'A core exercise targeting the obliques.',
    'Bodyweight',
    'Beginner'
  ),
  (
    'Hanging Leg Raise',
    'A core exercise targeting the abs.',
    'Bodyweight',
    'Intermediate'
  ),
  (
    'Sit-Up',
    'A core exercise targeting the abs.',
    'Bodyweight',
    'Beginner'
  ),
  (
    'Crunch',
    'A core exercise targeting the abs.',
    'Bodyweight',
    'Beginner'
  ),
  (
    'Mountain Climber',
    'A core exercise targeting the abs and hip flexors.',
    'Bodyweight',
    'Beginner'
  ),
  (
    'Bicycle Crunch',
    'A core exercise targeting the abs and obliques.',
    'Bodyweight',
    'Beginner'
  ),
  (
    'Toe Touch',
    'A core exercise targeting the abs.',
    'Bodyweight',
    'Beginner'
  ),
  (
    'Side Plank',
    'A core exercise targeting the obliques.',
    'Bodyweight',
    'Beginner'
  ),
  (
    'V-Up',
    'A core exercise targeting the abs.',
    'Bodyweight',
    'Intermediate'
  ),
  (
    'Ab Wheel Rollout',
    'A core exercise targeting the abs.',
    'Ab Wheel',
    'Intermediate'
  ),
  -- Popular back exercise
  (
    'Lat Pulldown',
    'A compound exercise targeting the back and biceps.',
    'Machine',
    'Beginner'
  ),
  (
    'Seated Row',
    'A compound exercise targeting the back and biceps.',
    'Machine',
    'Beginner'
  ),
  (
    'T-Bar Row',
    'A compound exercise targeting the back and biceps.',
    'Barbell',
    'Intermediate'
  ),
  (
    'Single-Arm Dumbbell Row',
    'A compound exercise targeting the back and biceps.',
    'Dumbbell',
    'Intermediate'
  ),
  (
    'Inverted Row',
    'A compound exercise targeting the back and biceps.',
    'Bodyweight',
    'Beginner'
  ),
  (
    'Cable Row',
    'A compound exercise targeting the back and biceps.',
    'Cable',
    'Beginner'
  ),
  (
    'Bent-Over Row',
    'A compound exercise targeting the back and biceps.',
    'Barbell',
    'Intermediate'
  ),
  -- Popular shoulder exercise
  (
    'Arnold Press',
    'A compound exercise targeting the shoulders and triceps.',
    'Dumbbell',
    'Intermediate'
  ),
  (
    'Reverse Fly',
    'An isolation exercise targeting the rear deltoids.',
    'Dumbbell',
    'Beginner'
  ),
  (
    'Upright Row',
    'A compound exercise targeting the shoulders and traps.',
    'Barbell',
    'Intermediate'
  ),
  (
    'Front Raise',
    'An isolation exercise targeting the front deltoids.',
    'Dumbbell',
    'Beginner'
  ),
  (
    'Rear Delt Fly',
    'An isolation exercise targeting the rear deltoids.',
    'Dumbbell',
    'Beginner'
  ),
  -- Popular chest exercise
  (
    'Incline Dumbbell Press',
    'A compound exercise targeting the upper chest, shoulders, and triceps.',
    'Dumbbell',
    'Intermediate'
  ),
  (
    'Decline Bench Press',
    'A compound exercise targeting the lower chest, shoulders, and triceps.',
    'Barbell',
    'Intermediate'
  ),
  (
    'Cable Chest Fly',
    'An isolation exercise targeting the chest.',
    'Cable',
    'Beginner'
  ),
  (
    'Pec Deck',
    'An isolation exercise targeting the chest.',
    'Machine',
    'Beginner'
  ),
  (
    'Push-Up',
    'A compound exercise targeting the chest, shoulders, and triceps.',
    'Bodyweight',
    'Beginner'
  ),
  -- Popular leg exercise
  (
    'Leg Press',
    'A compound exercise targeting the quadriceps, hamstrings, and glutes.',
    'Machine',
    'Beginner'
  ),
  (
    'Romanian Deadlift',
    'A compound exercise targeting the hamstrings and glutes.',
    'Barbell',
    'Intermediate'
  ),
  (
    'Good Morning',
    'A compound exercise targeting the hamstrings and lower back.',
    'Barbell',
    'Advanced'
  ),
  (
    'Glute Bridge',
    'A compound exercise targeting the glutes.',
    'Bodyweight',
    'Beginner'
  ),
  (
    'Step-Up',
    'A compound exercise targeting the quadriceps, hamstrings, and glutes.',
    'Bodyweight',
    'Beginner'
  ),
  (
    'Goblet Squat',
    'A compound exercise targeting the quadriceps, hamstrings, and glutes.',
    'Dumbbell',
    'Beginner'
  ),
  (
    'Hack Squat',
    'A compound exercise targeting the quadriceps, hamstrings, and glutes.',
    'Machine',
    'Beginner'
  ),
  -- Popular forearm exercise
  (
    'Wrist Curl',
    'An isolation exercise targeting the forearms.',
    'Dumbbell',
    'Beginner'
  ),
  (
    'Reverse Wrist Curl',
    'An isolation exercise targeting the forearms.',
    'Dumbbell',
    'Beginner'
  ),
  (
    'Farmers Walk',
    'A compound exercise targeting the forearms and traps.',
    'Dumbbell',
    'Beginner'
  ),
  -- Popular full-body exercise
  (
    'Burpee',
    'A full-body exercise that combines a squat, push-up, and jump.',
    'Bodyweight',
    'Intermediate'
  ),
  (
    'Kettlebell Swing',
    'A full-body exercise targeting the hips, glutes, and shoulders.',
    'Kettlebell',
    'Intermediate'
  ),
  (
    'Medicine Ball Slam',
    'A full-body exercise targeting the core, shoulders, and arms.',
    'Medicine Ball',
    'Beginner'
  ),
  (
    'Battle Rope',
    'A full-body exercise targeting the arms, shoulders, and core.',
    'Battle Rope',
    'Beginner'
  ),
  (
    'Tire Flip',
    'A full-body exercise targeting the legs, back, and shoulders.',
    'Tire',
    'Advanced'
  ),
  (
    'Sled Push',
    'A full-body exercise targeting the legs, back, and shoulders.',
    'Sled',
    'Intermediate'
  );
-- Verify the inserted data
SELECT *
FROM exercises;
