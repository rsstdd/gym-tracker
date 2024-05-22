use chrono::NaiveDate;
use serde::{Deserialize, Serialize};
use sqlx::FromRow;

// User model
#[derive(Serialize, Deserialize, FromRow)]
pub struct Users {
    pub id: i32,
    pub username: String,
    pub email: String,
    pub password_hash: String,
}

// UserProgram model
#[derive(Serialize, Deserialize, FromRow)]
pub struct UserPrograms {
    pub user_id: i32,
    pub program_id: i32,
    pub start_date: NaiveDate,
    pub end_date: Option<NaiveDate>,
}
