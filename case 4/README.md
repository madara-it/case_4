# Task Manager Web Application

This is a simple WEB application built with Delphi 10.2 and MS SQL Server. It allows you to manage a list of tasks.

## Features
- View a list of tasks.
- Add new tasks.
- Mark tasks as completed.

## Requirements
- Delphi 10.2 or higher.
- MS SQL Server.
- IIS (Internet Information Services).

## Installation
1. Create a database `TaskDB` in MS SQL Server using the script `DatabaseScripts/TaskDB.sql`.
2. Configure the connection in the Delphi project (update `TFDConnection` parameters).
3. Compile the project and deploy it to IIS.

## Usage
- Open the application in your browser.
- View the list of tasks.
- Add new tasks using the form.

## Screenshots
![Task List](screenshots/task_list.png)
![Add Task](screenshots/add_task.png)

## License
This project is licensed under the MIT License.