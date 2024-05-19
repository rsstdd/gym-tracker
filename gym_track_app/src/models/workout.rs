use chrono::NaiveDate;
use serde::{Deserialize, Serialize};
use sqlx::FromRow;

// Workout model
#[derive(Serialize, Deserialize, FromRow)]
pub struct Workouts {
    pub id: i32,
    pub program_id: i32,
    pub session_date: NaiveDate,
    pub session_name: Option<String>,
}
