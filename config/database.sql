CREATE DATABASE main_database;
USE main_database;

CREATE TABLE users (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    user_image VARCHAR(255) NULL
);

CREATE TABLE posts (
    id_post INT AUTO_INCREMENT PRIMARY KEY,
    post_title VARCHAR(255) NOT NULL,
    post_content TEXT NOT NULL, -- Mudei para TEXT pois posts costumam ser longos
    date_post DATETIME NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id_user)
);

CREATE TABLE comments (
    id_comment INT AUTO_INCREMENT PRIMARY KEY,
    comment_content VARCHAR(255) NOT NULL,
    date_comment DATETIME NOT NULL,
    user_id INT,
    post_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id_user),
    FOREIGN KEY (post_id) REFERENCES posts(id_post)
);

CREATE TABLE likes (
    id_like INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    post_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id_user),
    FOREIGN KEY (post_id) REFERENCES posts(id_post)
);