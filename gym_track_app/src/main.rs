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
            .route("/users", web::get().to(handlers::get_all_users))
            .route("/exercises", web::get().to(handlers::get_all_exercises))
            .route("/exercises/{id}", web::get().to(handlers::get_exercise_by_id))
            .route("/exercises", web::post().to(handlers::create_exercise))
            .route("/exercises/{id}", web::delete().to(handlers::delete_exercise))
            .route("/muscles", web::get().to(handlers::get_all_muscles))
            .route("/muscles/{id}", web::get().to(handlers::get_muscle_by_id))
            .route("/muscles", web::post().to(handlers::create_muscle))
            .route("/muscles/{id}", web::delete().to(handlers::delete_muscle))
            .route("/programs", web::get().to(handlers::get_all_programs))
            .route("/programs/{id}/splits", web::get().to(handlers::get_program_splits))
            .route("/splits/{id}/exercises", web::get().to(handlers::get_program_exercises))
            // .route("/workouts", web::get().to(handlers::get_all_workouts))
            // .route("/workouts/{id}/exercises", web::get().to(handlers::get_workout_exercises))
            // .route("/log_progress", web::post().to(handlers::log_progress))
        })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}
