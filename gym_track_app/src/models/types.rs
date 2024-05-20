use sqlx::PgPool;
use actix_web::web;

pub type DbPool = web::Data<PgPool>;
pub type Id = web::Path<i32>;
