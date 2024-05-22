use actix_web::{web, HttpResponse};
use crate::{
    dbaccess::users::{
        get_all_users_db,
        get_user_by_id_db,
        create_user_db,
        delete_user_db,
    },
    errors::GymTrackError,
    models::{types::Id, AppState, Users}
};

/// Handler to get all users
///
/// Fetches all users from the database and returns them as a JSON response.
///
/// # Arguments
/// * `app_state` - Shared application state containing the database connection pool.
///
/// # Returns
/// * `HttpResponse` - JSON response with all users or an error message.
pub async fn get_all_users(
    app_state: web::Data<AppState>
) -> Result<HttpResponse, GymTrackError> {
    get_all_users_db(&app_state.db)
        .await
        .map(|u| HttpResponse::Ok().json(u))
}

/// Handler to get a specific user by ID
///
/// Fetches a user by its ID from the database and returns it as a JSON response.
///
/// # Arguments
/// * `app_state` - Shared application state containing the database connection pool.
/// * `user_id` - The ID of the user to fetch.
///
/// # Returns
/// * `HttpResponse` - JSON response with the user or an error message.
pub async fn get_user_by_id(
    app_state: web::Data<AppState>,
    user_id: Id
) ->  Result<HttpResponse, GymTrackError> {
    get_user_by_id_db(&app_state.db, user_id.into_inner().into())
        .await
        .map(|u| HttpResponse::Ok().json(u))
}

/// Handler to create a new user
///
/// Inserts a new user into the database and returns the created user as a JSON response.
///
/// # Arguments
/// * `user` - JSON payload of the user to create.
/// * `app_state` - Shared application state containing the database connection pool.
///
/// # Returns
/// * `HttpResponse` - JSON response with the created user or an error message.
pub async fn create_user(
    user: web::Json<Users>,
    app_state: web::Data<AppState>,
) ->  Result<HttpResponse, GymTrackError> {
    create_user_db(&app_state.db, user.into_inner())
        .await
        .map(|u| HttpResponse::Ok().json(u))
}

/// Handler to delete a user by ID
///
/// Deletes a user by its ID from the database and returns the deleted user as a JSON response.
///
/// # Arguments
/// * `app_state` - Shared application state containing the database connection pool.
/// * `user_id` - The ID of the user to delete.
///
/// # Returns
/// * `HttpResponse` - JSON response with the deleted user or an error message.
pub async fn delete_user(
    app_state: web::Data<AppState>,
    user_id: Id
) -> Result<HttpResponse, GymTrackError> {
    delete_user_db(&app_state.db, user_id)
        .await
        .map(|u| HttpResponse::Ok().json(u))
}
