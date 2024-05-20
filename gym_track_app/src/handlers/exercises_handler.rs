use actix_web::{web, HttpResponse};
use sqlx::PgPool;
use crate::models::Exercises;

pub async fn get_all_exercises(pool: web::Data<PgPool>) -> HttpResponse {
    let result = sqlx::query_as!(
        Exercises,
        "SELECT id, name, description, equipment, difficulty_level FROM exercises"
    )
    .fetch_all(pool.get_ref())
    .await;

    match result {
        Ok(exercises) => HttpResponse::Ok().json(exercises),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}

pub async fn get_exercise_by_id(pool: web::Data<PgPool>, exercise_id: web::Path<i32>) -> HttpResponse {
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

pub async fn create_exercise(pool: web::Data<PgPool>, exercise: web::Json<Exercises>) -> HttpResponse {
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

pub async fn delete_exercise(pool: web::Data<PgPool>, exercise_id: web::Path<i32>) -> HttpResponse {
    let result = sqlx::query!("DELETE FROM exercises WHERE id = $1", exercise_id.into_inner())
        .execute(pool.get_ref())
        .await;

    match result {
        Ok(_) => HttpResponse::NoContent().finish(),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}
