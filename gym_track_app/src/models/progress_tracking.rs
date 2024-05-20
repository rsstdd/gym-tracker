use chrono::NaiveDate;
use serde::{Deserialize, Serialize};
use sqlx::FromRow;

#[derive(Serialize, Deserialize, FromRow)]
pub struct ProgressTracking {
    pub users_id: i32,
    pub exercises_id: i32,
    pub date: NaiveDate,
    pub weight: f32,
    pub sets: i32,
    pub reps: i32,
    pub rir: Option<i32>,
    pub notes: Option<String>,
}
