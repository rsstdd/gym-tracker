use actix_web::{web, HttpResponse};
use crate::{
    dbaccess::exercises::{
        get_all_exercises_db,
        get_exercise_by_id_db,
        create_exercise_db,
        delete_exercise_db,
    },
    errors::GymTrackError,
    models::{types::Id, AppState, Exercises}
};

/// Handler to get all exercises
///
/// Fetches all exercises from the database and returns them as a JSON response.
///
/// # Arguments
/// * `app_state` - Shared application state containing the database connection pool.
///
/// # Returns
/// * `HttpResponse` - JSON response with all exercises or an error message.
pub async fn get_all_exercises(
    app_state: web::Data<AppState>
) -> Result<HttpResponse, GymTrackError> {
    get_all_exercises_db(&app_state.db)
        .await
        .map(|e| HttpResponse::Ok().json(e))
}

/// Handler to get a specific exercise by ID
///
/// Fetches an exercise by its ID from the database and returns it as a JSON response.
///
/// # Arguments
/// * `app_state` - Shared application state containing the database connection pool.
/// * `exercise_id` - The ID of the exercise to fetch.
///
/// # Returns
/// * `HttpResponse` - JSON response with the exercise or an error message.
pub async fn get_exercise_by_id(
    app_state: web::Data<AppState>,
    exercise_id: Id
) ->  Result<HttpResponse, GymTrackError> {
    get_exercise_by_id_db(&app_state.db, exercise_id.into_inner().into())
        .await
        .map(|e| HttpResponse::Ok().json(e))
}

/// Handler to create a new exercise
///
/// Inserts a new exercise into the database and returns the created exercise as a JSON response.
///
/// # Arguments
/// * `exercise` - JSON payload of the exercise to create.
/// * `app_state` - Shared application state containing the database connection pool.
///
/// # Returns
/// * `HttpResponse` - JSON response with the created exercise or an error message.
pub async fn create_exercise(
    exercise: web::Json<Exercises>,
    app_state: web::Data<AppState>,
) ->  Result<HttpResponse, GymTrackError> {
    create_exercise_db(&app_state.db, exercise.into_inner())
        .await
        .map(|e| HttpResponse::Ok().json(e))
}

/// Handler to delete an exercise by ID
///
/// Deletes an exercise by its ID from the database and returns the deleted exercise as a JSON response.
///
/// # Arguments
/// * `app_state` - Shared application state containing the database connection pool.
/// * `exercise_id` - The ID of the exercise to delete.
///
/// # Returns
/// * `HttpResponse` - JSON response with the deleted exercise or an error message.
pub async fn delete_exercise(
    app_state: web::Data<AppState>,
    exercise_id: Id
) -> Result<HttpResponse, GymTrackError> {
    delete_exercise_db(&app_state.db, exercise_id)
        .await
        .map(|e| HttpResponse::Ok().json(e))
}
