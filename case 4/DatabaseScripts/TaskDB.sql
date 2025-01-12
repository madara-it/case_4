-- Создание базы данных
CREATE DATABASE TaskDB;
GO

-- Использование базы данных
USE TaskDB;
GO

-- Создание таблицы Tasks
CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY IDENTITY(1,1),
    TaskName NVARCHAR(100) NOT NULL,
    TaskDescription NVARCHAR(MAX),
    DueDate DATETIME,
    IsCompleted BIT DEFAULT 0
);
GO

-- Вставка тестовых данных
INSERT INTO Tasks (TaskName, TaskDescription, DueDate, IsCompleted)
VALUES 
    ('Task 1', 'Description for Task 1', '2023-10-15', 0),
    ('Task 2', 'Description for Task 2', '2023-10-20', 1);
GO