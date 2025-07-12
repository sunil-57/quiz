-- Insert sample users
INSERT INTO user (username, password, isGameMaster) VALUES
('alice', 'pass123', FALSE),
('bob', 'bobpass', FALSE),
('carol', 'carolpass', FALSE),
('dave', 'davepass', FALSE),
('eve', 'evepass', FALSE),
('frank', 'frankpass', FALSE),
('grace', 'gracepass', FALSE),
('heidi', 'heidipass', FALSE),
('ivan', 'ivanpass', FALSE),
('judy', 'judypass', FALSE),
('ken', 'kenpass', FALSE),
('lisa', 'lisapass', FALSE),
('mike', 'mikepass', FALSE),
('nina', 'ninapass', FALSE),
('admin', 'adminpass', TRUE);

-- Insert sample questions (integer options)
INSERT INTO question (title, option1, option2, option3, option4, correctOption) VALUES
('What is 2 + 2?', 3, 4, 5, 6, 2),
('What is 5 * 2?', 10, 9, 12, 8, 1),
('Which number is even?', 3, 7, 4, 9, 3),
('What is 9 - 4?', 6, 5, 4, 3, 2),
('Square of 3?', 6, 9, 12, 3, 2),
('What is 15 / 3?', 4, 3, 5, 6, 3),
('What is 7 + 6?', 13, 14, 12, 15, 1),
('Which is prime?', 4, 6, 9, 7, 4),
('What is 8 % 3?', 1, 2, 3, 0, 2),
('What is 2 * 3 + 1?', 5, 6, 7, 8, 3),
('What is 10 - 7?', 1, 2, 3, 4, 3),
('What is 100 / 10?', 5, 10, 20, 15, 2),
('Which is square of 5?', 15, 20, 25, 30, 3),
('What is 3^2?', 6, 9, 3, 12, 2),
('What is the result of 14 % 5?', 1, 2, 3, 4, 3);

-- Insert sample scoreboard entries
INSERT INTO scoreboard (userId, score, playedDate) VALUES
(1, 9, '2025-07-01'),
(2, 6, '2025-07-01'),
(3, 8, '2025-07-02'),
(4, 7, '2025-07-02'),
(5, 10, '2025-07-03'),
(6, 5, '2025-07-03'),
(7, 7, '2025-07-04'),
(8, 6, '2025-07-04'),
(9, 9, '2025-07-05'),
(10, 4, '2025-07-05'),
(11, 10, '2025-07-06'),
(12, 8, '2025-07-06'),
(13, 6, '2025-07-07'),
(14, 7, '2025-07-07'),
(1, 10, '2025-07-08');
