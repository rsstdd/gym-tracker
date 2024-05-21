use actix_web::{web, App, HttpServer};
use dotenv::dotenv;
use std::env;
use std::sync::Mutex;
use env_logger;

mod errors;
mod handlers;
mod models;
mod routes;
mod dbaccess;

use errors::GymTrackError;
use routes::*;
use models::AppState;
use dbaccess::db;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok();
    env_logger::init();
    let host_port = env::var("HOST_PORT").expect("HOST:PORT address is not set in .env file");
    let database_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let db_pool = db::establish_connection(&database_url).await.expect("Failed to create db_pool");

    let shared_data = web::Data::new(AppState {
        health_check_response: "I'm good. You've already asked me ".to_string(),
        visit_count: Mutex::new(0),
        db: db_pool,
    });

    let app = move || {
        App::new()
            .app_data(shared_data.clone())
            .app_data(web::JsonConfig::default().error_handler(|_err, _req| {
                GymTrackError::InvalidInput("Please provide valid Json input".to_string()).into()
            }))
            .configure(general_routes)
            .configure(user_routes)
            .configure(exercises_routes)
            .configure(muscles_routes)
            .configure(programs_routes)
    };

    println!("Running on host:port = {:?}", host_port);
    HttpServer::new(app).bind(&host_port)?.run().await
}
