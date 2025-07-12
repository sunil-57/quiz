-- Drop tables if they exist (in dependency order)
DROP TABLE IF EXISTS scoreboard;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS user;

-- Create `user` table
CREATE TABLE user (
    userId INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    isGameMaster BOOLEAN NOT NULL DEFAULT FALSE
);

-- Create `question` table
CREATE TABLE question (
    questionId INT AUTO_INCREMENT PRIMARY KEY,
    title TEXT NOT NULL,
    option1 INT NOT NULL,
    option2 INT NOT NULL,
    option3 INT NOT NULL,
    option4 INT NOT NULL,
    correctOption TINYINT NOT NULL CHECK (correctOption BETWEEN 1 AND 4)
);

-- Create `scoreboard` table
CREATE TABLE scoreboard (
    scoreId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    score INT NOT NULL CHECK (score >= 0),
    playedDate DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES user(userId) ON DELETE CASCADE
);
