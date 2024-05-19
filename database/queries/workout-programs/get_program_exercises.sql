SELECT e.id,
  e.name,
  e.description,
  e.equipment,
  e.difficulty_level
FROM exercises e
  JOIN programs_exercise pe ON e.id = pe.exercise_id
WHERE pe.program_id = 1;
