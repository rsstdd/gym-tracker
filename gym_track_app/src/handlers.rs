use actix_web::{web, HttpResponse, Responder};
use sqlx::PgPool;
use crate::models::{User, Exercise, Workout, Progress};

pub async fn get_users(pool: web::Data<PgPool>) -> impl Responder {
    let users = sqlx::query_as!(User, "SELECT id, username, email, password_hash FROM users")
        .fetch_all(pool.get_ref())
        .await
        .unwrap();
    HttpResponse::Ok().json(users)
}

pub async fn get_all_exercises(pool: web::Data<PgPool>) -> impl Responder {
    let exercises = sqlx::query_as!(Exercise, "SELECT id, name, description, equipment, difficulty_level FROM exercises")
        .fetch_all(pool.get_ref())
        .await
        .unwrap();
    HttpResponse::Ok().json(exercises)
}

pub async fn get_workouts(pool: web::Data<PgPool>, user_id: web::Path<i32>) -> impl Responder {
    let workouts = sqlx::query_as!(
        Workout,
        "SELECT id, user_id, date, notes FROM workouts WHERE user_id = $1",
        *user_id
    )
    .fetch_all(pool.get_ref())
    .await
    .unwrap();
    HttpResponse::Ok().json(workouts)
}

pub async fn log_progress(pool: web::Data<PgPool>, progress: web::Json<Progress>) -> impl Responder {
    sqlx::query!(
        "INSERT INTO progress_tracking (user_id, exercise_id, date, weight, sets, reps, rir, notes) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)",
        progress.user_id,
        progress.exercise_id,
        progress.date,
        progress.weight,
        progress.sets,
        progress.reps,
        progress.rir,
        progress.notes
    )
    .execute(pool.get_ref())
    .await
    .unwrap();
    HttpResponse::Ok().body("Progress logged")
}
