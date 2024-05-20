use actix_web::{web, HttpResponse};
use sqlx::PgPool;
use crate::models::Muscles;

pub async fn get_all_muscles(pool: web::Data<PgPool>) -> HttpResponse {
    let result = sqlx::query_as!(Muscles, "SELECT id, name FROM muscles")
        .fetch_all(pool.get_ref())
        .await;

    match result {
        Ok(muscles) => HttpResponse::Ok().json(muscles),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}

pub async fn get_muscle_by_id(pool: web::Data<PgPool>, muscle_id: web::Path<i32>) -> HttpResponse {
    let result = sqlx::query_as!(Muscles, "SELECT id, name FROM muscles WHERE id = $1", muscle_id.into_inner())
        .fetch_one(pool.get_ref())
        .await;

    match result {
        Ok(muscle) => HttpResponse::Ok().json(muscle),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}

pub async fn create_muscle(pool: web::Data<PgPool>, muscle: web::Json<Muscles>) -> HttpResponse {
    let result = sqlx::query!(
        "INSERT INTO muscles (name) VALUES ($1) RETURNING id, name",
        muscle.name
    )
    .fetch_one(pool.get_ref())
    .await;

    match result {
        Ok(record) => HttpResponse::Created().json(Muscles {
            id: record.id,
            name: record.name,
        }),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}

pub async fn delete_muscle(pool: web::Data<PgPool>, muscle_id: web::Path<i32>) -> HttpResponse {
    let result = sqlx::query!("DELETE FROM muscles WHERE id = $1", muscle_id.into_inner())
        .execute(pool.get_ref())
        .await;

    match result {
        Ok(_) => HttpResponse::NoContent().finish(),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}
