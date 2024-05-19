use serde::{Deserialize, Serialize};
use sqlx::FromRow;

// WorkoutExercise model
#[derive(Serialize, Deserialize, FromRow)]
pub struct WorkoutsExercises {
    pub id: i32,
    pub workout_id: i32,
    pub exercise_id: i32,
    pub sets: i32,
    pub reps: i32,
    pub weight: f32,
    pub rir: Option<i32>,
    pub exertion_metric: Option<String>,
}
