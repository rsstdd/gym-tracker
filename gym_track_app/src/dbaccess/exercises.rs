use crate::errors::GymTrackError;
use crate::models::Exercises;
use sqlx::postgres::PgPool;

pub async fn get_all_exercises_db(pool: &PgPool) -> Result<Vec<Exercises>, GymTrackError> {
    let exercises_rows: Vec<Exercises> = sqlx::query_as!(
        Exercises,
        r#"SELECT * FROM exercises"#,
    )
    .fetch_all(pool)
    .await?;

    Ok(exercises_rows)
}
