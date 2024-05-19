use actix_web::{web, HttpResponse};
use sqlx::PgPool;
use crate::models::ProgressTracking;

pub async fn log_progress(pool: web::Data<PgPool>, progress: web::Json<ProgressTracking>) -> HttpResponse {
    let result = sqlx::query!(
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
    .await;

    match result {
        Ok(_) => HttpResponse::Ok().body("Progress logged"),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}
