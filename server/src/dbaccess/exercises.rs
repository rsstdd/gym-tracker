use crate::errors::GymTrackError;
use crate::models::Exercises;
use sqlx::postgres::PgPool;
use crate::models::types::Id;

pub async fn get_all_exercises_db(pool: &PgPool) -> Result<Vec<Exercises>, GymTrackError> {
    let exercises_rows = sqlx::query_as!(
        Exercises,
        r#"SELECT * FROM exercises"#,
    )
    .fetch_all(pool)
    .await
    .map_err(|e| GymTrackError::DBError(e.to_string()))?;

    Ok(exercises_rows)
}

pub async fn get_exercise_by_id_db(pool: &PgPool, exercise_id: Id) -> Result<Exercises, GymTrackError> {
    let exercise = sqlx::query_as!(
        Exercises,
        "SELECT id, name, description, equipment, difficulty_level FROM exercises WHERE id = $1",
        exercise_id.into_inner()
    )
    .fetch_one(pool)
    .await
    .map_err(|e| GymTrackError::DBError(e.to_string()))?;

    Ok(exercise)
}

pub async fn create_exercise_db(
    pool: &PgPool,
    exercise: Exercises
) -> Result<Exercises, GymTrackError> {
    let new_exercise = sqlx::query_as!(
        Exercises,
        r#"
        INSERT INTO exercises (
            name,
            description,
            equipment,
            difficulty_level
        ) VALUES ($1, $2, $3, $4)
        RETURNING id, name, description, equipment, difficulty_level
        "#,
        exercise.name,
        exercise.description,
        exercise.equipment,
        exercise.difficulty_level
    )
    .fetch_one(pool)
    .await
    .map_err(|e| GymTrackError::DBError(e.to_string()))?;

    Ok(new_exercise)
}

pub async fn delete_exercise_db(
    pool: &PgPool,
    exercise_id: Id
) -> Result<String, GymTrackError> {
    let exercise_row = sqlx::query!(
        "DELETE FROM exercises WHERE id = $1", exercise_id.into_inner()
    )
    .execute(pool)
    .await
    .map_err(|e| GymTrackError::DBError(e.to_string()))?;

    Ok(format!("Deleted {:#?} record", exercise_row))
}
