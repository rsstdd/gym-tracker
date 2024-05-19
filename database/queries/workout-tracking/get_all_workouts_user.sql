SELECT w.id,
  w.program_id,
  w.session_date,
  w.session_name
FROM workouts w
  JOIN users_programs up ON w.program_id = up.program_id
WHERE up.user_id = 1;
