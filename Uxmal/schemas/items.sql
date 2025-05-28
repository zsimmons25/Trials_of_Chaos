CREATE DATABASE IF NOT EXISTS items;
USE items;

CREATE TABLE IF NOT EXISTS bases (
    id INT PRIMARY KEY,
    item_class VARCHAR(255) NOT NULL,
    base_name VARCHAR(255) NOT NULL,
    lvl_req INT,
    str_req INT,
    dex_req INT,
    int_req INT,
    armour INT,
    energy_shield INT,
    evasion INT,
    block_chance INT,
    physical_dmg VARCHAR(255),
    crit_chance VARCHAR(255),
    aps VARCHAR(255),
    weapon_range VARCHAR(255),
    implicit VARCHAR(255),
    item_tags VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    base_type VARCHAR(255) NOT NULL,
    ilvl INT NOT NULL DEFAULT 80,
    enchant VARCHAR(255),
    sockets INT,
    implicit INT DEFAULT 0,
    prefix1 VARCHAR(255),
    p1v1 INT,
    p1v2 INT,
    prefix2 VARCHAR(255),
    p2v1 INT,
    p2v2 INT,
    prefix3 VARCHAR(255),
    p3v1 INT,
    p3v2 INT,
    suffix1 VARCHAR(255),
    s1v INT,
    suffix2 VARCHAR(255),
    s2v INT,
    suffix3 VARCHAR(255),
    s3v INT,
    corrupted BOOLEAN DEFAULT TRUE,
    mirrored BOOLEAN DEFAULT FALSE
);

INSERT INTO bases (id, item_class, base_name, lvl_req, str_req, dex_req, int_req, armour, energy_shield, evasion, block_chance, physical_dmg, crit_chance, aps, weapon_range, implicit, item_tags) VALUES
(1, 'Quarterstaff', 'Aegis Quarterstaff',  79, 0, 165, 64, 0, 0, 0, 0, '58-97', '10%', '1.4', '1.3', '+15% increased Block Chance', 'two_hand_weapon'),
(2, 'Body Armour', 'Votive Raiment',  33, 0, 0, 68, 0, 78, 0, 0, '0', '0', '0', '0', '', 'int_armour'),
(3, 'Belt', 'Heavy Belt',  50, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(20-30)% increased Stun Threshold', 'belt');

INSERT INTO items (id, item_name, base_type, ilvl, enchant, sockets, implicit, prefix1, p1v1, p1v2, prefix2, p2v1, p2v2, prefix3, p3v1, p3v2, suffix1, s1v, suffix2, s2v, suffix3, s3v) VALUES
(1, 'Onslaught Beam', 'Aegis Quarterstaff', 80, '', 0, 15, 'RazorSharp', 27, 51, 'Squire', 19, 20, 'Humming', 1, 9, 'Mastery', 12, 'Success', 6, 'Pugilist', 30),
(2, 'Loath Skin', 'Votive Raiment', 80, '', 0, 0, 'Glimmering', 21, 0, 'Resolute', 53, 0, 'Monk', 9, 9, 'Prodigy', 15, 'Drake', 18, 'Apt', 20),
(3, 'Entropy Strap', 'Heavy Belt', 80, '', 0, 25, '', 0, 0, '', 0, 0, '', 0, 0, 'Gorilla', 24, '', 0, '', 0);