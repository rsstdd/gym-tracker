use serde::{Deserialize, Serialize};
use sqlx::FromRow;

// Program model
#[derive(Serialize, Deserialize, FromRow)]
pub struct Programs {
    pub id: i32,
    pub programs_name: String,
    pub programs_type: String,
    pub description: Option<String>,
    pub duration_weeks: i32,
    pub created_by_user_id: Option<i32>,
}

// ProgramSplit model
#[derive(Serialize, Deserialize, FromRow)]
pub struct ProgramsSplits {
    pub id: i32,
    pub programs_id: i32,
    pub programs_name: String,
    pub day_of_week: i32,
}

// ProgramExercise model
#[derive(Serialize, Deserialize, FromRow)]
pub struct ProgramsExercises {
    pub id: i32,
    pub split_id: i32,
    pub exercise_id: i32,
    pub sets: i32,
    pub reps: i32
}
