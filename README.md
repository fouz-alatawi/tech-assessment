# Task Managment 

This is a small web application built with **Go** and the **Gin-Gonic framework**.  It includes task management functionality with a **PostgreSQL** database.  The app uses **basic HTML and JavaScript** (Fetch API) for the frontend.


## Features

- **Task Management**:
  - Create, update, delete, and view tasks.
- **Authentication**:
  - Login and registration functionality.
- **Database**:
  - PostgreSQL database with schema initialization and seed data.
- **Docker Support**:
  - Easily run the app using Docker Compose.

---

## Prerequisites

- **Local Development**:
  - Go (1.21 or later)
  - Postgresql  (16 )
- **Docker Deployment**:
  - Docker
  - Docker Compose

---

## Local Development
### How to Run

1. **Clone the repository:**
   ```bash
   git clone <repo_url>
   cd <repo_folder>
2. **Start the app and PostgreSQL:**
    ```bash
    docker compose up --build 
3. **Access the app at:**

    [http://localhost:3000](http://localhost:3000)
---
## Frontend

The app includes simple HTML pages for the frontend:

- **Login Page:** `/login`
- **Registration Page:** `/register`
- **Task Management Page:** `/tasks`
- **Create Task Page:** `/tasks/create`
- **Homepage:** `/` 

These pages are styled with basic CSS for a clean and responsive layout.

## API Endpoints

The app also exposes a set of RESTful APIs for task management:

- **GET** `/api/tasks`  
  Retrieve all tasks for the authenticated user.

- **GET** `/api/tasks/:id`  
  Retrieve a specific task by ID.

- **POST** `/api/tasks`  
  Create a new task.  
  ```json
  {
    "title": "Task title",
    "description": "Task description",
    "priority": "Low | Medium | High",
    "status": "Pending | In Progress | Completed"
  }
- **PUT** `/api/tasks/{id}`  
  Update task.  
  ```json
  {
    "title": "Task title",
    "description": "Task description",
    "priority": "Low | Medium | High",
    "status": "Pending | In Progress | Completed"
  }
- **DELETE** `/api/tasks/{id}`  
  Delete task.  
  ```json
  {
    "title": "Task title",
    "description": "Task description",
    "priority": "Low | Medium | High",
    "status": "Pending | In Progress | Completed"
  }

