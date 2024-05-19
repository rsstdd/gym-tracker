SELECT e.id,
  e.name,
  e.description,
  e.equipment,
  e.difficulty_level
FROM exercises e
  JOIN exercises_muscles em ON e.id = em.exercise_id
WHERE em.muscle_id = 1;
