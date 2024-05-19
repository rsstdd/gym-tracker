use actix_web::{web, HttpResponse};
use sqlx::PgPool;
use crate::models::{Programs, ProgramSplits, ProgramExercises};

pub async fn get_all_programs(pool: web::Data<PgPool>) -> HttpResponse {
    let result = sqlx::query_as!(Programs, "SELECT id, name, description, created_by FROM programs")
        .fetch_all(pool.get_ref())
        .await;

    match result {
        Ok(programs) => HttpResponse::Ok().json(programs),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}

pub async fn get_program_splits(pool: web::Data<PgPool>, program_id: web::Path<i32>) -> HttpResponse {
    let result = sqlx::query_as!(ProgramSplits, "SELECT id, program_id, name, day_of_week FROM program_splits WHERE program_id = $1", program_id)
        .fetch_all(pool.get_ref())
        .await;

    match result {
        Ok(splits) => HttpResponse::Ok().json(splits),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}

pub async fn get_program_exercises(pool: web::Data<PgPool>, split_id: web::Path<i32>) -> HttpResponse {
    let result = sqlx::query_as!(ProgramExercises, "SELECT id, split_id, exercise_id, sets, reps, rir FROM program_exercises WHERE split_id = $1", split_id)
        .fetch_all(pool.get_ref())
        .await;

    match result {
        Ok(exercises) => HttpResponse::Ok().json(exercises),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}
