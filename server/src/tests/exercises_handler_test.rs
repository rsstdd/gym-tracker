use actix_web::{test, web, App, http::StatusCode};
use mockall::predicate::*;
use std::sync::Arc;
use gym_track_app::handlers::exercises_handler::*;
use gym_track_app::models::{AppState, Exercises, types::Id};
use std::sync::Mutex;
use gym_track_app::dbaccess::exercises::*;
use gym_track_app::errors::GymTrackError;

mock! {
    pub DbAccess {}

    #[async_trait::async_trait]
    pub trait Exercises {
        async fn get_all_exercises_db(db: &DbPool) -> Result<Vec<Exercises>, GymTrackError>;
        async fn get_exercise_by_id_db(db: &DbPool, exercise_id: Uuid) -> Result<Exercises, GymTrackError>;
        async fn create_exercise_db(db: &DbPool, exercise: Exercises) -> Result<Exercises, GymTrackError>;
        async fn delete_exercise_db(db: &DbPool, exercise_id: Uuid) -> Result<Exercises, GymTrackError>;
    }
}

fn app_state() -> web::Data<AppState> {
    let db = Arc::new(Mutex::new(vec![]));
    let state = AppState { db };
    web::Data::new(state)
}

#[actix_rt::test]
async fn test_get_all_exercises() {
    let mut app = test::init_service(App::new().app_data(app_state()).route("/exercises", web::get().to(get_all_exercises))).await;
    let req = test::TestRequest::get().uri("/exercises").to_request();
    let resp = test::call_service(&mut app, req).await;

    assert_eq!(resp.status(), StatusCode::OK);
}

#[actix_rt::test]
async fn test_get_exercise_by_id() {
    let mut app = test::init_service(App::new().app_data(app_state()).route("/exercises/{id}", web::get().to(get_exercise_by_id))).await;
    let req = test::TestRequest::get().uri("/exercises/1").to_request();
    let resp = test::call_service(&mut app, req).await;

    assert_eq!(resp.status(), StatusCode::OK);
}

#[actix_rt::test]
async fn test_create_exercise() {
    let new_exercise = Exercises {
        id: 1,
        name: String::from("Test Exercise"),
        description: String::from("Test Description"),
        ..Default::default()
    };

    let mut app = test::init_service(App::new().app_data(app_state()).route("/exercises", web::post().to(create_exercise))).await;
    let req = test::TestRequest::post()
        .uri("/exercises")
        .set_json(&new_exercise)
        .to_request();
    let resp = test::call_service(&mut app, req).await;

    assert_eq!(resp.status(), StatusCode::OK);
}

#[actix_rt::test]
async fn test_delete_exercise() {
    let mut app = test::init_service(App::new().app_data(app_state()).route("/exercises/{id}", web::delete().to(delete_exercise))).await;
    let req = test::TestRequest::delete().uri("/exercises/1").to_request();
    let resp = test::call_service(&mut app, req).await;

    assert_eq!(resp.status(), StatusCode::OK);
}
