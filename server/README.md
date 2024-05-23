# Server

## Overview

This application is a comprehensive gym tracking system designed to help users monitor and manage their weightlifting workouts. It focuses on progressive overload and tracks detailed metrics for each workout session, supporting both strength and hypertrophy training programs.

- [Key Features](#key-features)
- [Core Functionalities](#core-functionalities)
- [Database Schema](#database-schema)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running the Application](#running-the-application)
- [Running Tests](#running-tests)
- [API Endpoints](#api-endpoints)

## Key Features

- **Customizable Workouts**: Users can tailor their workout programs to their specific goals.
- **Detailed Tracking**: Comprehensive tracking of workout metrics, including advanced exertion metrics.
- **User Progress Monitoring**: Tools for tracking and analyzing user progress over time.
- **Robust Data Management**: Ensures data integrity and reliability through a well-defined database schema and foreign key constraints.

This gym tracking application provides users with the tools they need to effectively plan, track, and analyze their workouts, supporting their fitness journey with detailed insights and robust data management.

## Core Functionalities

### 1. User Management

- **User Registration and Authentication**: Users can register and log in to access their workout data.
- **User Profiles**: Each user has a profile that includes personal information and workout preferences.

### 2. Exercise Database

- **Exercise Catalog**: A comprehensive database of exercises, including details such as exercise name, description, equipment required, and difficulty level.
- **Muscle Groups**: Each exercise is linked to specific muscle groups to provide detailed insights into which muscles are being targeted.

### 3. Workout Programs

- **Program Creation**: Users can create custom workout programs tailored to their goals, choosing between predefined hypertrophy or strength training templates.
- **Program Splits**: Programs can be divided into different workout splits (e.g., push/pull/legs), each with a specific focus and set of exercises.
- **Exercise Sessions**: Each workout within a program includes multiple exercises with defined sets, reps, and weights.

### 4. Workout Tracking

- **Session Logging**: Users can log their workout sessions, including details such as sets, reps, weight lifted, and any additional metrics like Reps in Reserve (RIR) or Rate of Perceived Exertion (RPE).
- **Progress Tracking**: The application tracks user progress over time, providing insights into strength gains and improvements in performance.
- **Exertion Metrics**: Users can record exertion metrics like RIR and RPE to better understand their performance and recovery needs.

### 5. Data Management

- **Database Integration**: The application uses PostgreSQL for robust data management, including tables for exercises, muscles, workout programs, sessions, and user progress.
- **Foreign Key Constraints**: Ensures data integrity by maintaining relationships between tables, such as linking exercises to specific muscle groups and workouts to programs.

### 6. Reporting and Analytics

- **Progress Reports**: Users can generate reports to visualize their progress over time, helping them stay motivated and make informed decisions about their training.
- **Workout Summaries**: Summary views of past workouts, highlighting key performance metrics and areas for improvement.

## Database Schema

The application uses a well-structured database schema, including the following key tables:

- **users**: Stores user information.
- **exercises**: Contains details of various exercises.
- **muscles**: Lists muscle groups targeted by exercises.
- **workouts**: Records individual workout sessions.
- **workouts_exercises**: Links exercises to workouts with specific details such as sets, reps, weight, and exertion metrics.
- **programs**: Stores workout programs created by users.
- **programs_split**: Divides programs into specific workout splits.
- **progress_tracking**: Tracks user progress over time.

### Initializing the Database

To set up the database, follow these steps:

1. Ensure PostgreSQL is installed and running on your machine.
2. Create a new PostgreSQL database.
3. Run the `init_db.sql` script to initialize the database schema and insert seed data.

```bash
psql -U your_username -d your_database -f ./database/init_db.sql
```

### Running the Scripts

To initialize the database, run the following command:

```bash
psql -U rsstdd -d gym_track -f ./database/init_db.sql
```

## Installation

To install and run the GymTrack App locally, follow these steps:

1. **Clone the repository:**

```bash
git clone <https://github.com/yourusername/gym_track_app.git>
cd gym_track_app
```

## Set up the environment

## Install dependencies

```sh
cargo build
```

## configuration

Create a .env file in the root directory with the following content, replacing the placeholders with your actual database

```sh
DATABASE_URL=postgres://username:password@localhost/gym_track
HOST_PORT=localhost:8080
```

## Running the Application

To run the application, use the following command:

```bash
cargo run
```

The application will start and be accessible at <http://localhost:8080>.

## Running Tests

To run the tests, use the following command:

```sh
cargo test
```

## API Endpoints

### User Endpoints

#### Get all users

```sh
URL: /api/users
Method: GET
Response: JSON array of users
```

### Get user by ID

```sh
URL: /api/users/{id}
Method: GET
Response: JSON object of the user
```

### Create a new user

```sh
URL: /api/users
Method: POST
Payload: JSON object of the user to create
Response: JSON object of the created user
```

### Delete a user by ID

```sh
URL: /api/users/{id}
Method: DELETE
Response: JSON object of the deleted user
```

## Exercise Endpoints

### Get all exercises

```sh
URL: /api/exercises
Method: GET
Response: JSON array of exercises
```

### Get exercise by ID

```sh
URL: /api/exercises/{id}
Method: GET
Response: JSON object of the exercise
```

### Create a new exercise

```sh
URL: /api/exercises
Method: POST
Payload: JSON object of the exercise to create
Response: JSON object of the created exercise
```

### Delete an exercise by ID

```sh
URL: /api/exercises/{id}
Method: DELETE
Response: JSON object of the deleted exercise
```

## Models

### User Model

```rust
pub struct Users {
    pub id: Uuid,
    pub username: String,
    pub email: String,
    pub password_hash: String,
}
```

### Exercise Model

```rust
pub struct Exercises {
    pub id: Uuid,
    pub name: String,
    pub description: String,
    pub equipment: String,
    pub difficulty_level: String,
}
```
