use actix_web::HttpResponse;
use sqlx::PgPool;
use crate::models::{
    Programs,
    ProgramsSplits,
    ProgramsExercises,
    types::{DbPool, Id}
};

pub async fn get_all_programs(pool: DbPool) -> HttpResponse {
    let result = sqlx::query_as!(
        Programs,
        r#"
        SELECT
            id,
            programs_name,
            programs_type,
            description,
            duration_weeks,
            created_by_user_id
        FROM
            programs
        "#
    )
        .fetch_all(pool.get_ref())
        .await;

    match result {
        Ok(p) => HttpResponse::Ok().json(p),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}

pub async fn get_program_by_id(pool:DbPool, program_id: Id) -> HttpResponse {
    let id = program_id.into_inner();
    let result = sqlx::query_as!(
        Programs,
        r#"
        SELECT
            id,
            programs_name,
            programs_type,
            description,
            duration_weeks,
            created_by_user_id
        FROM
            programs
        WHERE
            id = $1
        "#,
        id
    )
    .fetch_one(pool.get_ref())
    .await;

    match result {
        Ok(p) => HttpResponse::Ok().json(p),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}

pub async fn insert_program(
    pool: &PgPool,
    program: &Programs
) -> Result<Programs, sqlx::Error> {
    let inserted_program = sqlx::query_as!(
        Programs,
        r#"
        INSERT INTO programs (
            programs_name,
            programs_type,
            description,
            duration_weeks,
            created_by_user_id
        )
        VALUES ($1, $2, $3, $4, $5)
        RETURNING
            id,
            programs_name,
            programs_type,
            description,
            duration_weeks,
            created_by_user_id
        "#,
        program.programs_name,
        program.programs_type,
        program.description,
        program.duration_weeks,
        program.created_by_user_id,
    )
    .fetch_one(pool)
    .await?;

    Ok(inserted_program)
}

pub async fn get_program_splits(
    pool:DbPool,
    program_id: Id
) -> Result<HttpResponse, actix_web::Error> {
    let id: i32 = program_id.into_inner();
    let program = sqlx::query_as!(
        ProgramsSplits,
        r#"SELECT
            id,
            programs_id,
            programs_name,
            day_of_week
        FROM programs_splits
        WHERE programs_id = $1"#,
        id
    )
        .fetch_one(pool.get_ref())
        .await
        .map_err(|e| {
            eprintln!("Database query failed: {}", e);
            actix_web::error::ErrorInternalServerError("Internal Server Error")
    })?;

    Ok(HttpResponse::Ok().json(program))
}

pub async fn update_program(pool: &PgPool, program: &Programs) -> Result<Programs, sqlx::Error> {
    let updated_program = sqlx::query_as!(
        Programs,
        r#"
        UPDATE
            programs
        SET
            programs_name = $1,
            programs_type = $2,
            description = $3,
            duration_weeks = $4,
            created_by_user_id = $5
        WHERE
            id = $6
        RETURNING
            id,
            programs_name,
            programs_type,
            description,
            duration_weeks,
            created_by_user_id
        "#,
        program.programs_name,
        program.programs_type,
        program.description,
        program.duration_weeks,
        program.created_by_user_id,
        program.id
    )
    .fetch_one(pool)
    .await?;

    Ok(updated_program)
}

pub async fn delete_program(pool: &PgPool, program_id: i32) -> Result<(), sqlx::Error> {
    sqlx::query!(
        r#"
        DELETE FROM programs
        WHERE id = $1
        "#,
        program_id
    )
    .execute(pool)
    .await?;

    Ok(())
}

pub async fn get_program_exercises(
    pool: DbPool,
    split_id: Id
) -> HttpResponse {
    let id: i32 = split_id.into_inner();
    let result: Result<_, _> = sqlx::query_as!(
        ProgramsExercises,
        r#"
            SELECT
                id,
                split_id,
                exercise_id,
                sets,
                reps
            FROM
                programs_exercises
            WHERE
                split_id = $1"#,
        id
    )
        .fetch_all(pool.get_ref())
        .await;

    match result {
        Ok(exercises) => HttpResponse::Ok().json(exercises),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}
