use actix_web::{error, http::StatusCode, HttpResponse, Result};
use serde::Serialize;
use sqlx::error::Error as SQLxError;
use std::fmt;

#[derive(Debug, Serialize)]
pub enum GymTrackError {
    DBError(String),
    ActixError(String),
    NotFound(String),
    InvalidInput(String),
}
#[derive(Debug, Serialize)]
pub struct MyErrorResponse {
    error_message: String,
}
impl std::error::Error for GymTrackError {}

impl GymTrackError {
    fn error_response(&self) -> String {
        match self {
            GymTrackError::DBError(msg) => {
                println!("Database error occurred: {:?}", msg);
                "Database error".into()
            }
            GymTrackError::ActixError(msg) => {
                println!("Server error occurred: {:?}", msg);
                "Internal server error".into()
            }
            GymTrackError::InvalidInput(msg) => {
                println!("Invalid parameters received: {:?}", msg);
                msg.into()
            }
            GymTrackError::NotFound(msg) => {
                println!("Not found error occurred: {:?}", msg);
                msg.into()
            }
        }
    }
}

impl error::ResponseError for GymTrackError {
    fn status_code(&self) -> StatusCode {
        match self {
            GymTrackError::DBError(_msg) | GymTrackError::ActixError(_msg) => {
                StatusCode::INTERNAL_SERVER_ERROR
            }
            GymTrackError::InvalidInput(_msg) => StatusCode::BAD_REQUEST,
            GymTrackError::NotFound(_msg) => StatusCode::NOT_FOUND,
        }
    }
    fn error_response(&self) -> HttpResponse {
        HttpResponse::build(self.status_code()).json(MyErrorResponse {
            error_message: self.error_response(),
        })
    }
}

impl fmt::Display for GymTrackError {
    fn fmt(&self, f: &mut fmt::Formatter) -> Result<(), fmt::Error> {
        write!(f, "{}", self)
    }
}

impl From<actix_web::error::Error> for GymTrackError {
    fn from(err: actix_web::error::Error) -> Self {
        GymTrackError::ActixError(err.to_string())
    }
}

impl From<SQLxError> for GymTrackError {
    fn from(err: SQLxError) -> Self {
        GymTrackError::DBError(err.to_string())
    }
}
