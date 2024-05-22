// use actix_web::{web, HttpResponse};
// use sqlx::PgPool;
// use chrono::{NaiveDateTime, NaiveDate};

// use crate::models::{Workouts};

// pub async fn get_all_workouts(pool: web::Data<PgPool>) -> HttpResponse {
//     let result = sqlx::query_as!(
//         Workouts,
//         r#"SELECT
//             id,
//             program_id,
//             session_date::timestamp,
//             session_name
//         FROM
//             workouts
//         "#
//     )
//         .fetch_all(pool.get_ref())
//         .await;

//     match result {
//         Ok(workouts) => HttpResponse::Ok().json(workouts),
//         Err(_) => HttpResponse::InternalServerError().finish(),
//     }
// }

// // pub async fn get_workout_exercises(pool: web::Data<PgPool>, workout_id: web::Path<i32>) -> HttpResponse {
// //     let result = sqlx::query_as!(
// //         WorkoutsExercises>,
// //         "SELECT
// //             id,
// //             workout_id,
// //             exercise_id,
// //             sets,
// //             reps,
// //             weight,
// //             rir,
// //             exertion_metric
// //         FROM
// //             workout_exercises
// //         WHERE workout_id = $1",
// //         workout_id
// //     )
// //         .fetch_all(pool.get_ref())
// //         .await;

// //     match result {
// //         Ok(exercises) => HttpResponse::Ok().json(exercises),
// //         Err(_) => HttpResponse::InternalServerError().finish(),
// //     }
// // }
