use serde::{Deserialize, Serialize};
use sqlx::FromRow;

// Program model
#[derive(Serialize, Deserialize, FromRow)]
pub struct Programs {
    pub id: i32,
    pub name: String,
    pub description: Option<String>,
    pub created_by: i32,
}

// ProgramSplit model
#[derive(Serialize, Deserialize, FromRow)]
pub struct ProgramSplits {
    pub id: i32,
    pub program_id: i32,
    pub name: String,
    pub day_of_week: i32,
}

// ProgramExercise model
#[derive(Serialize, Deserialize, FromRow)]
pub struct ProgramExercises {
    pub id: i32,
    pub program_id: i32,
    pub exercise_id: i32,
    pub sets: i32,
    pub reps: i32,
    pub rir: Option<i32>,
}
