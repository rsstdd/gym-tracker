-- Seed data for the exercises_muscles table with mappings between exercises and specific muscles
-- Ensure the table is empty before seeding
TRUNCATE TABLE exercises_muscles RESTART IDENTITY;
-- Insert seed data with exercise-muscle mappings
INSERT INTO exercises_muscles (exercise_id, muscle_id, efficacy_rating)
VALUES -- Olympic weightlifting exercises
  (1, 2, 10),  -- Snatch - Latissimus Dorsi
  (1, 11, 8),  -- Snatch - Erector Spinae
  (1, 12, 9),  -- Snatch - Gluteus Maximus
  (1, 13, 10), -- Snatch - Quadriceps Femoris
  (1, 5, 7),  -- Snatch - Deltoids
  (2, 2, 10),  -- Clean and Jerk - Latissimus Dorsi
  (2, 11, 8),  -- Clean and Jerk - Erector Spinae
  (2, 12, 9),  -- Clean and Jerk - Gluteus Maximus
  (2, 13, 10), -- Clean and Jerk - Quadriceps Femoris
  (2, 5, 7),  -- Clean and Jerk - Deltoids
  (3, 2, 8),  -- Clean - Latissimus Dorsi
  (3, 11, 8),  -- Clean - Erector Spinae
  (3, 12, 7),  -- Clean - Gluteus Maximus
  (3, 13, 9),  -- Clean - Quadriceps Femoris
  (3, 5, 6),  -- Clean - Deltoids
  (4, 5, 9),  -- Jerk - Deltoids
  (4, 7, 8),  -- Jerk - Triceps Brachii
  -- Powerlifting exercises
  (5, 1, 10),  -- Bench Press - Pectoralis Major
  (5, 5, 7),  -- Bench Press - Deltoids
  (5, 7, 8),  -- Bench Press - Triceps Brachii
  (6, 13, 10), -- Squat - Quadriceps Femoris
  (6, 14, 9), -- Squat - Hamstrings
  (6, 12, 10), -- Squat - Gluteus Maximus
  (7, 14, 10), -- Deadlift - Hamstrings
  (7, 11, 9), -- Deadlift - Erector Spinae
  (7, 12, 10), -- Deadlift - Gluteus Maximus
  -- Popular compound exercises
  (8, 5, 10),  -- Overhead Press - Deltoids
  (8, 7, 8),  -- Overhead Press - Triceps Brachii
  (9, 2, 10),  -- Pull-Up - Latissimus Dorsi
  (9, 6, 8),  -- Pull-Up - Biceps Brachii
  (10, 1, 9),  -- Dumbbell Bench Press - Pectoralis Major
  (10, 5, 7),  -- Dumbbell Bench Press - Deltoids
  (10, 7, 8),  -- Dumbbell Bench Press - Triceps Brachii
  (11, 1, 8),  -- Incline Bench Press - Pectoralis Major
  (11, 5, 7),  -- Incline Bench Press - Deltoids
  (11, 7, 8),  -- Incline Bench Press - Triceps Brachii
  (12, 5, 9),  -- Dumbbell Shoulder Press - Deltoids
  (12, 7, 8),  -- Dumbbell Shoulder Press - Triceps Brachii
  (13, 2, 10), -- Barbell Row - Latissimus Dorsi
  (13, 6, 8),  -- Barbell Row - Biceps Brachii
  (13, 3, 7),  -- Barbell Row - Trapezius
  (13, 4, 7),  -- Barbell Row - Rhomboids
  (14, 2, 9),  -- Dumbbell Row - Latissimus Dorsi
  (14, 6, 8),  -- Dumbbell Row - Biceps Brachii
  (15, 13, 10), -- Front Squat - Quadriceps Femoris
  (15, 14, 9), -- Front Squat - Hamstrings
  (15, 12, 9), -- Front Squat - Gluteus Maximus
  (16, 13, 8), -- Lunge - Quadriceps Femoris
  (16, 14, 8), -- Lunge - Hamstrings
  (16, 12, 8), -- Lunge - Gluteus Maximus
  (17, 12, 9), -- Bulgarian Split Squat - Gluteus Maximus
  -- Popular isolation exercises
  (18, 6, 9),  -- Bicep Curl - Biceps Brachii
  (18, 8, 7),  -- Bicep Curl - Brachialis
  (19, 7, 9),  -- Tricep Extension - Triceps Brachii
  (20, 5, 9),  -- Lateral Raise - Deltoids
  (21, 14, 8), -- Leg Curl - Hamstrings
  (22, 13, 9), -- Leg Extension - Quadriceps Femoris
  (23, 15, 9), -- Calf Raise - Gastrocnemius
  (23, 16, 8), -- Calf Raise - Soleus
  (24, 1, 9),  -- Chest Fly - Pectoralis Major
  (25, 6, 8),  -- Hammer Curl - Biceps Brachii
  (25, 8, 8),  -- Hammer Curl - Brachialis
  (26, 6, 9),  -- Preacher Curl - Biceps Brachii
  (27, 7, 9),  -- Skull Crusher - Triceps Brachii
  (28, 7, 8),  -- Cable Tricep Extension - Triceps Brachii
  (29, 6, 8),  -- Cable Bicep Curl - Biceps Brachii
  (30, 5, 7),  -- Face Pull - Deltoids
  (30, 20, 8), -- Face Pull - Rear Deltoids
  (31, 15, 9), -- Seated Calf Raise - Gastrocnemius
  (31, 16, 8), -- Seated Calf Raise - Soleus
  (32, 15, 8), -- Standing Calf Raise - Gastrocnemius
  (32, 16, 8), -- Standing Calf Raise - Soleus
  (33, 6, 8),  -- Concentration Curl - Biceps Brachii
  (34, 7, 8),  -- Tricep Kickback - Triceps Brachii
  (35, 6, 8),  -- Incline Dumbbell Curl - Biceps Brachii
  (36, 6, 8),  -- Reverse Curl - Biceps Brachii
  (36, 21, 7), -- Reverse Curl - Forearm Flexors
  -- Popular core exercises
  (37, 9, 9),  -- Plank - Rectus Abdominis
  (37, 10, 9), -- Plank - Lower Back
  (37, 5, 7),  -- Plank - Deltoids
  (38, 10, 8), -- Russian Twist - Obliques
  (39, 9, 8),  -- Hanging Leg Raise - Rectus Abdominis
  (40, 9, 8),  -- Sit-Up - Rectus Abdominis
  (41, 9, 7),  -- Crunch - Rectus Abdominis
  (42, 10, 8), -- Mountain Climber - Obliques
  (42, 17, 7), -- Mountain Climber - Hip Flexors
  (43, 9, 8),  -- Bicycle Crunch - Rectus Abdominis
  (43, 10, 8), -- Bicycle Crunch - Obliques
  (44, 9, 8),  -- Toe Touch - Rectus Abdominis
  (45, 10, 8), -- Side Plank - Obliques
  (46, 9, 9),  -- V-Up - Rectus Abdominis
  (47, 9, 9),  -- Ab Wheel Rollout - Rectus Abdominis
  -- Popular back exercises
  (48, 2, 9),  -- Lat Pulldown - Latissimus Dorsi
  (48, 6, 8),  -- Lat Pulldown - Biceps Brachii
  (48, 3, 7),  -- Lat Pulldown - Trapezius
  (48, 4, 7),  -- Lat Pulldown - Rhomboids
  (49, 2, 9),  -- Seated Row - Latissimus Dorsi
  (49, 6, 8),  -- Seated Row - Biceps Brachii
  (50, 2, 9),  -- T-Bar Row - Latissimus Dorsi
  (50, 6, 8),  -- T-Bar Row - Biceps Brachii
  (50, 3, 7),  -- T-Bar Row - Trapezius
  (50, 4, 7),  -- T-Bar Row - Rhomboids
  (51, 2, 9),  -- Single-Arm Dumbbell Row - Latissimus Dorsi
  (51, 6, 8),  -- Single-Arm Dumbbell Row - Biceps Brachii
  (52, 2, 8),  -- Inverted Row - Latissimus Dorsi
  (52, 6, 7),  -- Inverted Row - Biceps Brachii
  (53, 2, 9),  -- Cable Row - Latissimus Dorsi
  (53, 6, 8),  -- Cable Row - Biceps Brachii
  (53, 3, 7),  -- Cable Row - Trapezius
  (53, 4, 7),  -- Cable Row - Rhomboids
  -- Popular shoulder exercises
  (54, 5, 9),  -- Arnold Press - Deltoids
  (54, 7, 8),  -- Arnold Press - Triceps Brachii
  (55, 5, 8),  -- Reverse Fly - Deltoids
  (56, 5, 8),  -- Upright Row - Deltoids
  (56, 18, 7), -- Upright Row - Trapezius
  (57, 5, 7),  -- Front Raise - Deltoids
  (58, 5, 7),  -- Rear Delt Fly - Deltoids
  -- Popular chest exercises
  (59, 1, 9),  -- Incline Dumbbell Press - Pectoralis Major
  (59, 5, 7),  -- Incline Dumbbell Press - Deltoids
  (59, 7, 7),  -- Incline Dumbbell Press - Triceps Brachii
  (60, 1, 8),  -- Decline Bench Press - Pectoralis Major
  (60, 5, 7),  -- Decline Bench Press - Deltoids
  (60, 7, 7),  -- Decline Bench Press - Triceps Brachii
  (61, 1, 8),  -- Cable Chest Fly - Pectoralis Major
  (62, 1, 8),  -- Pec Deck - Pectoralis Major
  (63, 1, 7),  -- Push-Up - Pectoralis Major
  (63, 5, 6),  -- Push-Up - Deltoids
  (63, 7, 6),  -- Push-Up - Triceps Brachii
  -- Popular leg exercises
  (64, 13, 9), -- Leg Press - Quadriceps Femoris
  (64, 14, 8), -- Leg Press - Hamstrings
  (64, 12, 8), -- Leg Press - Gluteus Maximus
  (65, 14, 9), -- Romanian Deadlift - Hamstrings
  (65, 12, 8), -- Romanian Deadlift - Gluteus Maximus
  (66, 14, 8), -- Good Morning - Hamstrings
  (66, 11, 8), -- Good Morning - Erector Spinae
  (67, 12, 9), -- Glute Bridge - Gluteus Maximus
  (68, 13, 8), -- Step-Up - Quadriceps Femoris
  (68, 14, 8), -- Step-Up - Hamstrings
  (68, 12, 8), -- Step-Up - Gluteus Maximus
  (69, 13, 8), -- Goblet Squat - Quadriceps Femoris
  (69, 14, 8), -- Goblet Squat - Hamstrings
  (69, 12, 8), -- Goblet Squat - Gluteus Maximus
  (70, 15, 8), -- Hack Squat - Gastrocnemius
  (70, 16, 7), -- Hack Squat - Soleus
  -- Popular forearm exercises
  (71, 21, 8), -- Wrist Curl - Forearm Flexors
  (71, 22, 8), -- Wrist Curl - Forearm Extensors
  (72, 21, 8), -- Reverse Wrist Curl - Forearm Flexors
  (72, 22, 7), -- Reverse Wrist Curl - Forearm Extensors
  (73, 21, 8), -- Farmers Walk - Forearm Flexors
  (73, 18, 8), -- Farmers Walk - Trapezius
  -- Popular full-body exercises
  (74, 13, 8), -- Burpee - Quadriceps Femoris
  (74, 7, 7),  -- Burpee - Triceps Brachii
  (74, 5, 7),  -- Burpee - Deltoids
  (75, 12, 8), -- Kettlebell Swing - Gluteus Maximus
  (75, 5, 7),  -- Kettlebell Swing - Deltoids
  (76, 9, 8),  -- Medicine Ball Slam - Rectus Abdominis
  (76, 5, 7),  -- Medicine Ball Slam - Deltoids
  (77, 21, 8), -- Battle Rope - Forearm Flexors
  (77, 5, 7),  -- Battle Rope - Deltoids
  (78, 13, 9), -- Tire Flip - Quadriceps Femoris
  (78, 11, 8), -- Tire Flip - Erector Spinae
  (79, 13, 8), -- Sled Push - Quadriceps Femoris
  (79, 5, 7);  -- Sled Push - Deltoids

-- Verify the inserted data
SELECT *
FROM exercises_muscles;
