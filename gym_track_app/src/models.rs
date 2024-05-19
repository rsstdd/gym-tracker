use serde::{Deserialize, Serialize};
use sqlx::FromRow;
use chrono::NaiveDate;

// User model
#[derive(Serialize, Deserialize, FromRow)]
pub struct User {
    pub id: i32,
    pub username: String,
    pub email: String,
    pub password_hash: String,
}

// Exercise model
#[derive(Serialize, Deserialize, FromRow)]
pub struct Exercise {
    pub id: i32,
    pub name: String,
    pub description: Option<String>,
    pub equipment: Option<String>,
    pub difficulty_level: Option<String>,
}

// Muscle model
#[derive(Serialize, Deserialize, FromRow)]
pub struct Muscle {
    pub id: i32,
    pub name: String,
}

// ExerciseMuscle model
#[derive(Serialize, Deserialize, FromRow)]
pub struct ExerciseMuscle {
    pub exercise_id: i32,
    pub muscle_id: i32,
    pub efficacy_rating: i32,
}

// Program model
#[derive(Serialize, Deserialize, FromRow)]
pub struct Program {
    pub id: i32,
    pub name: String,
    pub description: Option<String>,
    pub created_by: i32,
}

// ProgramSplit model
#[derive(Serialize, Deserialize, FromRow)]
pub struct ProgramSplit {
    pub id: i32,
    pub program_id: i32,
    pub name: String,
    pub day_of_week: i32,
}

// ProgramExercise model
#[derive(Serialize, Deserialize, FromRow)]
pub struct ProgramExercise {
    pub id: i32,
    pub program_id: i32,
    pub exercise_id: i32,
    pub sets: i32,
    pub reps: i32,
    pub rir: Option<i32>,
}

// ProgressTracking model
#[derive(Serialize, Deserialize, FromRow)]
pub struct ProgressTracking {
    pub id: i32,
    pub user_id: i32,
    pub exercise_id: i32,
    pub date: NaiveDate,
    pub weight: f32,
    pub sets: i32,
    pub reps: i32,
    pub rir: Option<i32>,
    pub notes: Option<String>,
}

// Workout model
#[derive(Serialize, Deserialize, FromRow)]
pub struct Workout {
    pub id: i32,
    pub user_id: i32,
    pub date: NaiveDate,
    pub notes: Option<String>,
}

// WorkoutExercise model
#[derive(Serialize, Deserialize, FromRow)]
pub struct WorkoutExercise {
    pub id: i32,
    pub workout_id: i32,
    pub exercise_id: i32,
    pub sets: i32,
    pub reps: i32,
    pub weight: f32,
    pub rir: Option<i32>,
    pub exertion_metric: Option<String>,
}

// UserProgram model
#[derive(Serialize, Deserialize, FromRow)]
pub struct UserProgram {
    pub user_id: i32,
    pub program_id: i32,
    pub start_date: NaiveDate,
    pub end_date: Option<NaiveDate>,
}
