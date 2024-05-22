use serde::{Deserialize, Serialize};
use sqlx::FromRow;

// Exercise model
#[derive(Serialize, Deserialize, FromRow)]
pub struct Exercises {
    pub id: i32,
    pub name: String,
    pub description: Option<String>,
    pub equipment: Option<String>,
    pub difficulty_level: Option<String>,
}
