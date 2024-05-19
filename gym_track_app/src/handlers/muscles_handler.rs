use actix_web::{web, HttpResponse};
use sqlx::PgPool;
use crate::models::Muscles;

pub async fn get_muscles(pool: web::Data<PgPool>) -> HttpResponse {
    let result = sqlx::query_as!(
        Muscles,
        "SELECT id, name FROM muscles"
    )
    .fetch_all(pool.get_ref())
    .await;

    match result {
        Ok(muscles) => HttpResponse::Ok().json(muscles),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}
