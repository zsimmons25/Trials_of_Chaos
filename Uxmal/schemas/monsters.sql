CREATE DATABASE IF NOT EXISTS monsters;
USE monsters;

-- =============================================
-- TABLES for Monsters
-- =============================================

CREATE TABLE IF NOT EXISTS StonecladGorilla (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'Stoneclad Gorilla',
    category VARCHAR(50) DEFAULT 'monster',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT, model_size TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);

CREATE TABLE IF NOT EXISTS CrestedBehemoth (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'Crested Behemoth',
    category VARCHAR(50) DEFAULT 'monster',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT, model_size TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);

CREATE TABLE IF NOT EXISTS CerebralBat (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'Cerebral Bat',
    category VARCHAR(50) DEFAULT 'monster',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);

CREATE TABLE IF NOT EXISTS PetulantStonemaw (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'Petulant Stonemaw',
    category VARCHAR(50) DEFAULT 'monster',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);

CREATE TABLE IF NOT EXISTS ScuteLizard (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'Scute Lizard',
    category VARCHAR(50) DEFAULT 'monster',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);

CREATE TABLE IF NOT EXISTS SaurianServant (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'Saurian Servant',
    category VARCHAR(50) DEFAULT 'monster',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);

CREATE TABLE IF NOT EXISTS BloodriteGuard2H (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'Bloodrite Guard 2H',
    category VARCHAR(50) DEFAULT 'monster',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);

CREATE TABLE IF NOT EXISTS BloodriteGuardDW (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'Bloodrite Guard DW',
    category VARCHAR(50) DEFAULT 'monster',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);

CREATE TABLE IF NOT EXISTS ChaosZealotDagger (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'Chaos Zealot Dagger',
    category VARCHAR(50) DEFAULT 'monster',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);

CREATE TABLE IF NOT EXISTS ChaosZealotSpear (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'Chaos Zealot Spear',
    category VARCHAR(50) DEFAULT 'monster',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);

CREATE TABLE IF NOT EXISTS BloodritePriest (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'Bloodrite Priest',
    category VARCHAR(50) DEFAULT 'monster',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);

-- Bosses
CREATE TABLE IF NOT EXISTS BahlakTheSkySeer (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'Bahlak, the Sky Seer',
    category VARCHAR(50) DEFAULT 'boss',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);

CREATE TABLE IF NOT EXISTS ChetzaTheFeatheredPlague (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'Chetza, the Feathered Plague',
    category VARCHAR(50) DEFAULT 'boss',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);

CREATE TABLE IF NOT EXISTS UxmalTheBeastlord (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'Uxmal, the Beastlord',
    category VARCHAR(50) DEFAULT 'boss',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);

-- Pinnacle Boss
CREATE TABLE IF NOT EXISTS TheTrialmaster (
    level INTEGER PRIMARY KEY,
    display_name VARCHAR(255) DEFAULT 'The Trialmaster',
    category VARCHAR(50) DEFAULT 'pinnacle',
    base_life INTEGER, base_armour INTEGER, base_evasion INTEGER, base_damage INTEGER, base_spell_damage INTEGER, base_accuracy INTEGER, base_attack_time REAL, base_experience INTEGER,
    life_percent TEXT, es_life_percent TEXT, armour_bonus TEXT, evasion_bonus TEXT, damage_percent TEXT, accuracy_percent TEXT, crit_chance TEXT, crit_damage_bonus TEXT, attack_distance TEXT, damage_spread TEXT, experience_percent TEXT,
    res_fire TEXT, res_cold TEXT, res_lightning TEXT, res_chaos TEXT,
    type VARCHAR(100), skills JSON
);


-- =============================================
-- INSERT DATA for Stoneclad Gorilla
-- =============================================

-- Stoneclad Gorilla Level 80
INSERT INTO StonecladGorilla (
    level, 
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80, 
    15609, 4803, 644, 334, 334, 1602, 1.5, 100000,
    '250%', '0%', '+66%', '+0%', '250%', '100%', '5%', '+30%', '8 ~ 15', '±20%', '250%',
    '0%', '0%', '0%', '0%',
    'ChaosGodGorilla',
        '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "668–1001",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodGorillaLeapSlam",
        "name": "Leap Slam",
        "description": "Leap Slam, damage increases towards the centre.",
        "stats": {
          "damage": "668–1001",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "damageModifier": "65% (35% less)",
          "notes": "+100% Final Damage at Centre"
        }
      },
      {
        "id": "ChaosGodGorillaExtraAttackDistance",
        "name": "Empowered Basic Attack",
        "description": "Basic attack with increased range, knockback, and maim.",
        "stats": {
          "damage": "668–1001",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "5 sec",
          "knockback": "50% increased distance",
          "maim": "On Hit"
        }
      },
      {
        "id": "ChaosGodGorillaSlam",
        "name": "Chaos Slam",
        "description": "Slams the ground, dealing area damage. Converts 80% of Physical Damage to Chaos. Damage increases towards the centre.",
        "stats": {
          "damage": "668–1001",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "11 sec",
          "conversion": "80% Phys to Chaos",
          "notes": "+150% Final Damage at Centre"
        }
      }
    ]'
);

-- Stoneclad Gorilla Level 79
INSERT INTO StonecladGorilla (
    level, 
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    79, 
    14725, 4540, 628, 324, 324, 1552, 1.5, 81664,
    '250%', '0%', '+66%', '+0%', '250%', '100%', '5%', '+30%', '8 ~ 15', '±20%', '250%',
    '0%', '0%', '0%', '0%',
    'ChaosGodTriceratops',
           '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "648-973",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodGorillaLeapSlam",
        "name": "Leap Slam",
        "description": "Leap Slam, damage increases towards the centre.",
        "stats": {
          "damage": "648-973",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "damageModifier": "65% (35% less)",
          "notes": "+100% Final Damage at Centre"
        }
      },
      {
        "id": "ChaosGodGorillaExtraAttackDistance",
        "name": "Empowered Basic Attack",
        "description": "Basic attack with increased range, knockback, and maim.",
        "stats": {
          "damage": "648-973",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "5 sec",
          "knockback": "50% increased distance",
          "maim": "On Hit"
        }
      },
      {
        "id": "ChaosGodGorillaSlam",
        "name": "Chaos Slam",
        "description": "Slams the ground, dealing area damage. Converts 80% of Physical Damage to Chaos. Damage increases towards the centre.",
        "stats": {
          "damage": "648-973",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "11 sec",
          "conversion": "80% Phys to Chaos",
          "notes": "+150% Final Damage at Centre"
        }
      }
    ]'
);

-- Stoneclad Gorilla Level 78
INSERT INTO StonecladGorilla (
    level, 
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    78, 
    13892, 4290, 613, 315, 315, 1504, 1.5, 74226,
    '250%', '0%', '+66%', '+0%', '250%', '100%', '5%', '+30%', '8 ~ 15', '±20%', '250%',
    '0%', '0%', '0%', '0%',
    'ChaosGodGorilla',
            '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "630-945",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodGorillaLeapSlam",
        "name": "Leap Slam",
        "description": "Leap Slam, damage increases towards the centre.",
        "stats": {
          "damage": "630-945",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "damageModifier": "65% (35% less)",
          "notes": "+100% Final Damage at Centre"
        }
      },
      {
        "id": "ChaosGodGorillaExtraAttackDistance9",
        "name": "Empowered Basic Attack",
        "description": "Basic attack with increased range, knockback, and maim.",
        "stats": {
          "damage": "630-945",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "5 sec",
          "knockback": "50% increased distance",
          "maim": "On Hit"
        }
      },
      {
        "id": "ChaosGodGorillaSlam",
        "name": "Chaos Slam",
        "description": "Slams the ground, dealing area damage. Converts 80% of Physical Damage to Chaos. Damage increases towards the centre.",
        "stats": {
          "damage": "630-945",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "11 sec",
          "conversion": "80% Phys to Chaos",
          "notes": "+150% Final Damage at Centre"
        }
      }
    ]'
);

-- Stoneclad Gorilla Level 77
INSERT INTO StonecladGorilla (
    level, 
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    77, 
    13105, 4053, 598, 306, 306, 1457, 1.5, 67522,
    '250%', '0%', '+66%', '+0%', '250%', '100%', '5%', '+30%', '8 ~ 15', '±20%', '250%',
    '0%', '0%', '0%', '0%',
    'ChaosGodGorilla',
            '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "611-917",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodGorillaLeapSlam",
        "name": "Leap Slam",
        "description": "Leap Slam, damage increases towards the centre.",
        "stats": {
          "damage": "611-917",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "damageModifier": "65% (35% less)",
          "notes": "+100% Final Damage at Centre"
        }
      },
      {
        "id": "ChaosGodGorillaExtraAttackDistance",
        "name": "Empowered Basic Attack",
        "description": "Basic attack with increased range, knockback, and maim.",
        "stats": {
          "damage": "611-917",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "5 sec",
          "knockback": "50% increased distance",
          "maim": "On Hit"
        }
      },
      {
        "id": "ChaosGodGorillaSlam",
        "name": "Chaos Slam",
        "description": "Slams the ground, dealing area damage. Converts 80% of Physical Damage to Chaos. Damage increases towards the centre.",
        "stats": {
          "damage": "611-917",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "11 sec",
          "conversion": "80% Phys to Chaos",
          "notes": "+150% Final Damage at Centre"
        }
      }
    ]'
);

-- Stoneclad Gorilla Level 76
INSERT INTO StonecladGorilla (
    level, 
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    76, 
    12363, 3829, 584, 297, 297, 1412, 1.5, 61373,
    '250%', '0%', '+66%', '+0%', '250%', '100%', '5%', '+30%', '8 ~ 15', '±20%', '250%',
    '0%', '0%', '0%', '0%',
    'ChaosGodGorilla',
            '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "594-890",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodGorillaLeapSlam",
        "name": "Leap Slam",
        "description": "Leap Slam, damage increases towards the centre.",
        "stats": {
          "damage": "594-890",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "damageModifier": "65% (35% less)",
          "notes": "+100% Final Damage at Centre"
        }
      },
      {
        "id": "ChaosGodGorillaExtraAttackDistance",
        "name": "Empowered Basic Attack",
        "description": "Basic attack with increased range, knockback, and maim.",
        "stats": {
          "damage": "594-890",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "5 sec",
          "knockback": "50% increased distance",
          "maim": "On Hit"
        }
      },
      {
        "id": "ChaosGodGorillaSlam",
        "name": "Chaos Slam",
        "description": "Slams the ground, dealing area damage. Converts 80% of Physical Damage to Chaos. Damage increases towards the centre.",
        "stats": {
          "damage": "594-890",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "11 sec",
          "conversion": "80% Phys to Chaos",
          "notes": "+150% Final Damage at Centre"
        }
      }
    ]'
);

-- Stoneclad Gorilla Level 75
INSERT INTO StonecladGorilla (
    level, 
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    75, 
    11664, 3617, 570, 288, 288, 1368, 1.5, 55765,
    '250%', '0%', '+66%', '+0%', '250%', '100%', '5%', '+30%', '8 ~ 15', '±20%', '250%',
    '0%', '0%', '0%', '0%',
    'ChaosGodGorilla',
            '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "576-864",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodGorillaLeapSlam",
        "name": "Leap Slam",
        "description": "Leap Slam, damage increases towards the centre.",
        "stats": {
          "damage": "576-864",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "damageModifier": "65% (35% less)",
          "notes": "+100% Final Damage at Centre"
        }
      },
      {
        "id": "ChaosGodGorillaExtraAttackDistance",
        "name": "Empowered Basic Attack",
        "description": "Basic attack with increased range, knockback, and maim.",
        "stats": {
          "damage": "576-864",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "5 sec",
          "knockback": "50% increased distance",
          "maim": "On Hit"
        }
      },
      {
        "id": "ChaosGodGorillaSlam",
        "name": "Chaos Slam",
        "description": "Slams the ground, dealing area damage. Converts 80% of Physical Damage to Chaos. Damage increases towards the centre.",
        "stats": {
          "damage": "576-864",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "11 sec",
          "conversion": "80% Phys to Chaos",
          "notes": "+150% Final Damage at Centre"
        }
      }
    ]'
);

-- Stoneclad Gorilla Level 40
INSERT INTO StonecladGorilla (
    level, 
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    40, 
    1253, 418, 206, 90, 90, 403, 1.5, 4259,
    '250%', '0%', '+66%', '+0%', '250%', '100%', '5%', '+30%', '8 ~ 15', '±20%', '250%',
    '0%', '0%', '0%', '0%',
    'ChaosGodGorilla',
            '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "180-270",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodGorillaLeapSlam",
        "name": "Leap Slam",
        "description": "Leap Slam, damage increases towards the centre.",
        "stats": {
          "damage": "180-270",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "damageModifier": "65% (35% less)",
          "notes": "+100% Final Damage at Centre"
        }
      },
      {
        "id": "ChaosGodGorillaExtraAttackDistance",
        "name": "Empowered Basic Attack",
        "description": "Basic attack with increased range, knockback, and maim.",
        "stats": {
          "damage": "180-270",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "5 sec",
          "knockback": "50% increased distance",
          "maim": "On Hit"
        }
      },
      {
        "id": "ChaosGodGorillaSlam",
        "name": "Chaos Slam",
        "description": "Slams the ground, dealing area damage. Converts 80% of Physical Damage to Chaos. Damage increases towards the centre.",
        "stats": {
          "damage": "180–270",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "11 sec",
          "conversion": "80% Phys to Chaos",
          "notes": "+150% Final Damage at Centre"
        }
      }
    ]'
);

-- =============================================
-- INSERT DATA for Crested Behemoth
-- =============================================

-- Crested Behemoth Level 80
INSERT INTO CrestedBehemoth (
    level, 
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80, 
    15609, 4803, 644, 334, 334, 1602, 3.0, 100000,
    '330%', '0%', '+100%', '+0%', '330%', '100%', '5%', '+30%', '9 ~ 20', '±20%', '330%',
    '0%', '0%', '30%', '0%',
    'ChaosGodTriceratops',
    '[
      {
        "id": "ChaosGodTriceratopsTailSlam",
        "name": "Tail Slam",
        "description": "Slams its tail, dealing area damage. Damage increases towards the centre. Converts 50% of Physical Damage to Lightning.",
        "stats": {
          "damage": "881–1322",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "12 sec",
          "conversion": "50% Phys to Lightning",
          "notes": "+80% Final Damage at Centre"
        }
      },
      {
        "id": "ChaosGodTriceratops180GroundSlam",
        "name": "180 Ground Slam",
        "description": "Performs a wide ground slam, dealing area damage. Deals 10% less Attack Damage. Converts 60% of Physical Damage to Lightning.",
        "stats": {
          "damage": "881–1322",
          "damageModifier": "90% (10% less)",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "8 sec",
          "conversion": "60% Phys to Lightning"
        }
      },
      {
        "id": "ChaosGodTriceratops",
        "name": "Charge",
        "description": "Charges at an enemy, bashing, stunning, and knocking it back. Pushes enemies aside. Damage/stun scales with distance. Deals 30% less Attack Damage. Converts 50% of Physical Damage to Lightning.",
        "stats": {
          "damage": "881–1322",
          "damageModifier": "70% (30% less)",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "18 sec",
          "conversion": "50% Phys to Lightning"
        }
      },
      {
        "id": "ChaosGodTriceratopsGigaBeam",
        "name": "Giga Beam",
        "description": "Fires a beam dealing Lightning area damage.",
        "stats": {
          "damage": "102–306 Lightning",
          "critChance": "6%",
          "castTime": "1 sec",
          "cooldown": "15 sec"
        }
      }
    ]'
);

-- Crested Behemoth Level 79
INSERT INTO CrestedBehemoth (
    level, 
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    79, 
    14725, 4540, 628, 324, 324, 1552, 3.0, 81664,
    '330%', '0%', '+100%', '+0%', '330%', '100%', '5%', '+30%', '9 ~ 20', '±20%', '330%',
    '0%', '0%', '30%', '0%',
    'ChaosGodTriceratops',
    '[
      {
        "id": "ChaosGodTriceratopsTailSlam",
        "name": "Tail Slam",
        "description": "Slams its tail, dealing area damage. Damage increases towards the centre. Converts 50% of Physical Damage to Lightning.",
        "stats": {
          "damage": "856–1284",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "12 sec",
          "conversion": "50% Phys to Lightning",
          "notes": "+80% Final Damage at Centre"
        }
      },
      {
        "id": "ChaosGodTriceratops180GroundSlam",
        "name": "180 Ground Slam",
        "description": "Performs a wide ground slam, dealing area damage. Deals 10% less Attack Damage. Converts 60% of Physical Damage to Lightning.",
        "stats": {
          "damage": "856–1284",
          "damageModifier": "90% (10% less)",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "8 sec",
          "conversion": "60% Phys to Lightning"
        }
      },
      {
        "id": "ChaosGodTriceratops",
        "name": "Charge",
        "description": "Charges at an enemy, bashing, stunning, and knocking it back. Pushes enemies aside. Damage/stun scales with distance. Deals 30% less Attack Damage. Converts 50% of Physical Damage to Lightning.",
        "stats": {
          "damage": "856–1284",
          "damageModifier": "70% (30% less)",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "18 sec",
          "conversion": "50% Phys to Lightning"
        }
      },
      {
        "id": "ChaosGodTriceratopsGigaBeam",
        "name": "Giga Beam",
        "description": "Fires a beam dealing Lightning area damage.",
        "stats": {
          "damage": "99-298 Lightning",
          "critChance": "6%",
          "castTime": "1 sec",
          "cooldown": "15 sec"
        }
      }
    ]'
);

-- Crested Behemoth Level 78
INSERT INTO CrestedBehemoth (
    level, 
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    78, 
    13892, 4290, 613, 315, 315, 1504, 3.0, 74226,
    '330%', '0%', '+100%', '+0%', '330%', '100%', '5%', '+30%', '9 ~ 20', '±20%', '330%',
    '0%', '0%', '30%', '0%',
    'ChaosGodTriceratops',
    '[
      {
        "id": "ChaosGodTriceratopsTailSlam",
        "name": "Tail Slam",
        "description": "Slams its tail, dealing area damage. Damage increases towards the centre. Converts 50% of Physical Damage to Lightning.",
        "stats": {
          "damage": "831–1247",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "12 sec",
          "conversion": "50% Phys to Lightning",
          "notes": "+80% Final Damage at Centre"
        }
      },
      {
        "id": "ChaosGodTriceratops180GroundSlam",
        "name": "180 Ground Slam",
        "description": "Performs a wide ground slam, dealing area damage. Deals 10% less Attack Damage. Converts 60% of Physical Damage to Lightning.",
        "stats": {
          "damage": "831–1247",
          "damageModifier": "90% (10% less)",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "8 sec",
          "conversion": "60% Phys to Lightning"
        }
      },
      {
        "id": "ChaosGodTriceratops",
        "name": "Charge",
        "description": "Charges at an enemy, bashing, stunning, and knocking it back. Pushes enemies aside. Damage/stun scales with distance. Deals 30% less Attack Damage. Converts 50% of Physical Damage to Lightning.",
        "stats": {
          "damage": "831–1247",
          "damageModifier": "70% (30% less)",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "18 sec",
          "conversion": "50% Phys to Lightning"
        }
      },
      {
        "id": "ChaosGodTriceratopsGigaBeam",
        "name": "Giga Beam",
        "description": "Fires a beam dealing Lightning area damage.",
        "stats": {
          "damage": "96-289 Lightning",
          "critChance": "6%",
          "castTime": "1 sec",
          "cooldown": "15 sec"
        }
      }
    ]'
);

-- Crested Behemoth Level 77
INSERT INTO CrestedBehemoth (
    level, 
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    77, 
    13105, 4053, 598, 306, 306, 1457, 3.0, 67522,
    '330%', '0%', '+100%', '+0%', '330%', '100%', '5%', '+30%', '9 ~ 20', '±20%', '330%',
    '0%', '0%', '30%', '0%',
    'ChaosGodTriceratops',
    '[
      {
        "id": "ChaosGodTriceratopsTailSlam",
        "name": "Tail Slam",
        "description": "Slams its tail, dealing area damage. Damage increases towards the centre. Converts 50% of Physical Damage to Lightning.",
        "stats": {
          "damage": "807–1211",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "12 sec",
          "conversion": "50% Phys to Lightning",
          "notes": "+80% Final Damage at Centre"
        }
      },
      {
        "id": "ChaosGodTriceratops180GroundSlam",
        "name": "180 Ground Slam",
        "description": "Performs a wide ground slam, dealing area damage. Deals 10% less Attack Damage. Converts 60% of Physical Damage to Lightning.",
        "stats": {
          "damage": "807–1211",
          "damageModifier": "90% (10% less)",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "8 sec",
          "conversion": "60% Phys to Lightning"
        }
      },
      {
        "id": "ChaosGodTriceratops",
        "name": "Charge",
        "description": "Charges at an enemy, bashing, stunning, and knocking it back. Pushes enemies aside. Damage/stun scales with distance. Deals 30% less Attack Damage. Converts 50% of Physical Damage to Lightning.",
        "stats": {
          "damage": "807–1211",
          "damageModifier": "70% (30% less)",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "18 sec",
          "conversion": "50% Phys to Lightning"
        }
      },
      {
        "id": "ChaosGodTriceratopsGigaBeam",
        "name": "Giga Beam",
        "description": "Fires a beam dealing Lightning area damage.",
        "stats": {
          "damage": "94-281 Lightning",
          "critChance": "6%",
          "castTime": "1 sec",
          "cooldown": "15 sec)"
        }
      }
    ]'
);

-- Crested Behemoth Level 76
INSERT INTO CrestedBehemoth (
    level, 
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    76, 
    12363, 3829, 584, 297, 297, 1412, 3.0, 61373,
    '330%', '0%', '+100%', '+0%', '330%', '100%', '5%', '+30%', '9 ~ 20', '±20%', '330%',
    '0%', '0%', '30%', '0%',
    'ChaosGodTriceratops',
    '[
      {
        "id": "ChaosGodTriceratopsTailSlam",
        "name": "Tail Slam",
        "description": "Slams its tail, dealing area damage. Damage increases towards the centre. Converts 50% of Physical Damage to Lightning.",
        "stats": {
          "damage": "784–1175",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "12 sec",
          "conversion": "50% Phys to Lightning",
          "notes": "+80% Final Damage at Centre"
        }
      },
      {
        "id": "ChaosGodTriceratops180GroundSlam",
        "name": "180 Ground Slam",
        "description": "Performs a wide ground slam, dealing area damage. Deals 10% less Attack Damage. Converts 60% of Physical Damage to Lightning.",
        "stats": {
          "damage": "784–1175",
          "damageModifier": "90% (10% less)",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "8 sec",
          "conversion": "60% Phys to Lightning"
        }
      },
      {
        "id": "ChaosGodTriceratops",
        "name": "Charge",
        "description": "Charges at an enemy, bashing, stunning, and knocking it back. Pushes enemies aside. Damage/stun scales with distance. Deals 30% less Attack Damage. Converts 50% of Physical Damage to Lightning.",
        "stats": {
          "damage": "784–1175",
          "damageModifier": "70% (30% less)",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "18 sec",
          "conversion": "50% Phys to Lightning"
        }
      },
      {
        "id": "ChaosGodTriceratopsGigaBeam",
        "name": "Giga Beam",
        "description": "Fires a beam dealing Lightning area damage.",
        "stats": {
          "damage": "91-273 Lightning",
          "critChance": "6%",
          "castTime": "1 sec",
          "cooldown": "15 sec"
        }
      }
    ]'
);

-- Crested Behemoth Level 75
INSERT INTO CrestedBehemoth (
    level, 
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    75, 
    11664, 3617, 570, 288, 288, 1368, 3.0, 55765,
    '330%', '0%', '+100%', '+0%', '330%', '100%', '5%', '+30%', '9 ~ 20', '±20%', '330%',
    '0%', '0%', '30%', '0%',
    'ChaosGodTriceratops',
    '[
      {
        "id": "ChaosGodTriceratopsTailSlam",
        "name": "Tail Slam",
        "description": "Slams its tail, dealing area damage. Damage increases towards the centre. Converts 50% of Physical Damage to Lightning.",
        "stats": {
          "damage": "761–1141",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "12 sec",
          "conversion": "50% Phys to Lightning",
          "notes": "+80% Final Damage at Centre"
        }
      },
      {
        "id": "ChaosGodTriceratops180GroundSlam",
        "name": "180 Ground Slam",
        "description": "Performs a wide ground slam, dealing area damage. Deals 10% less Attack Damage. Converts 60% of Physical Damage to Lightning.",
        "stats": {
          "damage": "761–1141",
          "damageModifier": "90% (10% less)",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "8 sec",
          "conversion": "60% Phys to Lightning"
        }
      },
      {
        "id": "ChaosGodTriceratops",
        "name": "Charge",
        "description": "Charges at an enemy, bashing, stunning, and knocking it back. Pushes enemies aside. Damage/stun scales with distance. Deals 30% less Attack Damage. Converts 50% of Physical Damage to Lightning.",
        "stats": {
          "damage": "761–1141",
          "damageModifier": "70% (30% less)",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "18 sec",
          "conversion": "50% Phys to Lightning"
        }
      },
      {
        "id": "ChaosGodTriceratopsGigaBeam",
        "name": "Giga Beam",
        "description": "Fires a beam dealing Lightning area damage.",
        "stats": {
          "damage": "88-265 Lightning",
          "critChance": "6%",
          "castTime": "1 sec",
          "cooldown": "15 sec"
        }
      }
    ]'
);

-- Crested Behemoth Level 40
INSERT INTO CrestedBehemoth (
    level, 
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    40, 
    1253, 418, 206, 90, 90, 403, 3.0, 4259,
    '330%', '0%', '+100%', '+0%', '330%', '100%', '5%', '+30%', '9 ~ 20', '±20%', '330%',
    '0%', '0%', '30%', '0%',
    'ChaosGodTriceratops',
    '[
      {
        "id": "ChaosGodTriceratopsTailSlam",
        "name": "Tail Slam",
        "description": "Slams its tail, dealing area damage. Damage increases towards the centre. Converts 50% of Physical Damage to Lightning.",
        "stats": {
          "damage": "238–356",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "12 sec",
          "conversion": "50% Phys to Lightning",
          "notes": "+80% Final Damage at Centre"
        }
      },
      {
        "id": "ChaosGodTriceratops180GroundSlam",
        "name": "180 Ground Slam",
        "description": "Performs a wide ground slam, dealing area damage. Deals 10% less Attack Damage. Converts 60% of Physical Damage to Lightning.",
        "stats": {
          "damage": "238–356",
          "damageModifier": "90% (10% less)",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "8 sec",
          "conversion": "60% Phys to Lightning"
        }
      },
      {
        "id": "ChaosGodTriceratops",
        "name": "Charge",
        "description": "Charges at an enemy, bashing, stunning, and knocking it back. Pushes enemies aside. Damage/stun scales with distance. Deals 30% less Attack Damage. Converts 50% of Physical Damage to Lightning.",
        "stats": {
          "damage": "238–356",
          "damageModifier": "70% (30% less)",
          "critChance": "5%",
          "attackTime": "3 sec",
          "cooldown": "18 sec",
          "conversion": "50% Phys to Lightning"
        }
      },
      {
        "id": "ChaosGodTriceratopsGigaBeam",
        "name": "Giga Beam",
        "description": "Fires a beam dealing Lightning area damage.",
        "stats": {
          "damage": "28-84 Lightning",
          "critChance": "6%",
          "castTime": "1 sec",
          "cooldown": "15 sec"
        }
      }
    ]'
);


-- =============================================
-- INSERT DATA for Cerebral Bat
-- =============================================

-- Cerebral Bat Level 80
INSERT INTO CerebralBat (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80,
    15609, 4803, 857, 334, 334, 1602, 1.5, 100000,
    '185%', '11%', '+0%', '+33%', '185%', '100%', '6%', '+30%', '7 ~ 10', '±20%', '185%',
    '0%', '30%', '0%', '0%',
    'ChaosGodTriheadBat',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "494–741",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodTriheadBatLeapSlam",
        "name": "Leap Slam",
        "description": "Leap Slam",
        "stats": {
          "damage": "494–741",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodTriheadBatSonicBlastSingle",
        "name": "Sonic Blast",
        "description": "Deals Fire Damage with a high chance to Ignite.",
        "stats": {
          "damage": "108–163 Fire",
          "critChance": "5%",
          "castTime": "1 sec",
          "cooldown": "12.5 sec",
          "igniteChance": "200%"
        }
      },
      {
        "id": "ChaosGodTriheadBatPoisonBlastSingle",
        "name": "Poison Blast",
        "description": "Deals Physical damage with a chance to Poison.",
        "stats": {
          "damage": "87–130 Physical",
          "critChance": "5%",
          "castTime": "1 sec",
          "cooldown": "12.5 sec",
          "poisonChance": "50% on Hit"
        }
      },
      {
        "id": "ChaosGodTriHeadBatPosionSpray",
        "name": "Poison Spray",
        "description": "Fires poison projectiles that pierce all targets.",
        "stats": {
          "damage": "494–741",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "notes": "Pierces all targets."
        }
      },
      {
        "id": "ChaosGodTriheadBatPoisonGround",
        "name": "Poison Ground",
        "description": "Creates a pool dealing Chaos damage over time.",
        "stats": {
          "damagePerSecond": "378 Chaos",
          "duration": "4 sec",
          "castTime": "1 sec"
        }
      }
    ]'
);

-- Cerebral Bat Level 79
INSERT INTO CerebralBat (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    79,
    14725, 4540, 835, 324, 324, 1552, 1.5, 81664,
    '185%', '11%', '+0%', '+33%', '185%', '100%', '6%', '+30%', '7 ~ 10', '±20%', '185%',
    '0%', '30%', '0%', '0%',
    'ChaosGodTriheadBat',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "480–720",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodTriheadBatLeapSlam",
        "name": "Leap Slam",
        "description": "Leap Slam.",
        "stats": {
          "damage": "480–720",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodTriheadBatSonicBlastSingle",
        "name": "Sonic Blast",
        "description": "Deals Fire Damage with a high chance to Ignite.",
        "stats": {
          "damage": "105–158 Fire",
          "critChance": "5%",
          "castTime": "1 sec",
          "cooldown": "12.5 sec",
          "igniteChance": "200%"
        }
      },
      {
        "id": "ChaosGodTriheadBatPoisonBlastSingle",
        "name": "Poison Blast",
        "description": "Deals Physical damage with a chance to Poison.",
        "stats": {
          "damage": "84–127 Physical",
          "critChance": "5%",
          "castTime": "1 sec",
          "cooldown": "12.5 sec",
          "poisonChance": "50% on Hit"
        }
      },
      {
        "id": "ChaosGodTriHeadBatPosionSpray",
        "name": "Poison Spray",
        "description": "Fires poison projectiles that pierce all targets.",
        "stats": {
          "damage": "480–720",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "notes": "Pierces all targets."
        }
      },
      {
        "id": "ChaosGodTriheadBatPoisonGround",
        "name": "Poison Ground",
        "description": "Creates a pool dealing Chaos damage over time.",
        "stats": {
          "damagePerSecond": "367 Chaos",
          "duration": "4 sec",
          "castTime": "1 sec"
        }
      }
    ]'
);

-- Cerebral Bat Level 78
INSERT INTO CerebralBat (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    78,
    13892, 4290, 815, 315, 315, 1504, 1.5, 74226,
    '185%', '11%', '+0%', '+33%', '185%', '100%', '6%', '+30%', '7 ~ 10', '±20%', '185%',
    '0%', '30%', '0%', '0%',
    'ChaosGodTriheadBat',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "466–699",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodTriheadBatLeapSlam",
        "name": "Leap Slam",
        "description": "Leap Slam.",
        "stats": {
          "damage": "466–699",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodTriheadBatSonicBlastSingle",
        "name": "Sonic Blast",
        "description": "Deals Fire Damage with a high chance to Ignite.",
        "stats": {
          "damage": "102–154 Fire",
          "critChance": "5%",
          "castTime": "1 sec",
          "cooldown": "12.5 sec",
          "igniteChance": "200%"
        }
      },
      {
        "id": "ChaosGodTriheadBatPoisonBlastSingle",
        "name": "Poison Blast",
        "description": "Deals Physical damage with a chance to Poison.",
        "stats": {
          "damage": "82–123 Physical",
          "critChance": "5%",
          "castTime": "1 sec",
          "cooldown": "12.5 sec",
          "poisonChance": "50% on Hit"
        }
      },
      {
        "id": "ChaosGodTriHeadBatPosionSpray",
        "name": "Poison Spray",
        "description": "Fires poison projectiles that pierce all targets.",
        "stats": {
          "damage": "466–699",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "notes": "Pierces all targets."
        }
      },
      {
        "id": "ChaosGodTriheadBatPoisonGround",
        "name": "Poison Ground",
        "description": "Creates a pool dealing Chaos damage over time.",
        "stats": {
          "damagePerSecond": "357 Chaos",
          "duration": "4 sec",
          "castTime": "1 sec"
        }
      }
    ]'
);

-- Cerebral Bat Level 77
INSERT INTO CerebralBat (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    77,
    13105, 4053, 795, 306, 306, 1457, 1.5, 67552,
    '185%', '11%', '+0%', '+33%', '185%', '100%', '6%', '+30%', '7 ~ 10', '±20%', '185%',
    '0%', '30%', '0%', '0%',
    'ChaosGodTriheadBat',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee projectile attack.",
        "stats": {
          "damage": "452–679",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodTriheadBatLeapSlam",
        "name": "Leap Slam",
        "description": "Leap Slam.",
        "stats": {
          "damage": "452–679",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodTriheadBatSonicBlastSingle",
        "name": "Sonic Blast",
        "description": "Deals Fire Damage with a high chance to Ignite.",
        "stats": {
          "damage": "100-150 Fire",
          "critChance": "5%",
          "castTime": "1 sec",
          "cooldown": "12.5 sec",
          "igniteChance": "200%"
        }
      },
      {
        "id": "ChaosGodTriheadBatPoisonBlastSingle",
        "name": "Poison Blast",
        "description": "Deals Physical damage with a chance to Poison.",
        "stats": {
          "damage": "79–119 Physical",
          "critChance": "5%",
          "castTime": "1 sec",
          "cooldown": "12.5 sec",
          "poisonChance": "50% on Hit"
        }
      },
      {
        "id": "ChaosGodTriHeadBatPosionSpray",
        "name": "Poison Spray",
        "description": "Fires poison projectiles that pierce all targets.",
        "stats": {
          "damage": "452–679",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "notes": "Pierces all targets."
        }
      },
      {
        "id": "ChaosGodTriheadBatPoisonGround",
        "name": "Poison Ground",
        "description": "Creates a pool dealing Chaos damage over time.",
        "stats": {
          "damagePerSecond": "346 Chaos",
          "duration": "4 sec",
          "castTime": "1 sec"
        }
      }
    ]'
);

-- Cerebral Bat Level 76
INSERT INTO CerebralBat (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    76,
    12363, 3829, 777, 297, 297, 1412, 1.5, 61373,
    '185%', '11%', '+0%', '+33%', '185%', '100%', '6%', '+30%', '7 ~ 10', '±20%', '185%',
    '0%', '30%', '0%', '0%',
    'ChaosGodTriheadBat',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "439–659",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodTriheadBatLeapSlam",
        "name": "Leap Slam",
        "description": "Leap Slam.",
        "stats": {
          "damage": "439–659",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodTriheadBatSonicBlastSingle",
        "name": "Sonic Blast",
        "description": "Deals Fire Damage with a high chance to Ignite.",
        "stats": {
          "damage": "97–145 Fire",
          "critChance": "5%",
          "castTime": "1 sec",
          "cooldown": "12.5 sec",
          "igniteChance": "200%"
        }
      },
      {
        "id": "ChaosGodTriheadBatPoisonBlastSingle",
        "name": "Poison Blast",
        "description": "Deals Physical damage with a chance to Poison.",
        "stats": {
          "damage": "77–116 Physical",
          "critChance": "5%",
          "castTime": "1 sec",
          "cooldown": "12.5 sec",
          "poisonChance": "50% on Hit"
        }
      },
      {
        "id": "ChaosGodTriHeadBatPosionSpray",
        "name": "Poison Spray",
        "description": "Fires poison projectiles that pierce all targets.",
        "stats": {
          "damage": "439–659",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "notes": "Pierces all targets."
        }
      },
      {
        "id": "ChaosGodTriheadBatPoisonGround",
        "name": "Poison Ground",
        "description": "Creates a pool dealing Chaos damage over time.",
        "stats": {
          "damagePerSecond": "337 Chaos",
          "duration": "4 sec",
          "castTime": "1 sec"
        }
      }
    ]'
);

-- Cerebral Bat Level 75
INSERT INTO CerebralBat (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    75,
    11664, 3617, 758, 288, 288, 1368, 1.5, 55765,
    '185%', '11%', '+0%', '+33%', '185%', '100%', '6%', '+30%', '7 ~ 10', '±20%', '185%',
    '0%', '30%', '0%', '0%',
    'ChaosGodTriheadBat',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "426–640",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodTriheadBatLeapSlam",
        "name": "Leap Slam",
        "description": "Leap Slam.",
        "stats": {
          "damage": "426–640",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodTriheadBatSonicBlastSingle",
        "name": "Sonic Blast",
        "description": "Deals Fire Damage with a high chance to Ignite.",
        "stats": {
          "damage": "94–141 Fire",
          "critChance": "5%",
          "castTime": "1 sec",
          "cooldown": "12.5 sec",
          "igniteChance": "200%"
        }
      },
      {
        "id": "ChaosGodTriheadBatPoisonBlastSingle",
        "name": "Poison Blast",
        "description": "Deals Physical damage with a chance to Poison.",
        "stats": {
          "damage": "75–113 Physical",
          "critChance": "5%",
          "castTime": "1 sec",
          "cooldown": "12.5 sec",
          "poisonChance": "50% on Hit"
        }
      },
      {
        "id": "ChaosGodTriHeadBatPosionSpray",
        "name": "Poison Spray",
        "description": "Fires poison projectiles that pierce all targets.",
        "stats": {
          "damage": "426–640",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "notes": "Pierces all targets."
        }
      },
      {
        "id": "ChaosGodTriheadBatPoisonGround",
        "name": "Poison Ground",
        "description": "Creates a pool dealing Chaos damage over time.",
        "stats": {
          "damagePerSecond": "327 Chaos",
          "duration": "4 sec",
          "castTime": "1 sec"
        }
      }
    ]'
);

-- Cerebral Bat Level 40
INSERT INTO CerebralBat (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    40,
    1253, 418, 274, 90, 90, 403, 1.5, 4259,
    '185%', '11%', '+0%', '+33%', '185%', '100%', '6%', '+30%', '7 ~ 10', '±20%', '185%',
    '0%', '30%', '0%', '0%',
    'ChaosGodTriheadBat',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "133–200",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodTriheadBatLeapSlam",
        "name": "Leap Slam",
        "description": "Leap Slam.",
        "stats": {
          "damage": "133–200",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodTriheadBatSonicBlastSingle",
        "name": "Sonic Blast",
        "description": "Deals Fire Damage with a high chance to Ignite.",
        "stats": {
          "damage": "30–45 Fire",
          "critChance": "5%",
          "castTime": "1 sec",
          "cooldown": "12.5 sec",
          "igniteChance": "200%"
        }
      },
      {
        "id": "ChaosGodTriheadBatPoisonBlastSingle",
        "name": "Poison Blast",
        "description": "Deals Physical damage with a chance to Poison.",
        "stats": {
          "damage": "24–36 Physical",
          "critChance": "5%",
          "castTime": "1 sec",
          "cooldown": "12.5 sec",
          "poisonChance": "50% on Hit"
        }
      },
      {
        "id": "ChaosGodTriHeadBatPosionSpray",
        "name": "Poison Spray",
        "description": "Fires poison projectiles that pierce all targets.",
        "stats": {
          "damage": "133–200",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "notes": "Pierces all targets."
        }
      },
      {
        "id": "ChaosGodTriheadBatPoisonGround",
        "name": "Poison Ground",
        "description": "Creates a pool dealing Chaos damage over time.",
        "stats": {
          "damagePerSecond": "104 Chaos",
          "duration": "4 sec",
          "castTime": "1 sec"
        }
      }
    ]'
);

-- =============================================
-- INSERT DATA for Petulant Stonemaw
-- =============================================

-- Petulant Stonemaw Level 80
INSERT INTO PetulantStonemaw (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80,
    15609, 4803, 715, 334, 334, 1602, 1.5, 100000,
    '110%', '0%', '+11%', '+11%', '110%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '110%',
    '-30%', '30%', '0%', '0%',
    'ChaosGodRangedFodder',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "294–441",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodRangedFodder",
        "name": "Charge",
        "description": "Charges at an enemy, bashing, stunning, and knocking it back. Pushes enemies aside. Damage/stun scales with distance.",
        "stats": {
          "damage": "294–441",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "12 sec"
        }
      }
    ]'
);

-- Petulant Stonemaw Level 79
INSERT INTO PetulantStonemaw (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    79,
    14725, 4540, 628, 324, 324, 1552, 1.5, 81664,
    '110%', '0%', '+11%', '+11%', '110%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '110%',
    '-30%', '30%', '0%', '0%',
    'ChaosGodRangedFodder',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "285–428",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodRangedFodder",
        "name": "Charge",
        "description": "Charges at an enemy, bashing, stunning, and knocking it back. Pushes enemies aside. Damage/stun scales with distance.",
        "stats": {
          "damage": "285–428",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "12 sec"
        }
      }
    ]'
);

-- Petulant Stonemaw Level 78
INSERT INTO PetulantStonemaw (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    78,
    13892, 4290, 613, 315, 315, 1504, 1.5, 74226,
    '110%', '0%', '+11%', '+11%', '110%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '110%',
    '-30%', '30%', '0%', '0%',
    'ChaosGodRangedFodder',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "277–416",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodRangedFodder",
        "name": "Charge",
        "description": "Charges at an enemy, bashing, stunning, and knocking it back. Pushes enemies aside. Damage/stun scales with distance.",
        "stats": {
          "damage": "277–416",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "12 sec"
        }
      }
    ]'
);

-- Petulant Stonemaw Level 77
INSERT INTO PetulantStonemaw (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    77,
    13105, 4053, 598, 306, 306, 1457, 1.5, 67552,
    '110%', '0%', '+11%', '+11%', '110%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '110%',
    '-30%', '30%', '0%', '0%',
    'ChaosGodRangedFodder',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "269–404",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodRangedFodder",
        "name": "Charge",
        "description": "Charges at an enemy, bashing, stunning, and knocking it back. Pushes enemies aside. Damage/stun scales with distance.",
        "stats": {
          "damage": "269–404",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "12 sec"
        }
      }
    ]'
);

-- Petulant Stonemaw Level 76
INSERT INTO PetulantStonemaw (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    76,
    12363, 3829, 584, 297, 297, 1412, 1.5, 61373,
    '110%', '0%', '+11%', '+11%', '110%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '110%',
    '-30%', '30%', '0%', '0%',
    'ChaosGodRangedFodder',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "261–392",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodRangedFodder",
        "name": "Charge",
        "description": "Charges at an enemy, bashing, stunning, and knocking it back. Pushes enemies aside. Damage/stun scales with distance.",
        "stats": {
          "damage": "261–392",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "12 sec"
        }
      }
    ]'
);

-- Petulant Stonemaw Level 75
INSERT INTO PetulantStonemaw (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    75,
    11664, 3617, 570, 288, 288, 1368, 1.5, 55765,
    '110%', '0%', '+11%', '+11%', '110%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '110%',
    '-30%', '30%', '0%', '0%',
    'ChaosGodRangedFodder',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "254–380",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodRangedFodder",
        "name": "Charge",
        "description": "Charges at an enemy, bashing, stunning, and knocking it back. Pushes enemies aside. Damage/stun scales with distance.",
        "stats": {
          "damage": "254–380",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "12 sec"
        }
      }
    ]'
);

-- Petulant Stonemaw Level 40
INSERT INTO PetulantStonemaw (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    40,
    1253, 418, 206, 90, 90, 403, 1.5, 4259,
    '110%', '0%', '+11%', '+11%', '110%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '110%',
    '-30%', '30%', '0%', '0%',
    'ChaosGodRangedFodder',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "79–119",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "ChaosGodRangedFodder",
        "name": "Charge",
        "description": "Charges at an enemy, bashing, stunning, and knocking it back. Pushes enemies aside. Damage/stun scales with distance.",
        "stats": {
          "damage": "79–119",
          "critChance": "5%",
          "attackTime": "1.5 sec",
          "cooldown": "12 sec"
        }
      }
    ]'
);

-- =============================================
-- INSERT DATA for Scute Lizard
-- =============================================

-- Scute Lizard Level 80
INSERT INTO ScuteLizard (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80,
    15609, 4803, 715, 334, 334, 1602, 1.5, 100000,
    '185%', '0%', '+0%', '+33%', '185%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '185%',
    '-30%', '30%', '0%', '0%',
    'ChaosGodJaguar',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "494-741",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      }
    ]'
);

-- Scute Lizard Level 79
INSERT INTO ScuteLizard (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    79,
    14725, 4540, 628, 324, 324, 1552, 1.5, 81664,
    '185%', '0%', '+0%', '+33%', '185%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '185%',
    '-30%', '30%', '0%', '0%',
    'ChaosGodJaguar',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "480-720",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      }
    ]'
);

-- Scute Lizard Level 78
INSERT INTO ScuteLizard (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    78,
    13892, 4290, 613, 315, 315, 1504, 1.5, 74226,
    '185%', '0%', '+0%', '+33%', '185%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '185%',
    '-30%', '30%', '0%', '0%',
    'ChaosGodJaguar',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "466–699",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      }
    ]'
);

-- Scute Lizard Level 77
INSERT INTO ScuteLizard (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    77,
    13105, 4053, 598, 306, 306, 1457, 1.5, 67552,
    '185%', '0%', '+0%', '+33%', '185%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '185%',
    '-30%', '30%', '0%', '0%',
    'ChaosGodJaguar',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "452–679",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      }
    ]'
);

-- Scute Lizard Level 76
INSERT INTO ScuteLizard (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    76,
    12363, 3829, 584, 297, 297, 1412, 1.5, 61373,
    '185%', '0%', '+0%', '+33%', '185%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '185%',
    '-30%', '30%', '0%', '0%',
    'ChaosGodJaguar',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "439–659",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      }
    ]'
);

-- Scute Lizard Level 75
INSERT INTO ScuteLizard (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    75,
    11664, 3617, 570, 288, 288, 1368, 1.5, 55765,
    '185%', '0%', '+0%', '+33%', '185%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '185%',
    '-30%', '30%', '0%', '0%',
    'ChaosGodJaguar',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "426–640",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      }
    ]'
);

-- Scute Lizard Level 40
INSERT INTO ScuteLizard (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    40,
    1253, 418, 206, 90, 90, 403, 1.5, 4259,
    '185%', '0%', '+0%', '+33%', '185%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '185%',
    '-30%', '30%', '0%', '0%',
    'ChaosGodJaguar',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "133–200",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      }
    ]'
);

-- =============================================
-- INSERT DATA for Saurian Servant
-- =============================================

-- Saurian Servant Level 80
INSERT INTO SaurianServant (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80,
    15609, 4803, 715, 334, 334, 1602, 1.5, 100000,
    '220%', '22%', '+0%', '+0%', '220%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '220%',
    '0%', '0%', '0%', '0%',
    'ChaosGodTriHeadLizard',
    '[
      {
        "id": "ChaosGodTriHeadLizardBasicProjectile",
        "name": "Chaos Projectile",
        "description": "Fires multiple chaos projectiles.",
        "stats": {
          "damage": "326.8–490.1 Chaos",
          "castTime": "1 sec",
          "additionalProjectiles": 2,
          "projectileSpreadRadius": 16,
          "projectileSpeedVariation": "+10%",
          "maxActionDistanceModifier": "-30%"
        }
      },
      {
        "id": "ChaosLizardBreathe",
        "name": "Chaos Breathe",
        "description": "Breathes chaos damage in an area.",
        "stats": {
          "damage": "544.6–816.9 Chaos",
          "critChance": "6%",
          "castTime": "1 sec",
          "isAreaDamage": true
        }
      },
      {
        "id": "ChaosLizardCircles",
        "name": "Chaos Circles",
        "description": "Performs a special action with a cooldown.",
        "stats": {
          "cooldown": "12.5 sec",
          "maxActionDistanceModifier": "-33%"
        }
      }
    ]'
);

-- Saurian Servant Level 79
INSERT INTO SaurianServant (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    79,
    14725, 4540, 628, 324, 324, 1552, 1.5, 81664,
    '220%', '22%', '+0%', '+0%', '220%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '220%',
    '0%', '0%', '0%', '0%',
    'ChaosGodTriHeadLizard',
    '[
      {
        "id": "ChaosGodTriHeadLizardBasicProjectile",
        "name": "Chaos Projectile",
        "description": "Fires multiple chaos projectiles.",
        "stats": {
          "damage": "317-476 Chaos",
          "castTime": "1 sec",
          "additionalProjectiles": 2,
          "projectileSpreadRadius": 16,
          "projectileSpeedVariation": "+10%",
          "maxActionDistanceModifier": "-30%"
        }
      },
      {
        "id": "ChaosLizardBreathe",
        "name": "Chaos Breathe",
        "description": "Breathes chaos damage in an area.",
        "stats": {
          "damage": "529-793 Chaos",
          "critChance": "6%",
          "castTime": "1 sec",
          "isAreaDamage": true
        }
      },
      {
        "id": "ChaosLizardCircles",
        "name": "Chaos Circles",
        "description": "Performs a special action with a cooldown.",
        "stats": {
          "cooldown": "12.5 sec",
          "maxActionDistanceModifier": "-33%"
        }
      }
    ]'
);

-- Saurian Servant Level 78
INSERT INTO SaurianServant (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    78,
    13892, 4290, 613, 315, 315, 1504, 1.5, 74226,
    '220%', '22%', '+0%', '+0%', '220%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '220%',
    '0%', '0%', '0%', '0%',
    'ChaosGodTriHeadLizard',
    '[
      {
        "id": "ChaosGodTriHeadLizardBasicProjectile",
        "name": "Chaos Projectile",
        "description": "Fires multiple chaos projectiles.",
        "stats": {
          "damage": "308-462 Chaos",
          "castTime": "1 sec",
          "additionalProjectiles": 2,
          "projectileSpreadRadius": 16,
          "projectileSpeedVariation": "+10%",
          "maxActionDistanceModifier": "-30%"
        }
      },
      {
        "id": "ChaosLizardBreathe",
        "name": "Chaos Breathe",
        "description": "Breathes chaos damage in an area.",
        "stats": {
          "damage": "514-771 Chaos",
          "critChance": "6%",
          "castTime": "1 sec",
          "isAreaDamage": true
        }
      },
      {
        "id": "ChaosLizardCircles",
        "name": "Chaos Circles",
        "description": "Performs a special action with a cooldown.",
        "stats": {
          "cooldown": "12.5 sec",
          "maxActionDistanceModifier": "-33%"
        }
      }
    ]'
);

-- Saurian Servant Level 77
INSERT INTO SaurianServant (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    77,
    13105, 4053, 598, 306, 306, 1457, 1.5, 67552,
    '220%', '22%', '+0%', '+0%', '220%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '220%',
    '0%', '0%', '0%', '0%',
    'ChaosGodTriHeadLizard',
    '[
      {
        "id": "ChaosGodTriHeadLizardBasicProjectile",
        "name": "Chaos Projectile",
        "description": "Fires multiple chaos projectiles.",
        "stats": {
          "damage": "299-449 Chaos",
          "castTime": "1 sec",
          "additionalProjectiles": 2,
          "projectileSpreadRadius": 16,
          "projectileSpeedVariation": "+10%",
          "maxActionDistanceModifier": "-30%"
        }
      },
      {
        "id": "ChaosLizardBreathe",
        "name": "Chaos Breathe",
        "description": "Breathes chaos damage in an area.",
        "stats": {
          "damage": "499-749 Chaos",
          "critChance": "6%",
          "castTime": "1 sec",
          "isAreaDamage": true
        }
      },
      {
        "id": "ChaosLizardCircles",
        "name": "Chaos Circles",
        "description": "Performs a special action with a cooldown.",
        "stats": {
          "cooldown": "12.5 sec",
          "maxActionDistanceModifier": "-33%"
        }
      }
    ]'
);

-- Saurian Servant Level 76
INSERT INTO SaurianServant (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    76,
    12363, 3829, 584, 297, 297, 1412, 1.5, 61373,
    '220%', '22%', '+0%', '+0%', '220%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '220%',
    '0%', '0%', '0%', '0%',
    'ChaosGodTriHeadLizard',
    '[
      {
        "id": "ChaosGodTriHeadLizardBasicProjectile",
        "name": "Chaos Projectile",
        "description": "Fires multiple chaos projectiles.",
        "stats": {
          "damage": "291-436 Chaos",
          "castTime": "1 sec",
          "additionalProjectiles": 2,
          "projectileSpreadRadius": 16,
          "projectileSpeedVariation": "+10%",
          "maxActionDistanceModifier": "-30%"
        }
      },
      {
        "id": "ChaosLizardBreathe",
        "name": "Chaos Breathe",
        "description": "Breathes chaos damage in an area.",
        "stats": {
          "damage": "485-727 Chaos",
          "critChance": "6%",
          "castTime": "1 sec",
          "isAreaDamage": true
        }
      },
      {
        "id": "ChaosLizardCircles",
        "name": "Chaos Circles",
        "description": "Performs a special action with a cooldown.",
        "stats": {
          "cooldown": "12.5 sec",
          "maxActionDistanceModifier": "-33%"
        }
      }
    ]'
);

-- Saurian Servant Level 75
INSERT INTO SaurianServant (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    75,
    11664, 3617, 570, 288, 288, 1368, 1.5, 55765,
    '220%', '22%', '+0%', '+0%', '220%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '220%',
    '0%', '0%', '0%', '0%',
    'ChaosGodTriHeadLizard',
    '[
      {
        "id": "ChaosGodTriHeadLizardBasicProjectile",
        "name": "Chaos Projectile",
        "description": "Fires multiple chaos projectiles.",
        "stats": {
          "damage": "282-424Chaos",
          "castTime": "1 sec",
          "additionalProjectiles": 2,
          "projectileSpreadRadius": 16,
          "projectileSpeedVariation": "+10%",
          "maxActionDistanceModifier": "-30%"
        }
      },
      {
        "id": "ChaosLizardBreathe",
        "name": "Chaos Breathe",
        "description": "Breathes chaos damage in an area.",
        "stats": {
          "damage": "471-707 Chaos",
          "critChance": "6%",
          "castTime": "1 sec",
          "isAreaDamage": true
        }
      },
      {
        "id": "ChaosLizardCircles",
        "name": "Chaos Circles",
        "description": "Performs a special action with a cooldown.",
        "stats": {
          "cooldown": "12.5 sec",
          "maxActionDistanceModifier": "-33%"
        }
      }
    ]'
);

-- Saurian Servant Level 40
INSERT INTO SaurianServant (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    40,
    1253, 418, 206, 90, 90, 403, 1.5, 4259,
    '220%', '22%', '+0%', '+0%', '220%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '220%',
    '0%', '0%', '0%', '0%',
    'ChaosGodTriHeadLizard',
    '[
      {
        "id": "ChaosGodTriHeadLizardBasicProjectile",
        "name": "Chaos Projectile",
        "description": "Fires multiple chaos projectiles.",
        "stats": {
          "damage": "90-135 Chaos",
          "castTime": "1 sec",
          "additionalProjectiles": 2,
          "projectileSpreadRadius": 16,
          "projectileSpeedVariation": "+10%",
          "maxActionDistanceModifier": "-30%"
        }
      },
      {
        "id": "ChaosLizardBreathe",
        "name": "Chaos Breathe",
        "description": "Breathes chaos damage in an area.",
        "stats": {
          "damage": "150-225 Chaos",
          "critChance": "6%",
          "castTime": "1 sec",
          "isAreaDamage": true
        }
      },
      {
        "id": "ChaosLizardCircles",
        "name": "Chaos Circles",
        "description": "Performs a special action with a cooldown.",
        "stats": {
          "cooldown": "12.5 sec",
          "maxActionDistanceModifier": "-33%"
        }
      }
    ]'
);

-- =============================================
-- INSERT DATA for Bloodrite Guard DW
-- =============================================

-- Bloodrite Guard DW Level 80
INSERT INTO BloodriteGuardDW (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80,
    15609, 4803, 644, 334, 334, 1602, 1.5, 100000,
    '110%', '0%', '+0%', '+25%', '121%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '110%',
    '30%', '0%', '0%', '0%',
    'BloodBathDualWield',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "323-485",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "BloodBathFlameEnrage",
        "name": "Flame Enrage",
        "description": "Enrages with flames, enhancing abilities.",
        "stats": {}
      },
      {
        "id": "BloodMageSacrificeBlast",
        "name": "Sacrifice Blast",
        "description": "Deals physical damage and converts part of it to fire damage.",
        "stats": {
          "damage": "653-980 Physical",
          "critChance": "5%",
          "castTime": "1 sec",
          "conversion": "10% Phys to Fire"
        }
      },
      {
        "id": "BloodBathFireGround",
        "name": "Fire Ground",
        "description": "Creates a fiery ground dealing damage over time.",
        "stats": {
        "damagePerSecond": "123 fire damage"
        }
      }
    ]'
);

-- Bloodrite Guard DW Level 79
INSERT INTO BloodriteGuardDW (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    79,
    14725, 4540, 628, 324, 324, 1552, 1.5, 81664,
    '110%', '0%', '+0%', '+25%', '121%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '110%',
    '30%', '0%', '0%', '0%',
    'BloodBathDualWield',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "314-471",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "BloodBathFlameEnrage",
        "name": "Flame Enrage",
        "description": "Enrages with flames, enhancing abilities.",
        "stats": {}
      },
      {
        "id": "BloodMageSacrificeBlast",
        "name": "Sacrifice Blast",
        "description": "Deals physical damage and converts part of it to fire damage.",
        "stats": {
          "damage": "635-952 Physical",
          "critChance": "5%",
          "castTime": "1 sec",
          "conversion": "10% Phys to Fire"
        }
      },
      {
        "id": "BloodBathFireGround",
        "name": "Fire Ground",
        "description": "Creates a fiery ground dealing damage over time.",
        "stats": {
        "damagePerSecond": "119 fire damage"
        }
      }
    ]'
);

-- Bloodrite Guard DW Level 78
INSERT INTO BloodriteGuardDW (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    78,
    13892, 4290, 613, 315, 315, 1504, 1.5, 74226,
    '110%', '0%', '+0%', '+25%', '121%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '110%',
    '30%', '0%', '0%', '0%',
    'BloodBathDualWield',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "305-457",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "BloodBathFlameEnrage",
        "name": "Flame Enrage",
        "description": "Enrages with flames, enhancing abilities.",
        "stats": {}
      },
      {
        "id": "BloodMageSacrificeBlast",
        "name": "Sacrifice Blast",
        "description": "Deals physical damage and converts part of it to fire damage.",
        "stats": {
          "damage": "617-925 Physical",
          "critChance": "5%",
          "castTime": "1 sec",
          "conversion": "10% Phys to Fire"
        }
      },
      {
        "id": "BloodBathFireGround",
        "name": "Fire Ground",
        "description": "Creates a fiery ground dealing damage over time.",
        "stats": {
        "damagePerSecond": "116 fire damage"
        }
      }
    ]'
);

-- Bloodrite Guard DW Level 77
INSERT INTO BloodriteGuardDW (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    77,
    13105, 4053, 598, 306, 306, 1457, 1.5, 67552,
    '110%', '0%', '+0%', '+25%', '121%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '110%',
    '30%', '0%', '0%', '0%',
    'BloodBathDualWield',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "296-444",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "BloodBathFlameEnrage",
        "name": "Flame Enrage",
        "description": "Enrages with flames, enhancing abilities.",
        "stats": {}
      },
      {
        "id": "BloodMageSacrificeBlast",
        "name": "Sacrifice Blast",
        "description": "Deals physical damage and converts part of it to fire damage.",
        "stats": {
          "damage": "599-899 Physical",
          "critChance": "5%",
          "castTime": "1 sec",
          "conversion": "10% Phys to Fire"
        }
      },
      {
        "id": "BloodBathFireGround",
        "name": "Fire Ground",
        "description": "Creates a fiery ground dealing damage over time.",
        "stats": {
        "damagePerSecond": "112 fire damage"
        }
      }
    ]'
);

-- Bloodrite Guard DW Level 76
INSERT INTO BloodriteGuardDW (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    76,
    12363, 3829, 584, 297, 297, 1412, 1.5, 61373,
    '110%', '0%', '+0%', '+25%', '121%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '110%',
    '30%', '0%', '0%', '0%',
    'BloodBathDualWield',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "287-431",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "BloodBathFlameEnrage",
        "name": "Flame Enrage",
        "description": "Enrages with flames, enhancing abilities.",
        "stats": {}
      },
      {
        "id": "BloodMageSacrificeBlast",
        "name": "Sacrifice Blast",
        "description": "Deals physical damage and converts part of it to fire damage.",
        "stats": {
          "damage": "582-873 Physical",
          "critChance": "5%",
          "castTime": "1 sec",
          "conversion": "10% Phys to Fire"
        }
      },
      {
        "id": "BloodBathFireGround",
        "name": "Fire Ground",
        "description": "Creates a fiery ground dealing damage over time.",
        "stats": {
        "damagePerSecond": "109 fire damage"
        }
      }
    ]'
);

-- Bloodrite Guard DW Level 75
INSERT INTO BloodriteGuardDW (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    75,
    11664, 3617, 570, 288, 288, 1368, 1.5, 55765,
    '110%', '0%', '+0%', '+25%', '121%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '110%',
    '30%', '0%', '0%', '0%',
    'BloodBathDualWield',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "279-418",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "BloodBathFlameEnrage",
        "name": "Flame Enrage",
        "description": "Enrages with flames, enhancing abilities.",
        "stats": {}
      },
      {
        "id": "BloodMageSacrificeBlast",
        "name": "Sacrifice Blast",
        "description": "Deals physical damage and converts part of it to fire damage.",
        "stats": {
          "damage": "565-848 Physical",
          "critChance": "5%",
          "castTime": "1 sec",
          "conversion": "10% Phys to Fire"
        }
      },
      {
        "id": "BloodBathFireGround",
        "name": "Fire Ground",
        "description": "Creates a fiery ground dealing damage over time.",
        "stats": {
        "damagePerSecond": "106 fire damage"
        }
      }
    ]'
);

-- Bloodrite Guard DW Level 40
INSERT INTO BloodriteGuardDW (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    40,
    1253, 418, 206, 90, 90, 403, 1.5, 4259,
    '110%', '0%', '+0%', '+25%', '121%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '110%',
    '30%', '0%', '0%', '0%',
    'BloodBathDualWield',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "87-131",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "BloodBathFlameEnrage",
        "name": "Flame Enrage",
        "description": "Enrages with flames, enhancing abilities.",
        "stats": {}
      },
      {
        "id": "BloodMageSacrificeBlast",
        "name": "Sacrifice Blast",
        "description": "Deals physical damage and converts part of it to fire damage.",
        "stats": {
          "damage": "180-269 Physical",
          "critChance": "5%",
          "castTime": "1 sec",
          "conversion": "10% Phys to Fire"
        }
      },
      {
        "id": "BloodBathFireGround",
        "name": "Fire Ground",
        "description": "Creates a fiery ground dealing damage over time.",
        "stats": {
        "damagePerSecond": "34 fire damage"
        }
      }
    ]'
);

-- =============================================
-- INSERT DATA for Bloodrite Guard 2H
-- =============================================

-- Bloodrite Guard 2H Level 80
INSERT INTO BloodriteGuard2H (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80,
    15609, 4803, 644, 334, 334, 1602, 1.5, 100000,
    '160%', '0%', '+35%', '+0%', '160%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '160%',
    '30%', '0%', '0%', '0%',
    'BloodBathTwoHand',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "427–641",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "BloodBathFlameEnrage",
        "name": "Flame Enrage",
        "description": "Enrages with flames, enhancing abilities.",
        "stats": {}
      },
      {
        "id": "BloodBathMaceGroundSlam",
        "name": "Mace Ground Slam",
        "description": "Slams the ground, dealing area damage.",
        "stats": {
          "damage": "427–641",
          "critChance": "5%",
          "attackDamage": "155%",
          "attackTime": "1.5 sec",
          "cooldown": "5 sec",
          "damageModifier": "55% more Attack Damage",
          "notes": [
            "action attack or cast time uses animation length [1]",
            "attack maximum action distance + [8]"
          ]
        }
      },
      {
        "id": "BloodBathFireGround",
        "name": "Fire Ground",
        "description": "Creates a fiery ground dealing damage over time.",
        "stats": {
          "damagePerSecond": "123 Fire",
          "castTime": "1 sec",
          "duration": "3 sec",
          "areaEffectRadiusModifier": "-45%",
          "notes": [
            "ground fire art variation [1004]"
          ]
        }
      }
    ]'
);

-- Bloodrite Guard 2H Level 79
INSERT INTO BloodriteGuard2H (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    79,
    14725, 4540, 628, 324, 324, 1552, 1.5, 81664,
    '160%', '0%', '+35%', '+0%', '160%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '160%',
    '30%', '0%', '0%', '0%',
    'BloodBathTwoHand',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "415-622",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "BloodBathFlameEnrage",
        "name": "Flame Enrage",
        "description": "Enrages with flames, enhancing abilities.",
        "stats": {}
      },
      {
        "id": "BloodBathMaceGroundSlam",
        "name": "Mace Ground Slam",
        "description": "Slams the ground, dealing area damage.",
        "stats": {
          "damage": "415-622",
          "critChance": "5%",
          "attackDamage": "155%",
          "attackTime": "1.5 sec",
          "cooldown": "5 sec",
          "damageModifier": "55% more Attack Damage",
          "notes": [
            "action attack or cast time uses animation length [1]",
            "attack maximum action distance + [8]"
          ]
        }
      },
      {
        "id": "BloodBathFireGround",
        "name": "Fire Ground",
        "description": "Creates a fiery ground dealing damage over time.",
        "stats": {
          "damagePerSecond": "119 Fire",
          "castTime": "1 sec",
          "duration": "3 sec",
          "areaEffectRadiusModifier": "-45%",
          "notes": [
            "ground fire art variation [1004]"
          ]
        }
      }
    ]'
);

-- Bloodrite Guard 2H Level 78
INSERT INTO BloodriteGuard2H (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    78,
    13892, 4290, 613, 315, 315, 1504, 1.5, 74226,
    '160%', '0%', '+35%', '+0%', '160%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '160%',
    '30%', '0%', '0%', '0%',
    'BloodBathTwoHand',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "403-604",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "BloodBathFlameEnrage",
        "name": "Flame Enrage",
        "description": "Enrages with flames, enhancing abilities.",
        "stats": {}
      },
      {
        "id": "BloodBathMaceGroundSlam",
        "name": "Mace Ground Slam",
        "description": "Slams the ground, dealing area damage.",
        "stats": {
          "damage": "403-604",
          "critChance": "5%",
          "attackDamage": "155%",
          "attackTime": "1.5 sec",
          "cooldown": "5 sec",
          "damageModifier": "55% more Attack Damage",
          "notes": [
            "action attack or cast time uses animation length [1]",
            "attack maximum action distance + [8]"
          ]
        }
      },
      {
        "id": "BloodBathFireGround",
        "name": "Fire Ground",
        "description": "Creates a fiery ground dealing damage over time.",
        "stats": {
          "damagePerSecond": "116 Fire",
          "castTime": "1 sec",
          "duration": "3 sec",
          "areaEffectRadiusModifier": "-45%",
          "notes": [
            "ground fire art variation [1004]"
          ]
        }
      }
    ]'
);

-- Bloodrite Guard 2H Level 77
INSERT INTO BloodriteGuard2H (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    77,
    13105, 4053, 598, 306, 306, 1457, 1.5, 67552,
    '160%', '0%', '+35%', '+0%', '160%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '160%',
    '30%', '0%', '0%', '0%',
    'BloodBathTwoHand',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "391-587",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "BloodBathFlameEnrage",
        "name": "Flame Enrage",
        "description": "Enrages with flames, enhancing abilities.",
        "stats": {}
      },
      {
        "id": "BloodBathMaceGroundSlam",
        "name": "Mace Ground Slam",
        "description": "Slams the ground, dealing area damage.",
        "stats": {
          "damage": "391-587",
          "critChance": "5%",
          "attackDamage": "155%",
          "attackTime": "1.5 sec",
          "cooldown": "5 sec",
          "damageModifier": "55% more Attack Damage",
          "notes": [
            "action attack or cast time uses animation length [1]",
            "attack maximum action distance + [8]"
          ]
        }
      },
      {
        "id": "BloodBathFireGround",
        "name": "Fire Ground",
        "description": "Creates a fiery ground dealing damage over time.",
        "stats": {
          "damagePerSecond": "112 Fire",
          "castTime": "1 sec",
          "duration": "3 sec",
          "areaEffectRadiusModifier": "-45%",
          "notes": [
            "ground fire art variation [1004]"
          ]
        }
      }
    ]'
);

-- Bloodrite Guard 2H Level 76
INSERT INTO BloodriteGuard2H (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    76,
    12363, 3829, 584, 297, 297, 1412, 1.5, 61373,
    '160%', '0%', '+35%', '+0%', '160%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '160%',
    '30%', '0%', '0%', '0%',
    'BloodBathTwoHand',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "380-570",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "BloodBathFlameEnrage",
        "name": "Flame Enrage",
        "description": "Enrages with flames, enhancing abilities.",
        "stats": {}
      },
      {
        "id": "BloodBathMaceGroundSlam",
        "name": "Mace Ground Slam",
        "description": "Slams the ground, dealing area damage.",
        "stats": {
          "damage": "380-570",
          "critChance": "5%",
          "attackDamage": "155%",
          "attackTime": "1.5 sec",
          "cooldown": "5 sec",
          "damageModifier": "55% more Attack Damage",
          "notes": [
            "action attack or cast time uses animation length [1]",
            "attack maximum action distance + [8]"
          ]
        }
      },
      {
        "id": "BloodBathFireGround",
        "name": "Fire Ground",
        "description": "Creates a fiery ground dealing damage over time.",
        "stats": {
          "damagePerSecond": "109 Fire",
          "castTime": "1 sec",
          "duration": "3 sec",
          "areaEffectRadiusModifier": "-45%",
          "notes": [
            "ground fire art variation [1004]"
          ]
        }
      }
    ]'
);

-- Bloodrite Guard 2H Level 75
INSERT INTO BloodriteGuard2H (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    75,
    11664, 3617, 570, 288, 288, 1368, 1.5, 55765,
    '160%', '0%', '+35%', '+0%', '160%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '160%',
    '30%', '0%', '0%', '0%',
    'BloodBathTwoHand',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "369-553",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "BloodBathFlameEnrage",
        "name": "Flame Enrage",
        "description": "Enrages with flames, enhancing abilities.",
        "stats": {}
      },
      {
        "id": "BloodBathMaceGroundSlam",
        "name": "Mace Ground Slam",
        "description": "Slams the ground, dealing area damage.",
        "stats": {
          "damage": "369-553",
          "critChance": "5%",
          "attackDamage": "155%",
          "attackTime": "1.5 sec",
          "cooldown": "5 sec",
          "damageModifier": "55% more Attack Damage",
          "notes": [
            "action attack or cast time uses animation length [1]",
            "attack maximum action distance + [8]"
          ]
        }
      },
      {
        "id": "BloodBathFireGround",
        "name": "Fire Ground",
        "description": "Creates a fiery ground dealing damage over time.",
        "stats": {
          "damagePerSecond": "106 Fire",
          "castTime": "1 sec",
          "duration": "3 sec",
          "areaEffectRadiusModifier": "-45%",
          "notes": [
            "ground fire art variation [1004]"
          ]
        }
      }
    ]'
);

-- Bloodrite Guard 2H Level 40
INSERT INTO BloodriteGuard2H (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    40,
    1253, 418, 206, 90, 90, 403, 1.5, 4259,
    '160%', '0%', '+35%', '+0%', '160%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '160%',
    '30%', '0%', '0%', '0%',
    'BloodBathTwoHand',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "115-173",
          "critChance": "5%",
          "attackTime": "1.5 sec"
        }
      },
      {
        "id": "BloodBathFlameEnrage",
        "name": "Flame Enrage",
        "description": "Enrages with flames, enhancing abilities.",
        "stats": {}
      },
      {
        "id": "BloodBathMaceGroundSlam",
        "name": "Mace Ground Slam",
        "description": "Slams the ground, dealing area damage.",
        "stats": {
          "damage": "115-173",
          "critChance": "5%",
          "attackDamage": "155%",
          "attackTime": "1.5 sec",
          "cooldown": "5 sec",
          "damageModifier": "55% more Attack Damage",
          "notes": [
            "action attack or cast time uses animation length [1]",
            "attack maximum action distance + [8]"
          ]
        }
      },
      {
        "id": "BloodBathFireGround",
        "name": "Fire Ground",
        "description": "Creates a fiery ground dealing damage over time.",
        "stats": {
          "damagePerSecond": "34 Fire",
          "castTime": "1 sec",
          "duration": "3 sec",
          "areaEffectRadiusModifier": "-45%",
          "notes": [
            "ground fire art variation [1004]"
          ]
        }
      }
    ]'
);

-- =============================================
-- INSERT DATA for Chaos Zealot Daggers
-- =============================================

-- Chaos Zealot Daggers Level 80
INSERT INTO ChaosZealotDagger (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80,
    15609, 4803, 644, 334, 334, 1602, 1.25, 100000,
    '100%', '0%', '+0%', '+30%', '100%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '100%',
    '0%', '0%', '0%', '0%',
    'VaalZealotDagger',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "267-401",
          "critChance": "5%",
          "attackTime": "1.25 sec"
        }
      },
      {
        "id": "ZealotAffinity",
        "name": "Zealot Affinity",
        "description": "Monster has 30% resistance to an element, based on the element of their weapon.",
        "stats": {}
      }
    ]'
);

-- Chaos Zealot Daggers Level 79
INSERT INTO ChaosZealotDagger (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    79,
    14725, 4540, 628, 324, 324, 1552, 1.25, 81664,
    '100%', '0%', '+0%', '+30%', '100%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '100%',
    '0%', '0%', '0%', '0%',
    'VaalZealotDagger',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "259-389",
          "critChance": "5%",
          "attackTime": "1.25 sec"
        }
      },
      {
        "id": "ZealotAffinity",
        "name": "Zealot Affinity",
        "description": "Monster has 30% resistance to an element, based on the element of their weapon.",
        "stats": {}
      }
    ]'
);

-- Chaos Zealot Daggers Level 78
INSERT INTO ChaosZealotDagger (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    78,
    13892, 4290, 613, 315, 315, 1504, 1.25, 74226,
    '100%', '0%', '+0%', '+30%', '100%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '100%',
    '0%', '0%', '0%', '0%',
    'VaalZealotDagger',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "252-378",
          "critChance": "5%",
          "attackTime": "1.25 sec"
        }
      },
      {
        "id": "ZealotAffinity",
        "name": "Zealot Affinity",
        "description": "Monster has 30% resistance to an element, based on the element of their weapon.",
        "stats": {}
      }
    ]'
);

-- Chaos Zealot Daggers Level 77
INSERT INTO ChaosZealotDagger (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    77,
    13105, 4053, 598, 306, 306, 1457, 1.25, 67552,
    '100%', '0%', '+0%', '+30%', '100%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '100%',
    '0%', '0%', '0%', '0%',
    'VaalZealotDagger',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "245-367",
          "critChance": "5%",
          "attackTime": "1.25 sec"
        }
      },
      {
        "id": "ZealotAffinity",
        "name": "Zealot Affinity",
        "description": "Monster has 30% resistance to an element, based on the element of their weapon.",
        "stats": {}
      }
    ]'
);

-- Chaos Zealot Daggers Level 76
INSERT INTO ChaosZealotDagger (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    76,
    12363, 3829, 584, 297, 297, 1412, 1.25, 61373,
    '100%', '0%', '+0%', '+30%', '100%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '100%',
    '0%', '0%', '0%', '0%',
    'VaalZealotDagger',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "237-356",
          "critChance": "5%",
          "attackTime": "1.25 sec"
        }
      },
      {
        "id": "ZealotAffinity",
        "name": "Zealot Affinity",
        "description": "Monster has 30% resistance to an element, based on the element of their weapon.",
        "stats": {}
      }
    ]'
);

-- Chaos Zealot Daggers Level 75
INSERT INTO ChaosZealotDagger (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    75,
    11664, 3617, 570, 288, 288, 1368, 1.25, 55765,
    '100%', '0%', '+0%', '+30%', '100%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '100%',
    '0%', '0%', '0%', '0%',
    'VaalZealotDagger',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "231-346",
          "critChance": "5%",
          "attackTime": "1.25 sec"
        }
      },
      {
        "id": "ZealotAffinity",
        "name": "Zealot Affinity",
        "description": "Monster has 30% resistance to an element, based on the element of their weapon.",
        "stats": {}
      }
    ]'
);

-- Chaos Zealot Daggers Level 40
INSERT INTO ChaosZealotDagger (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    40,
    1253, 418, 206, 90, 90, 403, 1.25, 4259,
    '100%', '0%', '+0%', '+30%', '100%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '100%',
    '0%', '0%', '0%', '0%',
    'VaalZealotDagger',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "72-108",
          "critChance": "5%",
          "attackTime": "1.25 sec"
        }
      },
      {
        "id": "ZealotAffinity",
        "name": "Zealot Affinity",
        "description": "Monster has 30% resistance to an element, based on the element of their weapon.",
        "stats": {}
      }
    ]'
);

-- =============================================
-- INSERT DATA for Chaos Zealot Spear
-- =============================================

-- Chaos Zealot Spear Level 80
INSERT INTO ChaosZealotSpear (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80,
    15609, 4803, 644, 334, 334, 1602, 1.4, 100000,
    '115%', '0%', '+0%', '+40%', '115%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '115%',
    '0%', '0%', '0%', '0%',
    'VaalZealotSpear',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "307-461",
          "critChance": "5%",
          "attackTime": "1.4 sec"
        }
      },
      {
        "id": "ZealotAffinity",
        "name": "Zealot Affinity",
        "description": "Monster has 30% resistance to an element, based on the element of their weapon.",
        "stats": {}
      },
      {
        "id": "SpearSlash",
        "name": "Spear Slash",
        "description": "Slashes with spear in a wide arc. Dealing 50% more damage.",
        "stats": {
          "damage": "307-461",
          "critChance": "5%",
          "attackDamage": "150%",
          "attackTime": "1.4 sec",
          "cooldown": "4 sec"
        }
      }
    ]'
);

-- Chaos Zealot Spear Level 79
INSERT INTO ChaosZealotSpear (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    79,
    14725, 4540, 628, 324, 324, 1552, 1.4, 81664,
    '115%', '0%', '+0%', '+40%', '115%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '115%',
    '0%', '0%', '0%', '0%',
    'VaalZealotSpear',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "298-447",
          "critChance": "5%",
          "attackTime": "1.4 sec"
        }
      },
      {
        "id": "ZealotAffinity",
        "name": "Zealot Affinity",
        "description": "Monster has 30% resistance to an element, based on the element of their weapon.",
        "stats": {}
      },
      {
        "id": "SpearSlash",
        "name": "Spear Slash",
        "description": "Slashes with spear in a wide arc. Dealing 50% more damage.",
        "stats": {
          "damage": "298-447",
          "critChance": "5%",
          "attackDamage": "150%",
          "attackTime": "1.4 sec",
          "cooldown": "4 sec"
        }
      }
    ]'
);

-- Chaos Zealot Spear Level 78
INSERT INTO ChaosZealotSpear (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    78,
    13892, 4290, 613, 315, 315, 1504, 1.4, 74226,
    '115%', '0%', '+0%', '+40%', '115%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '115%',
    '0%', '0%', '0%', '0%',
    'VaalZealotSpear',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "290-434",
          "critChance": "5%",
          "attackTime": "1.4 sec"
        }
      },
      {
        "id": "ZealotAffinity",
        "name": "Zealot Affinity",
        "description": "Monster has 30% resistance to an element, based on the element of their weapon.",
        "stats": {}
      },
      {
        "id": "SpearSlash",
        "name": "Spear Slash",
        "description": "Slashes with spear in a wide arc. Dealing 50% more damage.",
        "stats": {
          "damage": "290-434",
          "critChance": "5%",
          "attackDamage": "150%",
          "attackTime": "1.4 sec",
          "cooldown": "4 sec"
        }
      }
    ]'
);

-- Chaos Zealot Spear Level 77
INSERT INTO ChaosZealotSpear (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    77,
    13105, 4053, 598, 306, 306, 1457, 1.4, 67552,
    '115%', '0%', '+0%', '+40%', '115%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '115%',
    '0%', '0%', '0%', '0%',
    'VaalZealotSpear',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "281-422",
          "critChance": "5%",
          "attackTime": "1.4 sec"
        }
      },
      {
        "id": "ZealotAffinity",
        "name": "Zealot Affinity",
        "description": "Monster has 30% resistance to an element, based on the element of their weapon.",
        "stats": {}
      },
      {
        "id": "SpearSlash",
        "name": "Spear Slash",
        "description": "Slashes with spear in a wide arc. Dealing 50% more damage.",
        "stats": {
          "damage": "281-422",
          "critChance": "5%",
          "attackDamage": "150%",
          "attackTime": "1.4 sec",
          "cooldown": "4 sec"
        }
      }
    ]'
);

-- Chaos Zealot Spear Level 76
INSERT INTO ChaosZealotSpear (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    76,
    12363, 3829, 584, 297, 297, 1412, 1.4, 61373,
    '115%', '0%', '+0%', '+40%', '115%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '115%',
    '0%', '0%', '0%', '0%',
    'VaalZealotSpear',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "273-410",
          "critChance": "5%",
          "attackTime": "1.4 sec"
        }
      },
      {
        "id": "ZealotAffinity",
        "name": "Zealot Affinity",
        "description": "Monster has 30% resistance to an element, based on the element of their weapon.",
        "stats": {}
      },
      {
        "id": "SpearSlash",
        "name": "Spear Slash",
        "description": "Slashes with spear in a wide arc. Dealing 50% more damage.",
        "stats": {
          "damage": "273-410",
          "critChance": "5%",
          "attackDamage": "150%",
          "attackTime": "1.4 sec",
          "cooldown": "4 sec"
        }
      }
    ]'
);

-- Chaos Zealot Spear Level 75
INSERT INTO ChaosZealotSpear (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    75,
    11664, 3617, 570, 288, 288, 1368, 1.4, 55765,
    '115%', '0%', '+0%', '+40%', '115%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '115%',
    '0%', '0%', '0%', '0%',
    'VaalZealotSpear',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "265-398",
          "critChance": "5%",
          "attackTime": "1.4 sec"
        }
      },
      {
        "id": "ZealotAffinity",
        "name": "Zealot Affinity",
        "description": "Monster has 30% resistance to an element, based on the element of their weapon.",
        "stats": {}
      },
      {
        "id": "SpearSlash",
        "name": "Spear Slash",
        "description": "Slashes with spear in a wide arc. Dealing 50% more damage.",
        "stats": {
          "damage": "265-398",
          "critChance": "5%",
          "attackDamage": "150%",
          "attackTime": "1.4 sec",
          "cooldown": "4 sec"
        }
      }
    ]'
);

-- Chaos Zealot Spear Level 40
INSERT INTO ChaosZealotSpear (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    40,
    1253, 418, 206, 90, 90, 403, 1.4, 4259,
    '115%', '0%', '+0%', '+40%', '115%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '115%',
    '0%', '0%', '0%', '0%',
    'VaalZealotSpear',
    '[
      {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
          "damage": "83-124",
          "critChance": "5%",
          "attackTime": "1.4 sec"
        }
      },
      {
        "id": "ZealotAffinity",
        "name": "Zealot Affinity",
        "description": "Monster has 30% resistance to an element, based on the element of their weapon.",
        "stats": {}
      },
      {
        "id": "SpearSlash",
        "name": "Spear Slash",
        "description": "Slashes with spear in a wide arc. Dealing 50% more damage.",
        "stats": {
          "damage": "83-124",
          "critChance": "5%",
          "attackDamage": "150%",
          "attackTime": "1.4 sec",
          "cooldown": "4 sec"
        }
      }
    ]'
);

-- =============================================
-- INSERT DATA for Bloodrite Priest
-- =============================================

-- Bloodrite Priest Level 80
INSERT INTO BloodritePriest (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80,
    15609, 4803, 644, 334, 334, 1602, 1.5, 100000,
    '170%', '20%', '+0%', '+0%', '170%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '170%',
    '30%', '0%', '0%', '0%',
    'BloodBathMage',
    '[
      {
        "id": "MPSBloodMageBloodProjectile",
        "name": "Blood Projectile",
        "description": "Fires multiple physical projectiles.",
        "stats": {
          "critChance": "5%",
          "castTime": "2.57 sec",
          "cooldown": "6 sec",
          "damage": "326–490 Physical",
          "additionalProjectiles": "2"
        }
      },
      {
        "id": "BloodMageExsanguinate",
        "name": "Exsanguinate",
        "description": "Expels blood tendrils in a cone, dealing physical damage and applying a physical damage over time debuff.",
        "stats": {
          "critChance": "5%",
          "castTime": "1.67 sec",
          "cooldown": "0.5 sec",
          "damage": "272–408 Physical",
          "damageOverTime": "378 Base Physical per second",
          "chains": 1,
          "debuffDuration": "1 sec",
          "targets": "+2"
        }
      }
    ]'
);

-- Bloodrite Priest Level 79
INSERT INTO BloodritePriest (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    79,
    14725, 4540, 628, 324, 324, 1552, 1.5, 81664,
    '170%', '20%', '+0%', '+0%', '170%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '170%',
    '30%', '0%', '0%', '0%',
    'BloodBathMage',
    '[
      {
        "id": "MPSBloodMageBloodProjectile",
        "name": "Blood Projectile",
        "description": "Fires multiple physical projectiles.",
        "stats": {
          "critChance": "5%",
          "castTime": "2.57 sec",
          "cooldown": "6 sec",
          "damage": "317-476 Physical",
          "additionalProjectiles": "2"
        }
      },
      {
        "id": "BloodMageExsanguinate",
        "name": "Exsanguinate",
        "description": "Expels blood tendrils in a cone, dealing physical damage and applying a physical damage over time debuff.",
        "stats": {
          "critChance": "5%",
          "castTime": "1.67 sec",
          "cooldown": "0.5 sec",
          "damage": "264-396 Physical",
          "damageOverTime": "367 Base Physical per second",
          "chains": 1,
          "debuffDuration": "1 sec",
          "targets": "+2"
        }
      }
    ]'
);

-- Bloodrite Priest Level 78
INSERT INTO BloodritePriest (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    78,
    13892, 4290, 613, 315, 315, 1504, 1.5, 74226,
    '170%', '20%', '+0%', '+0%', '170%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '170%',
    '30%', '0%', '0%', '0%',
    'BloodBathMage',
    '[
      {
        "id": "MPSBloodMageBloodProjectile",
        "name": "Blood Projectile",
        "description": "Fires multiple physical projectiles.",
        "stats": {
          "critChance": "5%",
          "castTime": "2.57 sec",
          "cooldown": "6 sec",
          "damage": "308-462 Physical",
          "additionalProjectiles": "2"
        }
      },
      {
        "id": "BloodMageExsanguinate",
        "name": "Exsanguinate",
        "description": "Expels blood tendrils in a cone, dealing physical damage and applying a physical damage over time debuff.",
        "stats": {
          "critChance": "5%",
          "castTime": "1.67 sec",
          "cooldown": "0.5 sec",
          "damage": "257-385 Physical",
          "damageOverTime": "357 Base Physical per second",
          "chains": 1,
          "debuffDuration": "1 sec",
          "targets": "+2"
        }
      }
    ]'
);

-- Bloodrite Priest Level 77
INSERT INTO BloodritePriest (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    77,
    13105, 4053, 598, 306, 306, 1457, 1.5, 67552,
    '170%', '20%', '+0%', '+0%', '170%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '170%',
    '30%', '0%', '0%', '0%',
    'BloodBathMage',
    '[
      {
        "id": "MPSBloodMageBloodProjectile",
        "name": "Blood Projectile",
        "description": "Fires multiple physical projectiles.",
        "stats": {
          "critChance": "5%",
          "castTime": "2.57 sec",
          "cooldown": "6 sec",
          "damage": "299-449 Physical",
          "additionalProjectiles": "2"
        }
      },
      {
        "id": "BloodMageExsanguinate",
        "name": "Exsanguinate",
        "description": "Expels blood tendrils in a cone, dealing physical damage and applying a physical damage over time debuff.",
        "stats": {
          "critChance": "5%",
          "castTime": "1.67 sec",
          "cooldown": "0.5 sec",
          "damage": "249-374 Physical",
          "damageOverTime": "346 Base Physical per second",
          "chains": 1,
          "debuffDuration": "1 sec",
          "targets": "+2"
        }
      }
    ]'
);

-- Bloodrite Priest Level 76
INSERT INTO BloodritePriest (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    76,
    12363, 3829, 584, 297, 297, 1412, 1.5, 61373,
    '170%', '20%', '+0%', '+0%', '170%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '170%',
    '30%', '0%', '0%', '0%',
    'BloodBathMage',
    '[
      {
        "id": "MPSBloodMageBloodProjectile",
        "name": "Blood Projectile",
        "description": "Fires multiple physical projectiles.",
        "stats": {
          "critChance": "5%",
          "castTime": "2.57 sec",
          "cooldown": "6 sec",
          "damage": "291-436 Physical",
          "additionalProjectiles": "2"
        }
      },
      {
        "id": "BloodMageExsanguinate",
        "name": "Exsanguinate",
        "description": "Expels blood tendrils in a cone, dealing physical damage and applying a physical damage over time debuff.",
        "stats": {
          "critChance": "5%",
          "castTime": "1.67 sec",
          "cooldown": "0.5 sec",
          "damage": "242-363 Physical",
          "damageOverTime": "337 Base Physical per second",
          "chains": 1,
          "debuffDuration": "1 sec",
          "targets": "+2"
        }
      }
    ]'
);

-- Bloodrite Priest Level 75
INSERT INTO BloodritePriest (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    75,
    11664, 3617, 570, 288, 288, 1368, 1.5, 55765,
    '170%', '20%', '+0%', '+0%', '170%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '170%',
    '30%', '0%', '0%', '0%',
    'BloodBathMage',
    '[
      {
        "id": "MPSBloodMageBloodProjectile",
        "name": "Blood Projectile",
        "description": "Fires multiple physical projectiles.",
        "stats": {
          "critChance": "5%",
          "castTime": "2.57 sec",
          "cooldown": "6 sec",
          "damage": "282-424 Physical",
          "additionalProjectiles": "2"
        }
      },
      {
        "id": "BloodMageExsanguinate",
        "name": "Exsanguinate",
        "description": "Expels blood tendrils in a cone, dealing physical damage and applying a physical damage over time debuff.",
        "stats": {
          "critChance": "5%",
          "castTime": "1.67 sec",
          "cooldown": "0.5 sec",
          "damage": "235-353Physical",
          "damageOverTime": "327 Base Physical per second",
          "chains": 1,
          "debuffDuration": "1 sec",
          "targets": "+2"
        }
      }
    ]'
);

-- Bloodrite Priest Level 40
INSERT INTO BloodritePriest (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    40,
    1253, 418, 206, 90, 90, 403, 1.5, 4259,
    '170%', '20%', '+0%', '+0%', '170%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '170%',
    '30%', '0%', '0%', '0%',
    'BloodBathMage',
    '[
      {
        "id": "MPSBloodMageBloodProjectile",
        "name": "Blood Projectile",
        "description": "Fires multiple physical projectiles.",
        "stats": {
          "critChance": "5%",
          "castTime": "2.57 sec",
          "cooldown": "6 sec",
          "damage": "90-135 Physical",
          "additionalProjectiles": "2"
        }
      },
      {
        "id": "BloodMageExsanguinate",
        "name": "Exsanguinate",
        "description": "Expels blood tendrils in a cone, dealing physical damage and applying a physical damage over time debuff.",
        "stats": {
          "critChance": "5%",
          "castTime": "1.67 sec",
          "cooldown": "0.5 sec",
          "damage": "75-112 Physical",
          "damageOverTime": "104 Base Physical per second",
          "chains": 1,
          "debuffDuration": "1 sec",
          "targets": "+2"
        }
      }
    ]'
);



-- =============================================
-- Bosses
-- =============================================

-- =============================================
-- INSERT DATA for Bahlak The Sky Seer
-- =============================================

-- Bahlak Level 80
INSERT INTO BahlakTheSkySeer (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80,
    15609, 4803, 644, 334, 334, 1602, 1.5, 100000,
    '250%', '11%', '+0%', '+22%', '333%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '-30%', '0%', '75%', '0%',
    'ChaosGodOwlBoss',
    '[
    {
      "id": "MeleeAtAnimationSpeedBoss",
      "name": "Basic Attack",
      "description": "Standard melee attack.",
      "stats": {
        "baseDamage": "889–1334",
        "critChance": "5%",
        "attackTime": "1.5 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossFeatherSwipe",
      "name": "Feather Swipe",
      "description": "Bahlak swipes a wing to one side, generating a arc of projectiles that fire outwards.",
      "stats": {
        "baseDamage": "889–1334",
        "critChance": "5%",
        "attackDamageModifier": "170%",
        "attackTime": "1.5 sec",
        "cooldownTime": "12 sec",
        "additionalProjectiles": "8",
        "stunBuildupModifier": "+150%"
      }
    },
    {
      "id": "ChaosGodOwlBossTornadoForm",
      "name": "Tornado Form",
      "description": "Bahlak enters Tornado Form, chasing the player and dealing damage on contact.",
      "stats": {
        "cooldownTime": "40 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossTornado",
      "name": "Tornado",
      "description": "When Bahlak enters Tornado Form, he will create multiple smaller tornadoes that chase the player.",
      "stats": {
        "critChance": "5%",
        "castTime": "1 sec",
        "damage": "544–816 Physical",
        "duration": "8 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossBallLightning",
      "name": "Ball Lightning",
      "description": "Bahlak fires a slow-moving orb Projectile that moves through enemies. The orb itself does not Hit enemies, but repeatedly shoots bolts of Lightning at nearby targets.",
      "stats": {
        "critChance": "6%",
        "castTime": "1 sec",
        "cooldownTime": "15 sec",
        "damage": "408–1225 Lightning",
        "damageInterval": "0.2 sec",
        "projectileSpeedModifier": "-50%",
        "shockChanceModifier": "+50%",
        "forkCount": "2",
        "forkDistance": "35"
      }
    },
    {
      "id": "ChaosGodOwlBossLightningCascade",
      "name": "Lightning Cascade",
      "description": "Bahlak calls down multiple bolts of lightning in a line, dealing damage to all enemies in the area.",
      "stats": {
        "critChance": "6%",
        "castTime": "1 sec",
        "damage": "748–2247 Lightning",
        "shockChanceModifier": "+100%",
        "cooldownTime": "18 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossDarkenSky",
      "description": "Bahlak darkens the sky of the arena.",
      "name": "Darken Sky",
      "stats": {
        "cooldownTime": "55 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossLacerateKick",
      "name": "Lacerate Kick",
      "description": "Bahlak dashes towards the player, dealing damage and applying a bleed debuff.",
      "stats": {
        "baseDamage": "889–1334",
        "critChance": "5%",
        "attackDamageModifier": "215%",
        "attackTime": "1.5 sec",
        "damageModifier": "115% more Attack Damage",
        "centerDamageModifier": "20% more Attack Damage"
      }
    },
    {
      "id": "ChaosGodOwlBossDiveBomb",
      "name": "Dive Bomb",
      "description": "Bahlak launches into the air and dives on top of the player, dealing damage in an concentrated area.",
      "stats": {
        "baseDamage": "889–1334",
        "critChance": "5%",
        "attackDamageModifier": "250%",
        "attackTime": "1.5 sec",
        "damageModifier": "150% more Attack Damage",
        "centerDamageModifier": "50% more Attack Damage",
        "cooldownTime": "20 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossWingBlast",
      "name": "Wing Blast",
      "description": "Bahlak unleashes blasts of wind from his wings, dealing damage in a line 3 times.",
      "stats": {
        "baseDamage": "889–1334",
        "critChance": "5%",
        "attackDamageModifier": "60%",
        "attackTime": "1.5 sec",
        "damageModifier": "40% less Attack Damage"
      }
    }
]'
);

-- Bahlak Level 79
INSERT INTO BahlakTheSkySeer (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    79,
    14725, 4540, 628, 324, 324, 1552, 1.5, 81664,
    '250%', '11%', '+0%', '+22%', '333%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '-30%', '0%', '75%', '0%',
    'ChaosGodOwlBoss',
    '[
    {
      "id": "MeleeAtAnimationSpeedBoss",
      "name": "Basic Attack",
      "description": "Standard melee attack.",
      "stats": {
        "baseDamage": "864-1295",
        "critChance": "5%",
        "attackTime": "1.5 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossFeatherSwipe",
      "name": "Feather Swipe",
      "description": "Bahlak swipes a wing to one side, generating a arc of projectiles that fire outwards.",
      "stats": {
        "baseDamage": "864-1295",
        "critChance": "5%",
        "attackDamageModifier": "170%",
        "attackTime": "1.5 sec",
        "cooldownTime": "12 sec",
        "additionalProjectiles": "8",
        "stunBuildupModifier": "+150%"
      }
    },
    {
      "id": "ChaosGodOwlBossTornadoForm",
      "name": "Tornado Form",
      "description": "Bahlak enters Tornado Form, chasing the player and dealing damage on contact.",
      "stats": {
        "cooldownTime": "40 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossTornado",
      "name": "Tornado",
      "description": "When Bahlak enters Tornado Form, he will create multiple smaller tornadoes that chase the player.",
      "stats": {
        "critChance": "5%",
        "castTime": "1 sec",
        "damage": "529-793 Physical",
        "duration": "8 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossBallLightning",
      "name": "Ball Lightning",
      "description": "Bahlak fires a slow-moving orb Projectile that moves through enemies. The orb itself does not Hit enemies, but repeatedly shoots bolts of Lightning at nearby targets.",
      "stats": {
        "critChance": "6%",
        "castTime": "1 sec",
        "cooldownTime": "15 sec",
        "damage": "397-1191 Lightning",
        "damageInterval": "0.2 sec",
        "projectileSpeedModifier": "-50%",
        "shockChanceModifier": "+50%",
        "forkCount": "2",
        "forkDistance": "35"
      }
    },
    {
      "id": "ChaosGodOwlBossLightningCascade",
      "name": "Lightning Cascade",
      "description": "Bahlak calls down multiple bolts of lightning in a line, dealing damage to all enemies in the area.",
      "stats": {
        "critChance": "6%",
        "castTime": "1 sec",
        "damage": "727-2183 Lightning",
        "shockChanceModifier": "+100%",
        "cooldownTime": "18 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossDarkenSky",
      "description": "Bahlak darkens the sky of the arena.",
      "name": "Darken Sky",
      "stats": {
        "cooldownTime": "55 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossLacerateKick",
      "name": "Lacerate Kick",
      "description": "Bahlak dashes towards the player, dealing damage and applying a bleed debuff.",
      "stats": {
        "baseDamage": "864-1295",
        "critChance": "5%",
        "attackDamageModifier": "215%",
        "attackTime": "1.5 sec",
        "damageModifier": "115% more Attack Damage",
        "centerDamageModifier": "20% more Attack Damage"
      }
    },
    {
      "id": "ChaosGodOwlBossDiveBomb",
      "name": "Dive Bomb",
      "description": "Bahlak launches into the air and dives on top of the player, dealing damage in an concentrated area.",
      "stats": {
        "baseDamage": "864-1295",
        "critChance": "5%",
        "attackDamageModifier": "250%",
        "attackTime": "1.5 sec",
        "damageModifier": "150% more Attack Damage",
        "centerDamageModifier": "50% more Attack Damage",
        "cooldownTime": "20 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossWingBlast",
      "name": "Wing Blast",
      "description": "Bahlak unleashes blasts of wind from his wings, dealing damage in a line 3 times.",
      "stats": {
        "baseDamage": "864-1295",
        "critChance": "5%",
        "attackDamageModifier": "60%",
        "attackTime": "1.5 sec",
        "damageModifier": "40% less Attack Damage"
      }
    }
]'
);

-- Bahlak Level 78
INSERT INTO BahlakTheSkySeer (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    78,
    13892, 4290, 613, 315, 315, 1504, 1.5, 74226,
    '250%', '11%', '+0%', '+22%', '333%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '-30%', '0%', '75%', '0%',
    'ChaosGodOwlBoss',
    '[
    {
      "id": "MeleeAtAnimationSpeedBoss",
      "name": "Basic Attack",
      "description": "Standard melee attack.",
      "stats": {
        "baseDamage": "839-1258",
        "critChance": "5%",
        "attackTime": "1.5 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossFeatherSwipe",
      "name": "Feather Swipe",
      "description": "Bahlak swipes a wing to one side, generating a arc of projectiles that fire outwards.",
      "stats": {
        "baseDamage": "839-1258",
        "critChance": "5%",
        "attackDamageModifier": "170%",
        "attackTime": "1.5 sec",
        "cooldownTime": "12 sec",
        "additionalProjectiles": "8",
        "stunBuildupModifier": "+150%"
      }
    },
    {
      "id": "ChaosGodOwlBossTornadoForm",
      "name": "Tornado Form",
      "description": "Bahlak enters Tornado Form, chasing the player and dealing damage on contact.",
      "stats": {
        "cooldownTime": "40 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossTornado",
      "name": "Tornado",
      "description": "When Bahlak enters Tornado Form, he will create multiple smaller tornadoes that chase the player.",
      "stats": {
        "critChance": "5%",
        "castTime": "1 sec",
        "damage": "514-771 Physical",
        "duration": "8 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossBallLightning",
      "name": "Ball Lightning",
      "description": "Bahlak fires a slow-moving orb Projectile that moves through enemies. The orb itself does not Hit enemies, but repeatedly shoots bolts of Lightning at nearby targets.",
      "stats": {
        "critChance": "6%",
        "castTime": "1 sec",
        "cooldownTime": "15 sec",
        "damage": "385-1157 Lightning",
        "damageInterval": "0.2 sec",
        "projectileSpeedModifier": "-50%",
        "shockChanceModifier": "+50%",
        "forkCount": "2",
        "forkDistance": "35"
      }
    },
    {
      "id": "ChaosGodOwlBossLightningCascade",
      "name": "Lightning Cascade",
      "description": "Bahlak calls down multiple bolts of lightning in a line, dealing damage to all enemies in the area.",
      "stats": {
        "critChance": "6%",
        "castTime": "1 sec",
        "damage": "707-2121 Lightning",
        "shockChanceModifier": "+100%",
        "cooldownTime": "18 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossDarkenSky",
      "description": "Bahlak darkens the sky of the arena.",
      "name": "Darken Sky",
      "stats": {
        "cooldownTime": "55 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossLacerateKick",
      "name": "Lacerate Kick",
      "description": "Bahlak dashes towards the player, dealing damage and applying a bleed debuff.",
      "stats": {
        "baseDamage": "839-1258",
        "critChance": "5%",
        "attackDamageModifier": "215%",
        "attackTime": "1.5 sec",
        "damageModifier": "115% more Attack Damage",
        "centerDamageModifier": "20% more Attack Damage"
      }
    },
    {
      "id": "ChaosGodOwlBossDiveBomb",
      "name": "Dive Bomb",
      "description": "Bahlak launches into the air and dives on top of the player, dealing damage in an concentrated area.",
      "stats": {
        "baseDamage": "839-1258",
        "critChance": "5%",
        "attackDamageModifier": "250%",
        "attackTime": "1.5 sec",
        "damageModifier": "150% more Attack Damage",
        "centerDamageModifier": "50% more Attack Damage",
        "cooldownTime": "20 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossWingBlast",
      "name": "Wing Blast",
      "description": "Bahlak unleashes blasts of wind from his wings, dealing damage in a line 3 times.",
      "stats": {
        "baseDamage": "839-1258",
        "critChance": "5%",
        "attackDamageModifier": "60%",
        "attackTime": "1.5 sec",
        "damageModifier": "40% less Attack Damage"
      }
    }
]'
);

-- Bahlak Level 77
INSERT INTO BahlakTheSkySeer (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    77,
    13105, 4053, 598, 306, 306, 1457, 1.5, 67552,
    '250%', '11%', '+0%', '+22%', '333%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '-30%', '0%', '75%', '0%',
    'ChaosGodOwlBoss',
    '[
    {
      "id": "MeleeAtAnimationSpeedBoss",
      "name": "Basic Attack",
      "description": "Standard melee attack.",
      "stats": {
        "baseDamage": "814–1222",
        "critChance": "5%",
        "attackTime": "1.5 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossFeatherSwipe",
      "name": "Feather Swipe",
      "description": "Bahlak swipes a wing to one side, generating a arc of projectiles that fire outwards.",
      "stats": {
        "baseDamage": "814–1222",
        "critChance": "5%",
        "attackDamageModifier": "170%",
        "attackTime": "1.5 sec",
        "cooldownTime": "12 sec",
        "additionalProjectiles": "8",
        "stunBuildupModifier": "+150%"
      }
    },
    {
      "id": "ChaosGodOwlBossTornadoForm",
      "name": "Tornado Form",
      "description": "Bahlak enters Tornado Form, chasing the player and dealing damage on contact.",
      "stats": {
        "cooldownTime": "40 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossTornado",
      "name": "Tornado",
      "description": "When Bahlak enters Tornado Form, he will create multiple smaller tornadoes that chase the player.",
      "stats": {
        "critChance": "5%",
        "castTime": "1 sec",
        "damage": "499-749 Physical",
        "duration": "8 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossBallLightning",
      "name": "Ball Lightning",
      "description": "Bahlak fires a slow-moving orb Projectile that moves through enemies. The orb itself does not Hit enemies, but repeatedly shoots bolts of Lightning at nearby targets.",
      "stats": {
        "critChance": "6%",
        "castTime": "1 sec",
        "cooldownTime": "15 sec",
        "damage": "374-1124 Lightning",
        "damageInterval": "0.2 sec",
        "projectileSpeedModifier": "-50%",
        "shockChanceModifier": "+50%",
        "forkCount": "2",
        "forkDistance": "35"
      }
    },
    {
      "id": "ChaosGodOwlBossLightningCascade",
      "name": "Lightning Cascade",
      "description": "Bahlak calls down multiple bolts of lightning in a line, dealing damage to all enemies in the area.",
      "stats": {
        "critChance": "6%",
        "castTime": "1 sec",
        "damage": "686-2061 Lightning",
        "shockChanceModifier": "+100%",
        "cooldownTime": "18 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossDarkenSky",
      "description": "Bahlak darkens the sky of the arena.",
      "name": "Darken Sky",
      "stats": {
        "cooldownTime": "55 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossLacerateKick",
      "name": "Lacerate Kick",
      "description": "Bahlak dashes towards the player, dealing damage and applying a bleed debuff.",
      "stats": {
        "baseDamage": "814–12224",
        "critChance": "5%",
        "attackDamageModifier": "215%",
        "attackTime": "1.5 sec",
        "damageModifier": "115% more Attack Damage",
        "centerDamageModifier": "20% more Attack Damage"
      }
    },
    {
      "id": "ChaosGodOwlBossDiveBomb",
      "name": "Dive Bomb",
      "description": "Bahlak launches into the air and dives on top of the player, dealing damage in an concentrated area.",
      "stats": {
        "baseDamage": "814–1222",
        "critChance": "5%",
        "attackDamageModifier": "250%",
        "attackTime": "1.5 sec",
        "damageModifier": "150% more Attack Damage",
        "centerDamageModifier": "50% more Attack Damage",
        "cooldownTime": "20 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossWingBlast",
      "name": "Wing Blast",
      "description": "Bahlak unleashes blasts of wind from his wings, dealing damage in a line 3 times.",
      "stats": {
        "baseDamage": "814–1222",
        "critChance": "5%",
        "attackDamageModifier": "60%",
        "attackTime": "1.5 sec",
        "damageModifier": "40% less Attack Damage"
      }
    }
]'
);

-- Bahlak Level 76
INSERT INTO BahlakTheSkySeer (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    76,
    12700, 3906, 583, 297, 297, 1412, 1.5, 61373,
    '250%', '11%', '+0%', '+22%', '333%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '-30%', '0%', '75%', '0%',
    'ChaosGodOwlBoss',
    '[
    {
      "id": "MeleeAtAnimationSpeedBoss",
      "name": "Basic Attack",
      "description": "Standard melee attack.",
      "stats": {
        "baseDamage": "791–1186",
        "critChance": "5%",
        "attackTime": "1.5 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossFeatherSwipe",
      "name": "Feather Swipe",
      "description": "Bahlak swipes a wing to one side, generating a arc of projectiles that fire outwards.",
      "stats": {
        "baseDamage": "791–1186",
        "critChance": "5%",
        "attackDamageModifier": "170%",
        "attackTime": "1.5 sec",
        "cooldownTime": "12 sec",
        "additionalProjectiles": "8",
        "stunBuildupModifier": "+150%"
      }
    },
    {
      "id": "ChaosGodOwlBossTornadoForm",
      "name": "Tornado Form",
      "description": "Bahlak enters Tornado Form, chasing the player and dealing damage on contact.",
      "stats": {
        "cooldownTime": "40 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossTornado",
      "name": "Tornado",
      "description": "When Bahlak enters Tornado Form, he will create multiple smaller tornadoes that chase the player.",
      "stats": {
        "critChance": "5%",
        "castTime": "1 sec",
        "damage": "485-727 Physical",
        "duration": "8 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossBallLightning",
      "name": "Ball Lightning",
      "description": "Bahlak fires a slow-moving orb Projectile that moves through enemies. The orb itself does not Hit enemies, but repeatedly shoots bolts of Lightning at nearby targets.",
      "stats": {
        "critChance": "6%",
        "castTime": "1 sec",
        "cooldownTime": "15 sec",
        "damage": "363-1092 Lightning",
        "damageInterval": "0.2 sec",
        "projectileSpeedModifier": "-50%",
        "shockChanceModifier": "+50%",
        "forkCount": "2",
        "forkDistance": "35"
      }
    },
    {
      "id": "ChaosGodOwlBossLightningCascade",
      "name": "Lightning Cascade",
      "description": "Bahlak calls down multiple bolts of lightning in a line, dealing damage to all enemies in the area.",
      "stats": {
        "critChance": "6%",
        "castTime": "1 sec",
        "damage": "667-2002 Lightning",
        "shockChanceModifier": "+100%",
        "cooldownTime": "18 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossDarkenSky",
      "description": "Bahlak darkens the sky of the arena.",
      "name": "Darken Sky",
      "stats": {
        "cooldownTime": "55 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossLacerateKick",
      "name": "Lacerate Kick",
      "description": "Bahlak dashes towards the player, dealing damage and applying a bleed debuff.",
      "stats": {
        "baseDamage": "791–1186",
        "critChance": "5%",
        "attackDamageModifier": "215%",
        "attackTime": "1.5 sec",
        "damageModifier": "115% more Attack Damage",
        "centerDamageModifier": "20% more Attack Damage"
      }
    },
    {
      "id": "ChaosGodOwlBossDiveBomb",
      "name": "Dive Bomb",
      "description": "Bahlak launches into the air and dives on top of the player, dealing damage in an concentrated area.",
      "stats": {
        "baseDamage": "791–1186",
        "critChance": "5%",
        "attackDamageModifier": "250%",
        "attackTime": "1.5 sec",
        "damageModifier": "150% more Attack Damage",
        "centerDamageModifier": "50% more Attack Damage",
        "cooldownTime": "20 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossWingBlast",
      "name": "Wing Blast",
      "description": "Bahlak unleashes blasts of wind from his wings, dealing damage in a line 3 times.",
      "stats": {
        "baseDamage": "791–1186",
        "critChance": "5%",
        "attackDamageModifier": "60%",
        "attackTime": "1.5 sec",
        "damageModifier": "40% less Attack Damage"
      }
    }
]'
);

-- Bahlak Level 75
INSERT INTO BahlakTheSkySeer (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    75,
    12300, 3763, 568, 288, 288, 1368, 1.5, 55673,
    '250%', '11%', '+0%', '+22%', '333%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '-30%', '0%', '75%', '0%',
    'ChaosGodOwlBoss',
    '[
    {
      "id": "MeleeAtAnimationSpeedBoss",
      "name": "Basic Attack",
      "description": "Standard melee attack.",
      "stats": {
        "baseDamage": "768–1151",
        "critChance": "5%",
        "attackTime": "1.5 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossFeatherSwipe",
      "name": "Feather Swipe",
      "description": "Bahlak swipes a wing to one side, generating a arc of projectiles that fire outwards.",
      "stats": {
        "baseDamage": "768–1151",
        "critChance": "5%",
        "attackDamageModifier": "170%",
        "attackTime": "1.5 sec",
        "cooldownTime": "12 sec",
        "additionalProjectiles": "8",
        "stunBuildupModifier": "+150%"
      }
    },
    {
      "id": "ChaosGodOwlBossTornadoForm",
      "name": "Tornado Form",
      "description": "Bahlak enters Tornado Form, chasing the player and dealing damage on contact.",
      "stats": {
        "cooldownTime": "40 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossTornado",
      "name": "Tornado",
      "description": "When Bahlak enters Tornado Form, he will create multiple smaller tornadoes that chase the player.",
      "stats": {
        "critChance": "5%",
        "castTime": "1 sec",
        "damage": "471-707 Physical",
        "duration": "8 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossBallLightning",
      "name": "Ball Lightning",
      "description": "Bahlak fires a slow-moving orb Projectile that moves through enemies. The orb itself does not Hit enemies, but repeatedly shoots bolts of Lightning at nearby targets.",
      "stats": {
        "critChance": "6%",
        "castTime": "1 sec",
        "cooldownTime": "15 sec",
        "damage": "353-1060 Lightning",
        "damageInterval": "0.2 sec",
        "projectileSpeedModifier": "-50%",
        "shockChanceModifier": "+50%",
        "forkCount": "2",
        "forkDistance": "35"
      }
    },
    {
      "id": "ChaosGodOwlBossLightningCascade",
      "name": "Lightning Cascade",
      "description": "Bahlak calls down multiple bolts of lightning in a line, dealing damage to all enemies in the area.",
      "stats": {
        "critChance": "6%",
        "castTime": "1 sec",
        "damage": "648-1944 Lightning",
        "shockChanceModifier": "+100%",
        "cooldownTime": "18 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossDarkenSky",
      "description": "Bahlak darkens the sky of the arena.",
      "name": "Darken Sky",
      "stats": {
        "cooldownTime": "55 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossLacerateKick",
      "name": "Lacerate Kick",
      "description": "Bahlak dashes towards the player, dealing damage and applying a bleed debuff.",
      "stats": {
        "baseDamage": "768–1151",
        "critChance": "5%",
        "attackDamageModifier": "215%",
        "attackTime": "1.5 sec",
        "damageModifier": "115% more Attack Damage",
        "centerDamageModifier": "20% more Attack Damage"
      }
    },
    {
      "id": "ChaosGodOwlBossDiveBomb",
      "name": "Dive Bomb",
      "description": "Bahlak launches into the air and dives on top of the player, dealing damage in an concentrated area.",
      "stats": {
        "baseDamage": "768–1151",
        "critChance": "5%",
        "attackDamageModifier": "250%",
        "attackTime": "1.5 sec",
        "damageModifier": "150% more Attack Damage",
        "centerDamageModifier": "50% more Attack Damage",
        "cooldownTime": "20 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossWingBlast",
      "name": "Wing Blast",
      "description": "Bahlak unleashes blasts of wind from his wings, dealing damage in a line 3 times.",
      "stats": {
        "baseDamage": "768–1151",
        "critChance": "5%",
        "attackDamageModifier": "60%",
        "attackTime": "1.5 sec",
        "damageModifier": "40% less Attack Damage"
      }
    }
]'
);

-- Bahlak Level 40
INSERT INTO BahlakTheSkySeer (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    40,
    1253, 418, 206, 90, 90, 403, 1.5, 4259,
    '250%', '11%', '+0%', '+22%', '333%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '-30%', '0%', '75%', '0%',
    'ChaosGodOwlBoss',
    '[
    {
      "id": "MeleeAtAnimationSpeedBoss",
      "name": "Basic Attack",
      "description": "Standard melee attack.",
      "stats": {
        "baseDamage": "240–360",
        "critChance": "5%",
        "attackTime": "1.5 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossFeatherSwipe",
      "name": "Feather Swipe",
      "description": "Bahlak swipes a wing to one side, generating a arc of projectiles that fire outwards.",
      "stats": {
        "baseDamage": "240–360",
        "critChance": "5%",
        "attackDamageModifier": "170%",
        "attackTime": "1.5 sec",
        "cooldownTime": "12 sec",
        "additionalProjectiles": "8",
        "stunBuildupModifier": "+150%"
      }
    },
    {
      "id": "ChaosGodOwlBossTornadoForm",
      "name": "Tornado Form",
      "description": "Bahlak enters Tornado Form, chasing the player and dealing damage on contact.",
      "stats": {
        "cooldownTime": "40 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossTornado",
      "name": "Tornado",
      "description": "When Bahlak enters Tornado Form, he will create multiple smaller tornadoes that chase the player.",
      "stats": {
        "critChance": "5%",
        "castTime": "1 sec",
        "damage": "150-225 Physical",
        "duration": "8 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossBallLightning",
      "name": "Ball Lightning",
      "description": "Bahlak fires a slow-moving orb Projectile that moves through enemies. The orb itself does not Hit enemies, but repeatedly shoots bolts of Lightning at nearby targets.",
      "stats": {
        "critChance": "6%",
        "castTime": "1 sec",
        "cooldownTime": "15 sec",
        "damage": "112-337 Lightning",
        "damageInterval": "0.2 sec",
        "projectileSpeedModifier": "-50%",
        "shockChanceModifier": "+50%",
        "forkCount": "2",
        "forkDistance": "35"
      }
    },
    {
      "id": "ChaosGodOwlBossLightningCascade",
      "name": "Lightning Cascade",
      "description": "Bahlak calls down multiple bolts of lightning in a line, dealing damage to all enemies in the area.",
      "stats": {
        "critChance": "6%",
        "castTime": "1 sec",
        "damage": "206-618Lightning",
        "shockChanceModifier": "+100%",
        "cooldownTime": "18 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossDarkenSky",
      "description": "Bahlak darkens the sky of the arena.",
      "name": "Darken Sky",
      "stats": {
        "cooldownTime": "55 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossLacerateKick",
      "name": "Lacerate Kick",
      "description": "Bahlak dashes towards the player, dealing damage and applying a bleed debuff.",
      "stats": {
        "baseDamage": "240–360",
        "critChance": "5%",
        "attackDamageModifier": "215%",
        "attackTime": "1.5 sec",
        "damageModifier": "115% more Attack Damage",
        "centerDamageModifier": "20% more Attack Damage"
      }
    },
    {
      "id": "ChaosGodOwlBossDiveBomb",
      "name": "Dive Bomb",
      "description": "Bahlak launches into the air and dives on top of the player, dealing damage in an concentrated area.",
      "stats": {
        "baseDamage": "240–360",
        "critChance": "5%",
        "attackDamageModifier": "250%",
        "attackTime": "1.5 sec",
        "damageModifier": "150% more Attack Damage",
        "centerDamageModifier": "50% more Attack Damage",
        "cooldownTime": "20 sec"
      }
    },
    {
      "id": "ChaosGodOwlBossWingBlast",
      "name": "Wing Blast",
      "description": "Bahlak unleashes blasts of wind from his wings, dealing damage in a line 3 times.",
      "stats": {
        "baseDamage": "240–360",
        "critChance": "5%",
        "attackDamageModifier": "60%",
        "attackTime": "1.5 sec",
        "damageModifier": "40% less Attack Damage"
      }
    }
]'
);

-- =============================================
-- INSERT DATA for Chetza The Feathered Plague
-- =============================================

-- Chetza Level 80
INSERT INTO ChetzaTheFeatheredPlague (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80,
    15609, 4803, 644, 334, 334, 1602, 2, 100000,
    '250%', '0%', '+0%', '+0%', '250%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '-30%', '30%', '0%', '0%',
    'MutantBirdBoss',
    '[
    {
      "id": "MeleeAtAnimationSpeed",
      "name": "Basic Attack",
      "description": "Standard melee attack.",
      "stats": {
        "baseDamage": "668–1001",
        "critChance": "5%",
        "attackTime": "2 sec"
      }
    },
    {
      "id": "MutantBirdBossVomitSpray",
      "name": "Vomit Spray",
      "description": "Deals physical damage in an area.",
      "stats": {
        "critChance": "5%",
        "castTime": "1 sec",
        "cooldownTime": "30 sec",
        "damage": "871–1307 Physical",
        "damageModifier": "150% more Attack Damage",
        "areaEffectModifier": "100% increased Area of Effect"
      }
    },
    {
      "id": "MutantBirdBossBeakSpiral",
      "name": "Beak Spiral",
      "description": "Chetza plunges their beak into the ground, creating a spiral of spikes that inflict a heavy bleed.",
      "stats": {
        "cooldownTime": "22.5 sec"
      }
    },
    {
      "id": "MutantBirdBossSummonPlagueling",
      "name": "Summon Plagueling",
      "description": "Summons a Plagueling minion.",
      "stats": {}
    },
    {
      "id": "MutantBirdBoss180",
      "name": "180 degree swipe",
      "description": "180 degree swipe attack.",
      "stats": {
        "baseDamage": "668–1001",
        "damageModifier": "55% more Attack Damage",
        "stunBuildupModifier": "0%"
      }
    },
    {
      "id": "MutantBirdBoss90",
      "name": "90 degree swipe",
      "description": "90 degree swipe attack.",
      "stats": {
        "baseDamage": "668–1001",
        "damageModifier": "25% more Attack Damage",
        "stunBuildupModifier": "0%"
      }
    },
    {
      "id": "MutantBirdBossSpit",
      "name": "Spit",
      "description": "Chetza spits a projectile at the player.",
      "stats": {
        "baseDamage": "668–1001",
        "critChance": "5%",
        "attackTime": "2 sec",
        "projectileSpeedModifier": "+70%",
        "projectileSpreadRadius": "90",
        "cooldownTime": "12.75 sec"
      }
    },
    {
      "id": "MutantBirdBossSpitArtillery",
      "name": "Spit Artillery",
      "description": "Chetza spits a projectile into the air, which then rains down on the player.",
      "stats": {
        "baseDamage": "668–1001",
        "critChance": "5%",
        "attackTime": "2 sec",
        "projectileSpeedModifier": "+30%",
        "projectileSpreadRadius": "50",
        "cooldownTime": "12.75 sec"
      }
    }
  ]'
);

-- Chetza Level 79
INSERT INTO ChetzaTheFeatheredPlague (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    79,
    14725, 4540, 628, 324, 324, 1557, 2, 81664,
    '250%', '0%', '+0%', '+0%', '250%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '-30%', '30%', '0%', '0%',
    'MutantBirdBoss',
    '[
    {
      "id": "MeleeAtAnimationSpeed",
      "name": "Basic Attack",
      "description": "Standard melee attack.",
      "stats": {
        "baseDamage": "648-973",
        "critChance": "5%",
        "attackTime": "2 sec"
      }
    },
    {
      "id": "MutantBirdBossVomitSpray",
      "name": "Vomit Spray",
      "description": "Deals physical damage in an area.",
      "stats": {
        "critChance": "5%",
        "castTime": "1 sec",
        "cooldownTime": "30 sec",
        "damage": "846-1270 Physical",
        "damageModifier": "150% more Attack Damage",
        "areaEffectModifier": "100% increased Area of Effect"
      }
    },
    {
      "id": "MutantBirdBossBeakSpiral",
      "name": "Beak Spiral",
      "description": "Chetza plunges their beak into the ground, creating a spiral of spikes that inflict a heavy bleed.",
      "stats": {
        "cooldownTime": "22.5 sec"
      }
    },
    {
      "id": "MutantBirdBossSummonPlagueling",
      "name": "Summon Plagueling",
      "description": "Summons a Plagueling minion.",
      "stats": {}
    },
    {
      "id": "MutantBirdBoss180",
      "name": "180 degree swipe",
      "description": "180 degree swipe attack.",
      "stats": {
        "baseDamage": "648-973",
        "damageModifier": "55% more Attack Damage",
        "stunBuildupModifier": "0%"
      }
    },
    {
      "id": "MutantBirdBoss90",
      "name": "90 degree swipe",
      "description": "90 degree swipe attack.",
      "stats": {
        "baseDamage": "648-973",
        "damageModifier": "25% more Attack Damage",
        "stunBuildupModifier": "0%"
      }
    },
    {
      "id": "MutantBirdBossSpit",
      "name": "Spit",
      "description": "Chetza spits a projectile at the player.",
      "stats": {
        "baseDamage": "648-973",
        "critChance": "5%",
        "attackTime": "2 sec",
        "projectileSpeedModifier": "+70%",
        "projectileSpreadRadius": "90",
        "cooldownTime": "12.75 sec"
      }
    },
    {
      "id": "MutantBirdBossSpitArtillery",
      "name": "Spit Artillery",
      "description": "Chetza spits a projectile into the air, which then rains down on the player.",
      "stats": {
        "baseDamage": "648-973",
        "critChance": "5%",
        "attackTime": "2 sec",
        "projectileSpeedModifier": "+30%",
        "projectileSpreadRadius": "50",
        "cooldownTime": "12.75 sec"
      }
    }
  ]'
);

-- Chetza Level 78
INSERT INTO ChetzaTheFeatheredPlague (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    78,
    13892, 4290, 613, 314, 314, 1504, 2, 74226,
    '250%', '0%', '+0%', '+0%', '250%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '-30%', '30%', '0%', '0%',
    'MutantBirdBoss',
    '[
    {
      "id": "MeleeAtAnimationSpeed",
      "name": "Basic Attack",
      "description": "Standard melee attack.",
      "stats": {
        "baseDamage": "630–945",
        "critChance": "5%",
        "attackTime": "2 sec"
      }
    },
    {
      "id": "MutantBirdBossVomitSpray",
      "name": "Vomit Spray",
      "description": "Deals physical damage in an area.",
      "stats": {
        "critChance": "5%",
        "castTime": "1 sec",
        "cooldownTime": "30 sec",
        "damage": "822-1234 Physical",
        "damageModifier": "150% more Attack Damage",
        "areaEffectModifier": "100% increased Area of Effect"
      }
    },
    {
      "id": "MutantBirdBossBeakSpiral",
      "name": "Beak Spiral",
      "description": "Chetza plunges their beak into the ground, creating a spiral of spikes that inflict a heavy bleed.",
      "stats": {
        "cooldownTime": "22.5 sec"
      }
    },
    {
      "id": "MutantBirdBossSummonPlagueling",
      "name": "Summon Plagueling",
      "description": "Summons a Plagueling minion.",
      "stats": {}
    },
    {
      "id": "MutantBirdBoss180",
      "name": "180 degree swipe",
      "description": "180 degree swipe attack.",
      "stats": {
        "baseDamage": "630–945",
        "damageModifier": "55% more Attack Damage",
        "stunBuildupModifier": "0%"
      }
    },
    {
      "id": "MutantBirdBoss90",
      "name": "90 degree swipe",
      "description": "90 degree swipe attack.",
      "stats": {
        "baseDamage": "630–945",
        "damageModifier": "25% more Attack Damage",
        "stunBuildupModifier": "0%"
      }
    },
    {
      "id": "MutantBirdBossSpit",
      "name": "Spit",
      "description": "Chetza spits a projectile at the player.",
      "stats": {
        "baseDamage": "630–9451",
        "critChance": "5%",
        "attackTime": "2 sec",
        "projectileSpeedModifier": "+70%",
        "projectileSpreadRadius": "90",
        "cooldownTime": "12.75 sec"
      }
    },
    {
      "id": "MutantBirdBossSpitArtillery",
      "name": "Spit Artillery",
      "description": "Chetza spits a projectile into the air, which then rains down on the player.",
      "stats": {
        "baseDamage": "630–945",
        "critChance": "5%",
        "attackTime": "2 sec",
        "projectileSpeedModifier": "+30%",
        "projectileSpreadRadius": "50",
        "cooldownTime": "12.75 sec"
      }
    }
  ]'
);

-- Chetza Level 77
INSERT INTO ChetzaTheFeatheredPlague (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    77,
    13105, 4053, 598, 305, 305, 1457, 2, 67522,
    '250%', '0%', '+0%', '+0%', '250%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '-30%', '30%', '0%', '0%',
    'MutantBirdBoss',
    '[
    {
      "id": "MeleeAtAnimationSpeed",
      "name": "Basic Attack",
      "description": "Standard melee attack.",
      "stats": {
        "baseDamage": "611–917",
        "critChance": "5%",
        "attackTime": "2 sec"
      }
    },
    {
      "id": "MutantBirdBossVomitSpray",
      "name": "Vomit Spray",
      "description": "Deals physical damage in an area.",
      "stats": {
        "critChance": "5%",
        "castTime": "1 sec",
        "cooldownTime": "30 sec",
        "damage": "799-1199 Physical",
        "damageModifier": "150% more Attack Damage",
        "areaEffectModifier": "100% increased Area of Effect"
      }
    },
    {
      "id": "MutantBirdBossBeakSpiral",
      "name": "Beak Spiral",
      "description": "Chetza plunges their beak into the ground, creating a spiral of spikes that inflict a heavy bleed.",
      "stats": {
        "cooldownTime": "22.5 sec"
      }
    },
    {
      "id": "MutantBirdBossSummonPlagueling",
      "name": "Summon Plagueling",
      "description": "Summons a Plagueling minion.",
      "stats": {}
    },
    {
      "id": "MutantBirdBoss180",
      "name": "180 degree swipe",
      "description": "180 degree swipe attack.",
      "stats": {
        "baseDamage": "611–917",
        "damageModifier": "55% more Attack Damage",
        "stunBuildupModifier": "0%"
      }
    },
    {
      "id": "MutantBirdBoss90",
      "name": "90 degree swipe",
      "description": "90 degree swipe attack.",
      "stats": {
        "baseDamage": "611–917",
        "damageModifier": "25% more Attack Damage",
        "stunBuildupModifier": "0%"
      }
    },
    {
      "id": "MutantBirdBossSpit",
      "name": "Spit",
      "description": "Chetza spits a projectile at the player.",
      "stats": {
        "baseDamage": "611–917",
        "critChance": "5%",
        "attackTime": "2 sec",
        "projectileSpeedModifier": "+70%",
        "projectileSpreadRadius": "90",
        "cooldownTime": "12.75 sec"
      }
    },
    {
      "id": "MutantBirdBossSpitArtillery",
      "name": "Spit Artillery",
      "description": "Chetza spits a projectile into the air, which then rains down on the player.",
      "stats": {
        "baseDamage": "611–917",
        "critChance": "5%",
        "attackTime": "2 sec",
        "projectileSpeedModifier": "+30%",
        "projectileSpreadRadius": "50",
        "cooldownTime": "12.75 sec"
      }
    }
  ]'
);

-- Chetza Level 76
INSERT INTO ChetzaTheFeatheredPlague (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    76,
    12363, 3829, 584, 296, 296, 1412, 2, 61373,
    '250%', '0%', '+0%', '+0%', '250%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '-30%', '30%', '0%', '0%',
    'MutantBirdBoss',
    '[
    {
      "id": "MeleeAtAnimationSpeed",
      "name": "Basic Attack",
      "description": "Standard melee attack.",
      "stats": {
        "baseDamage": "594–890",
        "critChance": "5%",
        "attackTime": "2 sec"
      }
    },
    {
      "id": "MutantBirdBossVomitSpray",
      "name": "Vomit Spray",
      "description": "Deals physical damage in an area.",
      "stats": {
        "critChance": "5%",
        "castTime": "1 sec",
        "cooldownTime": "30 sec",
        "damage": "776-1165 Physical",
        "damageModifier": "150% more Attack Damage",
        "areaEffectModifier": "100% increased Area of Effect"
      }
    },
    {
      "id": "MutantBirdBossBeakSpiral",
      "name": "Beak Spiral",
      "description": "Chetza plunges their beak into the ground, creating a spiral of spikes that inflict a heavy bleed.",
      "stats": {
        "cooldownTime": "22.5 sec"
      }
    },
    {
      "id": "MutantBirdBossSummonPlagueling",
      "name": "Summon Plagueling",
      "description": "Summons a Plagueling minion.",
      "stats": {}
    },
    {
      "id": "MutantBirdBoss180",
      "name": "180 degree swipe",
      "description": "180 degree swipe attack.",
      "stats": {
        "baseDamage": "594–890",
        "damageModifier": "55% more Attack Damage",
        "stunBuildupModifier": "0%"
      }
    },
    {
      "id": "MutantBirdBoss90",
      "name": "90 degree swipe",
      "description": "90 degree swipe attack.",
      "stats": {
        "baseDamage": "594–890",
        "damageModifier": "25% more Attack Damage",
        "stunBuildupModifier": "0%"
      }
    },
    {
      "id": "MutantBirdBossSpit",
      "name": "Spit",
      "description": "Chetza spits a projectile at the player.",
      "stats": {
        "baseDamage": "594–890",
        "critChance": "5%",
        "attackTime": "2 sec",
        "projectileSpeedModifier": "+70%",
        "projectileSpreadRadius": "90",
        "cooldownTime": "12.75 sec"
      }
    },
    {
      "id": "MutantBirdBossSpitArtillery",
      "name": "Spit Artillery",
      "description": "Chetza spits a projectile into the air, which then rains down on the player.",
      "stats": {
        "baseDamage": "594–890",
        "critChance": "5%",
        "attackTime": "2 sec",
        "projectileSpeedModifier": "+30%",
        "projectileSpreadRadius": "50",
        "cooldownTime": "12.75 sec"
      }
    }
  ]'
);

-- Chetza Level 75
INSERT INTO ChetzaTheFeatheredPlague (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    75,
    11664, 3617, 570, 288, 288, 1368, 2, 55765,
    '250%', '0%', '+0%', '+0%', '250%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '-30%', '30%', '0%', '0%',
    'MutantBirdBoss',
    '[
    {
      "id": "MeleeAtAnimationSpeed",
      "name": "Basic Attack",
      "description": "Standard melee attack.",
      "stats": {
        "baseDamage": "576–864",
        "critChance": "5%",
        "attackTime": "2 sec"
      }
    },
    {
      "id": "MutantBirdBossSummonPlagueling",
      "name": "Summon Plagueling",
      "description": "Summons a Plagueling minion.",
      "stats": {}
    },
    {
      "id": "MutantBirdBossBeakSpiral",
      "name": "Beak Spiral",
      "description": "Chetza plunges their beak into the ground, creating a spiral of spikes that inflict a heavy bleed.",
      "stats": {
        "cooldownTime": "22.5 sec"
      }
    },
    {
      "id": "MutantBirdBossVomitSpray",
      "name": "Vomit Spray",
      "description": "Deals physical damage in an area.",
      "stats": {
        "critChance": "5%",
        "castTime": "1 sec",
        "cooldownTime": "30 sec",
        "damage": "754-1131 Physical",
        "damageModifier": "150% more Attack Damage",
        "areaEffectModifier": "100% increased Area of Effect"
      }
    },
    {
      "id": "MutantBirdBoss180",
      "name": "180 degree swipe",
      "description": "180 degree swipe attack.",
      "stats": {
        "baseDamage": "576–864",
        "damageModifier": "55% more Attack Damage",
        "stunBuildupModifier": "0%"
      }
    },
    {
      "id": "MutantBirdBoss90",
      "name": "90 degree swipe",
      "description": "90 degree swipe attack.",
      "stats": {
        "baseDamage": "576–864",
        "damageModifier": "25% more Attack Damage",
        "stunBuildupModifier": "0%"
      }
    },
    {
      "id": "MutantBirdBossSpit",
      "name": "Spit",
      "description": "Chetza spits a projectile at the player.",
      "stats": {
        "baseDamage": "576–864",
        "critChance": "5%",
        "attackTime": "2 sec",
        "projectileSpeedModifier": "+70%",
        "projectileSpreadRadius": "90",
        "cooldownTime": "12.75 sec"
      }
    },
    {
      "id": "MutantBirdBossSpitArtillery",
      "name": "Spit Artillery",
      "description": "Chetza spits a projectile into the air, which then rains down on the player.",
      "stats": {
        "baseDamage": "576–864",
        "critChance": "5%",
        "attackTime": "2 sec",
        "projectileSpeedModifier": "+30%",
        "projectileSpreadRadius": "50",
        "cooldownTime": "12.75 sec"
      }
    }
  ]'
);

-- Chetza Level 40
INSERT INTO ChetzaTheFeatheredPlague (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    40,
    1253, 418, 206, 90, 90, 403, 2, 4259,
    '250%', '0%', '+0%', '+0%', '250%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '-30%', '30%', '0%', '0%',
    'MutantBirdBoss',
    '[
    {
      "id": "MeleeAtAnimationSpeed",
      "name": "Basic Attack",
      "description": "Standard melee attack.",
      "stats": {
        "baseDamage": "180–270",
        "critChance": "5%",
        "attackTime": "2 sec"
      }
    },
    {
      "id": "MutantBirdBossSummonPlagueling",
      "name": "Summon Plagueling",
      "description": "Summons a Plagueling minion.",
      "stats": {}
    },
    {
      "id": "MutantBirdBossBeakSpiral",
      "name": "Beak Spiral",
      "description": "Chetza plunges their beak into the ground, creating a spiral of spikes that inflict a heavy bleed.",
      "stats": {
        "cooldownTime": "22.5 sec"
      }
    },
    {
      "id": "MutantBirdBossVomitSpray",
      "name": "Vomit Spray",
      "description": "Deals physical damage in an area.",
      "stats": {
        "critChance": "5%",
        "castTime": "1 sec",
        "cooldownTime": "30 sec",
        "damage": "240-360 Physical",
        "damageModifier": "150% more Attack Damage",
        "areaEffectModifier": "100% increased Area of Effect"
      }
    },
    {
      "id": "MutantBirdBoss180",
      "name": "180 degree swipe",
      "description": "180 degree swipe attack.",
      "stats": {
        "baseDamage": "180–270",
        "damageModifier": "55% more Attack Damage",
        "stunBuildupModifier": "0%"
      }
    },
    {
      "id": "MutantBirdBoss90",
      "name": "90 degree swipe",
      "description": "90 degree swipe attack.",
      "stats": {
        "baseDamage": "180–270",
        "damageModifier": "25% more Attack Damage",
        "stunBuildupModifier": "0%"
      }
    },
    {
      "id": "MutantBirdBossSpit",
      "name": "Spit",
      "description": "Chetza spits a projectile at the player.",
      "stats": {
        "baseDamage": "180–270",
        "critChance": "5%",
        "attackTime": "2 sec",
        "projectileSpeedModifier": "+70%",
        "projectileSpreadRadius": "90",
        "cooldownTime": "12.75 sec"
      }
    },
    {
      "id": "MutantBirdBossSpitArtillery",
      "name": "Spit Artillery",
      "description": "Chetza spits a projectile into the air, which then rains down on the player.",
      "stats": {
        "baseDamage": "180–270",
        "critChance": "5%",
        "attackTime": "2 sec",
        "projectileSpeedModifier": "+30%",
        "projectileSpreadRadius": "50",
        "cooldownTime": "12.75 sec"
      }
    }
  ]'
);

-- =============================================
-- INSERT DATA for Uxmal The Beastlord
-- =============================================

-- Uxmal Level 80
INSERT INTO UxmalTheBeastlord (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80,
    15609, 4803, 644, 334, 334, 1602, 1.5, 100000,
    '333%', '0%', '+0%', '+0%', '250%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '30%', '30%', '30%', '0%',
    'ChaosChimeraBoss',
    '[
    {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
            "baseDamage": "668–1001",
            "critChance": "5%",
            "attackTime": "1.5 sec"
        }
    },
    {
        "id": "ChaosChimeraBossOffScreenReposition",
        "name": "Reposition to offscreen",
        "description": "Repositions to offscreen.",
        "stats": {
          "cooldownTime": "18 sec"
        }
    },
    {
        "id": "ChaosChimeraBossGroundSlam",
        "name": "Ground Slam",
        "description": "Deals area damage with a powerful slam.",
        "stats": {
            "baseDamage": "668–1001",
            "critChance": "5%",
            "attackDamage": "200%",
            "attackTime": "1.5 sec",
            "cooldownTime": "10 sec",
            "damageModifier": "100% more Attack Damage",
            "attackMaximumActionDistance": "+25"
        }
    },
    {
        "id": "ChaosChimeraBossLeapSlam",
        "name": "Leap Slam",
        "description": "Deals area damage upon landing.",
        "stats": {
            "baseDamage": "668–1001",
            "critChance": "5%",
            "attackDamage": "165%",
            "attackTime": "1.5 sec",
            "damageModifier": "65% more Attack Damage",
            "cooldownTime": "9 sec"
        }
    },
    {
        "id": "ChaosChimeraBossWindBlast",
        "name": "Wind Blast",
        "description": "Unleashes a wind blast.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "16–25 Physical",
            "stunBuildup": "150% more",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossDragonBreath",
        "name": "Dragon Breath",
        "description": "Breathes fire, dealing damage over time.",
        "stats": {
            "castTime": "1 sec",
            "damagePerSecond": "945 Fire",
            "cooldownTime": "25 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFireball",
        "name": "Fireball",
        "description": "Launches a fireball.",
        "stats": {
            "damage": "16–24 Fire",
            "critChance": "5%",
            "castTime": "1 sec",
            "cooldownTime": "15 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFireballImpact",
        "name": "Fireball Impact",
        "description": "Deals fire damage on impact.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "980–1470 Fire",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFrostBreathImpact",
        "name": "Frost Breath Impact",
        "description": "Deals frost damage on impact.",
        "stats": {
            "critChance": "7%",
            "castTime": "1 sec",
            "damage": "87–130 Cold",
            "chillMagnitude": "200% more",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossLightningBreath",
        "name": "Lightning Breath",
        "description": "Breathes lightning, dealing damage.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "170–510 Lightning",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossLightningOrbArc",
        "name": "Lightning Orb Arc",
        "description": "Fires a lightning orb that arcs.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "68–204 Lightning",
            "shockChance": "200%"
        }
    },
    {
        "id": "ChaosChimeraBossLightningOrbExplosion",
        "name": "Lightning Orb Explosion",
        "description": "Explodes a lightning orb.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "810–1504 Lightning",
            "shockChance": "20%"
        }
    },
    {
        "id": "ChaosChimeraBossChaosSprayImpact",
        "name": "Chaos Spray Impact",
        "description": "Deals chaos damage on impact.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "136–204 Physical",
            "poisonChance": "33%",
            "cooldownTime": "20 sec"
        }
    },
    {
        "id": "ChaosChimeraBossPoisonSpray",
        "name": "Poison Spray",
        "description": "Sprays poison in an area.",
        "stats": {
            "castTime": "1 sec",
            "damagePerSecond": "832 Chaos",
            "cooldownTime": "20 sec"
        }
    }
]'
);

-- Uxmal Level 79
INSERT INTO UxmalTheBeastlord (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    79,
    14725, 4580, 628, 324, 324, 1562, 1.5, 81664,
    '333%', '0%', '+0%', '+0%', '250%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '30%', '30%', '30%', '0%',
    'ChaosChimeraBoss',
    '[
    {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
            "baseDamage": "648–973",
            "critChance": "5%",
            "attackTime": "1.5 sec"
        }
    },
    {
        "id": "ChaosChimeraBossOffScreenReposition",
        "name": "Reposition to offscreen",
        "description": "Repositions to offscreen.",
        "stats": {
          "cooldownTime": "18 sec"
        }
    },
    {
        "id": "ChaosChimeraBossGroundSlam",
        "name": "Ground Slam",
        "description": "Deals area damage with a powerful slam.",
        "stats": {
            "baseDamage": "648–973",
            "critChance": "5%",
            "attackDamage": "200%",
            "attackTime": "1.5 sec",
            "cooldownTime": "10 sec",
            "damageModifier": "100% more Attack Damage",
            "attackMaximumActionDistance": "+25"
        }
    },
    {
        "id": "ChaosChimeraBossLeapSlam",
        "name": "Leap Slam",
        "description": "Deals area damage upon landing.",
        "stats": {
            "baseDamage": "648–973",
            "critChance": "5%",
            "attackDamage": "165%",
            "attackTime": "1.5 sec",
            "damageModifier": "65% more Attack Damage",
            "cooldownTime": "9 sec"
        }
    },
    {
        "id": "ChaosChimeraBossWindBlast",
        "name": "Wind Blast",
        "description": "Unleashes a wind blast.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "16–25 Physical",
            "stunBuildup": "150% more",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossDragonBreath",
        "name": "Dragon Breath",
        "description": "Breathes fire, dealing damage over time.",
        "stats": {
            "castTime": "1 sec",
            "damagePerSecond": "918 Fire",
            "cooldownTime": "25 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFireball",
        "name": "Fireball",
        "description": "Launches a fireball.",
        "stats": {
            "damage": "16–24 Fire",
            "critChance": "5%",
            "castTime": "1 sec",
            "cooldownTime": "15 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFireballImpact",
        "name": "Fireball Impact",
        "description": "Deals fire damage on impact.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "952-1429 Fire",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFrostBreathImpact",
        "name": "Frost Breath Impact",
        "description": "Deals frost damage on impact.",
        "stats": {
            "critChance": "7%",
            "castTime": "1 sec",
            "damage": "84-127 Cold",
            "chillMagnitude": "200% more",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossLightningBreath",
        "name": "Lightning Breath",
        "description": "Breathes lightning, dealing damage.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "165-496 Lightning",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossLightningOrbArc",
        "name": "Lightning Orb Arc",
        "description": "Fires a lightning orb that arcs.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "66-198 Lightning",
            "shockChance": "200%"
        }
    },
    {
        "id": "ChaosChimeraBossLightningOrbExplosion",
        "name": "Lightning Orb Explosion",
        "description": "Explodes a lightning orb.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "787-1462 Lightning",
            "shockChance": "20%"
        }
    },
    {
        "id": "ChaosChimeraBossChaosSprayImpact",
        "name": "Chaos Spray Impact",
        "description": "Deals chaos damage on impact.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "132-198 Physical",
            "poisonChance": "33%",
            "cooldownTime": "20 sec"
        }
    },
    {
        "id": "ChaosChimeraBossPoisonSpray",
        "name": "Poison Spray",
        "description": "Sprays poison in an area.",
        "stats": {
            "castTime": "1 sec",
            "damagePerSecond": "808 Chaos",
            "cooldownTime": "20 sec"
        }
    }
]'
);

-- Uxmal Level 78
INSERT INTO UxmalTheBeastlord (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    78,
    13892, 4290, 613, 314, 314, 1504, 1.5, 74226,
    '333%', '0%', '+0%', '+0%', '250%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '30%', '30%', '30%', '0%',
    'ChaosChimeraBoss',
    '[
    {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
            "baseDamage": "630–945",
            "critChance": "5%",
            "attackTime": "1.5 sec"
        }
    },
    {
        "id": "ChaosChimeraBossOffScreenReposition",
        "name": "Reposition to offscreen",
        "description": "Repositions to offscreen.",
        "stats": {
          "cooldownTime": "18 sec"
        }
    },
    {
        "id": "ChaosChimeraBossGroundSlam",
        "name": "Ground Slam",
        "description": "Deals area damage with a powerful slam.",
        "stats": {
            "baseDamage": "630–945",
            "critChance": "5%",
            "attackDamage": "200%",
            "attackTime": "1.5 sec",
            "cooldownTime": "10 sec",
            "damageModifier": "100% more Attack Damage",
            "attackMaximumActionDistance": "+25"
        }
    },
    {
        "id": "ChaosChimeraBossLeapSlam",
        "name": "Leap Slam",
        "description": "Deals area damage upon landing.",
        "stats": {
            "baseDamage": "630–9451",
            "critChance": "5%",
            "attackDamage": "165%",
            "attackTime": "1.5 sec",
            "damageModifier": "65% more Attack Damage",
            "cooldownTime": "9 sec"
        }
    },
    {
        "id": "ChaosChimeraBossWindBlast",
        "name": "Wind Blast",
        "description": "Unleashes a wind blast.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "16–25 Physical",
            "stunBuildup": "150% more",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossDragonBreath",
        "name": "Dragon Breath",
        "description": "Breathes fire, dealing damage over time.",
        "stats": {
            "castTime": "1 sec",
            "damagePerSecond": "892 Fire",
            "cooldownTime": "25 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFireball",
        "name": "Fireball",
        "description": "Launches a fireball.",
        "stats": {
            "damage": "16–24 Fire",
            "critChance": "5%",
            "castTime": "1 sec",
            "cooldownTime": "15 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFireballImpact",
        "name": "Fireball Impact",
        "description": "Deals fire damage on impact.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "925-1388 Fire",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFrostBreathImpact",
        "name": "Frost Breath Impact",
        "description": "Deals frost damage on impact.",
        "stats": {
            "critChance": "7%",
            "castTime": "1 sec",
            "damage": "82-123 Cold",
            "chillMagnitude": "200% more",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossLightningBreath",
        "name": "Lightning Breath",
        "description": "Breathes lightning, dealing damage.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "160-482 Lightning",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossLightningOrbArc",
        "name": "Lightning Orb Arc",
        "description": "Fires a lightning orb that arcs.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "64-192 Lightning",
            "shockChance": "200%"
        }
    },
    {
        "id": "ChaosChimeraBossLightningOrbExplosion",
        "name": "Lightning Orb Explosion",
        "description": "Explodes a lightning orb.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "765-1421 Lightning",
            "shockChance": "20%"
        }
    },
    {
        "id": "ChaosChimeraBossChaosSprayImpact",
        "name": "Chaos Spray Impact",
        "description": "Deals chaos damage on impact.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "128-192 Physical",
            "poisonChance": "33%",
            "cooldownTime": "20 sec"
        }
    },
    {
        "id": "ChaosChimeraBossPoisonSpray",
        "name": "Poison Spray",
        "description": "Sprays poison in an area.",
        "stats": {
            "castTime": "1 sec",
            "damagePerSecond": "785 Chaos",
            "cooldownTime": "20 sec"
        }
    }
]'
);

-- Uxmal Level 77
INSERT INTO UxmalTheBeastlord (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    77,
    13105, 4053, 598, 305, 305, 1457, 1.5, 67522,
    '333%', '0%', '+0%', '+0%', '250%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '30%', '30%', '30%', '0%',
    'ChaosChimeraBoss',
    '[
    {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
            "baseDamage": "611–917",
            "critChance": "5%",
            "attackTime": "1.5 sec"
        }
    },
    {
        "id": "ChaosChimeraBossOffScreenReposition",
        "name": "Reposition to offscreen",
        "description": "Repositions to offscreen.",
        "stats": {
          "cooldownTime": "18 sec"
        }
    },
    {
        "id": "ChaosChimeraBossGroundSlam",
        "name": "Ground Slam",
        "description": "Deals area damage with a powerful slam.",
        "stats": {
            "baseDamage": "611–917",
            "critChance": "5%",
            "attackDamage": "200%",
            "attackTime": "1.5 sec",
            "cooldownTime": "10 sec",
            "damageModifier": "100% more Attack Damage",
            "attackMaximumActionDistance": "+25"
        }
    },
    {
        "id": "ChaosChimeraBossLeapSlam",
        "name": "Leap Slam",
        "description": "Deals area damage upon landing.",
        "stats": {
            "baseDamage": "611–917",
            "critChance": "5%",
            "attackDamage": "165%",
            "attackTime": "1.5 sec",
            "damageModifier": "65% more Attack Damage",
            "cooldownTime": "9 sec"
        }
    },
    {
        "id": "ChaosChimeraBossWindBlast",
        "name": "Wind Blast",
        "description": "Unleashes a wind blast.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "16–25 Physical",
            "stunBuildup": "150% more",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossDragonBreath",
        "name": "Dragon Breath",
        "description": "Breathes fire, dealing damage over time.",
        "stats": {
            "castTime": "1 sec",
            "damagePerSecond": "867 Fire",
            "cooldownTime": "25 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFireball",
        "name": "Fireball",
        "description": "Launches a fireball.",
        "stats": {
            "damage": "16–24 Fire",
            "critChance": "5%",
            "castTime": "1 sec",
            "cooldownTime": "15 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFireballImpact",
        "name": "Fireball Impact",
        "description": "Deals fire damage on impact.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "899-1349 Fire",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFrostBreathImpact",
        "name": "Frost Breath Impact",
        "description": "Deals frost damage on impact.",
        "stats": {
            "critChance": "7%",
            "castTime": "1 sec",
            "damage": "80-120 Cold",
            "chillMagnitude": "200% more",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossLightningBreath",
        "name": "Lightning Breath",
        "description": "Breathes lightning, dealing damage.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "156-468 Lightning",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossLightningOrbArc",
        "name": "Lightning Orb Arc",
        "description": "Fires a lightning orb that arcs.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "62-187 Lightning",
            "shockChance": "200%"
        }
    },
    {
        "id": "ChaosChimeraBossLightningOrbExplosion",
        "name": "Lightning Orb Explosion",
        "description": "Explodes a lightning orb.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "743-1380 Lightning",
            "shockChance": "20%"
        }
    },
    {
        "id": "ChaosChimeraBossChaosSprayImpact",
        "name": "Chaos Spray Impact",
        "description": "Deals chaos damage on impact.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "125-187 Physical",
            "poisonChance": "33%",
            "cooldownTime": "20 sec"
        }
    },
    {
        "id": "ChaosChimeraBossPoisonSpray",
        "name": "Poison Spray",
        "description": "Sprays poison in an area.",
        "stats": {
            "castTime": "1 sec",
            "damagePerSecond": "763 Chaos",
            "cooldownTime": "20 sec"
        }
    }
]'
);

-- Uxmal Level 76
INSERT INTO UxmalTheBeastlord (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    76,
    12363, 3829, 584, 296, 296, 1412, 1.5, 61373,
    '333%', '0%', '+0%', '+0%', '250%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '30%', '30%', '30%', '0%',
    'ChaosChimeraBoss',
    '[
    {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
            "baseDamage": "594–890",
            "critChance": "5%",
            "attackTime": "1.5 sec"
        }
    },
    {
        "id": "ChaosChimeraBossOffScreenReposition",
        "name": "Reposition to offscreen",
        "description": "Repositions to offscreen.",
        "stats": {
          "cooldownTime": "18 sec"
        }
    },
    {
        "id": "ChaosChimeraBossGroundSlam",
        "name": "Ground Slam",
        "description": "Deals area damage with a powerful slam.",
        "stats": {
            "baseDamage": "594–890",
            "critChance": "5%",
            "attackDamage": "200%",
            "attackTime": "1.5 sec",
            "cooldownTime": "10 sec",
            "damageModifier": "100% more Attack Damage",
            "attackMaximumActionDistance": "+25"
        }
    },
    {
        "id": "ChaosChimeraBossLeapSlam",
        "name": "Leap Slam",
        "description": "Deals area damage upon landing.",
        "stats": {
            "baseDamage": "594–890",
            "critChance": "5%",
            "attackDamage": "165%",
            "attackTime": "1.5 sec",
            "damageModifier": "65% more Attack Damage",
            "cooldownTime": "9 sec"
        }
    },
    {
        "id": "ChaosChimeraBossWindBlast",
        "name": "Wind Blast",
        "description": "Unleashes a wind blast.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "16–25 Physical",
            "stunBuildup": "150% more",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossDragonBreath",
        "name": "Dragon Breath",
        "description": "Breathes fire, dealing damage over time.",
        "stats": {
            "castTime": "1 sec",
            "damagePerSecond": "842 Fire",
            "cooldownTime": "25 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFireball",
        "name": "Fireball",
        "description": "Launches a fireball.",
        "stats": {
            "damage": "16–24 Fire",
            "critChance": "5%",
            "castTime": "1 sec",
            "cooldownTime": "15 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFireballImpact",
        "name": "Fireball Impact",
        "description": "Deals fire damage on impact.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "873-1310 Fire",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFrostBreathImpact",
        "name": "Frost Breath Impact",
        "description": "Deals frost damage on impact.",
        "stats": {
            "critChance": "7%",
            "castTime": "1 sec",
            "damage": "77-116 Cold",
            "chillMagnitude": "200% more",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossLightningBreath",
        "name": "Lightning Breath",
        "description": "Breathes lightning, dealing damage.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "151-455 Lightning",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossLightningOrbArc",
        "name": "Lightning Orb Arc",
        "description": "Fires a lightning orb that arcs.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "60-182 Lightning",
            "shockChance": "200%"
        }
    },
    {
        "id": "ChaosChimeraBossLightningOrbExplosion",
        "name": "Lightning Orb Explosion",
        "description": "Explodes a lightning orb.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "721-1341 Lightning",
            "shockChance": "20%"
        }
    },
    {
        "id": "ChaosChimeraBossChaosSprayImpact",
        "name": "Chaos Spray Impact",
        "description": "Deals chaos damage on impact.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "121-182 Physical",
            "poisonChance": "33%",
            "cooldownTime": "20 sec"
        }
    },
    {
        "id": "ChaosChimeraBossPoisonSpray",
        "name": "Poison Spray",
        "description": "Sprays poison in an area.",
        "stats": {
            "castTime": "1 sec",
            "damagePerSecond": "741 Chaos",
            "cooldownTime": "20 sec"
        }
    }
]'
);

-- Uxmal Level 75
INSERT INTO UxmalTheBeastlord (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    75,
    11664, 3617, 570, 288, 288, 1368, 1.5, 55765,
    '333%', '0%', '+0%', '+0%', '250%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '30%', '30%', '30%', '0%',
    'ChaosChimeraBoss',
    '[
    {
        "id": "MeleeAtAnimationSpeed",
        "name": "Basic Attack",
        "description": "Standard melee attack.",
        "stats": {
            "baseDamage": "576–864",
            "critChance": "5%",
            "attackTime": "1.5 sec"
        }
    },
    {
        "id": "ChaosChimeraBossOffScreenReposition",
        "name": "Reposition to offscreen",
        "description": "Repositions to offscreen.",
        "stats": {
          "cooldownTime": "18 sec"
        }
    },
    {
        "id": "ChaosChimeraBossGroundSlam",
        "name": "Ground Slam",
        "description": "Deals area damage with a powerful slam.",
        "stats": {
            "baseDamage": "576–864",
            "critChance": "5%",
            "attackDamage": "200%",
            "attackTime": "1.5 sec",
            "cooldownTime": "10 sec",
            "damageModifier": "100% more Attack Damage",
            "attackMaximumActionDistance": "+25"
        }
    },
    {
        "id": "ChaosChimeraBossLeapSlam",
        "name": "Leap Slam",
        "description": "Deals area damage upon landing.",
        "stats": {
            "baseDamage": "576–864",
            "critChance": "5%",
            "attackDamage": "165%",
            "attackTime": "1.5 sec",
            "damageModifier": "65% more Attack Damage",
            "cooldownTime": "9 sec"
        }
    },
    {
        "id": "ChaosChimeraBossWindBlast",
        "name": "Wind Blast",
        "description": "Unleashes a wind blast.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "16–25 Physical",
            "stunBuildup": "150% more",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossDragonBreath",
        "name": "Dragon Breath",
        "description": "Breathes fire, dealing damage over time.",
        "stats": {
            "castTime": "1 sec",
            "damagePerSecond": "818 Fire",
            "cooldownTime": "25 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFireball",
        "name": "Fireball",
        "description": "Launches a fireball.",
        "stats": {
            "damage": "16–24 Fire",
            "critChance": "5%",
            "castTime": "1 sec",
            "cooldownTime": "15 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFireballImpact",
        "name": "Fireball Impact",
        "description": "Deals fire damage on impact.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "848-1273 Fire",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossFrostBreathImpact",
        "name": "Frost Breath Impact",
        "description": "Deals frost damage on impact.",
        "stats": {
            "critChance": "7%",
            "castTime": "1 sec",
            "damage": "75-113 Cold",
            "chillMagnitude": "200% more",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossLightningBreath",
        "name": "Lightning Breath",
        "description": "Breathes lightning, dealing damage.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "147-441 Lightning",
            "cooldownTime": "10 sec"
        }
    },
    {
        "id": "ChaosChimeraBossLightningOrbArc",
        "name": "Lightning Orb Arc",
        "description": "Fires a lightning orb that arcs.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "59-176 Lightning",
            "shockChance": "200%"
        }
    },
    {
        "id": "ChaosChimeraBossLightningOrbExplosion",
        "name": "Lightning Orb Explosion",
        "description": "Explodes a lightning orb.",
        "stats": {
            "critChance": "6%",
            "castTime": "1 sec",
            "damage": "701-1302 Lightning",
            "shockChance": "20%"
        }
    },
    {
        "id": "ChaosChimeraBossChaosSprayImpact",
        "name": "Chaos Spray Impact",
        "description": "Deals chaos damage on impact.",
        "stats": {
            "critChance": "5%",
            "castTime": "1 sec",
            "damage": "117-176 Physical",
            "poisonChance": "33%",
            "cooldownTime": "20 sec"
        }
    },
    {
        "id": "ChaosChimeraBossPoisonSpray",
        "name": "Poison Spray",
        "description": "Sprays poison in an area.",
        "stats": {
            "castTime": "1 sec",
            "damagePerSecond": "720 Chaos",
            "cooldownTime": "20 sec"
        }
    }
]'
);

-- Uxmal Level 40
INSERT INTO UxmalTheBeastlord (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    40,
    1253, 418, 206, 90, 90, 403, 1.5, 4259,
    '333%', '0%', '+0%', '+0%', '250%', '100%', '5%', '+30%', '3 ~ 6', '±20%', '250%',
    '30%', '30%', '30%', '0%',
    'ChaosChimeraBoss',
    '[
      {
          "id": "MeleeAtAnimationSpeed",
          "name": "Basic Attack",
          "description": "Standard melee attack.",
          "stats": {
              "baseDamage": "180–270",
              "critChance": "5%",
              "attackTime": "1.5 sec"
          }
      },
      {
          "id": "ChaosChimeraBossOffScreenReposition",
          "name": "Reposition to offscreen",
          "description": "Repositions to offscreen.",
          "stats": {
            "cooldownTime": "18 sec"
          }
      },
      {
          "id": "ChaosChimeraBossGroundSlam",
          "name": "Ground Slam",
          "description": "Deals area damage with a powerful slam.",
          "stats": {
              "baseDamage": "180–270",
              "critChance": "5%",
              "attackDamage": "200%",
              "attackTime": "1.5 sec",
              "cooldownTime": "10 sec",
              "damageModifier": "100% more Attack Damage",
              "attackMaximumActionDistance": "+25"
          }
      },
      {
          "id": "ChaosChimeraBossLeapSlam",
          "name": "Leap Slam",
          "description": "Deals area damage upon landing.",
          "stats": {
              "baseDamage": "180–270",
              "critChance": "5%",
              "attackDamage": "165%",
              "attackTime": "1.5 sec",
              "damageModifier": "65% more Attack Damage",
              "cooldownTime": "9 sec"
          }
      },
      {
          "id": "ChaosChimeraBossWindBlast",
          "name": "Wind Blast",
          "description": "Unleashes a wind blast.",
          "stats": {
              "critChance": "5%",
              "castTime": "1 sec",
              "damage": "16–25 Physical",
              "stunBuildup": "150% more",
              "cooldownTime": "10 sec"
          }
      },
      {
          "id": "ChaosChimeraBossDragonBreath",
          "name": "Dragon Breath",
          "description": "Breathes fire, dealing damage over time.",
          "stats": {
              "castTime": "1 sec",
              "damagePerSecond": "260 Fire",
              "cooldownTime": "25 sec"
          }
      },
      {
          "id": "ChaosChimeraBossFireball",
          "name": "Fireball",
          "description": "Launches a fireball.",
          "stats": {
              "damage": "16–24 Fire",
              "critChance": "5%",
              "castTime": "1 sec",
              "cooldownTime": "15 sec"
          }
      },
      {
          "id": "ChaosChimeraBossFireballImpact",
          "name": "Fireball Impact",
          "description": "Deals fire damage on impact.",
          "stats": {
              "critChance": "5%",
              "castTime": "1 sec",
              "damage": "269-404 Fire",
              "cooldownTime": "10 sec"
          }
      },
      {
          "id": "ChaosChimeraBossFrostBreathImpact",
          "name": "Frost Breath Impact",
          "description": "Deals frost damage on impact.",
          "stats": {
              "critChance": "7%",
              "castTime": "1 sec",
              "damage": "24-36 Cold",
              "chillMagnitude": "200% more",
              "cooldownTime": "10 sec"
          }
      },
      {
          "id": "ChaosChimeraBossLightningBreath",
          "name": "Lightning Breath",
          "description": "Breathes lightning, dealing damage.",
          "stats": {
              "critChance": "6%",
              "castTime": "1 sec",
              "damage": "46-140 Lightning",
              "cooldownTime": "10 sec"
          }
      },
      {
          "id": "ChaosChimeraBossLightningOrbArc",
          "name": "Lightning Orb Arc",
          "description": "Fires a lightning orb that arcs.",
          "stats": {
              "critChance": "6%",
              "castTime": "1 sec",
              "damage": "18-56 Lightning",
              "shockChance": "200%"
          }
      },
      {
          "id": "ChaosChimeraBossLightningOrbExplosion",
          "name": "Lightning Orb Explosion",
          "description": "Explodes a lightning orb.",
          "stats": {
              "critChance": "6%",
              "castTime": "1 sec",
              "damage": "222-414 Lightning",
              "shockChance": "20%"
          }
      },
      {
          "id": "ChaosChimeraBossChaosSprayImpact",
          "name": "Chaos Spray Impact",
          "description": "Deals chaos damage on impact.",
          "stats": {
              "critChance": "5%",
              "castTime": "1 sec",
              "damage": "37-56 Physical",
              "poisonChance": "33%",
              "cooldownTime": "20 sec"
          }
      },
      {
          "id": "ChaosChimeraBossPoisonSpray",
          "name": "Poison Spray",
          "description": "Sprays poison in an area.",
          "stats": {
              "castTime": "1 sec",
              "damagePerSecond": "229 Chaos",
              "cooldownTime": "20 sec"
          }
      }
  ]'
);

-- =============================================
-- Pinnacle Boss
-- =============================================

-- =============================================
-- INSERT DATA for The Trialmaster
-- =============================================

-- Trialmaster Level 80
INSERT INTO TheTrialmaster (
    level,
    base_life, base_armour, base_evasion, base_damage, base_spell_damage, base_accuracy, base_attack_time, base_experience,
    life_percent, es_life_percent, armour_bonus, evasion_bonus, damage_percent, accuracy_percent, crit_chance, crit_damage_bonus, attack_distance, damage_spread, experience_percent,
    res_fire, res_cold, res_lightning, res_chaos,
    type, skills
) VALUES (
    80,
    15609, 4803, 644, 334, 334, 1602, 1.5, 100000,
    '750%', '0%', '+50%', '+0%', '372%', '100%', '5%', '+30%', '8 ~ 28', '±20%', '400%',
    '75%', '75%', '75%', '0%',
    'TheTrialmaster',
    '[
  {
    "id": "TrialMasterSpearSlash",
    "name": "Spear Slash",
    "description": "The Trialmaster slashes with his spear from side to side, inflicting physical damage.",
    "stats": {
      "baseDamage": "993–1490",
      "criticalHitChance": "5%",
      "attackTime": "1.5 sec"
    }
  },
  {
    "id": "TrialMasterSpinningCombo",
    "name": "Spinning Combo",
    "description": "The Trialmaster spins and slashes, unleashing waves of blood that deal physical damage.",
    "stats": {
      "baseDamage": "993–1490",
      "criticalHitChance": "5%",
      "attackTime": "1.5 sec",
      "lacerateWaveCount": "3",
      "cooldownTime": "12 sec"
    }
  },
  {
    "id": "TrialMasterBloodSunder",
    "name": "Blood Sunder",
    "description": "The Trialmaster slams the ground with his spear, launching 4 waves of blood spikes in a cone that deal physical damage.",
    "stats": {
      "baseDamage": "993–1490",
      "criticalHitChance": "5%",
      "attacktime": "1.5 sec",
      "cooldownTime": "8 sec",
      "spreadAngle": "60",
      "sunderWaveCount": "4",
      "physicalReductionOverwhelm": "30%"
    }
  },
  {
    "id": "TrialMasterTimestopSlam",
    "name": "Timestop Slam",
    "description": "The Trialmaster pauses time, and queues up 3 sunders, which will be unleashed after a short delay.",
    "stats": {
      "spellRepeats": 2,
      "radiusBonus": "80"
    }
  },
  {
    "id": "TrialMasterBloodNova",
    "name": "Blood Nova",
    "description": "The Trialmaster stabs his spear into the ground, channeling a large blood nova that detonates after a delay.",
    "stats": {
      "baseDamage": "993–1490",
      "criticalHitChance": "5%",
      "attackDamage": "200%",
      "attackTime": "1.5 sec",
      "physicalReductionOverwhelm": "30%"
    }
  },
  {
    "id": "TrialMasterSpearGroundImpact",
    "name": "Spear Throw",
    "description": "The Trialmaster throws his spear, dealing physical damage to players in an area.",
    "stats": {
      "baseDamage": "993–1490",
      "criticalHitChance": "5%",
      "attackDamage": "50%",
      "attackTime": "1.5 sec",
      "deals": "50% less attack damage"
    }
  },
  {
    "id": "TrialMasterSpearGroundNova",
    "name": "Spear Nova",
    "description": "While the spear is in the ground, it will unleash novas of blood spikes that increase in area, dealing physical damage to players.",
    "stats": {
      "baseDamage": "993–1490",
      "criticalHitChance": "5%",
      "attackDamage": "70%",
      "attackTime": "1.5 sec",
      "armourBreakDamagePercent": "200%",
      "deals": "30% less attack damage"
    }
  },
  {
    "id": "TrialMasterSpearBloodPool",
    "name": "Spear Blood Pool",
    "description": "While the spear is in the ground, it will create a pool of blood that slows player\'s movement.",
    "stats": {
      "castTime": "1 sec",
      "movementSpeedPenalty": "50%",
      "duration": "3 sec"
    }
  },
  {
    "id": "TrialMasterElementalProjectiles",
    "name": "Prismatic Bolt",
    "description": "The Trialmaster fires 3 bolts of elemental damage, dealing fire, cold and lightning damage.",
    "stats": {}
  },
  {
    "id": "TrialMasterFireBoltImpact",
    "name": "Fire Bolt Impact",
    "description": "Fire Orb from Prismatic Bolt",
    "stats": {
      "damage": "435-653 fire damage"
    }
  },
  {
    "id": "TrialMasterColdBoltImpact",
    "name": "Cold Bolt Impact",
    "description": "Cold Orb from Prismatic Bolt",
    "stats": {
      "damage": "435-653 cold damage"
    }
  },
  {
    "id": "TrialMasterLightningBoltImpact",
    "name": "Lightning Bolt Impact",
    "description": "Lightning Orb from Prismatic Bolt",
    "stats": {
      "damage": "272-817 lightning damage"
    }
  },
  {
    "id": "TrialMasterBloodOrb",
    "name": "Blood Orb",
    "description": "The Trialmaster throws a blood orb, which forks off the walls and explodes on contact, dealing physical damage to players in the area.",
    "stats": {
      "damage": "653-980 physical damage",
      "castTime": "1 sec",
      "cooldownTime": "7 sec",
      "richochetDamage": "435-653 physical damage",
      "explosionDamage": "257-314 physical damage",
      "physicalReductionOverwhelm": "30%"
    }
  },
  {
    "id": "TrialMasterTimestopBloodOrb",
    "name": "Timestop Blood Orb",
    "description": "The Trialmaster pauses time, and queues up 3 blood orbs, which will be unleashed after a short delay.",
    "stats": {
      "spellRepeats": 2,
      "radiusBonus": "80"
    }
  },
  {
    "id": "TrialMasterHeartTether",
    "name": "Heart Tether",
    "description": "The Trialmaster places a Heart in the arena, players who enter it\'s area are tethered to it. The tethered player is slowed and will be stunned if they break the tether. The heart will explode after a duration, dealing physical damage to all players in the area.",
    "stats": {
      "damage": "217-326 physical damage",
      "duration": "10 sec",
      "maxTetherRange": "37",
      "movementSpeedPenalty": "70%",
      "chanceToStun": "100%",
      "cooldownTime": "10 sec"
    }
  },
  {
    "id": "TrialMasterTeleport",
    "name": "Teleport",
    "description": "The Trialmaster teleports to a random location in the arena.",
    "stats": {
      "castTime": "1.5 sec",
      "cooldownTime": "10 sec"
    }
  }
]'
);