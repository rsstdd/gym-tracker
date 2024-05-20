use actix_web::{web, HttpResponse};
use crate::{dbaccess::exercises::get_all_exercises_db, errors::GymTrackError, models::{types::{DbPool, Id}, AppState, Exercises}};

pub async fn get_all_exercises(
    app_state: web::Data<AppState>
) -> Result<HttpResponse, GymTrackError> {
    get_all_exercises_db(&app_state.db)
        .await
        .map(|c| HttpResponse::Ok().json(c))
}

pub async fn get_exercise_by_id(pool: DbPool, exercise_id: Id) -> HttpResponse {
    let result = sqlx::query_as!(
        Exercises,
        "SELECT id, name, description, equipment, difficulty_level FROM exercises WHERE id = $1",
        exercise_id.into_inner()
    )
    .fetch_one(pool.get_ref())
    .await;

    match result {
        Ok(exercise) => HttpResponse::Ok().json(exercise),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}

pub async fn create_exercise(pool: DbPool, exercise: web::Json<Exercises>) -> HttpResponse {
    let result = sqlx::query_as!(
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
        exercise.name, exercise.description, exercise.equipment, exercise.difficulty_level
    )
    .fetch_one(pool.get_ref())
    .await;

    match result {
        Ok(new_exercise) => HttpResponse::Created().json(new_exercise),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}

pub async fn delete_exercise(pool: DbPool, exercise_id: Id) -> HttpResponse {
    let result = sqlx::query!("DELETE FROM exercises WHERE id = $1", exercise_id.into_inner())
        .execute(pool.get_ref())
        .await;

    match result {
        Ok(_) => HttpResponse::NoContent().finish(),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}
