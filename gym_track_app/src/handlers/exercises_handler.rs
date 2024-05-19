use actix_web::{web, HttpResponse, Responder};
use sqlx::PgPool;
use crate::models::Exercises;

pub async fn get_exercises(pool: web::Data<PgPool>) -> HttpResponse {
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

pub async fn get_all_exercises(pool: web::Data<PgPool>) -> impl Responder {
    let exercises = sqlx::query_as!(Exercises, "SELECT id, name, description, equipment, difficulty_level FROM exercises")
        .fetch_all(pool.get_ref())
        .await
        .unwrap();
    HttpResponse::Ok().json(exercises)
}
