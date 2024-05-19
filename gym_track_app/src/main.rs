use actix_web::{web, App, HttpServer};
use dotenv::dotenv;
use std::env;

mod handlers;
mod models;
mod db;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok();
    let database_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let pool = db::establish_connection(&database_url).await.expect("Failed to create pool");

    HttpServer::new(move || {
        App::new()
            .app_data(web::Data::new(pool.clone()))
            .route("/exercises", web::get().to(handlers::get_exercises))
            .route("/muscles", web::get().to(handlers::get_muscles))
            .route("/users", web::get().to(handlers::get_all_users))
        })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}
