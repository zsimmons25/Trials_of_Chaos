CREATE DATABASE IF NOT EXISTS items;
USE items;

CREATE TABLE IF NOT EXISTS bases (
    base_name VARCHAR(255) NOT NULL PRIMARY KEY,
    item_class VARCHAR(255) NOT NULL,
    lvl_req INT,
    str_req INT,
    dex_req INT,
    int_req INT,
    armour INT,
    evasion INT,
    energy_shield INT,
    block_chance INT,
    physical_dmg VARCHAR(255),
    crit_chance VARCHAR(255),
    aps VARCHAR(255),
    weapon_range VARCHAR(255),
    implicit VARCHAR(255),
    item_tags VARCHAR(255) NOT NULL,
    active BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    base_type VARCHAR(255) NOT NULL,
    quality INT DEFAULT 0,
    ilvl INT NOT NULL DEFAULT 80,
    enchant VARCHAR(255),
    sockets INT,
    implicit INT DEFAULT 0,
    prefix1 VARCHAR(255),
    p1v1 INT,
    p1v2 INT,
    p1v3 INT,
    prefix2 VARCHAR(255),
    p2v1 INT,
    p2v2 INT,
    p2v3 INT,
    prefix3 VARCHAR(255),
    p3v1 INT,
    p3v2 INT,
    p3v3 INT,
    suffix1 VARCHAR(255),
    s1v INT,
    suffix2 VARCHAR(255),
    s2v INT,
    suffix3 VARCHAR(255),
    s3v INT,
    corrupted BOOLEAN DEFAULT TRUE,
    mirrored BOOLEAN DEFAULT FALSE,
    rarity VARCHAR(255) DEFAULT 'rare'
);



INSERT INTO bases (base_name, item_class, lvl_req, str_req, dex_req, int_req, armour, evasion, energy_shield, block_chance, physical_dmg, crit_chance, aps, weapon_range, implicit, item_tags, active) VALUES
-- //
-- Novice
-- //

-- Helmet

-- STR
('Rusted Greathelm', 'Helmet', 1, 0, 0, 0, 29, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Soldier Greathelm', 'Helmet', 12, 23, 0, 0, 66, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Wrapped Greathelm', 'Helmet', 16, 30, 0, 0, 79, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Spired Greathelm', 'Helmet', 27, 50, 0, 0, 116, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Elite Greathelm', 'Helmet', 33, 61, 0, 0, 136, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Warrior Greathelm', 'Helmet', 36, 66, 0, 0, 146, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),

-- DEX
('Shabby Hood', 'Helmet', 1, 0, 0, 0, 0, 19, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Felt Cap', 'Helmet', 10, 0, 20, 0, 0, 48, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Lace Hood', 'Helmet', 16, 0, 30, 0, 0, 67, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Swathed Cap', 'Helmet', 26, 0, 49, 0, 0, 98, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Hunter Hood', 'Helmet', 33, 0, 61, 0, 0, 121, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Viper Cap', 'Helmet', 38, 0, 70, 0, 0, 136, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),

-- INT
('Twig Circlet', 'Helmet', 1, 0, 0, 0, 0, 0, 19, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Wicker Tiara', 'Helmet', 10, 0, 0, 20, 0, 0, 28, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Beaded Circlet', 'Helmet', 16, 0, 0, 30, 0, 0, 34, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Chain Tiara', 'Helmet', 26, 0, 0, 49, 0, 0, 44, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Feathered Tiara', 'Helmet', 33, 0, 0, 61, 0, 0, 51, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Gold Circlet', 'Helmet', 40, 0, 0, 74, 0, 0, 58, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),


-- STR/DEX
('Brimmed Helm', 'Helmet', 5, 0, 0, 0, 23, 18, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Guarded Helm', 'Helmet', 11, 13, 13, 0, 34, 28, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Visored Helm', 'Helmet', 16, 18, 18, 0, 44, 37, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Cowled Helm', 'Helmet', 26, 27, 27, 0, 62, 54, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Shieled Helm', 'Helmet', 33, 34, 34, 0, 75, 66, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),

-- STR/INT
('Iron Crown', 'Helmet', 5, 0, 0, 0, 23, 0, 12, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Horned Crown', 'Helmet', 10, 12, 12, 0, 33, 0, 15, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Cultist Crown', 'Helmet', 16, 18, 18, 0, 44, 0, 19, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Martyr Crown', 'Helmet', 28, 30, 30, 0, 66, 0, 25, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Heavy Crown', 'Helmet', 33, 34, 34, 0, 75, 0, 28, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),

-- DEX/INT
('Hewn Mask', 'Helmet', 5, 0, 0, 0, 0, 18, 12, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),
('Face Mask', 'Helmet', 10, 0, 12, 12, 0, 26, 15, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),
('Hooded Mask', 'Helmet', 16, 0, 18, 18, 0, 37, 19, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),
('Veiled Mask', 'Helmet', 28, 0, 30, 30, 0, 58, 25, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),
('Tribal Mask', 'Helmet', 33, 0, 34, 34, 0, 66, 28, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),

-- Body Armour

-- STR
('Rusted Cuirass', 'Body Armour', 1, 0, 0, 0, 45, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Fur Plate', 'Body Armour', 4, 10, 0, 0, 60, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Iron Cuirass', 'Body Armour', 11, 24, 0, 0, 96, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Raider Plate', 'Body Armour', 16, 34, 0, 0, 121, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Maraketh Cuirass', 'Body Armour', 20, 42, 0, 0, 141, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Steel Plate', 'Body Armour', 27, 57, 0, 0, 177, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Full Plate', 'Body Armour', 33, 68, 0, 0, 208, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Vaal Cuirass', 'Body Armour', 37, 77, 0, 0, 228, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),

-- DEX
('Leather Vest', 'Body Armour', 1, 0, 0, 0, 0, 30, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Quilted Vest', 'Body Armour', 4, 0, 10, 0, 0, 44, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Pathfinder Coat', 'Body Armour', 11, 0, 24, 0, 78, 0, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Shrouded Vest', 'Body Armour', 16, 0, 34, 0, 0, 102, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Rhoahide Coat', 'Body Armour', 22, 0, 47, 0, 0, 131, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Studded Vest', 'Body Armour', 26, 0, 55, 0, 0, 150, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Scouts Vest', 'Body Armour', 33, 0, 68, 0, 0, 184, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Serpentscale Coat', 'Body Armour', 36, 0, 75, 0, 0, 198, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),

-- INT
('Tattered Robe', 'Body Armour', 1, 0, 0, 0, 0, 0, 28, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Feathered Robe', 'Body Armour', 5, 0, 0, 13, 0, 0, 35, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Hexers Robe', 'Body Armour', 11, 0, 0, 24, 0, 0, 44, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Bone Raiment', 'Body Armour', 16, 0, 0, 34, 0, 0, 52, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Silk Robe', 'Body Armour', 22, 0, 0, 47, 0, 0, 61, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Keth Raiment', 'Body Armour', 28, 0, 0, 59, 0, 0, 70, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Votive Raiment', 'Body Armour', 33, 0, 0, 68, 0, 0, 78, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Altar Robe', 'Body Armour', 40, 0, 0, 83, 0, 0, 89, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),

-- STR/DEX
('Chain Mail', 'Body Armour', 1, 0, 0, 0, 25, 16, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Rogue Armour', 'Body Armour', 11, 14, 14, 0, 53, 43, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Vagabond Armour', 'Body Armour', 16, 20, 20, 0, 67, 56, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Cloaked Mail', 'Body Armour', 26, 31, 31, 0, 95, 83, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Explorer Armour', 'Body Armour', 33, 39, 39, 0, 114, 101, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Scale Mail', 'Body Armour', 37, 43, 43, 0, 125, 112, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),

-- STR/INT
('Pilgrim Vestments', 'Body Armour', 1, 0, 0, 0, 25, 0, 16, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Pelt Mantle', 'Body Armour', 10, 14, 0, 14, 50, 0, 23, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Mail Vestments', 'Body Armour', 16, 20, 0, 20, 67, 0, 28, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Shaman Mantle', 'Body Armour', 28, 33, 0, 33, 100, 0, 39, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Ironclad Vestments', 'Body Armour', 33, 39, 0, 39, 114, 0, 43, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Sacrificial Mantle', 'Body Armour', 36, 41, 0, 41, 123, 0, 46, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),

-- DEX/INT
('Hermit Garb', 'Body Armour', 1, 0, 0, 0, 0, 16, 16, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),
('Waxed Jacket', 'Body Armour', 11, 0, 14, 14, 0, 43, 24, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),
('Marabout Garb', 'Body Armour', 16, 0, 20, 20, 0, 56, 28, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),
('Wayfarer Jacket', 'Body Armour', 28, 0, 33, 33, 0, 88, 39, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),
('Anchorite Garb', 'Body Armour', 33, 0, 39, 39, 0, 101, 43, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),
('Scalpers Jacket', 'Body Armour', 39, 0, 45, 45, 0, 117, 48, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),

-- Gloves
-- \\

-- STR
('Stocky Mitts', 'Gloves', 1, 0, 0, 0, 15, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Riveted Mitts', 'Gloves', 11, 19, 0, 0, 31, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Tempered Mitts', 'Gloves', 16, 27, 0, 0, 40, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Bolstered Mitts', 'Gloves', 27, 44, 0, 0, 58, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Moulded Mitts', 'Gloves', 33, 53, 0, 0, 68, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),

-- DEX
('Suede Bracers', 'Gloves', 1, 0, 0, 0, 0, 10, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Firm Bracers', 'Gloves', 11, 0, 19, 0, 0, 26, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Bound Bracers', 'Gloves', 16, 0, 27, 0, 0, 33, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Sectioned Bracers', 'Gloves', 28, 0, 46, 0, 0, 52, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Spined Bracers', 'Gloves', 33, 0, 53, 0, 0, 60, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),

-- INT
('Torn Gloves', 'Gloves', 1, 0, 0, 0, 0, 0, 9, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Sombre Gloves', 'Gloves', 12, 0, 0, 20, 0, 0, 15, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Stitched Gloves', 'Gloves', 16, 0, 0, 27, 0, 0, 17, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Jewelled Gloves', 'Gloves', 26, 0, 0, 43, 0, 0, 22, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Intricate Gloves', 'Gloves', 33, 0, 0, 53, 0, 0, 26, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),

-- STR/DEX
('Ringmail Guantlets', 'Gloves', 6, 7, 7, 0, 13, 10, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Layered Guantlets', 'Gloves', 16, 15, 15, 0, 22, 18, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Doubled Guantlets', 'Gloves', 33, 30, 30, 0, 37, 33, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),

-- STR/INT
('Rope Cuffs', 'Gloves', 5, 6, 0, 6, 12, 0, 6, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Aged Cuffs', 'Gloves', 16, 15, 0, 15, 22, 0, 9, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Goldcast Cuffs', 'Gloves', 33, 30, 0, 30, 37, 0, 14, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),

-- DEX/INT
('Gauze Wraps', 'Gloves', 4, 0, 6, 6, 0, 8, 6, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),
('Linen Wraps', 'Gloves', 16, 0, 15, 15, 0, 18, 9, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),
('Spiral Wraps', 'Gloves', 33, 0, 30, 30, 0, 33, 14, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),

-- Boots
-- \\

-- STR
('Rough Greaves', 'Boots', 1, 0, 0, 0, 22, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Iron Greaves', 'Boots', 11, 20, 0, 0, 47, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Bronze Greaves', 'Boots', 16, 29, 0, 0, 60, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Trimmed Greaves', 'Boots', 27, 47, 0, 0, 87, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Stone Greaves', 'Boots', 33, 57, 0, 0, 102, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),

-- DEX
('Rawhide Boots', 'Boots', 1, 0, 0, 0, 0, 15, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Laced Boots', 'Boots', 11, 0, 20, 0, 0, 38, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Embossed Boots', 'Boots', 16, 0, 29, 0, 0, 50, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Steeltoe Boots', 'Boots', 27, 0, 49, 0, 0, 79, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Lizardscale Boots', 'Boots', 33, 0, 57, 0, 0, 90, 0, 0, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),

-- INT
('Straw Sandals', 'Boots', 1, 0, 0, 0, 0, 0, 14, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Wrapped Sandals', 'Boots', 11, 0, 0, 20, 0, 0, 22, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Lattice Sandals', 'Boots', 16, 0, 0, 29, 0, 0, 25, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Silk Slippers', 'Boots', 27, 0, 0, 47, 0, 0, 34, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Feathered Sandals', 'Boots', 33, 0, 0, 57, 0, 0, 38, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),

-- STR/DEX
('Mail Sabatons', 'Boots', 6, 8, 8, 0, 19, 15, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Braced Sabatons', 'Boots', 16, 17, 17, 0, 33, 28, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Stacked Sabatons', 'Boots', 33, 32, 32, 0, 56, 50, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),

-- STR/INT
('Padded Leggings', 'Boots', 5, 7, 0, 7, 18, 0, 9, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Secured Leggings', 'Boots', 16, 17, 0, 17, 33, 0, 14, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Pelt Leggings', 'Boots', 33, 32, 0, 32, 56, 0, 21, 0, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),

-- DEX/INT
('Frayed Shoes', 'Boots', 5, 0, 7, 7, 0, 13, 9, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),
('Threaded Shoes', 'Boots', 16, 0, 17, 17, 0, 28, 14, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),
('Hunting Shoes', 'Boots', 33, 0, 32, 32, 0, 50, 21, 0, '0', '0', '0', '0', '', 'dex_int_armour, novice', TRUE),

-- Shields
-- \\

-- DEX
('Leather Buckler', 'Shield', 1, 0, 0, 0, 0, 10, 0, 20, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Wooden Buckler', 'Shield', 5, 0, 11, 0, 0, 16, 0, 20, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Plated Buckler', 'Shield', 11, 0, 22, 0, 0, 26, 0, 20, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Iron Buckler', 'Shield', 16, 0, 30, 0, 0, 33, 0, 20, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Ridged Buckler', 'Shield', 22, 0, 42, 0, 0, 43, 0, 20, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Spiked Buckler', 'Shield', 26, 0, 49, 0, 0, 49, 0, 20, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Ringed Buckler', 'Shield', 33, 0, 61, 0, 0, 60, 0, 20, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),
('Edged Buckler', 'Shield', 39, 0, 72, 0, 0, 70, 0, 20, '0', '0', '0', '0', '', 'dex_armour, novice', TRUE),

-- STR
('Splintered Tower Shield', 'Shield', 1, 0, 0, 0, 18, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Painted Tower Shield', 'Shield', 6, 13, 0, 0, 29, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Braced Tower Shield', 'Shield', 12, 23, 0, 0, 41, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Barricade Tower Shield', 'Shield', 16, 30, 0, 0, 50, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Effigial Tower Shield', 'Shield', 21, 40, 0, 0, 60, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Rampart Tower Shield', 'Shield', 28, 52, 0, 0, 75, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Heraldric Tower Shield', 'Shield', 33, 61, 0, 0, 85, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),
('Stone Tower Shield', 'Shield', 36, 66, 0, 0, 91, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, novice', TRUE),

-- STR/DEX
('Hardwood Targe', 'Shield', 1, 0, 0, 0, 10, 7, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Pelage Targe', 'Shield', 8, 10, 10, 0, 18, 14, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Studded Targe', 'Shield', 16, 18, 18, 0, 27, 23, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Crescent Targe', 'Shield', 26, 27, 27, 0, 39, 34, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Chiseled Targe', 'Shield', 33, 34, 34, 0, 47, 41, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),
('Feathered Targe', 'Shield', 37, 38, 38, 0, 51, 46, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, novice', TRUE),

-- STR/INT
('Blazon Crest Shield', 'Shield', 1, 0, 0, 0, 10, 0, 6, 25, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Sigil Crest Shield', 'Shield', 7, 10, 0, 10, 17, 0, 8, 25, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Emblem Crest Shield', 'Shield', 16, 18, 0, 18, 27, 0, 12, 25, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Jingling Crest Shield', 'Shield', 28, 30, 0, 30, 41, 0, 16, 25, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Sectarian Crest Shield', 'Shield', 33, 34, 0, 34, 47, 0, 18, 25, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),
('Omen Crest Shield', 'Shield', 36, 37, 0, 37, 50, 0, 19, 25, '0', '0', '0', '0', '', 'str_int_armour, novice', TRUE),

-- Focus
-- \\
('Twig Focus', 'Focus', 1, 0, 0, 0, 0, 0, 12, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Woven Focus', 'Focus', 6, 0, 0, 13, 0, 0, 15, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Antler Focus', 'Focus', 10, 0, 0, 20, 0, 0, 17, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Engraved Focus', 'Focus', 16, 0, 0, 30, 0, 0, 21, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Tonal Focus', 'Focus', 22, 0, 0, 42, 0, 0, 25, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Crystal Focus', 'Focus', 26, 0, 0, 49, 0, 0, 28, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Voodoo Focus', 'Focus', 33, 0, 0, 61, 0, 0, 32, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),
('Plumed Focus', 'Focus', 36, 0, 0, 66, 0, 0, 34, 0, '0', '0', '0', '0', '', 'int_armour, novice', TRUE),

-- One Hand Axe
-- \\
('Dull Hatchet', 'One Hand Axe', 1, 0, 0, 0, 0, 0, 0, 0, '4-10', '5%', '1.5', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Hook Axe', 'One Hand Axe', 4, 10, 0, 0, 0, 0, 0, 0, '5-14', '5%', '1.45', '1.1', 'Gain 1 Rage on Hit', 'one_hand_weapon, novice', TRUE),
('Bearded Axe', 'One Hand Axe', 10, 20, 10, 0, 0, 0, 0, 0, '8-21', '5%', '1.45', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Extended Cleaver', 'One Hand Axe', 16, 30, 14, 0, 0, 0, 0, 0, '8-25', '5%', '1.5', '1.1', 'Has no Accuracy Penalty from Range', 'one_hand_weapon, novice', TRUE),
('Bandit Hatchet', 'One Hand Axe', 20, 37, 16, 0, 0, 0, 0, 0, '13-31', '5%', '1.5', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Crescent Axe', 'One Hand Axe', 26, 48, 20, 0, 0, 0, 0, 0, '18-37', '6.5%', '1.4', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Carving Hatchet', 'One Hand Axe', 33, 60, 25, 0, 0, 0, 0, 0, '19-44', '5%', '1.5', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Sacrificial Axe', 'One Hand Axe', 37, 67, 27, 0, 0, 0, 0, 0, '20-42', '5%', '1.5', '1.1', 'Gain (28-35) Mana per Enemy Killed', 'one_hand_weapon, novice', TRUE),

-- Two Hand Axe
-- \\
('Splitting Greataxe', 'Two Hand Axe', 1, 0, 0, 0, 0, 0, 0, 0, '8-20', '5%', '1.2', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Light Halberd', 'Two Hand Axe', 4, 10, 0, 0, 0, 0, 0, 0, '10-25', '5%', '1.25', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Executioner Greataxe', 'Two Hand Axe', 10, 20, 10, 0, 0, 0, 0, 0, '10-41', '5%', '1.2', '1.3', 'Culling Strike', 'two_hand_weapon, novice', TRUE),
('Arched Greataxe', 'Two Hand Axe', 16, 30, 14, 0, 0, 0, 0, 0, '17-59', '5%', '1.15', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Elegant Glaive', 'Two Hand Axe', 20, 37, 16, 0, 0, 0, 0, 0, '19-64', '5%', '1.2', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Savage Greataxe', 'Two Hand Axe', 27, 50, 21, 0, 0, 0, 0, 0, '23-70', '5%', '1.2', '1.3', 'Gain (34-43) Life per Enemy Killed', 'two_hand_weapon, novice', TRUE),
('Rending Halberd', 'Two Hand Axe', 33, 60, 25, 0, 0, 0, 0, 0, '27-91', '6.5%', '1.2', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Jagged Greataxe', 'Two Hand Axe', 40, 72, 29, 0, 0, 0, 0, 0, '43-99', '5%', '1.15', '1.3', '(15-25)% chance to cause Bleeding on Hit', 'two_hand_weapon, novice', TRUE),

-- One Hand Mace
-- \\
('Wooden Club', 'One Hand Mace', 1, 0, 0, 0, 0, 0, 0, 0, '6-10', '5%', '1.45', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Smithing Hammer', 'One Hand Mace', 4, 11, 0, 0, 0, 0, 0, 0, '9-15', '5%', '1.45', '1.1', 'Base Fire Damage [50%]', 'one_hand_weapon, novice', TRUE),
('Slim Mace', 'One Hand Mace', 10, 25, 0, 0, 0, 0, 0, 0, '11-17', '5%', '1.55', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Spiked Club', 'One Hand Mace', 16, 38, 0, 0, 0, 0, 0, 0, '15-24', '5%', '1.45', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Warpick', 'One Hand Mace', 22, 52, 0, 0, 0, 0, 0, 0, '18-24', '7%', '1.45', '1.1', '+(10-15)% to Critical Damage Bonus', 'one_hand_weapon, novice', TRUE),
('Plated Mace', 'One Hand Mace', 26, 61, 0, 0, 0, 0, 0, 0, '18-38', '5%', '1.4', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Brigand Mace', 'One Hand Mace', 33, 76, 0, 0, 0, 0, 0, 0, '28-38', '5%', '1.45', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Construct Hammer', 'One Hand Mace', 36, 83, 0, 0, 0, 0, 0, 0, '31-38', '5%', '1.4', '1.1', 'Causes Daze buildup equal to 100% of Damage dealt', 'one_hand_weapon, novice', TRUE),

-- Two Hand Mace
-- \\
('Felled Greatclub', 'Two Hand Mace', 1, 0, 0, 0, 0, 0, 0, 0, '13-18', '5%', '1.1', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Oak Greathammer', 'Two Hand Mace', 4, 11, 0, 0, 0, 0, 0, 0, '14-26', '5%', '1.05', '1.3', 'Causes (30-50)% increased Stun Buildup', 'two_hand_weapon, novice', TRUE),
('Forge Maul', 'Two Hand Mace', 11, 27, 0, 0, 0, 0, 0, 0, '29-39', '5%', '1.05', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Studded Greatclub', 'Two Hand Mace', 11, 27, 0, 0, 0, 0, 0, 0, '32-48', '5%', '1.1', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Cultist Greathammer', 'Two Hand Mace', 11, 27, 0, 0, 0, 0, 0, 0, '32-43', '5%', '1.05', '1.3', 'Strikes deal Splash damage to targets within 1.5 metres', 'two_hand_weapon, novice', TRUE),
('Temple Maul', 'Two Hand Mace', 11, 27, 0, 0, 0, 0, 0, 0, '35-72', '5%', '1.2', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Leaden Greathammer', 'Two Hand Mace', 11, 27, 0, 0, 0, 0, 0, 0, '58-78', '5%', '1.1', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Crumbling Maul', 'Two Hand Mace', 11, 27, 0, 0, 0, 0, 0, 0, '62-75', '5%', '1.1', '1.3', 'Causes Enemies to Explode on Critical kill, for 10% of their Life as Physical Damage', 'two_hand_weapon, novice', TRUE),

-- One Hand Sword
-- \\
('Shortsword', 'One Hand Sword', 1, 0, 0, 0, 0, 0, 0, 0, '6-9', '5%', '1.55', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Broadsword', 'One Hand Sword', 6, 10, 10, 0, 0, 0, 0, 0, '8-13', '5%', '1.6', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Vampiric Blade', 'One Hand Sword', 11, 16, 16, 0, 0, 0, 0, 0, '11-20', '5%', '1.5', '1.1', 'Leech []% of Physical Attack Damage as Life', 'one_hand_weapon, novice', TRUE),
('Scimitar', 'One Hand Sword', 16, 22, 22, 0, 0, 0, 0, 0, '14-23', '5%', '1.55', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Charred Shortsword', 'One Hand Sword', 21, 28, 28, 0, 0, 0, 0, 0, '19-34', '5%', '1.6', '1.1', 'Base Fire Damage [50%]', 'one_hand_weapon, novice', TRUE),
('Sickle Sword', 'One Hand Sword', 28, 37, 37, 0, 0, 0, 0, 0, '18-38', '5%', '1.5', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Falchion', 'One Hand Sword', 33, 43, 43, 0, 0, 0, 0, 0, '27-37', '5%', '1.5', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Treasured Blade', 'One Hand Sword', 40, 51, 51, 0, 0, 0, 0, 0, '27-45', '5%', '1.55', '1.1', '', 'one_hand_weapon, novice', TRUE),

-- Two Hand Sword
-- \\
('Corroded Longsword', 'Two Hand Sword', 1, 0, 0, 0, 0, 0, 0, 0, '6-9', '5%', '1.3', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Iron Greatsword', 'Two Hand Sword', 6, 10, 10, 0, 0, 0, 0, 0, '9-16', '5%', '1.35', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Blessed Claymore', 'Two Hand Sword', 11, 16, 16, 0, 0, 0, 0, 0, '13-23', '5%', '1.3', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Broad Greatsword', 'Two Hand Sword', 16, 22, 22, 0, 0, 0, 0, 0, '19-32', '5%', '1.25', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Rippled Greatsword', 'Two Hand Sword', 22, 30, 30, 0, 0, 0, 0, 0, '25-42', '5%', '1.3', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Arced Longsword', 'Two Hand Sword', 28, 37, 37, 0, 0, 0, 0, 0, '28-52', '5%', '1.35', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Stone Greatsword', 'Two Hand Sword', 33, 43, 43, 0, 0, 0, 0, 0, '31-58', '5%', '1.3', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Obsidian Greatsword', 'Two Hand Sword', 36, 46, 46, 0, 0, 0, 0, 0, '40-67', '5%', '1.25', '1.3', '', 'two_hand_weapon, novice', TRUE),

-- Claw
-- \\
('Crude Claw', 'Claw', 1, 0, 0, 0, 0, 0, 0, 0, '4-10', '5%', '1.65', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Pict Claw', 'Claw', 6, 0, 16, 0, 0, 0, 0, 0, '4-16', '5%', '1.7', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Wolfbone Claw', 'Claw', 12, 0, 29, 0, 0, 0, 0, 0, '7-23', '5%', '1.6', '1.1', 'Grants 8 Life per Enemy Hit', 'one_hand_weapon, novice', TRUE),
('Forked Claw', 'Claw', 16, 0, 38, 0, 0, 0, 0, 0, '10-26', '5%', '1.55', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Plated Claw', 'Claw', 22, 0, 52, 0, 0, 0, 0, 0, '13-31', '5%', '1.6', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Edged Claw', 'Claw', 28, 0, 65, 0, 0, 0, 0, 0, '11-38', '5%', '1.7', '1.1', '(15-25)% chance to Blind Enemies on hit', 'one_hand_weapon, novice', TRUE),
('Arced Claw', 'Claw', 33, 0, 76, 0, 0, 0, 0, 0, '12-46', '5%', '1.65', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Hooked Claw', 'Claw', 36, 0, 83, 0, 0, 0, 0, 0, '16-49', '5%', '1.55', '1.1', '', 'one_hand_weapon, novice', TRUE),


-- Dagger
-- \\
('Glass Shank', 'Dagger', 1, 0, 0, 0, 0, 0, 0, 0, '4-10', '15%', '1.55', '1', '', 'one_hand_weapon, novice', TRUE),
('Crone Knife', 'Dagger', 6, 0, 10, 10, 0, 0, 0, 0, '4-15', '15%', '1.55', '1', 'Leeches 4% of Physical Damage as Mana', 'one_hand_weapon, novice', TRUE),
('Simple Dagger', 'Dagger', 12, 0, 18, 18, 0, 0, 0, 0, '8-19', '15%', '1.55', '1', '', 'one_hand_weapon, novice', TRUE),
('Skinning Knife', 'Dagger', 16, 0, 22, 22, 0, 0, 0, 0, '8-22', '13.5%', '1.65', '1', '', 'one_hand_weapon, novice', TRUE),
('Moon Dagger', 'Dagger', 20, 0, 27, 27, 0, 0, 0, 0, '11-26', '15%', '1.55', '1', 'Base Cold Damage [100%]', 'one_hand_weapon, novice', TRUE),
('Engraved Knife', 'Dagger', 27, 0, 36, 36, 0, 0, 0, 0, '11-34', '13.5%', '1.55', '1', '', 'one_hand_weapon, novice', TRUE),
('Obsidian Dagger', 'Dagger', 33, 0, 43, 43, 0, 0, 0, 0, '13-39', '15%', '1.55', '1', '', 'one_hand_weapon, novice', TRUE),
('Bloodletting Dagger', 'Dagger', 39, 0, 50, 50, 0, 0, 0, 0, '18-42', '15%', '1.5', '1', '25% of Spell Mana Cost Converted to Life Cost', 'one_hand_weapon, novice', TRUE),

-- Flail
-- \\
('Splintered Flail', 'Flail', 1, 0, 0, 0, 0, 0, 0, 0, '6-9', '10%', '1.5', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Chain Flail', 'Flail', 4, 13, 0, 0, 0, 0, 0, 0, '8-14', '10%', '1.45', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Holy Flail', 'Flail', 10, 22, 0, 11, 0, 0, 0, 0, '10-17', '10%', '1.45', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Iron Flail', 'Flail', 16, 30, 0, 14, 0, 0, 0, 0, '14-23', '10%', '1.45', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Twin Flail', 'Flail', 20, 37, 0, 16, 0, 0, 0, 0, '8-18', '10%', '1.4', '1.1', 'Forks Critical Hits', 'one_hand_weapon, novice', TRUE),
('Slender Flail', 'Flail', 26, 48, 0, 20, 0, 0, 0, 0, '19-32', '8%', '1.5', '1.1', '', 'one_hand_weapon, novice', TRUE),
('Stone Flail', 'Flail', 33, 60, 0, 25, 0, 0, 0, 0, '23-38', '10%', '1.45', '1.1', 'Unblockable', 'one_hand_weapon, novice', TRUE),
('Ring Flail', 'Flail', 37, 69, 0, 28, 0, 0, 0, 0, '23-44', '10%', '1.45', '1.1', '', 'one_hand_weapon, novice', TRUE),

-- Spear
-- \\
('Hardwood Spear', 'Spear', 1, 0, 0, 0, 0, 0, 0, 0, '5-9', '5%', '1.6', '1.5', '', 'one_hand_weapon, novice', TRUE),
('Ironhead Spear', 'Spear', 5, 0, 11, 0, 0, 0, 0, 0, '7-13', '5%', '1.6', '1.5', '', 'one_hand_weapon, novice', TRUE),
('Hunting Spear', 'Spear', 10, 10, 20, 0, 0, 0, 0, 0, '10-18', '5%', '1.55', '1.5', '(15-25)% chance to Maim on Hit', 'one_hand_weapon, novice', TRUE),
('Winged Spear', 'Spear', 16, 14, 30, 0, 0, 0, 0, 0, '12-22', '5%', '1.65', '1.5', '', 'one_hand_weapon, novice', TRUE),
('War Spear', 'Spear', 21, 17, 39, 0, 0, 0, 0, 0, '14-26', '5%', '1.6', '1.5', '(25-35)% increased Projectile Speed with this Weapon', 'one_hand_weapon, novice', TRUE),
('Forked Spear', 'Spear', 26, 20, 48, 0, 0, 0, 0, 0, '17-32', '5%', '1.6', '1.5', '', 'one_hand_weapon, novice', TRUE),
('Barbed Spear', 'Spear', 33, 25, 60, 0, 0, 0, 0, 0, '20-38', '6.5%', '1.6', '1.5', '', 'one_hand_weapon, novice', TRUE),
('Broad Spear', 'Spear', 40, 29, 72, 0, 0, 0, 0, 0, '26-48', '5%', '1.5', '1.5', '', 'one_hand_weapon, novice', TRUE),

-- Bow
-- \\
('Crude Bow', 'Bow', 1, 0, 0, 0, 0, 0, 0, 0, '6-9', '5%', '1.2', '', '', 'one_hand_weapon, bow, novice', TRUE),
('Short Bow', 'Bow', 5, 0, 14, 0, 0, 0, 0, 0, '7-14', '5%', '1.25', '', '', 'one_hand_weapon, bow, novice', TRUE),
('Warden Bow', 'Bow', 11, 0, 27, 0, 0, 0, 0, 0, '12-18', '5%', '1.15', '', '(20-30)% chance to Chain an additional time', 'one_hand_weapon, bow, novice', TRUE),
('Recurve Bow', 'Bow', 16, 0, 38, 0, 0, 0, 0, 0, '15-31', '5%', '1.1', '', '', 'one_hand_weapon, bow, novice', TRUE),
('Composite Bow', 'Bow', 22, 0, 52, 0, 0, 0, 0, 0, '19-31', '5%', '1.2', '', '', 'one_hand_weapon, bow, novice', TRUE),
('Dualstring Bow', 'Bow', 28, 0, 65, 0, 0, 0, 0, 0, '16-31', '5%', '1.1', '', 'Bow Attacks fire an additional Arrow', 'one_hand_weapon, bow, novice', TRUE),
('Cultist Bow', 'Bow', 33, 0, 76, 0, 0, 0, 0, 0, '36-59', '5%', '1.2', '', 'Base Chaos Damage [100%]', 'one_hand_weapon, bow, novice', TRUE),
('Zealot Bow', 'Bow', 39, 0, 90, 0, 0, 0, 0, 0, '31-47', '5%', '1.2', '', '', 'one_hand_weapon, bow, novice', TRUE),

-- Crossbow
-- \\
('Makeshift Crossbow', 'Crossbow', 1, 0, 0, 0, 0, 0, 0, 0, '7-12', '5%', '1.6', '.80', '', 'two_hand_weapon, novice', TRUE),
('Tense Crossbow', 'Crossbow', 4, 8, 8, 0, 0, 0, 0, 0, '8-15', '5%', '1.6', '.85', '(20-30)% increased Bolt Speed', 'two_hand_weapon, novice', TRUE),
('Sturdy Crossbow', 'Crossbow', 10, 15, 15, 0, 0, 0, 0, 0, '11-26', '5%', '1.55', '.75', '', 'two_hand_weapon, novice', TRUE),
('Varnished Crossbow', 'Crossbow', 16, 22, 22, 0, 0, 0, 0, 0, '12-36', '5%', '1.6', '.80', '', 'two_hand_weapon, novice', TRUE),
('Dyad Crossbow', 'Crossbow', 20, 27, 27, 0, 0, 0, 0, 0, '9-37', '5%', '1.6', '1.1', '', 'two_hand_weapon, novice', TRUE),
('Alloy Crossbow', 'Crossbow', 26, 34, 34, 0, 0, 0, 0, 0, '12-50', '5%', '1.7', '.70', '', 'two_hand_weapon, novice', TRUE),
('Bombard Crossbow', 'Crossbow', 33, 43, 43, 0, 0, 0, 0, 0, '14-56', '5%', '1.65', '.75', 'Grenade Skills Fire an additional Projectile', 'two_hand_weapon, novice', TRUE),
('Construct Crossbow', 'Crossbow', 38, 49, 49, 0, 0, 0, 0, 0, '18-72', '5%', '1.6', '.80', '', 'two_hand_weapon, novice', TRUE),

-- Quarterstaff
-- \\
('Wrapped Quarterstaff', 'Quarterstaff', 1, 0, 0, 0, 0, 0, 0, 0, '7-12', '10%', '1.4', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Long Quarterstaff', 'Quarterstaff', 4, 0, 10, 0, 0, 0, 0, 0, '9-18', '10%', '1.4', '1.3', '16% increased Melee Strike Range with this weapon', 'two_hand_weapon, novice', TRUE),
('Gothic Quarterstaff', 'Quarterstaff', 11, 0, 22, 11, 0, 0, 0, 0, '16-26', '11.5%', '1.4', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Crackling Quarterstaff', 'Quarterstaff', 16, 0, 30, 14, 0, 0, 0, 0, '13-54', '10%', '1.4', '1.3', 'Base Lightning Damage [100%]', 'two_hand_weapon, novice', TRUE),
('Crescent Quarterstaff', 'Quarterstaff', 20, 0, 37, 16, 0, 0, 0, 0, '19-39', '10%', '1.5', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Steelpoint Quarterstaff', 'Quarterstaff', 28, 0, 51, 22, 0, 0, 0, 0, '28-51', '10%', '1.4', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Slicing Quarterstaff', 'Quarterstaff', 33, 0, 60, 25, 0, 0, 0, 0, '29-60', '10%', '1.4', '1.3', '', 'two_hand_weapon, novice', TRUE),
('Barrier Quarterstaff', 'Quarterstaff', 37, 0, 67, 27, 0, 0, 0, 0, '33-55', '10%', '1.4', '1.3', '+(10-15)% to Block chance', 'two_hand_weapon, novice', TRUE),


-- //
-- Advanced
-- //

-- Helmet
-- \\

-- STR
('Corroded Greathelm', 'Helmet', 45, 83, 0, 0, 176, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Mercenary Greathelm', 'Helmet', 48, 88, 0, 0, 186, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Homeguard Greathelm', 'Helmet', 51, 94, 0, 0, 196, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Elegant Greathelm', 'Helmet', 55, 101, 0, 0, 210, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Noble Greathelm', 'Helmet', 59, 108, 0, 0, 223, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),

-- DEX
('Rotted Hood', 'Helmet', 45, 0, 83, 0, 0, 158, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Wool Cap', 'Helmet', 48, 0, 88, 0, 0, 168, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Narrow Hood', 'Helmet', 51, 0, 94, 0, 0, 177, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Wrapped Cap', 'Helmet', 55, 0, 101, 0, 0, 190, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Deerstalker Hood', 'Helmet', 59, 0, 108, 0, 0, 203, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),

-- INT
('Druidic Circlet', 'Helmet', 45, 0, 0, 83, 0, 0, 63, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Avian Tiara', 'Helmet', 48, 0, 0, 88, 0, 0, 67, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Desert Circlet', 'Helmet', 51, 0, 0, 94, 0, 0, 70, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Sandsworn Tiara', 'Helmet', 55, 0, 0, 101, 0, 0, 74, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Jungle Tiara', 'Helmet', 59, 0, 0, 108, 0, 0, 78, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),

-- STR/DEX
('Domed Helm', 'Helmet', 45, 46, 46, 0, 97, 87, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Engraved Helm', 'Helmet', 48, 49, 49, 0, 102, 92, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Soldier Helm', 'Helmet', 51, 52, 52, 0, 108, 98, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Cabalist Helm', 'Helmet', 55, 55, 55, 0, 115, 105, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Gladiatoral Helm', 'Helmet', 59, 59, 59, 0, 123, 111, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),

-- STR/INT
('Mailed Crown', 'Helmet', 45, 46, 46, 0, 97, 0, 35, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Forest Crown', 'Helmet', 48, 49, 49, 0, 102, 0, 37, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Zealot Crown', 'Helmet', 51, 52, 52, 0, 108, 0, 38, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Hallowed Crown', 'Helmet', 55, 55, 55, 0, 115, 0, 41, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Inquistor Crown', 'Helmet', 59, 59, 59, 0, 123, 0, 43, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),

-- DEX/INT
('Oak Mask', 'Helmet', 45, 0, 46, 46, 0, 87, 35, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),
('Bandit Mask', 'Helmet', 48, 0, 49, 49, 0, 92, 37, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),
('Skulking Mask', 'Helmet', 51, 0, 52, 52, 0, 98, 38, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),
('Pariah Mask', 'Helmet', 55, 0, 55, 55, 0, 105, 41, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),
('Avian Mask', 'Helmet', 59, 0, 59, 59, 0, 111, 43, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),

-- Body Armour
-- \\

-- STR
('Barbarian Plate', 'Body Armour', 45, 94, 0, 0, 269, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Rugged Cuirass', 'Body Armour', 48, 99, 0, 0, 284, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Sandsworn Cuirass', 'Body Armour', 51, 105, 0, 0, 299, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Elegant Plate', 'Body Armour', 55, 113, 0, 0, 320, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Heavy Plate', 'Body Armour', 59, 122, 0, 0, 340, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Stone Cuirass', 'Body Armour', 62, 128, 0, 0, 355, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),

-- DEX
('Patchwork Vest', 'Body Armour', 45, 0, 94, 0, 0, 242, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Hunting Coat', 'Body Armour', 48, 0, 99, 0, 0, 256, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Riding Coat', 'Body Armour', 51, 0, 105, 0, 0, 271, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Layered Vest', 'Body Armour', 55, 0, 113, 0, 0, 290, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Runner Vest', 'Body Armour', 59, 0, 122, 0, 0, 309, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Lizardscale Coat', 'Body Armour', 62, 0, 128, 0, 0, 324, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),

-- INT
('Avian Robe', 'Body Armour', 45, 0, 0, 94, 0, 0, 97, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Cursekeepers Robe', 'Body Armour', 48, 0, 0, 99, 0, 0, 101, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Luxurious Robe', 'Body Armour', 51, 0, 0, 105, 0, 0, 106, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('River Raiment', 'Body Armour', 55, 0, 0, 113, 0, 0, 112, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Adherents Raiment', 'Body Armour', 59, 0, 0, 122, 0, 0, 119, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Ceremonial Robe', 'Body Armour', 62, 0, 0, 128, 0, 0, 123, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),

-- STR/DEX
('Ring Mail', 'Body Armour', 45, 51, 51, 0, 148, 133, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Scoundrel Armour', 'Body Armour', 48, 55, 55, 0, 156, 141, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Wanderer Armour', 'Body Armour', 51, 59, 59, 0, 165, 149, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Mantled Mail', 'Body Armour', 55, 62, 62, 0, 176, 159, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Trailblazer Armour', 'Body Armour', 59, 67, 67, 0, 187, 170, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Golden Mail', 'Body Armour', 62, 70, 70, 0, 195, 178, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),

-- STR/INT
('Templar Vestments', 'Body Armour', 45, 51, 0, 51, 148, 0, 53, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Bearskin Mantle', 'Body Armour', 48, 55, 0, 55, 156, 0, 56, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Chain Vestments', 'Body Armour', 51, 59, 0, 59, 165, 0, 58, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Occultist Mantle', 'Body Armour', 55, 62, 0, 62, 176, 0, 62, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Plated Vestments', 'Body Armour', 59, 67, 0, 67, 187, 0, 65, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Heartcarver Mantle', 'Body Armour', 62, 70, 0, 70, 195, 0, 68, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),

-- DEX/INT
('Ascetic Garb', 'Body Armour', 45, 0, 51, 51, 0, 133, 53, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),
('Oiled Jacket', 'Body Armour', 48, 0, 55, 55, 0, 141, 56, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),
('Evangelist Garb', 'Body Armour', 51, 0, 59, 59, 0, 149, 58, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),
('Itinerant Jacket', 'Body Armour', 55, 0, 62, 62, 0, 159, 62, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),
('Hatungo Garb', 'Body Armour', 59, 0, 67, 67, 0, 170, 65, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),
('Hawkers Jacket', 'Body Armour', 62, 0, 70, 70, 0, 178, 68, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),

-- Gloves
-- \\

-- STR
('Plated Mitts', 'Gloves', 45, 73, 0, 0, 88, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Elegant Mitts', 'Gloves', 51, 82, 0, 0, 98, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Ancient Mitts', 'Gloves', 55, 88, 0, 0, 105, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Feathered Mitts', 'Gloves', 59, 95, 0, 0, 111, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),

-- DEX
('Hunting Bracers', 'Gloves', 45, 0, 73, 0, 0, 79, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Swift Bracers', 'Gloves', 51, 0, 82, 0, 0, 89, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Refined Bracers', 'Gloves', 55, 0, 88, 0, 0, 95, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Spiked Bracers', 'Gloves', 59, 0, 95, 0, 0, 101, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),

-- INT
('Ominous Gloves', 'Gloves', 45, 0, 0, 73, 0, 0, 32, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Embroidered Gloves', 'Gloves', 51, 0, 0, 82, 0, 0, 35, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Baroque Gloves', 'Gloves', 55, 0, 0, 88, 0, 0, 37, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Gold Gloves', 'Gloves', 59, 0, 0, 95, 0, 0, 39, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),

-- STR/DEX
('Ironmail Guantlets', 'Gloves', 45, 40, 40, 0, 48, 44, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Captain Guantlets', 'Gloves', 51, 46, 46, 0, 54, 49, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Zealot Guantlets', 'Gloves', 59, 52, 52, 0, 61, 56, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),

-- STR/INT
('Braided Cuffs', 'Gloves', 45, 40, 0, 40, 48, 0, 17, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Heirloom Cuffs', 'Gloves', 51, 46, 0, 46, 54, 0, 19, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Ornate Cuffs', 'Gloves', 59, 52, 0, 52, 61, 0, 21, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),

-- DEX/INT
('Bandage Wraps', 'Gloves', 45, 0, 40, 40, 0, 44, 17, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),
('Cambric Wraps', 'Gloves', 16, 0, 46, 46, 0, 49, 19, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),
('Adorned Wraps', 'Gloves', 33, 0, 52, 52, 0, 56, 21, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),

-- Boots
-- \\

-- STR
('Plated Greaves', 'Boots', 45, 78, 0, 0, 132, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Lionheart Greaves', 'Boots', 51, 88, 0, 0, 147, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Elegant Greaves', 'Boots', 55, 95, 0, 0, 157, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Carved Greaves', 'Boots', 59, 101, 0, 0, 167, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),

-- DEX
('Bound Boots', 'Boots', 45, 0, 78, 0, 0, 119, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Sleek Boots', 'Boots', 51, 0, 88, 0, 0, 133, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Studded Boots', 'Boots', 55, 0, 95, 0, 0, 143, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Serpentscale Boots', 'Boots', 59, 0, 101, 0, 0, 152, 0, 0, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),

-- INT
('Laced Sandals', 'Boots', 45, 0, 0, 78, 0, 0, 48, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Bangled Sandals', 'Boots', 51, 0, 0, 88, 0, 0, 52, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Elegant Slippers', 'Boots', 55, 0, 0, 95, 0, 0, 55, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Dunerunner Sandals', 'Boots', 59, 0, 0, 101, 0, 0, 58, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),

-- STR/DEX
('Soldiering Sabatons', 'Boots', 45, 43, 43, 0, 73, 65, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Goldwork Sabatons', 'Boots', 51, 49, 49, 0, 81, 73, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Bastion Sabatons', 'Boots', 59, 56, 56, 0, 92, 84, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),

-- STR/INT
('Adherent Leggings', 'Boots', 45, 43, 0, 43, 73, 0, 26, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Bound Leggings', 'Boots', 51, 49, 0, 49, 81, 0, 29, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Shamanistic Leggings', 'Boots', 59, 56, 0, 56, 92, 0, 32, 0, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),

-- DEX/INT
('Wayfarer Shoes', 'Boots', 45, 0, 43, 43, 0, 65, 26, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),
('Silverbuckled Shoes', 'Boots', 51, 0, 49, 49, 0, 73, 29, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),
('Treerunner Shoes', 'Boots', 59, 0, 56, 56, 0, 84, 32, 0, '0', '0', '0', '0', '', 'dex_int_armour, advanced', TRUE),

-- Shields
-- \\

-- DEX
('Oak Buckler', 'Shield', 45, 0, 83, 0, 0, 79, 0, 20, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Painted Buckler', 'Shield', 48, 0, 88, 0, 0, 84, 0, 20, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Coiled Buckler', 'Shield', 51, 0, 94, 0, 0, 89, 0, 20, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Spikeward Buckler', 'Shield', 55, 0, 101, 0, 0, 95, 0, 20, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Jingling Buckler', 'Shield', 59, 0, 108, 0, 0, 101, 0, 20, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),
('Bladeguard Buckler', 'Shield', 61, 0, 112, 0, 0, 105, 0, 20, '0', '0', '0', '0', '', 'dex_armour, advanced', TRUE),

-- STR
('Aged Tower Shield', 'Shield', 45, 83, 0, 0, 110, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Metalworked Tower Shield', 'Shield', 48, 88, 0, 0, 116, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Cultist Tower Shield', 'Shield', 51, 94, 0, 0, 123, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Bulwark Tower Shield', 'Shield', 55, 101, 0, 0, 131, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Noble Tower Shield', 'Shield', 59, 108, 0, 0, 139, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),
('Goldworked Tower Shield', 'Shield', 61, 112, 0, 0, 144, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, advanced', TRUE),

-- STR/DEX
('Ironwood Targe', 'Shield', 45, 46, 46, 0, 61, 54, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Fur-lined Targe', 'Shield', 48, 49, 49, 0, 64, 58, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Mercenary Targe', 'Shield', 51, 52, 52, 0, 67, 61, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Polished Targe', 'Shield', 55, 55, 55, 0, 72, 65, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Stone Targe', 'Shield', 59, 59, 59, 0, 77, 70, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),
('Avian Targe', 'Shield', 62, 62, 62, 0, 80, 73, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, advanced', TRUE),

-- STR/INT
('Painted Crest Shield', 'Shield', 45, 46, 0, 46, 61, 0, 22, 25, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Engraved Crest Shield', 'Shield', 48, 49, 0, 49, 64, 0, 23, 25, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Descry Crest Shield', 'Shield', 51, 52, 0, 52, 67, 0, 24, 25, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Dekharan Crest Shield', 'Shield', 55, 55, 0, 55, 72, 0, 25, 25, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Quartered Crest Shield', 'Shield', 59, 59, 0, 59, 77, 0, 27, 25, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),
('Glowering Crest Shield', 'Shield', 62, 62, 0, 62, 80, 0, 28, 25, '0', '0', '0', '0', '', 'str_int_armour, advanced', TRUE),

-- Focus
-- \\
('Wreath Focus', 'Focus', 45, 0, 0, 83, 0, 0, 40, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Staghorn Focus', 'Focus', 48, 0, 0, 88, 0, 0, 42, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Jingling Focus', 'Focus', 51, 0, 0, 94, 0, 0, 43, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Arrayed Focus', 'Focus', 55, 0, 0, 101, 0, 0, 46, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Cultist Focus', 'Focus', 59, 0, 0, 108, 0, 0, 49, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),
('Hallowed Focus', 'Focus', 61, 0, 0, 112, 0, 0, 50, 0, '0', '0', '0', '0', '', 'int_armour, advanced', TRUE),

-- One Hand Axe
-- \\
('Boarding Hatchet', 'One Hand Axe', 45, 81, 33, 0, 0, 0, 0, 0, '24-55', '5%', '1.55', '1.1', '', 'one_hand_weapon, advanced', TRUE),
('Fury Cleaver', 'One Hand Axe', 48, 86, 35, 0, 0, 0, 0, 0, '30-62', '5%', '1.55', '1.1', '10% increased Damage taken', 'one_hand_weapon, advanced', TRUE),
('Battle Axe', 'One Hand Axe', 52, 93, 37, 0, 0, 0, 0, 0, '28-65', '5%', '1.5', '1.1', '', 'one_hand_weapon, advanced', TRUE),
('Profane Cleaver', 'One Hand Axe', 54, 96, 38, 0, 0, 0, 0, 0, '26-69', '5%', '1.5', '1.1', '', 'one_hand_weapon, advanced', TRUE),

-- Two Hand Axe
-- \\
('Reaver Glaive', 'Two Hand Axe', 45, 81, 33, 0, 0, 0, 0, 0, '43-113', '5%', '1.2', '1.3', '', 'two_hand_weapon, advanced', TRUE),
('Ember Greataxe', 'Two Hand Axe', 50, 89, 36, 0, 0, 0, 0, 0, '43-113', '5%', '1.2', '1.3', 'Base Fire Damage [100%]', 'two_hand_weapon, advanced', TRUE),
('Ceremonial Halberd', 'Two Hand Axe', 52, 93, 37, 0, 0, 0, 0, 0, '53-123', '5%', '1.2', '1.3', 'Cannot use Projectile Attacks', 'two_hand_weapon, advanced', TRUE),
('Monument Greataxe', 'Two Hand Axe', 57, 102, 40, 0, 0, 0, 0, 0, '48-143', '5%', '1.2', '1.3', '', 'two_hand_weapon, advanced', TRUE),

-- One Hand Mace
-- \\
('Morning Star', 'One Hand Mace', 45, 104, 0, 0, 0, 0, 0, 0, '33-49', '6.5%', '1.45', '1.1', '', 'one_hand_weapon, advanced', FALSE),
('Calescent Hammer', 'One Hand Mace', 45, 104, 0, 0, 0, 0, 0, 0, '38-64', '5%', '1.45', '1.1', 'Base Fire Damage [50%]', 'one_hand_weapon, advanced', TRUE),
('Jade Club', 'One Hand Mace', 48, 110, 0, 0, 0, 0, 0, 0, '30-50', '5%', '1.45', '1.1', 'Always Hits', 'one_hand_weapon, advanced', FALSE),
('Flared Mace', 'One Hand Mace', 48, 110, 0, 0, 0, 0, 0, 0, '33-50', '5%', '1.55', '1.1', '', 'one_hand_weapon, advanced', TRUE),
('Battle Pick', 'One Hand Mace', 51, 117, 0, 0, 0, 0, 0, 0, '35-47', '7%', '1.45', '1.1', '+(10-15)% to Critical Damage Bonus', 'one_hand_weapon, advanced', TRUE),
('Marching Mace', 'One Hand Mace', 55, 126, 0, 0, 0, 0, 0, 0, '34-70', '5%', '1.4', '1.1', '', 'one_hand_weapon, advanced', TRUE),
('Bandit Mace', 'One Hand Mace', 59, 135, 0, 0, 0, 0, 0, 0, '45-61', '5%', '1.45', '1.1', '', 'one_hand_weapon, advanced', TRUE),
('Structured Hammer', 'One Hand Mace', 62, 142, 0, 0, 0, 0, 0, 0, '49-60', '5%', '1.4', '1.1', 'Causes Daze buildup equal to 100% of Damage dealt', 'one_hand_weapon, advanced', TRUE),

-- Two Hand Mace
-- \\
('Pointed Maul', 'Two Hand Mace', 45, 104, 0, 0, 0, 0, 0, 0, '68-102', '6.5%', '1.1', '1.3', 'Crushes Enemies on Hit', 'two_hand_weapon, advanced', FALSE),
('Totemic Greatclub', 'Two Hand Mace', 50, 115, 0, 0, 0, 0, 0, 0, '73-99', '5%', '1.1', '1.3', 'Crushes Enemies on Hit', 'two_hand_weapon, advanced', FALSE),
('Snakewood Greathammer', 'Two Hand Mace', 45, 104, 0, 0, 0, 0, 0, 0, '59-109', '5%', '1.05', '1.3', 'Causes (30-50)% increased Stun Buildup', 'two_hand_weapon, advanced', TRUE),
('Blacksmith Maul', 'Two Hand Mace', 48, 110, 0, 0, 0, 0, 0, 0, '84-113', '5%', '1.05', '1.3', '', 'two_hand_weapon, advanced', TRUE),
('Zealot Greathammer', 'Two Hand Mace', 51, 117, 0, 0, 0, 0, 0, 0, '62-83', '5%', '1.05', '1.3', 'Strikes deal Splash damage to targets within 1.5 metres', 'two_hand_weapon, advanced', TRUE),
('Solemn Maul', 'Two Hand Mace', 55, 126, 0, 0, 0, 0, 0, 0, '60-125', '5%', '1.2', '1.3', '', 'two_hand_weapon, advanced', TRUE),
('Heavy Greathammer', 'Two Hand Mace', 59, 135, 0, 0, 0, 0, 0, 0, '94-127', '5%', '1.1', '1.3', '', 'two_hand_weapon, advanced', TRUE),
('Disintegrating Maul', 'Two Hand Mace', 62, 142, 0, 0, 0, 0, 0, 0, '93-114', '5%', '1.1', '1.3', 'Causes Enemies to Explode on Critical kill, for 10% of their Life as Physical Damage', 'two_hand_weapon, advanced', TRUE),

-- One Hand Sword
-- \\
('Cutlass', 'One Hand Sword', 45, 57, 57, 0, 0, 0, 0, 0, '33-49', '5%', '1.5', '1.1', 'Base Fire Damage [50%]', 'one_hand_weapon, advanced', TRUE),
('Runic Shortsword', 'One Hand Sword', 50, 63, 63, 0, 0, 0, 0, 0, '26-55', '5%', '1.65', '1.1', '', 'one_hand_weapon, advanced', TRUE),
('Messer', 'One Hand Sword', 52, 66, 66, 0, 0, 0, 0, 0, '30-56', '5%', '1.6', '1.1', '', 'one_hand_weapon, advanced', TRUE),
('Commander Sword', 'One Hand Sword', 54, 68, 68, 0, 0, 0, 0, 0, '36-60', '5%', '1.5', '1.1', '', 'one_hand_weapon, advanced', TRUE),

-- Two Hand Sword
-- \\
('Keen Greatsword', 'Two Hand Sword', 45, 57, 57, 0, 0, 0, 0, 0, '45-94', '5%', '1.3', '1.3', '', 'two_hand_weapon, advanced', TRUE),
('Ancient Greatblade', 'Two Hand Sword', 49, 62, 62, 0, 0, 0, 0, 0, '55-103', '5%', '1.25', '1.3', '', 'two_hand_weapon, advanced', TRUE),
('Flanged Greatblade', 'Two Hand Sword', 52, 66, 66, 0, 0, 0, 0, 0, '51-106', '5%', '1.3', '1.3', '', 'two_hand_weapon, advanced', TRUE),
('Regalia Longsword', 'Two Hand Sword', 54, 68, 68, 0, 0, 0, 0, 0, '61-92', '5%', '1.35', '1.3', '', 'two_hand_weapon, advanced', TRUE),

-- Claw
-- \\
('Razorglass Claw', 'Claw', 45, 0, 104, 0, 0, 0, 0, 0, '23-54', '5%', '1.6', '1.1', '', 'one_hand_weapon, advanced', TRUE),
('Sharktooth Claw', 'Claw', 49, 0, 112, 0, 0, 0, 0, 0, '25-52', '5%', '1.7', '1.1', '', 'one_hand_weapon, advanced', TRUE),
('Armoured Claw', 'Claw', 52, 0, 119, 0, 0, 0, 0, 0, '27-63', '5%', '1.55', '1.1', '', 'one_hand_weapon, advanced', TRUE),
('Piercing Claw', 'Claw', 55, 0, 126, 0, 0, 0, 0, 0, '23-68', '5%', '1.6', '1.1', '', 'one_hand_weapon, advanced', TRUE),

-- Dagger
-- \\
('Mail Breaker', 'Dagger', 45, 0, 57, 57, 0, 0, 0, 0, '19-44', '15%', '1.5', '1', 'Breaks (400-500) Armour on Critical Hit', 'one_hand_weapon, advanced', TRUE),
('Kris Knife', 'Dagger', 49, 0, 62, 62, 0, 0, 0, 0, '16-48', '15%', '1.65', '1', '', 'one_hand_weapon, advanced', TRUE),
('Parrying Dagger', 'Dagger', 52, 0, 66, 66, 0, 0, 0, 0, '16-55', '15%', '1.55', '1', '', 'one_hand_weapon, advanced', TRUE),
('Arcane Dirk', 'Dagger', 56, 0, 71, 71, 0, 0, 0, 0, '22-52', '15%', '1.55', '1', '', 'one_hand_weapon, advanced', TRUE),

-- Flail
-- \\
('Guarded Flail', 'Flail', 45, 81, 0, 33, 0, 0, 0, 0, '31-57', '10%', '1.4', '1.1', '', 'one_hand_weapon, advanced', TRUE),
('Icicle Flail', 'Flail', 50, 84, 0, 34, 0, 0, 0, 0, '24-55', '10%', '1.45', '1.1', 'Base Cold Damage [100%]', 'one_hand_weapon, advanced', TRUE),
('Tearing Flail', 'Flail', 52, 93, 0, 37, 0, 0, 0, 0, '27-56', '10%', '1.4', '1.1', '', 'one_hand_weapon, advanced', TRUE),
('Great Flail', 'Flail', 57, 103, 0, 41, 0, 0, 0, 0, '35-58', '10%', '1.45', '1.1', '', 'one_hand_weapon, advanced', TRUE),

-- Spear
-- \\
('Crossblade Spear', 'Spear', 45, 33, 81, 0, 0, 0, 0, 0, '28-51', '5%', '1.55', '1.5', '', 'one_hand_weapon, advanced', TRUE),
('Steelhead Spear', 'Spear', 45, 33, 81, 0, 0, 0, 0, 0, '27-50', '5%', '1.6', '1.5', '', 'one_hand_weapon, advanced', TRUE),
('Coursing Spear', 'Spear', 48, 35, 86, 0, 0, 0, 0, 0, '29-54', '5%', '1.55', '1.5', '(15-25)% chance to Maim on Hit', 'one_hand_weapon, advanced', TRUE),
('Seaglass Spear', 'Spear', 51, 36, 91, 65, 0, 0, 0, 0, '27-50', '10%', '1.6', '1.5', '', 'one_hand_weapon, advanced', TRUE),
('Swift Spear', 'Spear', 51, 36, 91, 0, 0, 0, 0, 0, '28-53', '5%', '1.6', '1.5', '(25-35)% increased Projectile Speed with this Weapon', 'one_hand_weapon, advanced', TRUE),
('Sword Spear', 'Spear', 52, 37, 93, 0, 0, 0, 0, 0, '30-56', '5%', '1.6', '1.5', '', 'one_hand_weapon, advanced', TRUE),
('Branched Spear', 'Spear', 55, 39, 98, 0, 0, 0, 0, 0, '32-59', '5%', '1.6', '1.5', '(25-35)% increased Projectile Speed with this Weapon', 'one_hand_weapon, advanced', TRUE),
('Striking Spear', 'Spear', 55, 39, 98, 0, 0, 0, 0, 0, '23-91', '5%', '1.6', '1.5', 'Base Lightning Damage [100%]', 'one_hand_weapon, advanced', TRUE),
('Jagged Spear', 'Spear', 59, 42, 105, 0, 0, 0, 0, 0, '33-61', '6.5%', '1.6', '1.5', '', 'one_hand_weapon, advanced', TRUE),
('Massive Spear', 'Spear', 62, 44, 110, 0, 0, 0, 0, 0, '38-70', '5%', '1.5', '1.5', '', 'one_hand_weapon, advanced', TRUE),

-- Bow
-- \\
('Snakewood Shortbow', 'Bow', 45, 0, 104, 0, 0, 0, 0, 0, '29-54', '5%', '1.25', '', '', 'one_hand_weapon, bow, advanced', TRUE),
('Protector Bow', 'Bow', 48, 0, 110, 0, 0, 0, 0, 0, '35-53', '5%', '1.15', '', '(20-30)% chance to Chain an additional time', 'one_hand_weapon, bow, advanced', TRUE),
('Rider Bow', 'Bow', 51, 0, 117, 0, 0, 0, 0, 0, '36-61', '5%', '1.2', '', '', 'one_hand_weapon, bow, advanced', TRUE),
('Twin Bow', 'Bow', 55, 0, 129, 0, 0, 0, 0, 0, '29-54', '5%', '1.2', '', 'Bow Attacks fire an additional Arrow', 'one_hand_weapon, bow, advanced', TRUE),
('Adherent Bow', 'Bow', 59, 0, 135, 0, 0, 0, 0, 0, '41-69', '5%', '1.2', '', 'Base Chaos Damage [100%]', 'one_hand_weapon, bow, advanced', TRUE),
('Militant Bow', 'Bow', 62, 0, 142, 0, 0, 0, 0, 0, '46-69', '5%', '1.2', '', '', 'one_hand_weapon, bow, advanced', TRUE),

-- Crossbow
-- \\
('Taut Crossbow', 'Crossbow', 45, 57, 57, 0, 0, 0, 0, 0, '20-79', '5%', '1.6', '.85', '(20-30)% increased Bolt Speed', 'two_hand_weapon, advanced', TRUE),
('Robust Crossbow', 'Crossbow', 48, 61, 61, 0, 0, 0, 0, 0, '22-89', '5%', '1.55', '.75', '', 'two_hand_weapon, advanced', TRUE),
('Painted Crossbow', 'Crossbow', 51, 65, 65, 0, 0, 0, 0, 0, '23-92', '5%', '1.6', '.80', '', 'two_hand_weapon, advanced', TRUE),
('Twin Crossbow', 'Crossbow', 55, 69, 69, 0, 0, 0, 0, 0, '21-83', '5%', '1.6', '1.1', 'Loads an additional bolt', 'two_hand_weapon, advanced', TRUE),
('Cannonade Crossbow', 'Crossbow', 59, 74, 74, 0, 0, 0, 0, 0, '23-90', '5%', '1.65', '.75', 'Grenade Skills Fire an additional Projectile', 'two_hand_weapon, advanced', TRUE),
('Bleak Crossbow', 'Crossbow', 62, 78, 78, 0, 0, 0, 0, 0, '27-109', '5%', '1.6', '.80', '', 'two_hand_weapon, advanced', TRUE),

-- Quarterstaff
-- \\
('Reaching Quarterstaff', 'Quarterstaff', 45, 0, 81, 33, 0, 0, 0, 0, '35-72', '10%', '1.4', '1.3', '16% increased Melee Strike Range with this weapon', 'two_hand_weapon, advanced', TRUE),
('Barbarous Quarterstaff', 'Quarterstaff', 48, 0, 86, 35, 0, 0, 0, 0, '43-72', '11.5%', '1.4', '1.3', '', 'two_hand_weapon, advanced', TRUE),
('Arcing Quarterstaff', 'Quarterstaff', 51, 0, 91, 36, 0, 0, 0, 0, '30-57', '10%', '1.4', '1.3', 'Base Lightning Damage [100%]', 'two_hand_weapon, advanced', TRUE),
('Waxing Quarterstaff', 'Quarterstaff', 55, 0, 98, 39, 0, 0, 0, 0, '40-83', '10%', '1.5', '1.3', '', 'two_hand_weapon, advanced', TRUE),
('Bladed Quarterstaff', 'Quarterstaff', 59, 0, 105, 42, 0, 0, 0, 0, '45-94', '10%', '1.4', '1.3', '', 'two_hand_weapon, advanced', TRUE),
('Guardian Quarterstaff', 'Quarterstaff', 62, 0, 110, 44, 0, 0, 0, 0, '49-82', '10%', '1.4', '1.3', '+(10-15)% to Block Chance', 'two_hand_weapon, advanced', TRUE),

-- //
-- Expert
-- //

-- Helmet
-- \\

-- STR
('Warmonger Greathelm', 'Helmet', 65, 118, 0, 0, 243, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, expert', TRUE),
('Masked Greathelm', 'Helmet', 70, 129, 0, 0, 267, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, expert', TRUE),
('Paragon Greathelm', 'Helmet', 75, 139, 0, 0, 292, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, expert', TRUE),

-- DEX
('Woven Cap', 'Helmet', 65, 0, 118, 0, 0, 222, 0, 0, '0', '0', '0', '0', '', 'dex_armour, expert', TRUE),
('Desert Cap', 'Helmet', 70, 0, 129, 0, 0, 244, 0, 0, '0', '0', '0', '0', '', 'dex_armour, expert', TRUE),
('Trapper Hood', 'Helmet', 75, 0, 139, 0, 0, 266, 0, 0, '0', '0', '0', '0', '', 'dex_armour, expert', TRUE),

-- INT
('Skycrown Tiara', 'Helmet', 65, 0, 0, 118, 0, 0, 84, 0, '0', '0', '0', '0', '', 'int_armour, expert', TRUE),
('Sorcerous Tiara', 'Helmet', 70, 0, 0, 129, 0, 0, 92, 0, '0', '0', '0', '0', '', 'int_armour, expert', TRUE),
('Kamasan Tiara', 'Helmet', 75, 0, 0, 139, 0, 0, 101, 0, '0', '0', '0', '0', '', 'int_armour, expert', TRUE),

-- STR/DEX
('Warded Helm', 'Helmet', 65, 65, 65, 0, 134, 122, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, expert', TRUE),
('Cryptic Helm', 'Helmet', 70, 70, 70, 0, 147, 134, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, expert', TRUE),
('Champion Helm', 'Helmet', 75, 76, 76, 0, 160, 146, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, expert', TRUE),


-- STR/INT
('Druidic Crown', 'Helmet', 65, 65, 65, 0, 134, 0, 46, 0, '0', '0', '0', '0', '', 'str_int_armour, expert', TRUE),
('Saintly Crown', 'Helmet', 70, 70, 70, 0, 147, 0, 51, 0, '0', '0', '0', '0', '', 'str_int_armour, expert', TRUE),
('Divine Crown', 'Helmet', 75, 76, 76, 0, 160, 0, 55, 0, '0', '0', '0', '0', '', 'str_int_armour, expert', TRUE),

-- DEX/INT
('Brigand Mask', 'Helmet', 65, 0, 65, 65, 0, 122, 46, 0, '0', '0', '0', '0', '', 'dex_int_armour, expert', TRUE),
('Faridun Mask', 'Helmet', 70, 0, 70, 70, 0, 134, 51, 0, '0', '0', '0', '0', '', 'dex_int_armour, expert', TRUE),
('Soaring Mask', 'Helmet', 75, 0, 76, 76, 0, 146, 55, 0, '0', '0', '0', '0', '', 'dex_int_armour, expert', TRUE),

-- Body Armour
-- \\

-- STR
('Soldier Plate', 'Body Armour', 65, 157, 0, 0, 534, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, expert', TRUE),
('Ornate Plate', 'Body Armour', 70, 157, 0, 0, 445, 0, 0, 0, '0', '0', '0', '0', 'Regenerate (1.5-2.5)% of Life per second', 'str_armour, expert', TRUE),
('Utzaal Cuirass', 'Body Armour', 75, 157, 0, 0, 445, 0, 0, 0, '0', '0', '0', '0', '(30-40)% increased Stun Threshold', 'str_armour, expert', TRUE),

-- DEX
('Swiftstalker Coat', 'Body Armour', 65, 0, 157, 0, 0, 406, 0, 0, '0', '0', '0', '0', '+(30-20)% reduced Slowing Potency of Debuffs on You', 'dex_armour, expert', TRUE),
('Slipstrike Vest', 'Body Armour', 70, 0, 157, 0, 0, 487, 0, 0, '0', '0', '0', '0', '', 'dex_armour, expert', TRUE),
('Wrymscale Coat', 'Body Armour', 75, 0, 157, 0, 0, 406, 0, 0, '0', '0', '0', '0', '(30-40)% increased Elemental Ailment Threshold', 'dex_armour, expert', TRUE),

-- INT
('Vile Robe', 'Body Armour', 65, 0, 0, 157, 0, 0, 184, 0, '0', '0', '0', '0', '', 'int_armour, expert', TRUE),
('Flowing Raiment', 'Body Armour', 70, 0, 0, 157, 0, 0, 153, 0, '0', '0', '0', '0', '(40-50)% increased Mana Regeneration Rate', 'int_armour, expert', TRUE),
('Sacramental Robe', 'Body Armour', 75, 0, 0, 157, 0, 0, 153, 0, '0', '0', '0', '0', '(40-50)% faster start of Energy Shield Recharge', 'int_armour, expert', TRUE),

-- STR/DEX
('Dastard Armour', 'Body Armour', 65, 86, 86, 0, 245, 223, 0, 0, '0', '0', '0', '0', '(60-80) to maximum Life', 'str_dex_armour, expert', TRUE),
('Shrouded Mail', 'Body Armour', 70, 86, 86, 0, 245, 223, 0, 0, '0', '0', '0', '0', '(20-25)% to [Fire|Cold|Lightning] Resistance', 'str_dex_armour, expert', TRUE),
('Death Mail', 'Body Armour', 75, 86, 86, 0, 294, 268, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, expert', TRUE),

-- STR/INT
('Wolfskin Mantle', 'Body Armour', 65, 86, 0, 86, 294, 0, 101, 0, '0', '0', '0', '0', '', 'str_int_armour, expert', TRUE),
('Conjurer Mantle', 'Body Armour', 70, 86, 0, 86, 245, 0, 84, 0, '0', '0', '0', '0', '+(20-30) to Spirit', 'str_int_armour, expert', TRUE),
('Death Mantle', 'Body Armour', 75, 86, 0, 86, 245, 0, 84, 0, '0', '0', '0', '0', '+1% to all Maximum Elemental Resistances', 'str_int_armour, expert', TRUE),

-- DEX/INT
('Sleek Jacket', 'Body Armour', 65, 0, 86, 86, 0, 268, 101, 0, '0', '0', '0', '0', '', 'dex_int_armour, expert', TRUE),
('Rambler Jacket', 'Body Armour', 70, 0, 86, 86, 0, 223, 84, 0, '0', '0', '0', '0', '(7-13)% to Chaos Resistance', 'dex_int_armour, expert', TRUE),
('Falconers Jacket', 'Body Armour', 75, 0, 86, 86, 0, 223, 84, 0, '0', '0', '0', '0', '5% increased movement speed', 'dex_int_armour, expert', TRUE),

-- Gloves
-- \\

-- STR
('Knightly Mitts', 'Gloves', 65, 104, 0, 0, 122, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, expert', TRUE),
('Ornate Mitts', 'Gloves', 70, 113, 0, 0, 134, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, expert', TRUE),
('Vaal Mitts', 'Gloves', 75, 122, 0, 0, 146, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, expert', TRUE),

-- DEX
('Stalking Bracers', 'Gloves', 65, 0, 104, 0, 0, 111, 0, 0, '0', '0', '0', '0', '', 'dex_armour, expert', TRUE),
('Grand Bracers', 'Gloves', 70, 0, 113, 0, 0, 122, 0, 0, '0', '0', '0', '0', '', 'dex_armour, expert', TRUE),
('Barbed Bracers', 'Gloves', 75, 0, 122, 0, 0, 133, 0, 0, '0', '0', '0', '0', '', 'dex_armour, expert', TRUE),

-- INT
('Grim Gloves', 'Gloves', 65, 0, 0, 104, 0, 0, 42, 0, '0', '0', '0', '0', '', 'int_armour, expert', TRUE),
('Opulent Gloves', 'Gloves', 70, 0, 0, 113, 0, 0, 46, 0, '0', '0', '0', '0', '', 'int_armour, expert', TRUE),
('Vaal Gloves', 'Gloves', 75, 0, 0, 122, 0, 0, 50, 0, '0', '0', '0', '0', '', 'int_armour, expert', TRUE),

-- STR/DEX
('Steelmail Guantlets', 'Gloves', 65, 57, 57, 0, 67, 61, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, expert', TRUE),
('Commander Guantlets', 'Gloves', 70, 62, 62, 0, 74, 67, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, expert', TRUE),
('Cultist Guantlets', 'Gloves', 75, 67, 67, 0, 80, 73, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, expert', TRUE),

-- STR/INT
('Bound Cuffs', 'Gloves', 65, 57, 0, 57, 67, 0, 23, 0, '0', '0', '0', '0', '', 'str_int_armour, expert', TRUE),
('Ancient Cuffs', 'Gloves', 70, 62, 0, 62, 74, 0, 25, 0, '0', '0', '0', '0', '', 'str_int_armour, expert', TRUE),
('Gleaming Cuffs', 'Gloves', 75, 67, 0, 67, 80, 0, 28, 0, '0', '0', '0', '0', '', 'str_int_armour, expert', TRUE),

-- DEX/INT
('War Wraps', 'Gloves', 65, 0, 57, 57, 0, 61, 23, 0, '0', '0', '0', '0', '', 'dex_int_armour, expert', TRUE),
('Elegant Wraps', 'Gloves', 70, 0, 62, 62, 0, 67, 25, 0, '0', '0', '0', '0', '', 'dex_int_armour, expert', TRUE),
('Vaal Wraps', 'Gloves', 75, 0, 67, 67, 0, 73, 28, 0, '0', '0', '0', '0', '', 'dex_int_armour, expert', TRUE),

-- Boots
-- \\

-- STR
('Bulwark Greaves', 'Boots', 65, 111, 0, 0, 182, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, expert', TRUE),
('Ornate Greaves', 'Boots', 70, 121, 0, 0, 200, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, expert', TRUE),
('Vaal Greaves', 'Boots', 75, 131, 0, 0, 219, 0, 0, 0, '0', '0', '0', '0', '', 'str_armour, expert', TRUE),

-- DEX
('Cinched Boots', 'Boots', 65, 0, 111, 0, 0, 166, 0, 0, '0', '0', '0', '0', '', 'dex_armour, expert', TRUE),
('Calvary Boots', 'Boots', 70, 0, 121, 0, 0, 183, 0, 0, '0', '0', '0', '0', '', 'dex_armour, expert', TRUE),
('Dragonscale Boots', 'Boots', 75, 0, 131, 0, 0, 200, 0, 0, '0', '0', '0', '0', '', 'dex_armour, expert', TRUE),

-- INT
('Bound Sandals', 'Boots', 65, 0, 0, 111, 0, 0, 63, 0, '0', '0', '0', '0', '', 'int_armour, expert', TRUE),
('Luxurious Slippers', 'Boots', 70, 0, 0, 121, 0, 0, 69, 0, '0', '0', '0', '0', '', 'int_armour, expert', TRUE),
('Sandsworn Sandals', 'Boots', 75, 0, 0, 131, 0, 0, 75, 0, '0', '0', '0', '0', '', 'int_armour, expert', TRUE),

-- STR/DEX
('Veteran Sabatons', 'Boots', 65, 61, 61, 0, 100, 91, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, expert', TRUE),
('Noble Sabatons', 'Boots', 70, 66, 66, 0, 110, 101, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, expert', TRUE),
('Fortress Sabatons', 'Boots', 75, 71, 71, 0, 120, 110, 0, 0, '0', '0', '0', '0', '', 'str_dex_armour, expert', TRUE),

-- STR/INT
('Faithful Leggings', 'Boots', 65, 61, 0, 61, 100, 0, 35, 0, '0', '0', '0', '0', '', 'str_int_armour, expert', TRUE),
('Apostle Leggings', 'Boots', 70, 66, 0, 66, 110, 0, 38, 0, '0', '0', '0', '0', '', 'str_int_armour, expert', TRUE),
('Warlock Leggings', 'Boots', 75, 71, 0, 71, 120, 0, 42, 0, '0', '0', '0', '0', '', 'str_int_armour, expert', TRUE),

-- DEX/INT
('Wanderer Shoes', 'Boots', 65, 0, 61, 61, 0, 91, 35, 0, '0', '0', '0', '0', '', 'dex_int_armour, expert', TRUE),
('Charmed Shoes', 'Boots', 70, 0, 66, 66, 0, 101, 38, 0, '0', '0', '0', '0', '', 'dex_int_armour, expert', TRUE),
('Quickslip Shoes', 'Boots', 75, 0, 71, 71, 0, 110, 42, 0, '0', '0', '0', '0', '', 'dex_int_armour, expert', TRUE),

-- Shields
-- \\

-- DEX
('Ornate Buckler', 'Shield', 65, 0, 118, 0, 0, 111, 0, 20, '0', '0', '0', '0', '', 'dex_armour, expert', TRUE),
('Gutspike Buckler', 'Shield', 70, 0, 129, 0, 0, 122, 0, 20, '0', '0', '0', '0', '', 'dex_armour, expert', TRUE),
('Ancient Buckler', 'Shield', 75, 0, 139, 0, 0, 133, 0, 20, '0', '0', '0', '0', '', 'dex_armour, expert', TRUE),

-- STR
('Royal Tower Shield', 'Shield', 65, 118, 0, 0, 152, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, expert', TRUE),
('Fortress Tower Shield', 'Shield', 70, 129, 0, 0, 167, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, expert', TRUE),
('Vaal Tower Shield', 'Shield', 75, 139, 0, 0, 182, 0, 0, 26, '0', '0', '0', '0', '', 'str_armour, expert', TRUE),

-- STR/DEX
('Mammoth Targe', 'Shield', 65, 65, 65, 0, 84, 76, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, expert', TRUE),
('Baroque Targe', 'Shield', 70, 70, 70, 0, 92, 84, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, expert', TRUE),
('Soaring Targe', 'Shield', 75, 76, 76, 0, 100, 91, 0, 25, '0', '0', '0', '0', '', 'str_dex_armour, expert', TRUE),

-- STR/INT
('Intricate Crest Shield', 'Shield', 65, 65, 0, 65, 84, 0, 29, 25, '0', '0', '0', '0', '', 'str_int_armour, expert', TRUE),
('Sekheman Crest Shield', 'Shield', 70, 70, 0, 70, 92, 0, 32, 25, '0', '0', '0', '0', '', 'str_int_armour, expert', TRUE),
('Vaal Crest Shield', 'Shield', 75, 76, 0, 76, 100, 0, 35, 25, '0', '0', '0', '0', '', 'str_int_armour, expert', TRUE),

-- Focus
-- \\
('Druidic Focus', 'Focus', 65, 0, 0, 118, 0, 0, 52, 0, '0', '0', '0', '0', '', 'int_armour, expert', TRUE),
('Leyline Focus', 'Focus', 70, 0, 0, 129, 0, 0, 58, 0, '0', '0', '0', '0', '', 'int_armour, expert', TRUE),
('Sacred Focus', 'Focus', 75, 0, 0, 139, 0, 0, 63, 0, '0', '0', '0', '0', '', 'int_armour, expert', TRUE),

-- One Hand Axe
-- \\
('Dread Hatchet', 'One Hand Axe', 65, 116, 45, 0, 0, 0, 0, 0, '34-79', '5%', '1.5', '1.1', '', 'one_hand_weapon, expert', TRUE),

-- Two Hand Axe
-- \\
('Vile Greataxe', 'Two Hand Axe', 65, 116, 45, 0, 0, 0, 0, 0, '59-155', '5%', '1.2', '1.3', '', 'two_hand_weapon, expert', TRUE),

-- One Hand Mace
-- \\
('Torment Club', 'One Hand Mace', 65, 148, 0, 0, 0, 0, 0, 0, '44-73', '5%', '1.45', '1.1', '', 'one_hand_weapon, expert', FALSE),
('Flanged Mace', 'One Hand Mace', 67, 174, 0, 0, 0, 0, 0, 0, '45-67', '5%', '1.55', '1.1', '', 'one_hand_weapon, expert', TRUE),
('Crown Mace', 'One Hand Mace', 72, 193, 0, 0, 0, 0, 0, 0, '43-89', '5%', '1.4', '1.1', '', 'one_hand_weapon, expert', TRUE),
('Marauding Mace', 'One Hand Mace', 77, 212, 0, 0, 0, 0, 0, 0, '51-84', '5%', '1.45', '1.1', '', 'one_hand_weapon, expert', FALSE),
('Molten Hammer', 'One Hand Mace', 77, 212, 0, 0, 0, 0, 0, 0, '60-100', '5%', '1.45', '1.1', 'Base Fire Damage [50%]', 'one_hand_weapon, expert', TRUE),
('Strife Pick', 'One Hand Mace', 78, 212, 0, 0, 0, 0, 0, 0, '49-66', '7%', '1.45', '1.1', '+(10-15)% to Critical Damage Bonus', 'one_hand_weapon, expert', TRUE),
('Fortified Hammer', 'One Hand Mace', 79, 212, 0, 0, 0, 0, 0, 0, '60-73', '5%', '1.4', '1.1', 'Causes Daze buildup equal to 100% of Damage dealt', 'one_hand_weapon, expert', TRUE),

-- Two Hand Mace
-- \\
('Giant Maul', 'Two Hand Mace', 65, 148, 0, 0, 0, 0, 0, 0, '96-144', '5%', '1.1', '1.3', '', 'two_hand_weapon, expert', FALSE),
('Anvil Maul', 'Two Hand Mace', 67, 174, 0, 0, 0, 0, 0, 0, '112-151', '5%', '1.05', '1.3', '', 'two_hand_weapon, expert', TRUE),
('Sacred Maul', 'Two Hand Mace', 72, 193, 0, 0, 0, 0, 0, 0, '76-158', '5%', '1.2', '1.3', '', 'two_hand_weapon, expert', TRUE),
('Ironwood Greathammer', 'Two Hand Mace', 77, 212, 0, 0, 0, 0, 0, 0, '94-174', '5%', '1.05', '1.3', 'Causes (30-50)% increased Stun Buildup', 'two_hand_weapon, expert', TRUE),
('Massive Greathammer', 'Two Hand Mace', 77, 212, 0, 0, 0, 0, 0, 0, '119-161', '5%', '1.1', '1.3', '', 'two_hand_weapon, expert', TRUE),
('Fanatic Greathammer', 'Two Hand Mace', 78, 212, 0, 0, 0, 0, 0, 0, '89-120', '5%', '1.05', '1.3', 'Strikes deal Splash damage to targets within 1.5 metres', 'two_hand_weapon, expert', TRUE),
('Ruination Maul', 'Two Hand Mace', 79, 212, 0, 0, 0, 0, 0, 0, '113-138', '5%', '1.1', '1.3', 'Causes Enemies to Explode on Critical kill, for 10% of their Life as Physical Damage', 'two_hand_weapon, expert', TRUE),

-- One Hand Sword
-- \\
('Dark Blade', 'One Hand Sword', 65, 81, 81, 0, 0, 0, 0, 0, '43-65', '5%', '1.55', '1.1', '', 'one_hand_weapon, expert', TRUE),

-- Two Hand Sword
-- \\
('Ultra Greatblade', 'Two Hand Sword', 65, 81, 81, 0, 0, 0, 0, 0, '72-119', '5%', '1.3', '1.3', '', 'two_hand_weapon, expert', TRUE),

-- Claw
-- \\
('Talon Claw', 'Claw', 65, 0, 148, 0, 0, 0, 0, 0, '23-79', '5%', '1.65', '1.1', '', 'one_hand_weapon, expert', TRUE),

-- Dagger
-- \\
('Cinquedea', 'Dagger', 65, 0, 81, 81, 0, 0, 0, 0, '21-62', '15%', '1.55', '1', '', 'one_hand_weapon, expert', TRUE),

-- Flail
-- \\
('Abyssal Flail', 'Flail', 65, 116, 0, 45, 0, 0, 0, 0, '36-66', '10%', '1.45', '1.1', '', 'one_hand_weapon, expert', TRUE),

-- Spear
-- \\
('Helix Spear', 'Spear', 65, 45, 116, 0, 0, 0, 0, 0, '37-68', '5%', '1.6', '1.5', '', 'one_hand_weapon, expert', TRUE),
('Orichalcum Spear', 'Spear', 67, 53, 135, 0, 0, 0, 0, 0, '38-70', '5%', '1.6', '1.5', '', 'one_hand_weapon, expert', TRUE),
('Pronged Spear', 'Spear', 72, 59, 150, 0, 0, 0, 0, 0, '40-75', '5%', '1.6', '1.5', '', 'one_hand_weapon, expert', TRUE),
('Spiked Spear', 'Spear', 77, 64, 165, 0, 0, 0, 0, 0, '41-76', '6.5%', '1.6', '1.5', '', 'one_hand_weapon, expert', TRUE),
('Stalking Spear', 'Spear', 77, 64, 165, 0, 0, 0, 0, 0, '44-82', '5%', '1.6', '1.5', '(15-25)% chance to Maim on Hit', 'one_hand_weapon, expert', TRUE),
('Flying Spear', 'Spear', 78, 64, 165, 0, 0, 0, 0, 0, '41-76', '5%', '1.6', '1.5', '(25-35)% increased Projectile Speed with this Weapon', 'one_hand_weapon, expert', TRUE),
('Grand Spear', 'Spear', 79, 64, 165, 0, 0, 0, 0, 0, '46-85', '5%', '1.5', '1.5', '', 'one_hand_weapon, expert', TRUE),

-- Bow
-- \\
('Ironwood Shortbow', 'Bow', 67, 0, 174, 0, 0, 0, 0, 0, '41-76', '5%', '1.25', '', '', 'one_hand_weapon, bow, expert', TRUE),
('Calvary Bow', 'Bow', 72, 0, 193, 0, 0, 0, 0, 0, '49-82', '5%', '1.2', '', '', 'one_hand_weapon, bow, expert', TRUE),
('Guardian Bow', 'Bow', 77, 0, 212, 0, 0, 0, 0, 0, '53-80', '5%', '1.15', '', '(20-30)% chance to Chain an additional time', 'one_hand_weapon, bow, expert', TRUE),
('Warmonger Bow', 'Bow', 77, 0, 212, 0, 0, 0, 0, 0, '56-84', '5%', '1.2', '', '', 'one_hand_weapon, bow, expert', TRUE),
('Gemini Bow', 'Bow', 78, 0, 212, 0, 0, 0, 0, 0, '39-73', '5%', '1.2', '', 'Bow Attacks fire an additional Arrow', 'one_hand_weapon, bow, expert', TRUE),
('Fanatic Bow', 'Bow', 79, 0, 212, 0, 0, 0, 0, 0, '52-87', '5%', '1.2', '', 'Base Chaos Damage [100%]', 'one_hand_weapon, bow, expert', TRUE),

-- Crossbow
-- \\
('Stout Crossbow', 'Crossbow', 67, 95, 95, 0, 0, 0, 0, 0, '30-119', '5%', '1.55', '.75', '', 'two_hand_weapon, expert', TRUE),
('Engraved Crossbow', 'Crossbow', 72, 106, 106, 0, 0, 0, 0, 0, '31-124', '5%', '1.6', '.80', '', 'two_hand_weapon, expert', TRUE),
('Desolate Crossbow', 'Crossbow', 77, 116, 116, 0, 0, 0, 0, 0, '33-132', '5%', '1.6', '.80', '', 'two_hand_weapon, expert', TRUE),
('Flexed Crossbow', 'Crossbow', 77, 116, 116, 0, 0, 0, 0, 0, '32-127', '5%', '1.6', '.85', '', 'two_hand_weapon, expert', TRUE),
('Gemini Crossbow', 'Crossbow', 78, 116, 116, 0, 0, 0, 0, 0, '28-112', '5%', '1.6', '1.1', 'Loads an additional bolt', 'two_hand_weapon, expert', TRUE),
('Siege Crossbow', 'Crossbow', 79, 116, 116, 0, 0, 0, 0, 0, '29-115', '5%', '1.65', '.75', 'Grenade Skills Fire an additional Projectile', 'two_hand_weapon, expert', TRUE),

-- Quarterstaff
-- \\
('Sinister Quarterstaff', 'Quarterstaff', 67, 0, 135, 53, 0, 0, 0, 0, '55-92', '11.5%', '1.4', '1.3', '', 'two_hand_weapon, expert', TRUE),
('Lunar Quarterstaff', 'Quarterstaff', 72, 0, 150, 59, 0, 0, 0, 0, '50-103', '10%', '1.5', '1.3', '', 'two_hand_weapon, expert', TRUE),
('Razor Quarterstaff', 'Quarterstaff', 77, 0, 165, 64, 0, 0, 0, 0, '65-108', '10%', '1.4', '1.3', '', 'two_hand_weapon, expert', TRUE),
('Striking Quarterstaff', 'Quarterstaff', 77, 0, 165, 64, 0, 0, 0, 0, '53-111', '10%', '1.4', '1.3', '16% increased Melee Strike Range with this weapon', 'two_hand_weapon, expert', TRUE),
('Bolting Quarterstaff', 'Quarterstaff', 78, 0, 165, 64, 0, 0, 0, 0, '43-172', '10%', '1.4', '1.3', 'Base Lightning Damage [100%]', 'two_hand_weapon, expert', TRUE),
('Aegis Quarterstaff', 'Quarterstaff', 79, 0, 165, 64, 0, 0, 0, 0, '58-97', '10.0%', '1.40', '1.3', '+(10-15)% to Block Chance', 'two_hand_weapon, expert', TRUE),

-- \\
-- Non-Martial Weapons
-- \\

-- Staff
-- \\
('Ashen Staff', 'Staff', 1, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (1-20) Firebolt', 'two_hand_weapon, expert', TRUE),
('Gelid Staff', 'Staff', 2, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (1-20) Freezing Shards', 'two_hand_weapon, expert', TRUE),
('Voltaic Staff', 'Staff', 2, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (1-20) Lightning Bolt', 'two_hand_weapon, expert', TRUE),
('Pyrophyte Staff', 'Staff', 16, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (5-20) Living Bomb', 'two_hand_weapon, expert', TRUE),
('Chiming Staff', 'Staff', 25, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (7-20) Sigil of Power', 'two_hand_weapon, expert', TRUE),
('Reaping Staff', 'Staff', 38, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (10-20) Reap', 'two_hand_weapon, expert', FALSE),

-- Wand
-- \\
('Withered Wand', 'Wand', 1, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (1-20) Chaos Bolt', 'one_hand_weapon, expert', TRUE),
('Attuned Wand', 'Wand', 2, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (1-20) Mana Drain', 'one_hand_weapon, expert', TRUE),
('Bone Wand', 'Wand', 2, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (1-20) Bone Blast', 'one_hand_weapon, expert', TRUE),
('Siphoning Wand', 'Wand', 11, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (3-20) Power Siphon', 'one_hand_weapon, expert', TRUE),
('Volatile Wand', 'Wand', 16, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (5-20) Volatile Dead', 'one_hand_weapon, expert', TRUE),
('Acrid Wand', 'Wand', 33, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (9-20) Decompose', 'one_hand_weapon, expert', TRUE),
('Offering Wand', 'Wand', 33, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (10-20) Exsanguinate', 'one_hand_weapon, expert', FALSE),

-- Sceptre
-- \\
('Rattling Sceptre', 'Sceptre', 1, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (1-20) Skeletal Warrior Minion', 'one_hand_weapon, expert', TRUE),
('Stoic Sceptre', 'Sceptre', 6, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (2-20) Discipline', 'one_hand_weapon, expert', TRUE),
('Omen Sceptre', 'Sceptre', 16, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (5-20) Malice', 'one_hand_weapon, expert', TRUE),
('Shrine Sceptre PoF', 'Sceptre', 26, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (7-20) Purity of Fire', 'one_hand_weapon, expert', TRUE),
('Shrine Sceptre PoI', 'Sceptre', 26, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (7-20) Purity of Ice', 'one_hand_weapon, expert', TRUE),
('Shrine Sceptre PoL', 'Sceptre', 26, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (7-20) Purity of Lightning', 'one_hand_weapon, expert', TRUE),
('Devouring Sceptre', 'Sceptre', 33, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'Grants Skill: Level (10-20) Feast of Flesh', 'one_hand_weapon, expert', FALSE),

-- \\
-- Quivers
-- \\
('Broadhead Quiver', 'Quiver', 1, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', 'Adds 1 to 3 Physical Damage to Attacks', 'quiver, novice', TRUE),
('Fire Quiver', 'Quiver', 8, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', 'Adds 3 to 5 Fire Damage to Attacks', 'quiver, novice', TRUE),
('Sacral Quiver', 'Quiver', 16, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', 'Gain (2-3) Life per Enemy Hit with Attacks', 'quiver, novice', TRUE),
('Two-Point Quiver', 'Quiver', 24, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(20-30)% increased accuracy rating', 'quiver, expert', TRUE),
('Blunt Quiver', 'Quiver', 33, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(20-30)% reduced Enemy Stun Threshold', 'quiver, expert', TRUE),
('Toxic Quiver', 'Quiver', 39, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(10-15)% chance to poison with attacks', 'quiver, expert', TRUE),
('Serrated Quiver', 'Quiver', 44, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', 'Attacks have (10-15)% chance to cause bleeding', 'quiver, expert', TRUE),
('Primed Quiver', 'Quiver', 51, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(7-10)% increased attack speed', 'quiver, expert', TRUE),
('Penetrating Quiver', 'Quiver', 55, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '100% chance to pierce an enemy', 'quiver, expert', TRUE),
('Volant Quiver', 'Quiver', 61, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(20-30)% increased arrow speed', 'quiver, expert', TRUE),
('Visceral Quiver', 'Quiver', 65, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(20-30)% increased Critical Hit Chance for Attacks', 'quiver, expert', TRUE),

-- \\
-- Jewelry
-- \\

-- Amulet
('Azure Amulet', 'Amulet', 1, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(20-30)% increased Mana Regeneration Rate', 'amulet', TRUE),
('Crimson Amulet', 'Amulet', 1, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(2-4) Life Regeneration per second', 'amulet', TRUE),
('Amber Amulet', 'Amulet', 8, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(10-15) to Strength', 'amulet', TRUE),
('Jade Amulet', 'Amulet', 8, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(10-15) to Dexterity', 'amulet', TRUE),
('Lapis Amulet', 'Amulet', 8, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(10-15) to Intelligence', 'amulet', TRUE),
('Lunar Amulet', 'Amulet', 14, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(20-30) to Maximum Energy Shield', 'amulet', TRUE),
('Bloodstone Amulet', 'Amulet', 18, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(30-40) to maximum Life', 'amulet', TRUE),
('Stellar Amulet', 'Amulet', 25, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(5-7) to all Attributes', 'amulet', TRUE),
('Solar Amulet', 'Amulet', 30, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(10-15) to Spirit', 'amulet', TRUE),
('Gold Amulet', 'Amulet', 35, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(12-20)% increased Rarity of Items found', 'amulet', TRUE),
('Dusk Amulet', 'Amulet', 45, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+1 Prefix Modifier allowed, -1 Suffix Modifier Allowed', 'amulet', TRUE),
('Gloam Amulet', 'Amulet', 45, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '-1 Prefix Modifier allowed, +1 Suffix Modifier Allowed', 'amulet', TRUE),
('Penumbra Amulet', 'Amulet', 45, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+2 Prefix Modifier allowed, -2 Suffix Modifier Allowed', 'amulet', TRUE),
('Tenebrous Amulet', 'Amulet', 45, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '-2 Prefix Modifier allowed, +2 Suffix Modifier Allowed', 'amulet', TRUE),


-- Ring
('Iron Ring', 'Ring', 1, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', 'Adds 1 to 4 Physical Damage to Attacks', 'ring', TRUE),
('Lazuli Ring', 'Ring', 1, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(20-30) to maximum Mana', 'ring', TRUE),
('Ruby Ring', 'Ring', 8, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(20-30)% to Fire Resistance', 'ring', TRUE),
('Sapphire Ring', 'Ring', 12, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(20-30)% to Cold Resistance', 'ring', TRUE),
('Topaz Ring', 'Ring', 16, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(20-30)% to Lightning Resistance', 'ring', TRUE),
('Amethyst Ring', 'Ring', 20, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(7-13)% to Chaos Resistance', 'ring', TRUE),
('Emerald Ring', 'Ring', 26, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(120-160) to Accuracy Rating', 'ring', TRUE),
('Pearl Ring', 'Ring', 32, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(7-10)% increased Cast Speed', 'ring', TRUE),
('Prismatic Ring', 'Ring', 35, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(7-10) to all Elemental Resistances', 'ring', TRUE),
('Breach Ring', 'Ring', 40, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', 'Maximum Quality is 40%', 'ring', TRUE),
('Gold Ring', 'Ring', 40, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(6-15)% increased Rarity of Items found', 'ring', TRUE),
('Unset Ring', 'Ring', 44, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', 'Grants 1 additional Skill Slot', 'ring', TRUE),
('Dusk Ring', 'Ring', 45, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+1 Prefix Modifier allowed, -1 Suffix Modifier Allowed', 'ring', TRUE),
('Gloam Ring', 'Ring', 45, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '-1 Prefix Modifier allowed, +1 Suffix Modifier Allowed', 'ring', TRUE),
('Penumbra Ring', 'Ring', 45, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+2 Prefix Modifier allowed, -2 Suffix Modifier Allowed', 'ring', TRUE),
('Tenebrous Ring', 'Ring', 45, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '-2 Prefix Modifier allowed, +2 Suffix Modifier Allowed', 'ring', TRUE),


-- Belt
('Linen Belt', 'Belt', 1, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(20-30)% increased Mana Recovery from Flasks', 'belt', TRUE),
('Rawhide Belt', 'Belt', 1, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(20-30)% increased Life Recovery from Flasks', 'belt', TRUE),
('Wide Belt', 'Belt', 14, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(20-30)% increased Flask Charges Gained', 'belt', TRUE),
('Long Belt', 'Belt', 20, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(15-20)% increased Charm Effect Duration', 'belt', TRUE),
('Plate Belt', 'Belt', 25, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '+(100-140) to Armour', 'belt', TRUE),
('Ornate Belt', 'Belt', 31, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(10-15)% reduced Charm Charges Used', 'belt', TRUE),
('Mail Belt', 'Belt', 40, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(10-15)% reduced Flask Charges used', 'belt', TRUE),
('Double Belt', 'Belt', 44, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(20-30)% increased Charm Charges gained', 'belt', TRUE),
('Heavy Belt', 'Belt', 50, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '(20-30)% increased Stun Threshold', 'belt', TRUE),
('Utility Belt', 'Belt', 55, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '20% of Flask Recovery applied Instantly', 'belt', TRUE),
('Fine Belt', 'Belt', 62, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', 'Flasks gain 0.17 charges per Second', 'belt', TRUE),

-- \\
-- Jewels
-- \\
('Diamond', 'Jewel', 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', 'Limited to 3 Explicits 1 per Type of Jewel', 'jewel', TRUE),
('Emerald', 'Jewel', 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '', 'jewel', TRUE),
('Ruby', 'Jewel', 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '', 'jewel', TRUE),
('Sapphire', 'Jewel', 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '0', '0', '', 'jewel', TRUE);

INSERT INTO items (id, item_name, base_type, ilvl, enchant, sockets, implicit, prefix1, p1v1, p1v2, p1v3, prefix2, p2v1, p2v2, p2v3, prefix3, p3v1, p3v2, p3v3, suffix1, s1v, suffix2, s2v, suffix3, s3v) VALUES
(1, 'Onslaught Beam', 'Aegis Quarterstaff', 80, '', 0, 15, 'RazorSharp', 27, 51, 0, 'Squire', 19, 20, 0, 'Humming', 1, 9, 0, 'Mastery', 12, 'Success', 6, 'Pugilist', 30),
(2, 'Loath Skin', 'Votive Raiment', 80, '', 0, 0, 'Glimmering', 21, 0, 0, 'Resolute', 53, 0, 0, 'Monk', 9, 9, 0, 'Prodigy', 15, 'Drake', 18, 'Apt', 20),
(3, 'Entropy Strap', 'Heavy Belt', 80, '', 0, 25, '', 0, 0, 0, '', 0, 0, 0, '', 0, 0, 0, 'Gorilla', 24, '', 0, '', 0);