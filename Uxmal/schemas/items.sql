CREATE DATABASE IF NOT EXISTS items;
USE items;

CREATE TABLE IF NOT EXISTS bases (
    id INT PRIMARY KEY,
    base_name VARCHAR(255) NOT NULL,
    lvl_req INT,
    str_req INT,
    int_req INT,
    dex_req INT,
    armour INT,
    energy_shield INT,
    evasion INT,
    block_chance INT,
    physical_dmg VARCHAR(255),
    crit_chance VARCHAR(255),
    aps VARCHAR(255),
    weapon_range VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS items (
    id INT PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    item_class VARCHAR(255) NOT NULL,
    base_type VARCHAR(255) NOT NULL,
    ilvl INT NOT NULL DEFAULT 80,
    enchant VARCHAR(255),
    sockets INT,
    implicit VARCHAR(255),
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

INSERT INTO bases (id, base_name, lvl_req, str_req, int_req, dex_req, armour, energy_shield, evasion, block_chance, physical_dmg, crit_chance, aps, weapon_range) VALUES
(1, 'Aegis Quarterstaff', 79, 0, 64, 165, 0, 0, 0, 0, '58-97', '10%', '1.4', '1.3'),
(2, 'Votive Raiment', 33, 0, 68, 0, 0, 78, 0, 0, '0', '0', '0', '0');

INSERT INTO items (id, item_name, item_class, base_type, ilvl, enchant, sockets, implicit, prefix1, p1v1, p1v2, prefix2, p2v1, p2v2, prefix3, p3v1, p3v2, suffix1, s1v, suffix2, s2v, suffix3, s3v) VALUES
(1, 'Onslaught Beam', 'Quarterstaff', 'Aegis Quarterstaff', 80, '', 0, '+15% to Block chance', 'RazorSharp', 27, 51, 'Squire', 19, 20, 'Humming', 1, 9, 'Mastery', 12, 'Success', 6, 'Pugilist', 30),
(2, 'Loath Skin', 'Body Armour', 'Votive Raiment', 80, '', 0, '', 'Glimmering', 21, 0, 'Resolute', 53, 0, 'Monk', 9, 9, 'Prodigy', 15, 'Drake', 18, 'Apt', 20);