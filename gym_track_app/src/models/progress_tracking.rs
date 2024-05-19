use chrono::NaiveDate;
use serde::{Deserialize, Serialize};
use sqlx::FromRow;

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
