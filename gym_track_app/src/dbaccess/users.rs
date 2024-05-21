use crate::models::{Users, types::Id};
use crate::errors::GymTrackError;
use sqlx::postgres::PgPool;

/// Fetches all users from the database
///
/// # Arguments
/// * `pool` - A reference to the database connection pool
///
/// # Returns
/// * A Result containing a vector of users or a GymTrackError
pub async fn get_all_users_db(
  pool: &PgPool
) -> Result<Vec<Users>, GymTrackError> {
    let users = sqlx::query_as!(Users, "SELECT * FROM users")
        .fetch_all(pool)
        .await?;

    Ok(users)
}

/// Fetches a user by ID from the database
///
/// # Arguments
/// * `pool` - A reference to the database connection pool
/// * `user_id` - The Id of the user to fetch
///
/// # Returns
/// * A Result containing the user or a GymTrackError
pub async fn get_user_by_id_db(
  pool: &PgPool,
  user_id: Id
) -> Result<Users, GymTrackError> {
    let user = sqlx::query_as!(
      Users,
      "SELECT * FROM users WHERE id = $1",
      user_id.into_inner()
    )
        .fetch_one(pool)
        .await?;

    Ok(user)
}

/// Inserts a new user into the database
///
/// # Arguments
/// * `pool` - A reference to the database connection pool
/// * `user` - The user to create
///
/// # Returns
/// * A Result containing the created user or a GymTrackError
pub async fn create_user_db(
  pool: &PgPool,
  user: Users
) -> Result<Users, GymTrackError> {
    let new_user = sqlx::query_as!(
        Users,
        r#"
        INSERT INTO users (
          id,
          username,
          email,
          password_hash
        ) VALUES ( $1, $2, $3, $4 )
        RETURNING *
        "#,
        user.id,
        user.username,
        user.email,
        user.password_hash
    )
    .fetch_one(pool)
    .await?;

    Ok(new_user)
}

/// Deletes a user by ID from the database
///
/// # Arguments
/// * `pool` - A reference to the database connection pool
/// * `user_id` - The Id of the user to delete
///
/// # Returns
/// * A Result containing the deleted user or a GymTrackError
pub async fn delete_user_db(
  pool: &PgPool,
  user_id: Id
) -> Result<Users, GymTrackError> {
    let deleted_user = sqlx::query_as!(
      Users,
      "DELETE FROM users WHERE id = $1 RETURNING *",
      user_id.into_inner()
    )
        .fetch_one(pool)
        .await?;

    Ok(deleted_user)
}
