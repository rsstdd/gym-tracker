use actix_web::{web, HttpResponse};
use sqlx::PgPool;
use crate::models::Users;


pub async fn get_all_users(pool: web::Data<PgPool>) -> HttpResponse {
    let result = sqlx::query_as!(
        Users,
        "SELECT id, username, email, password_hash FROM Users"
    )
    .fetch_all(pool.get_ref())
    .await;

    match result {
        Ok(users) => HttpResponse::Ok().json(users),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}
