use crate::handlers::{
  exercises_handler::*,
  general_handler::*,
  muscles_handler::*,
  programs_handler::*,
  users_handler::*,
};

// pub use progress_tracking_handler::*;
// pub use workouts_handler::*;

use actix_web::web;

pub fn general_routes(cfg: &mut web::ServiceConfig) {
    cfg.route("/health", web::get().to(health_check_handler));
}

pub fn user_routes(cfg: &mut web::ServiceConfig) {
    cfg.route("/users", web::get().to(get_all_users))
        .route("/users/{id}", web::get().to(get_user_by_id))
        .route("/users", web::post().to(create_user))
        .route("/users/{id}", web::delete().to(delete_user));
}

pub fn exercises_routes(cfg: &mut web::ServiceConfig) {
    cfg.route("/exercises", web::get().to(get_all_exercises))
        .route("/exercises/{id}", web::get().to(get_exercise_by_id))
        .route("/exercises", web::post().to(create_exercise))
        .route("/exercises/{id}", web::delete().to(delete_exercise));
}

pub fn muscles_routes(cfg: &mut web::ServiceConfig) {
    cfg.route("/muscles", web::get().to(get_all_muscles))
        .route("/muscles/{id}", web::get().to(get_muscle_by_id))
        .route("/muscles", web::post().to(create_muscle))
        .route("/muscles/{id}", web::delete().to(delete_muscle));
}

pub fn programs_routes(cfg: &mut web::ServiceConfig) {
    cfg.route("/programs", web::get().to(get_all_programs))
        .route("/programs/{id}", web::get().to(get_program_by_id))
        .route("/programs/{id}/splits", web::get().to(get_program_splits))
        .route("/splits/{id}/exercises", web::get().to(get_program_exercises));
}
