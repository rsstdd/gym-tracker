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
    cfg.service(
web::scope("/users")
        .route("", web::get().to(get_all_users))
        .route("", web::post().to(create_user))
        .route("/{id}", web::get().to(get_user_by_id))
        .route("/{id}", web::delete().to(delete_user))
    );
}

pub fn exercise_routes(cfg: &mut web::ServiceConfig) {
    cfg.service(
        web::scope("/exercises")
        .route("", web::get().to(get_all_exercises))
        .route("", web::post().to(create_exercise))
        .route("/{id}", web::get().to(get_exercise_by_id))
        .route("/{id}", web::delete().to(delete_exercise))
    );
}

pub fn muscles_routes(cfg: &mut web::ServiceConfig) {
    cfg.service(
        web::scope("/muscles")
        .route("", web::get().to(get_all_muscles))
        .route("/{id}", web::get().to(get_muscle_by_id))
        .route("", web::post().to(create_muscle))
        .route("/{id}", web::delete().to(delete_muscle))
    );
}

pub fn programs_routes(cfg: &mut web::ServiceConfig) {
    cfg.service(
        web::scope("/programs")
        .route("", web::get().to(get_all_programs))
        .route("/{id}", web::get().to(get_program_by_id))
        .route("/{id}/splits", web::get().to(get_program_splits))
        .route("/splits/{id}/exercises", web::get().to(get_program_exercises))
    );
}
