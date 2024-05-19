pub mod exercises_handler;
pub mod muscles_handler;
pub mod users_handler;

pub use exercises_handler::get_exercises;
pub use muscles_handler::get_muscles;
pub use users_handler::get_all_users;
