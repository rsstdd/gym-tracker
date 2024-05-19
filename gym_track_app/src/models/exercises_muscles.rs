use serde::{Deserialize, Serialize};
use sqlx::FromRow;

#[derive(Serialize, Deserialize, FromRow)]
pub struct ExercisesMuscles {
    pub exercise_id: i32,
    pub muscle_id: i32,
    pub efficacy_rating: i32,
}
