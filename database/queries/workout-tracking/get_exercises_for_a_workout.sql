SELECT we.id,
  we.exercise_id,
  we.sets,
  we.reps,
  we.weight,
  we.rir,
  we.exertion_metric
FROM workouts_exercises we
WHERE we.workouts_id = 1;
