CREATE DATABASE IF NOT EXISTS affixes;
USE affixes;

CREATE TABLE IF NOT EXISTS prefixes (
    id VARCHAR(255) PRIMARY KEY,
    affix_name VARCHAR(255) NOT NULL,
    ilvl INT NOT NULL,
    clvl INT NOT NULL,
    effect VARCHAR(255) NOT NULL,
    item_tags VARCHAR(255) NOT NULL,
    craft_tags VARCHAR(255),
    weighting INT NOT NULL,
    family VARCHAR(255) NOT NULL,
    affix_type VARCHAR(255) NOT NULL DEFAULT 'prefix'
);

CREATE TABLE IF NOT EXISTS suffixes (
    id VARCHAR(255) PRIMARY KEY,
    affix_name VARCHAR(255) NOT NULL,
    ilvl INT NOT NULL,
    clvl INT NOT NULL,
    effect VARCHAR(255) NOT NULL,
    item_tags VARCHAR(255) NOT NULL,
    craft_tags VARCHAR(255),
    weighting INT NOT NULL,
    family VARCHAR(255) NOT NULL,
    affix_type VARCHAR(255) NOT NULL DEFAULT 'suffix'
);

INSERT INTO prefixes (id, affix_name, ilvl, clvl, effect, item_tags, craft_tags, weighting, family) VALUES
-- //
-- Jewels
-- //

-- //
-- Ruby
-- //

-- //
-- Emerald
-- //

-- //
-- Sapphire
-- //

-- //
-- Weapons
-- //

-- //
-- One Hand
-- //

-- Physical
('AddedPhysicalDamage1', 'Flaring', 77, 61, 'Adds (26-39) to (44-66) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 100, 'PhysicalDamage'),
('AddedPhysicalDamage2', 'Tempered', 65, 52, 'Adds (21-31) to (36-53) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 200, 'PhysicalDamage'),
('AddedPhysicalDamage3', 'RazorSharp', 54, 43, 'Adds (16-24) to (28-42) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 400, 'PhysicalDamage'),
('AddedPhysicalDamage4', 'Annealed', 46, 36, 'Adds (13-20) to (23-35) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 600, 'PhysicalDamage'),
('AddedPhysicalDamage5', 'Gleaming', 36, 28, 'Adds (10-15) to (18-26) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamage6', 'Honed', 29, 23, 'Adds (8-12) to (14-21) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamage7', 'Polished', 21, 16, 'Adds (6-9) to (11-16) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamage8', 'Burnished', 13, 10, 'Adds (4-6) to (7-11) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamage9', 'Glinting', 2, 1, 'Adds (1-2) to (4-5) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),

-- Fire
('AddedFireDamage1', 'Carbonising', 81, 64, 'Adds (52-78) to (79-119) Fire Damage', 'bow, one_hand_weapon', 'damage, elemental, fire, attack', 120, 'FireDamage'),
('AddedFireDamage2', 'Cremating', 74, 59, 'Adds (45-67) to (68-102) Fire Damage', 'bow, one_hand_weapon', 'damage, elemental, fire, attack', 300, 'FireDamage'),
('AddedFireDamage3', 'Blasting', 62, 49, 'Adds (35-52) to (53-79) Fire Damage', 'bow, one_hand_weapon', 'damage, elemental, fire, attack', 480, 'FireDamage'),
('AddedFireDamage4', 'Incinerating', 51, 40, 'Adds (26-39) to (40-59) Fire Damage', 'bow, one_hand_weapon', 'damage, elemental, fire, attack', 720, 'FireDamage'),
('AddedFireDamage5', 'Scorching', 42, 33, 'Adds (20-30) to (31-46) Fire Damage', 'bow, one_hand_weapon', 'damage, elemental, fire, attack', 1200, 'FireDamage'),
('AddedFireDamage6', 'Flaming', 33, 26, 'Adds (14-21) to (22-33) Fire Damage', 'bow, one_hand_weapon', 'damage, elemental, fire, attack', 1200, 'FireDamage'),
('AddedFireDamage7', 'Burning', 26, 20, 'Adds (11-17) to (18-26) Fire Damage', 'bow, one_hand_weapon', 'damage, elemental, fire, attack', 1200, 'FireDamage'),
('AddedFireDamage8', 'Smoking', 18, 14, 'Adds (7-11) to (12-18) Fire Damage', 'bow, one_hand_weapon', 'damage, elemental, fire, attack', 1200, 'FireDamage'),
('AddedFireDamage9', 'Smouldering', 11, 8, 'Adds (4-6) to (7-10) Fire Damage', 'bow, one_hand_weapon', 'damage, elemental, fire, attack', 1200, 'FireDamage'),
('AddedFireDamage10', 'Heated', 1, 1, 'Adds (1-2) to (3-5) Fire Damage', 'bow, one_hand_weapon', 'damage, elemental, fire, attack', 1200, 'FireDamage'),

-- Cold
('AddedColdDamage1', 'Crystalising', 81, 64, 'Adds (42-63) to (64-95) Cold Damage', 'bow, one_hand_weapon', 'damage, elemental, cold, attack', 80, 'ColdDamage'),
('AddedColdDamage2', 'Entombing', 75, 59, 'Adds (37-55) to (56-84) Cold Damage', 'bow, one_hand_weapon', 'damage, elemental, cold, attack', 200, 'ColdDamage'),
('AddedColdDamage3', 'Polar', 63, 49, 'Adds (28-43) to (44-65) Cold Damage', 'bow, one_hand_weapon', 'damage, elemental, cold, attack', 320, 'ColdDamage'),
('AddedColdDamage4', 'Glaciated', 52, 40, 'Adds (21-32) to (33-49) Cold Damage', 'bow, one_hand_weapon', 'damage, elemental, cold, attack', 480, 'ColdDamage'),
('AddedColdDamage5', 'Frozen', 43, 33, 'Adds (16-25) to (26-38) Cold Damage', 'bow, one_hand_weapon', 'damage, elemental, cold, attack', 800, 'ColdDamage'),
('AddedColdDamage6', 'Freezing', 34, 26, 'Adds (12-18) to (19-28) Cold Damage', 'bow, one_hand_weapon', 'damage, elemental, cold, attack', 800, 'ColdDamage'),
('AddedColdDamage7', 'Frigid', 27, 20, 'Adds (9-14) to (15-22) Cold Damage', 'bow, one_hand_weapon', 'damage, elemental, cold, attack', 800, 'ColdDamage'),
('AddedColdDamage8', 'Icy', 19, 14, 'Adds (6-9) to (10-15) Cold Damage', 'bow, one_hand_weapon', 'damage, elemental, cold, attack', 800, 'ColdDamage'),
('AddedColdDamage9', 'Chilled', 12, 8, 'Adds (3-5) to (6-9) Cold Damage', 'bow, one_hand_weapon', 'damage, elemental, cold, attack', 800, 'ColdDamage'),
('AddedColdDamage10', 'Frosted', 1, 1, 'Adds (1-2) to (3-4) Cold Damage', 'bow, one_hand_weapon', 'damage, elemental, cold, attack', 800, 'ColdDamage'),

-- Lightning
('AddedLightningDamage1', 'Vapourising', 81, 64, 'Adds (1-10) to (125-180) Lightning Damage', 'bow, one_hand_weapon', 'damage, elemental, lightning, attack', 80, 'LightningDamage'),
('AddedLightningDamage2', 'Electrocuting', 74, 59, 'Adds (1-8) to (108-155) Lightning Damage', 'bow, one_hand_weapon', 'damage, elemental, lightning, attack', 200, 'LightningDamage'),
('AddedLightningDamage3', 'Discharging', 63, 49, 'Adds (1-7) to (86-123) Lightning Damage', 'bow, one_hand_weapon', 'damage, elemental, lightning, attack', 320, 'LightningDamage'),
('AddedLightningDamage4', 'Shocking', 51, 40, 'Adds (1-5) to (62-89) Lightning Damage', 'bow, one_hand_weapon', 'damage, elemental, lightning, attack', 480, 'LightningDamage'),
('AddedLightningDamage5', 'Arcing', 42, 33, 'Adds (1-4) to (49-70) Lightning Damage', 'bow, one_hand_weapon', 'damage, elemental, lightning, attack', 800, 'LightningDamage'),
('AddedLightningDamage6', 'Sparking', 34, 26, 'Adds (1-3) to (37-52) Lightning Damage', 'bow, one_hand_weapon', 'damage, elemental, lightning, attack', 800, 'LightningDamage'),
('AddedLightningDamage7', 'Crackling', 31, 20, 'Adds (1-3) to (33-47) Lightning Damage', 'bow, one_hand_weapon', 'damage, elemental, lightning, attack', 800, 'LightningDamage'),
('AddedLightningDamage8', 'Snapping', 19, 14, 'Adds 1 to (19-28) Lightning Damage', 'bow, one_hand_weapon', 'damage, elemental, lightning, attack', 800, 'LightningDamage'),
('AddedLightningDamage9', 'Buzzing', 13, 8, 'Adds 1 to (13-18) Lightning Damage', 'bow, one_hand_weapon', 'damage, elemental, lightning, attack', 800, 'LightningDamage'),
('AddedLightningDamage10', 'Humming', 1, 1, 'Adds 1 to (4-6) Lightning Damage', 'bow, one_hand_weapon', 'damage, elemental, lightning, attack', 800, 'LightningDamage'),

-- WED
('WeaponElementalDamage1', 'Devastating', 81, 64, '(87-100)% increased Elemental Damage with Attacks', 'bow, one_hand_weapon', 'damage, elemental, attack', 500, 'WeaponElementalDamage'),
('WeaponElementalDamage2', 'Overpowering', 60, 48, '(73-85)% increased Elemental Damage with Attacks', 'bow, one_hand_weapon', 'damage, elemental, attack', 500, 'WeaponElementalDamage'),
('WeaponElementalDamage3', 'Unleashed', 45, 36, '(63-71)% increased Elemental Damage with Attacks', 'bow, one_hand_weapon', 'damage, elemental, attack', 500, 'WeaponElementalDamage'),
('WeaponElementalDamage4', 'Empowering', 30, 24, '(53-61)% increased Elemental Damage with Attacks', 'bow, one_hand_weapon', 'damage, elemental, attack', 500, 'WeaponElementalDamage'),
('WeaponElementalDamage5', 'Infusing', 15, 12, '(36-51)% increased Elemental Damage with Attacks', 'bow, one_hand_weapon', 'damage, elemental, attack', 500, 'WeaponElementalDamage'),
('WeaponElementalDamage6', 'Catalysing', 4, 3, '(19-34)% increased Elemental Damage with Attacks', 'bow, one_hand_weapon', 'damage, elemental, attack', 500, 'WeaponElementalDamage'),

-- Spell Damage
('SpellDamage1', 'Runic', 80, 64, '(105-119)% increased Spell Damage', 'wand, focus', 'damage,caster', 50, 'SpellDamage'),
('SpellDamage2', 'Glyphic', 70, 56, '(90-104)% increased Spell Damage', 'wand, focus', 'damage,caster', 100, 'SpellDamage'),
('SpellDamage3', 'Incanter', 58, 46, '(75-89)% increased Spell Damage', 'wand, focus', 'damage,caster', 200, 'SpellDamage'),
('SpellDamage4', 'Occultist', 46, 36, '(65-74)% increased Spell Damage', 'wand, focus', 'damage,caster', 400, 'SpellDamage'),
('SpellDamage5', 'Professor', 35, 28, '(55-64)% increased Spell Damage', 'wand, focus', 'damage,caster', 600, 'SpellDamage'),
('SpellDamage6', 'Scholar', 23, 18, '(45-54)% increased Spell Damage', 'wand, focus', 'damage,caster', 1000, 'SpellDamage'),
('SpellDamage7', 'Adept', 11, 8, '(35-44)% increased Spell Damage', 'wand, focus', 'damage,caster', 1000, 'SpellDamage'),
('SpellDamage8', 'Apprentice', 1, 1, '(25-34)% increased Spell Damage', 'wand, focus', 'damage,caster', 1000, 'SpellDamage'),

-- Spell Hybrid
('SpellDamageHybridWand1', 'Lich', 79, 63, '(45-49)% increased Spell Damage\n+(42-45) to maximum Mana', 'wand', 'mana,damage,caster', 100, 'SpellDamageHybrid'),
('SpellDamageHybridWand2', 'Archmage', 63, 50, '(40-44)% increased Spell Damage\n+(38-41) to maximum Mana', 'wand', 'mana,damage,caster', 200, 'SpellDamageHybrid'),
('SpellDamageHybridWand3', 'Mage', 48, 38, '(35-39)% increased Spell Damage\n+(34-37) to maximum Mana', 'wand', 'mana,damage,caster', 400, 'SpellDamageHybrid'),
('SpellDamageHybridWand4', 'Warlock', 35, 28, '(30-34)% increased Spell Damage\n+(29-33) to maximum Mana', 'wand', 'mana,damage,caster', 600, 'SpellDamageHybrid'),
('SpellDamageHybridWand5', 'Wizard', 23, 18, '(25-29)% increased Spell Damage\n+(25-28) to maximum Mana', 'wand', 'mana,damage,caster', 1000, 'SpellDamageHybrid'),
('SpellDamageHybridWand6', 'Conjuror', 11, 8, '(20-24)% increased Spell Damage\n+(21-24) to maximum Mana', 'wand', 'mana,damage,caster', 1000, 'SpellDamageHybrid'),
('SpellDamageHybridWand7', 'Caster', 2, 1, '(15-19)% increased Spell Damage\n+(17-20) to maximum Mana', 'wand', 'mana,damage,caster', 1000, 'SpellDamageHybrid'),

-- Spell Physical
('SpellPhysicalDamage1', 'Torturer', 81, 64, '(105-119)% increased Spell Physical Damage', 'wand, focus', 'damage,physical', 50, 'SpellPhysicalDamage'),
('SpellPhysicalDamage2', 'Oppressor', 71, 56, '(90-104)% increased Spell Physical Damage', 'wand, focus', 'damage,physical', 100, 'SpellPhysicalDamage'),
('SpellPhysicalDamage3', 'Agonising', 59, 47, '(75-89)% increased Spell Physical Damage', 'wand, focus', 'damage,physical', 200, 'SpellPhysicalDamage'),
('SpellPhysicalDamage4', 'Pitiless', 47, 37, '(65-74)% increased Spell Physical Damage', 'wand, focus', 'damage,physical', 300, 'SpellPhysicalDamage'),
('SpellPhysicalDamage5', 'Sadistic', 36, 28, '(55-64)% increased Spell Physical Damage', 'wand, focus', 'damage,physical', 400, 'SpellPhysicalDamage'),
('SpellPhysicalDamage6', 'Vengeful', 24, 19, '(45-54)% increased Spell Physical Damage', 'wand, focus', 'damage,physical', 500, 'SpellPhysicalDamage'),
('SpellPhysicalDamage7', 'Unforgiving', 12, 9, '(35-44)% increased Spell Physical Damage', 'wand, focus', 'damage,physical', 500, 'SpellPhysicalDamage'),
('SpellPhysicalDamage8', 'Punishing', 2, 1, '(25-34)% increased Spell Physical Damage', 'wand, focus', 'damage,physical', 500, 'SpellPhysicalDamage'),

-- Spell Fire
('SpellFireDamage1', 'Pyromancer', 81, 64, '(105-119)% increased Fire Damage', 'wand, focus', 'damage,elemental,fire', 50, 'SpellFireDamage'),
('SpellFireDamage2', 'Volcanic', 71, 56, '(90-104)% increased Fire Damage', 'wand, focus', 'damage,elemental,fire', 100, 'SpellFireDamage'),
('SpellFireDamage3', 'Magmatic', 59, 47, '(75-89)% increased Fire Damage', 'wand, focus', 'damage,elemental,fire', 200, 'SpellFireDamage'),
('SpellFireDamage4', 'Smoldering', 47, 37, '(65-74)% increased Fire Damage', 'wand, focus', 'damage,elemental,fire', 300, 'SpellFireDamage'),
('SpellFireDamage5', 'Cauterising', 36, 28, '(55-64)% increased Fire Damage', 'wand, focus', 'damage,elemental,fire', 400, 'SpellFireDamage'),
('SpellFireDamage6', 'Blistering', 24, 19, '(45-54)% increased Fire Damage', 'wand, focus', 'damage,elemental,fire', 500, 'SpellFireDamage'),
('SpellFireDamage7', 'Sizzling', 12, 9, '(35-44)% increased Fire Damage', 'wand, focus', 'damage,elemental,fire', 500, 'SpellFireDamage'),
('SpellFireDamage8', 'Searing', 2, 1, '(25-34)% increased Fire Damage', 'wand, focus', 'damage,elemental,fire', 500, 'SpellFireDamage'),

-- Spell Cold
('SpellColdDamage1', 'Cryomancer', 81, 64, '(105-119)% increased Cold Damage', 'wand, focus', 'damage,elemental,cold', 50, 'SpellColdDamage'),
('SpellColdDamage2', 'Crystalline', 71, 56, '(90-104)% increased Cold Damage', 'wand, focus', 'damage,elemental,cold', 100, 'SpellColdDamage'),
('SpellColdDamage3', 'Arctic', 59, 47, '(75-89)% increased Cold Damage', 'wand, focus', 'damage,elemental,cold', 200, 'SpellColdDamage'),
('SpellColdDamage4', 'Hailing', 47, 37, '(65-74)% increased Cold Damage', 'wand, focus', 'damage,elemental,cold', 300, 'SpellColdDamage'),
('SpellColdDamage5', 'Snowy', 36, 28, '(55-64)% increased Cold Damage', 'wand, focus', 'damage,elemental,cold', 400, 'SpellColdDamage'),
('SpellColdDamage6', 'Alpine', 24, 19, '(45-54)% increased Cold Damage', 'wand, focus', 'damage,elemental,cold', 500, 'SpellColdDamage'),
('SpellColdDamage7', 'Biting', 12, 9, '(35-44)% increased Cold Damage', 'wand, focus', 'damage,elemental,cold', 500, 'SpellColdDamage'),
('SpellColdDamage8', 'Bitter', 2, 1, '(25-34)% increased Cold Damage', 'wand, focus', 'damage,elemental,cold', 500, 'SpellColdDamage'),

-- Spell Lightning
('SpellLightningDamage1', 'Electromancer', 81, 64, '(105-119)% increased Lightning Damage', 'wand, focus', 'damage,elemental,lightning', 50, 'SpellLightningDamage'),
('SpellLightningDamage2', 'Ionising', 71, 56, '(90-104)% increased Lightning Damage', 'wand, focus', 'damage,elemental,lightning', 100, 'SpellLightningDamage'),
('SpellLightningDamage3', 'Smiting', 59, 47, '(75-89)% increased Lightning Damage', 'wand, focus', 'damage,elemental,lightning', 200, 'SpellLightningDamage'),
('SpellLightningDamage4', 'Striking', 47, 37, '(65-74)% increased Lightning Damage', 'wand, focus', 'damage,elemental,lightning', 300, 'SpellLightningDamage'),
('SpellLightningDamage5', 'Coursing', 36, 28, '(55-64)% increased Lightning Damage', 'wand, focus', 'damage,elemental,lightning', 400, 'SpellLightningDamage'),
('SpellLightningDamage6', 'Bolting', 24, 19, '(45-54)% increased Lightning Damage', 'wand, focus', 'damage,elemental,lightning', 500, 'SpellLightningDamage'),
('SpellLightningDamage7', 'Hissing', 12, 9, '(35-44)% increased Lightning Damage', 'wand, focus', 'damage,elemental,lightning', 500, 'SpellLightningDamage'),
('SpellLightningDamage8', 'Charged', 2, 1, '(25-34)% increased Lightning Damage', 'wand, focus', 'damage,elemental,lightning', 500, 'SpellLightningDamage'),

-- Spell Chaos
('SpellChaosDamage1', 'Malevolent', 81, 64, '(105-119)% increased Chaos Damage', 'wand, focus', 'damage,chaos', 50, 'SpellChaosDamage'),
('SpellChaosDamage2', 'Twisted', 71, 56, '(90-104)% increased Chaos Damage', 'wand, focus', 'damage,chaos', 100, 'SpellChaosDamage'),
('SpellChaosDamage3', 'Vile', 59, 47, '(75-89)% increased Chaos Damage', 'wand, focus', 'damage,chaos', 200, 'SpellChaosDamage'),
('SpellChaosDamage4', 'Malignant', 47, 37, '(65-74)% increased Chaos Damage', 'wand, focus', 'damage,chaos', 300, 'SpellChaosDamage'),
('SpellChaosDamage5', 'Darkened', 36, 28, '(55-64)% increased Chaos Damage', 'wand, focus', 'damage,chaos', 400, 'SpellChaosDamage'),
('SpellChaosDamage6', 'Clouded', 24, 19, '(45-54)% increased Chaos Damage', 'wand, focus', 'damage,chaos', 500, 'SpellChaosDamage'),
('SpellChaosDamage7', 'Tainted', 12, 9, '(35-44)% increased Chaos Damage', 'wand, focus', 'damage,chaos', 500, 'SpellChaosDamage'),
('SpellChaosDamage8', 'Impure', 2, 1, '(25-34)% increased Chaos Damage', 'wand, focus', 'damage,chaos', 500, 'SpellChaosDamage'),

-- //
-- Two Hand
-- //

-- Physical
('AddedPhysicalDamageTwoHand1', 'Flaring', 77, 61, 'Adds (37-55) to (63-94) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 100, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand2', 'Tempered', 65, 52, 'Adds (29-44) to (50-75) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 200, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand3', 'RazorSharp', 54, 43, 'Adds (23-35) to (39-59) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 400, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand4', 'Annealed', 46, 36, 'Adds (19-29) to (33-49) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 600, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand5', 'Gleaming', 36, 28, 'Adds (14-21) to (25-37) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand6', 'Honed', 29, 23, 'Adds (11-17) to (20-30) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand7', 'Polished', 21, 16, 'Adds (8-12) to (15-22) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand8', 'Burnished', 13, 10, 'Adds (5-8) to (10-15) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand9', 'Glinting', 2, 1, 'Adds (2-3) to (5-7) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),

-- Fire
('AddedFireDamageTwoHand1', 'Carbonising', 81, 64, 'Adds (74-112) to (113-169) Fire Damage', 'two_hand_weapon', 'damage, elemental, fire, attack', 120, 'FireDamage'),
('AddedFireDamageTwoHand2', 'Cremating', 74, 59, 'Adds (64-96) to (97-146) Fire Damage', 'two_hand_weapon', 'damage, elemental, fire, attack', 300, 'FireDamage'),
('AddedFireDamageTwoHand3', 'Blasting', 62, 49, 'Adds (49-74) to (75-113) Fire Damage', 'two_hand_weapon', 'damage, elemental, fire, attack', 480, 'FireDamage'),
('AddedFireDamageTwoHand4', 'Incinerating', 51, 40, 'Adds (37-55) to (56-84) Fire Damage', 'two_hand_weapon', 'damage, elemental, fire, attack', 720, 'FireDamage'),
('AddedFireDamageTwoHand5', 'Scorching', 42, 33, 'Adds (28-43) to (44-65) Fire Damage', 'two_hand_weapon', 'damage, elemental, fire, attack', 1200, 'FireDamage'),
('AddedFireDamageTwoHand6', 'Flaming', 33, 26, 'Adds (20-31) to (32-47) Fire Damage', 'two_hand_weapon', 'damage, elemental, fire, attack', 1200, 'FireDamage'),
('AddedFireDamageTwoHand7', 'Burning', 26, 20, 'Adds (16-24) to (25-37) Fire Damage', 'two_hand_weapon', 'damage, elemental, fire, attack', 1200, 'FireDamage'),
('AddedFireDamageTwoHand8', 'Smoking', 18, 14, 'Adds (10-16) to (17-25) Fire Damage', 'two_hand_weapon', 'damage, elemental, fire, attack', 1200, 'FireDamage'),
('AddedFireDamageTwoHand9', 'Smouldering', 11, 8, 'Adds (6-9) to (10-15) Fire Damage', 'two_hand_weapon', 'damage, elemental, fire, attack', 1200, 'FireDamage'),
('AddedFireDamageTwoHand10', 'Heated', 1, 1, 'Adds (2-4) to (5-7) Fire Damage', 'two_hand_weapon', 'damage, elemental, fire, attack', 1200, 'FireDamage'),

-- Cold
('AddedColdDamageTwoHand1', 'Crystalising', 81, 64, 'Adds (59-89) to (90-135) Cold Damage', 'two_hand_weapon', 'damage, elemental, cold, attack', 80, 'ColdDamage'),
('AddedColdDamageTwoHand2', 'Entombing', 75, 59, 'Adds (52-79) to (80-119) Cold Damage', 'two_hand_weapon', 'damage, elemental, cold, attack', 200, 'ColdDamage'),
('AddedColdDamageTwoHand3', 'Polar', 63, 49, 'Adds (40-61) to (62-92) Cold Damage', 'two_hand_weapon', 'damage, elemental, cold, attack', 320, 'ColdDamage'),
('AddedColdDamageTwoHand4', 'Glaciated', 52, 40, 'Adds (30-45) to (46-69) Cold Damage', 'two_hand_weapon', 'damage, elemental, cold, attack', 480, 'ColdDamage'),
('AddedColdDamageTwoHand5', 'Frozen', 43, 33, 'Adds (23-35) to (36-54) Cold Damage', 'two_hand_weapon', 'damage, elemental, cold, attack', 800, 'ColdDamage'),
('AddedColdDamageTwoHand6', 'Freezing', 34, 26, 'Adds (17-25) to (26-39) Cold Damage', 'two_hand_weapon', 'damage, elemental, cold, attack', 800, 'ColdDamage'),
('AddedColdDamageTwoHand7', 'Frigid', 27, 20, 'Adds (13-20) to (21-31) Cold Damage', 'two_hand_weapon', 'damage, elemental, cold, attack', 800, 'ColdDamage'),
('AddedColdDamageTwoHand8', 'Icy', 19, 14, 'Adds (9-13) to (14-21) Cold Damage', 'two_hand_weapon', 'damage, elemental, cold, attack', 800, 'ColdDamage'),
('AddedColdDamageTwoHand9', 'Chilled', 12, 8, 'Adds (5-8) to (9-13) Cold Damage', 'two_hand_weapon', 'damage, elemental, cold, attack', 800, 'ColdDamage'),
('AddedColdDamageTwoHand10', 'Frosted', 1, 1, 'Adds (2-3) to (4-6) Cold Damage', 'two_hand_weapon', 'damage, elemental, cold, attack', 800, 'ColdDamage'),

-- Lightning
('AddedLightningDamageTwoHand1', 'Vapourising', 81, 64, 'Adds (1-14) to (178-256) Lightning Damage', 'two_hand_weapon', 'damage, elemental, lightning, attack', 80, 'LightningDamage'),
('AddedLightningDamageTwoHand2', 'Electrocuting', 74, 59, 'Adds (1-12) to (154-221) Lightning Damage', 'two_hand_weapon', 'damage, elemental, lightning, attack', 200, 'LightningDamage'),
('AddedLightningDamageTwoHand3', 'Discharging', 63, 49, 'Adds (1-10) to (122-175) Lightning Damage', 'two_hand_weapon', 'damage, elemental, lightning, attack', 320, 'LightningDamage'),
('AddedLightningDamageTwoHand4', 'Shocking', 51, 40, 'Adds (1-7) to (88-127) Lightning Damage', 'two_hand_weapon', 'damage, elemental, lightning, attack', 480, 'LightningDamage'),
('AddedLightningDamageTwoHand5', 'Arcing', 42, 33, 'Adds (1-5) to (69-99) Lightning Damage', 'two_hand_weapon', 'damage, elemental, lightning, attack', 800, 'LightningDamage'),
('AddedLightningDamageTwoHand6', 'Sparking', 34, 26, 'Adds (1-4) to (52-74) Lightning Damage', 'two_hand_weapon', 'damage, elemental, lightning, attack', 800, 'LightningDamage'),
('AddedLightningDamageTwoHand7', 'Crackling', 31, 20, 'Adds (1-4) to (46-66) Lightning Damage', 'two_hand_weapon', 'damage, elemental, lightning, attack', 800, 'LightningDamage'),
('AddedLightningDamageTwoHand8', 'Snapping', 19, 14, 'Adds (1-2) to (28-39) Lightning Damage', 'two_hand_weapon', 'damage, elemental, lightning, attack', 800, 'LightningDamage'),
('AddedLightningDamageTwoHand9', 'Buzzing', 13, 8, 'Adds 1 to (18-25) Lightning Damage', 'two_hand_weapon', 'damage, elemental, lightning, attack', 800, 'LightningDamage'),
('AddedLightningDamageTwoHand10', 'Humming', 1, 1, 'Adds 1 to (7-10) Lightning Damage', 'two_hand_weapon', 'damage, elemental, lightning, attack', 800, 'LightningDamage'),

-- WED
('WeaponElementalDamageTwoHand1', 'Devastating', 81, 64, '(120-139)% increased Elemental Damage with Attacks', 'two_hand_weapon', 'damage, elemental, attack', 500, 'WeaponElementalDamage'),
('WeaponElementalDamageTwoHand2', 'Overpowering', 60, 48, '(100-119)% increased Elemental Damage with Attacks', 'two_hand_weapon', 'damage, elemental, attack', 500, 'WeaponElementalDamage'),
('WeaponElementalDamageTwoHand3', 'Unleashed', 45, 36, '(86-99)% increased Elemental Damage with Attacks', 'two_hand_weapon', 'damage, elemental, attack', 500, 'WeaponElementalDamage'),
('WeaponElementalDamageTwoHand4', 'Empowering', 30, 24, '(72-85)% increased Elemental Damage with Attacks', 'two_hand_weapon', 'damage, elemental, attack', 500, 'WeaponElementalDamage'),
('WeaponElementalDamageTwoHand5', 'Infusing', 15, 12, '(48-71)% increased Elemental Damage with Attacks', 'two_hand_weapon', 'damage, elemental, attack', 500, 'WeaponElementalDamage'),
('WeaponElementalDamageTwoHand6', 'Catalysing', 4, 3, '(34-47)% increased Elemental Damage with Attacks', 'two_hand_weapon', 'damage, elemental, attack', 500, 'WeaponElementalDamage'),

-- Spell Damage
('SpellDamageStaff1', 'Runic', 80, 64, '(150-169)% increased Spell Damage', 'staff', 'damage,caster', 50, 'SpellDamage'),
('SpellDamageStaff2', 'Glyphic', 70, 56, '(130-149)% increased Spell Damage', 'staff', 'damage,caster', 100, 'SpellDamage'),
('SpellDamageStaff3', 'Incanter', 58, 46, '(110-129)% increased Spell Damage', 'staff', 'damage,caster', 200, 'SpellDamage'),
('SpellDamageStaff4', 'Occultist', 46, 36, '(95-109)% increased Spell Damage', 'staff', 'damage,caster', 400, 'SpellDamage'),
('SpellDamageStaff5', 'Professor', 35, 28, '(80-94)% increased Spell Damage', 'staff', 'damage,caster', 600, 'SpellDamage'),
('SpellDamageStaff6', 'Scholar', 23, 18, '(65-79)% increased Spell Damage', 'staff', 'damage,caster', 1000, 'SpellDamage'),
('SpellDamageStaff7', 'Adept', 11, 8, '(50-64)% increased Spell Damage', 'staff', 'damage,caster', 1000, 'SpellDamage'),
('SpellDamageStaff8', 'Apprentice', 1, 1, '(35-49)% increased Spell Damage', 'staff', 'damage,caster', 1000, 'SpellDamage'),

-- Spell Hybrid
('SpellDamageHybridStaff1', 'Lich', 79, 63, '(64-69)% increased Spell Damage\n+(60-64) to maximum Mana', 'staff', 'mana,damage,caster', 100, 'SpellDamageHybrid'),
('SpellDamageHybridStaff2', 'Archmage', 63, 50, '(56-62)% increased Spell Damage\n+(54-59) to maximum Mana', 'staff', 'mana,damage,caster', 200, 'SpellDamageHybrid'),
('SpellDamageHybridStaff3', 'Mage', 48, 38, '(49-55)% increased Spell Damage\n+(48-53) to maximum Mana', 'staff', 'mana,damage,caster', 400, 'SpellDamageHybrid'),
('SpellDamageHybridStaff4', 'Warlock', 35, 28, '(42-48)% increased Spell Damage\n+(42-47) to maximum Mana', 'staff', 'mana,damage,caster', 600, 'SpellDamageHybrid'),
('SpellDamageHybridStaff5', 'Wizard', 23, 18, '(35-41)% increased Spell Damage\n+(36-41) to maximum Mana', 'staff', 'mana,damage,caster', 1000, 'SpellDamageHybrid'),
('SpellDamageHybridStaff6', 'Conjuror', 11, 8, '(28-34)% increased Spell Damage\n+(31-35) to maximum Mana', 'staff', 'mana,damage,caster', 1000, 'SpellDamageHybrid'),
('SpellDamageHybridStaff7', 'Caster', 2, 1, '(21-27)% increased Spell Damage\n+(26-30) to maximum Mana', 'staff', 'mana,damage,caster', 1000, 'SpellDamageHybrid'),

-- Spell Physical
('SpellPhysicalDamageStaff1', 'Torturer', 81, 64, '(150-169)% increased Spell Physical Damage', 'staff', 'damage,physical', 50, 'SpellPhysicalDamage'),
('SpellPhysicalDamageStaff2', 'Oppressor', 71, 56, '(130-149)% increased Spell Physical Damage', 'staff', 'damage,physical', 100, 'SpellPhysicalDamage'),
('SpellPhysicalDamageStaff3', 'Agonising', 59, 47, '(110-129)% increased Spell Physical Damage', 'staff', 'damage,physical', 200, 'SpellPhysicalDamage'),
('SpellPhysicalDamageStaff4', 'Pitiless', 47, 37, '(95-109)% increased Spell Physical Damage', 'staff', 'damage,physical', 300, 'SpellPhysicalDamage'),
('SpellPhysicalDamageStaff5', 'Sadistic', 36, 28, '(80-94)% increased Spell Physical Damage', 'staff', 'damage,physical', 400, 'SpellPhysicalDamage'),
('SpellPhysicalDamageStaff6', 'Vengeful', 24, 19, '(65-79)% increased Spell Physical Damage', 'staff', 'damage,physical', 500, 'SpellPhysicalDamage'),
('SpellPhysicalDamageStaff7', 'Unforgiving', 12, 9, '(50-64)% increased Spell Physical Damage', 'staff', 'damage,physical', 500, 'SpellPhysicalDamage'),
('SpellPhysicalDamageStaff8', 'Punishing', 2, 1, '(35-49)% increased Spell Physical Damage', 'staff', 'damage,physical', 500, 'SpellPhysicalDamage'),

-- Spell Fire
('SpellFireDamageStaff1', 'Pyromancer', 81, 64, '(150-169)% increased Fire Damage', 'staff', 'damage,elemental,fire', 50, 'SpellFireDamage'),
('SpellFireDamageStaff2', 'Volcanic', 71, 56, '(130-149)% increased Fire Damage', 'staff', 'damage,elemental,fire', 100, 'SpellFireDamage'),
('SpellFireDamageStaff3', 'Magmatic', 59, 47, '(110-129)% increased Fire Damage', 'staff', 'damage,elemental,fire', 200, 'SpellFireDamage'),
('SpellFireDamageStaff4', 'Smoldering', 47, 37, '(95-109)% increased Fire Damage', 'staff', 'damage,elemental,fire', 300, 'SpellFireDamage'),
('SpellFireDamageStaff5', 'Cauterising', 36, 28, '(80-94)% increased Fire Damage', 'staff', 'damage,elemental,fire', 400, 'SpellFireDamage'),
('SpellFireDamageStaff6', 'Blistering', 24, 19, '(65-79)% increased Fire Damage', 'staff', 'damage,elemental,fire', 500, 'SpellFireDamage'),
('SpellFireDamageStaff7', 'Sizzling', 12, 9, '(50-64)% increased Fire Damage', 'staff', 'damage,elemental,fire', 500, 'SpellFireDamage'),
('SpellFireDamageStaff8', 'Searing', 2, 1, '(35-49)% increased Fire Damage', 'staff', 'damage,elemental,fire', 500, 'SpellFireDamage'),

-- Spell Cold
('SpellColdDamageStaff1', 'Cryomancer', 81, 64, '(150-169)% increased Cold Damage', 'staff', 'damage,elemental,cold', 50, 'SpellColdDamage'),
('SpellColdDamageStaff2', 'Crystalline', 71, 56, '(130-149)% increased Cold Damage', 'staff', 'damage,elemental,cold', 100, 'SpellColdDamage'),
('SpellColdDamageStaff3', 'Arctic', 59, 47, '(110-129)% increased Cold Damage', 'staff', 'damage,elemental,cold', 200, 'SpellColdDamage'),
('SpellColdDamageStaff4', 'Hailing', 47, 37, '(95-109)% increased Cold Damage', 'staff', 'damage,elemental,cold', 300, 'SpellColdDamage'),
('SpellColdDamageStaff5', 'Snowy', 36, 28, '(80-94)% increased Cold Damage', 'staff', 'damage,elemental,cold', 400, 'SpellColdDamage'),
('SpellColdDamageStaff6', 'Alpine', 24, 19, '(65-79)% increased Cold Damage', 'staff', 'damage,elemental,cold', 500, 'SpellColdDamage'),
('SpellColdDamageStaff7', 'Biting', 12, 9, '(50-64)% increased Cold Damage', 'staff', 'damage,elemental,cold', 500, 'SpellColdDamage'),
('SpellColdDamageStaff8', 'Bitter', 2, 1, '(35-49)% increased Cold Damage', 'staff', 'damage,elemental,cold', 500, 'SpellColdDamage'),

-- Spell Lightning
('SpellLightningDamageStaff1', 'Electromancer', 81, 64, '(150-169)% increased Lightning Damage', 'staff', 'damage,elemental,lightning', 50, 'SpellLightningDamage'),
('SpellLightningDamageStaff2', 'Ionising', 71, 56, '(130-149)% increased Lightning Damage', 'staff', 'damage,elemental,lightning', 100, 'SpellLightningDamage'),
('SpellLightningDamageStaff3', 'Smiting', 59, 47, '(110-129)% increased Lightning Damage', 'staff', 'damage,elemental,lightning', 200, 'SpellLightningDamage'),
('SpellLightningDamageStaff4', 'Striking', 47, 37, '(95-109)% increased Lightning Damage', 'staff', 'damage,elemental,lightning', 300, 'SpellLightningDamage'),
('SpellLightningDamageStaff5', 'Coursing', 36, 28, '(80-94)% increased Lightning Damage', 'staff', 'damage,elemental,lightning', 400, 'SpellLightningDamage'),
('SpellLightningDamageStaff6', 'Bolting', 24, 19, '(65-79)% increased Lightning Damage', 'staff', 'damage,elemental,lightning', 500, 'SpellLightningDamage'),
('SpellLightningDamageStaff7', 'Hissing', 12, 9, '(50-64)% increased Lightning Damage', 'staff', 'damage,elemental,lightning', 500, 'SpellLightningDamage'),
('SpellLightningDamageStaff8', 'Charged', 2, 1, '(35-49)% increased Lightning Damage', 'staff', 'damage,elemental,lightning', 500, 'SpellLightningDamage'),

-- Spell Chaos
('SpellChaosDamageStaff1', 'Malevolent', 81, 64, '(150-169)% increased Chaos Damage', 'staff', 'damage,chaos', 50, 'SpellChaosDamage'),
('SpellChaosDamageStaff2', 'Twisted', 71, 56, '(130-149)% increased Chaos Damage', 'staff', 'damage,chaos', 100, 'SpellChaosDamage'),
('SpellChaosDamageStaff3', 'Vile', 59, 47, '(110-129)% increased Chaos Damage', 'staff', 'damage,chaos', 200, 'SpellChaosDamage'),
('SpellChaosDamageStaff4', 'Malignant', 47, 37, '(95-109)% increased Chaos Damage', 'staff', 'damage,chaos', 300, 'SpellChaosDamage'),
('SpellChaosDamageStaff5', 'Darkened', 36, 28, '(80-94)% increased Chaos Damage', 'staff', 'damage,chaos', 400, 'SpellChaosDamage'),
('SpellChaosDamageStaff6', 'Clouded', 24, 19, '(65-79)% increased Chaos Damage', 'staff', 'damage,chaos', 500, 'SpellChaosDamage'),
('SpellChaosDamageStaff7', 'Tainted', 12, 9, '(50-64)% increased Chaos Damage', 'staff', 'damage,chaos', 500, 'SpellChaosDamage'),
('SpellChaosDamageStaff8', 'Impure', 2, 1, '(35-49)% increased Chaos Damage', 'staff', 'damage,chaos', 500, 'SpellChaosDamage'),

-- //
-- Weapons Shared
-- //

-- Physical Percent
('IncreasedPhysicalPercent1', 'Merciless', 82, 65, '(170-179)% increased Physical Damage', 'weapon', 'damage, physical, attack', 25, 'PhysicalPercent'),
('IncreasedPhysicalPercent2', 'Tyrannical', 73, 58, '(155-169)% increased Physical Damage', 'weapon', 'damage, physical, attack', 50, 'PhysicalPercent'),
('IncreasedPhysicalPercent3', 'Cruel', 60, 48, '(135-154)% increased Physical Damage', 'weapon', 'damage, physical, attack', 100, 'PhysicalPercent'),
('IncreasedPhysicalPercent4', 'Bloodthirsty', 46, 36, '(110-134)% increased Physical Damage', 'weapon', 'damage, physical, attack', 200, 'PhysicalPercent'),
('IncreasedPhysicalPercent5', 'Vicious', 35, 28, '(85-109)% increased Physical Damage', 'weapon', 'damage, physical, attack', 400, 'PhysicalPercent'),
('IncreasedPhysicalPercent6', 'Wicked', 23, 18, '(65-84)% increased Physical Damage', 'weapon', 'damage, physical, attack', 1000, 'PhysicalPercent'),
('IncreasedPhysicalPercent7', 'Serrated', 11, 8, '(50-64)% increased Physical Damage', 'weapon', 'damage, physical, attack', 1000, 'PhysicalPercent'),
('IncreasedPhysicalPercent8', 'Heavy', 1, 1, '(40-49)% increased Physical Damage', 'weapon', 'damage, physical, attack', 1000, 'PhysicalPercent'),

-- Physical Hybrid
('IncreasedPhysicalPercentAccuracy1', 'Dictator', 81, 64, '(75-79)% increased Physical Damage\n+(175-200) to Accuracy Rating', 'weapon', 'damage, physical, attack', 100, 'PhysicalPercentAccuracy'),
('IncreasedPhysicalPercentAccuracy2', 'Emperor', 76, 60, '(65-74)% increased Physical Damage\n+(150-174) to Accuracy Rating', 'weapon', 'damage, physical, attack', 200, 'PhysicalPercentAccuracy'),
('IncreasedPhysicalPercentAccuracy3', 'Conqueror', 65, 52, '(55-64)% increased Physical Damage\n+(124-149) to Accuracy Rating', 'weapon', 'damage, physical, attack', 400, 'PhysicalPercentAccuracy'),
('IncreasedPhysicalPercentAccuracy4', 'Champion', 53, 42, '(45-54)% increased Physical Damage\n+(98-123) to Accuracy Rating', 'weapon', 'damage, physical, attack', 600, 'PhysicalPercentAccuracy'),
('IncreasedPhysicalPercentAccuracy5', 'Mercenary', 38, 30, '(35-44)% increased Physical Damage\n+(73-97) to Accuracy Rating', 'weapon', 'damage, physical, attack', 1000, 'PhysicalPercentAccuracy'),
('IncreasedPhysicalPercentAccuracy6', 'Reaver', 23, 18, '(25-34)% increased Physical Damage\n+(47-72) to Accuracy Rating', 'weapon', 'damage, physical, attack', 1000, 'PhysicalPercentAccuracy'),
('IncreasedPhysicalPercentAccuracy7', 'Journeyman', 11, 8, '(20-24)% increased Physical Damage\n+(21-46) to Accuracy Rating', 'weapon', 'damage, physical, attack', 1000, 'PhysicalPercentAccuracy'),
('IncreasedPhysicalPercentAccuracy8', 'Squire', 1, 1, '(15-19)% increased Physical Damage\n+(16-20) to Accuracy Rating', 'weapon', 'damage, physical, attack', 1000, 'PhysicalPercentAccuracy'),

-- Accuracy
('Accuracy1', 'Amazon', 76, 60, '+(451-550) to Accuracy Rating', 'weapon, quiver, helmet, gloves', 'attack', 200, 'Accuracy'),
('Accuracy2', 'Ranger', 63, 50, '+(347-450) to Accuracy Rating', 'weapon, quiver, amulet, ring, helmet, gloves', 'attack', 300, 'Accuracy'),
('Accuracy3', 'Hunter', 50, 40, '+(237-346) to Accuracy Rating', 'weapon, quiver, amulet, ring, helmet, gloves', 'attack', 600, 'Accuracy'),
('Accuracy4', 'Steady', 41, 32, '+(168-236) to Accuracy Rating', 'weapon, quiver, amulet, ring, helmet, gloves', 'attack', 600, 'Accuracy'),
('Accuracy5', 'Consistent', 33, 26, '+(124-167) to Accuracy Rating', 'weapon, quiver, amulet, ring, helmet, gloves', 'attack', 800, 'Accuracy'),
('Accuracy6', 'Deliberate', 26, 20, '+(85-123) to Accuracy Rating', 'weapon, quiver, amulet, ring, helmet, gloves', 'attack', 800, 'Accuracy'),
('Accuracy7', 'Focused', 20, 16, '+(61-84) to Accuracy Rating', 'weapon, quiver, amulet, ring, helmet, gloves', 'attack', 800, 'Accuracy'),
('Accuracy8', 'Reliable', 12, 9, '+(33-60) to Accuracy Rating', 'weapon, quiver, amulet, ring, helmet, gloves', 'attack', 800, 'Accuracy'),
('Accuracy9', 'Precise', 1, 1, '+(11-32) to Accuracy Rating', 'weapon, quiver, amulet, ring, helmet, gloves', 'attack', 800, 'Accuracy'),

-- Gain as extra
('GainAsExtraFireDamage1', 'Flamebound', 80, 64, 'Gain (28-30)% of Damage as Extra Fire Damage', 'wand, staff', 'damage,elemental,fire', 500, 'GainAsExtraFireDamage'),
('GainAsExtraFireDamage2', 'Infernal', 61, 48, 'Gain (25-27)% of Damage as Extra Fire Damage', 'wand, staff', 'damage,elemental,fire', 500, 'GainAsExtraFireDamage'),
('GainAsExtraFireDamage3', 'Zealot', 46, 36, 'Gain (22-24)% of Damage as Extra Fire Damage', 'wand, staff', 'damage,elemental,fire', 500, 'GainAsExtraFireDamage'),
('GainAsExtraFireDamage4', 'Fanatic', 31, 24, 'Gain (19-21)% of Damage as Extra Fire Damage', 'wand, staff', 'damage,elemental,fire', 500, 'GainAsExtraFireDamage'),
('GainAsExtraFireDamage5', 'Ardent', 16, 12, 'Gain (16-18)% of Damage as Extra Fire Damage', 'wand, staff', 'damage,elemental,fire', 500, 'GainAsExtraFireDamage'),
('GainAsExtraFireDamage6', 'Fervent', 5, 4, 'Gain (13-15)% of Damage as Extra Fire Damage', 'wand, staff', 'damage,elemental,fire', 500, 'GainAsExtraFireDamage'),

('GainAsExtraColdDamage1', 'Frostbound', 80, 64, 'Gain (28-30)% of Damage as Extra Cold Damage', 'wand, staff', 'damage,elemental,cold', 500, 'GainAsExtraColdDamage'),
('GainAsExtraColdDamage2', 'Ruthless', 61, 48, 'Gain (25-27)% of Damage as Extra Cold Damage', 'wand, staff', 'damage,elemental,cold', 500, 'GainAsExtraColdDamage'),
('GainAsExtraColdDamage3', 'Malicious', 46, 36, 'Gain (22-24)% of Damage as Extra Cold Damage', 'wand, staff', 'damage,elemental,cold', 500, 'GainAsExtraColdDamage'),
('GainAsExtraColdDamage4', 'Destructive', 31, 24, 'Gain (19-21)% of Damage as Extra Cold Damage', 'wand, staff', 'damage,elemental,cold', 500, 'GainAsExtraColdDamage'),
('GainAsExtraColdDamage5', 'Pernicious', 16, 12, 'Gain (16-18)% of Damage as Extra Cold Damage', 'wand, staff', 'damage,elemental,cold', 500, 'GainAsExtraColdDamage'),
('GainAsExtraColdDamage6', 'Malignant', 5, 4, 'Gain (13-15)% of Damage as Extra Cold Damage', 'wand, staff', 'damage,elemental,cold', 500, 'GainAsExtraColdDamage'),

('GainAsExtraLightningDamage1', 'Stormbound', 80, 64, 'Gain (28-30)% of Damage as Extra Lightning Damage', 'wand, staff', 'damage,elemental,lightning', 500, 'GainAsExtraLightningDamage'),
('GainAsExtraLightningDamage2', 'Electrifying', 61, 48, 'Gain (25-27)% of Damage as Extra Lightning Damage', 'wand, staff', 'damage,elemental,lightning', 500, 'GainAsExtraLightningDamage'),
('GainAsExtraLightningDamage3', 'Vorpal', 46, 36, 'Gain (22-24)% of Damage as Extra Lightning Damage', 'wand, staff', 'damage,elemental,lightning', 500, 'GainAsExtraLightningDamage'),
('GainAsExtraLightningDamage4', 'Fatal', 31, 24, 'Gain (19-21)% of Damage as Extra Lightning Damage', 'wand, staff', 'damage,elemental,lightning', 500, 'GainAsExtraLightningDamage'),
('GainAsExtraLightningDamage5', 'Lethal', 16, 12, 'Gain (16-18)% of Damage as Extra Lightning Damage', 'wand, staff', 'damage,elemental,lightning', 500, 'GainAsExtraLightningDamage'),
('GainAsExtraLightningDamage6', 'Deadly', 5, 4, 'Gain (13-15)% of Damage as Extra Lightning Damage', 'wand, staff', 'damage,elemental,lightning', 500, 'GainAsExtraLightningDamage'),

-- //
-- Quiver
-- //
('ProjectileSpeedQuiver1', 'Nimble', 82, 65, '(42-46)% increased Projectile Speed', 'quiver', 'speed', 1000, 'ProjectileSpeed'),
('ProjectileSpeedQuiver2', 'Rapid', 55, 44, '(34-41)% increased Projectile Speed', 'quiver', 'speed', 1000, 'ProjectileSpeed'),
('ProjectileSpeedQuiver3', 'Quick', 41, 32, '(26-33)% increased Projectile Speed', 'quiver', 'speed', 1000, 'ProjectileSpeed'),
('ProjectileSpeedQuiver4', 'Brisk', 27, 21, '(18-25)% increased Projectile Speed', 'quiver', 'speed', 1000, 'ProjectileSpeed'),
('ProjectileSpeedQuiver5', 'Darting', 14, 11, '(10-17)% increased Projectile Speed', 'quiver', 'speed', 1000, 'ProjectileSpeed'),

('IncreasedBowDamage1', 'Impaling', 81, 64, '(51-59)% increased Damage with Bow Skills', 'quiver', 'damage', 500, 'IncreasedBowDamage'),
('IncreasedBowDamage2', 'Lacerating', 60, 48, '(43-50)% increased Damage with Bow Skills', 'quiver', 'damage', 500, 'IncreasedBowDamage'),
('IncreasedBowDamage3', 'Incisive', 45, 36, '(37-42)% increased Damage with Bow Skills', 'quiver', 'damage', 500, 'IncreasedBowDamage'),
('IncreasedBowDamage4', 'Perforating', 30, 24, '(31-36)% increased Damage with Bow Skills', 'quiver', 'damage', 500, 'IncreasedBowDamage'),
('IncreasedBowDamage5', 'Trenchant', 15, 12, '(21-30)% increased Damage with Bow Skills', 'quiver', 'damage', 500, 'IncreasedBowDamage'),
('IncreasedBowDamage6', 'Acute', 4, 3, '(11-20)% increased Damage with Bow Skills', 'quiver', 'damage', 500, 'IncreasedBowDamage'),

-- Physical
('AddedPhysicalDamageQuiver1', 'Flaring', 76, 60, 'Adds (12-19) to (22-32) Physical Damage to Attacks', 'ring, gloves, quiver', 'damage, physical, attack', 400, 'PhysicalDamage'),
('AddedPhysicalDamageQuiver2', 'Tempered', 64, 51, 'Adds (10-15) to (18-26) Physical Damage to Attacks', 'ring, gloves, quiver', 'damage, physical, attack', 600, 'PhysicalDamage'),
('AddedPhysicalDamageQuiver3', 'Razor-sharp', 52, 41, 'Adds (7-11) to (14-20) Physical Damage to Attacks', 'ring, gloves, quiver', 'damage, physical, attack', 800, 'PhysicalDamage'),
('AddedPhysicalDamageQuiver4', 'Annealed', 44, 35, 'Adds (6-10) to (12-17) Physical Damage to Attacks', 'ring, gloves, quiver', 'damage, physical, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamageQuiver5', 'Gleaming', 35, 28, 'Adds (5-7) to (9-13) Physical Damage to Attacks', 'ring, gloves, quiver', 'damage, physical, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamageQuiver6', 'Honed', 28, 22, 'Adds (4-6) to (8-11) Physical Damage to Attacks', 'ring, gloves, quiver', 'damage, physical, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamageQuiver7', 'Polished', 19, 15, 'Adds (2-4) to (5-8) Physical Damage to Attacks', 'ring, gloves, quiver', 'damage, physical, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamageQuiver8', 'Burnished', 13, 10, 'Adds (2-3) to (4-6) Physical Damage to Attacks', 'ring, gloves, quiver', 'damage, physical, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamageQuiver9', 'Glinting', 5, 4, 'Adds (1-2) to 3 Physical Damage to Attacks', 'ring, gloves, quiver', 'damage, physical, attack', 1000, 'PhysicalDamage'),

-- Fire
('AddedFireDamageQuiver1', 'Cremating', 76, 60, 'Adds (19-29) to (30-45) Fire damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, fire, attack', 200, 'FireDamage'),
('AddedFireDamageQuiver2', 'Blasting', 64, 51, 'Adds (16-24) to (25-38) Fire damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, fire, attack', 300, 'FireDamage'),
('AddedFireDamageQuiver3', 'Incinerating', 52, 41, 'Adds (13-19) to (20-30) Fire damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, fire, attack', 400, 'FireDamage'),
('AddedFireDamageQuiver4', 'Scorching', 44, 35, 'Adds (11-16) to (17-26) Fire damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, fire, attack', 500, 'FireDamage'),
('AddedFireDamageQuiver5', 'Flaming', 35, 28, 'Adds (8-13) to (14-20) Fire damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, fire, attack', 500, 'FireDamage'),
('AddedFireDamageQuiver6', 'Burning', 28, 22, 'Adds (7-11) to (12-17) Fire damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, fire, attack', 500, 'FireDamage'),
('AddedFireDamageQuiver7', 'Smoking', 20, 16, 'Adds (5-8) to (9-13) Fire damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, fire, attack', 500, 'FireDamage'),
('AddedFireDamageQuiver8', 'Smouldering', 12, 9, 'Adds (3-5) to (6-9) Fire damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, fire, attack', 500, 'FireDamage'),
('AddedFireDamageQuiver9', 'Heated', 1, 1, 'Adds (1-2) to 3 Fire damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, fire, attack', 500, 'FireDamage'),

-- Cold
('AddedColdDamageQuiver1', 'Entombing', 77, 61, 'Adds (16-24) to (25-37) Cold damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, cold, attack', 200, 'ColdDamage'),
('AddedColdDamageQuiver2', 'Polar', 65, 52, 'Adds (13-20) to (21-31) Cold damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, cold, attack', 300, 'ColdDamage'),
('AddedColdDamageQuiver3', 'Glaciated', 53, 42, 'Adds (10-15) to (16-24) Cold damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, cold, attack', 400, 'ColdDamage'),
('AddedColdDamageQuiver4', 'Frozen', 45, 36, 'Adds (9-13) to (14-21) Cold damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, cold, attack', 500, 'ColdDamage'),
('AddedColdDamageQuiver5', 'Freezing', 36, 28, 'Adds (7-10) to (11-17) Cold damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, cold, attack', 500, 'ColdDamage'),
('AddedColdDamageQuiver6', 'Frigid', 29, 23, 'Adds (6-9) to (10-14) Cold damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, cold, attack', 500, 'ColdDamage'),
('AddedColdDamageQuiver7', 'Icy', 21, 16, 'Adds (4-6) to (7-11) Cold damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, cold, attack', 500, 'ColdDamage'),
('AddedColdDamageQuiver8', 'Chilled', 13, 10, 'Adds (3-4) to (5-8) Cold damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, cold, attack', 500, 'ColdDamage'),
('AddedColdDamageQuiver9', 'Frosted', 1, 1, 'Adds 1 to (2-3) Cold damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, cold, attack', 500, 'ColdDamage'),

-- Lightning
('AddedLightningDamageQuiver1', 'Electrocuting', 76, 60, 'Adds (1-4) to (48-71) Lightning damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, lightning, attack', 200, 'LightningDamage'),
('AddedLightningDamageQuiver2', 'Discharging', 64, 51, 'Adds (1-3) to (40-59) Lightning damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, lightning, attack', 300, 'LightningDamage'),
('AddedLightningDamageQuiver3', 'Shocking', 52, 41, 'Adds (1-2) to (31-47) Lightning damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, lightning, attack', 400, 'LightningDamage'),
('AddedLightningDamageQuiver4', 'Arcing', 44, 35, 'Adds (1-2) to (27-40) Lightning damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, lightning, attack', 500, 'LightningDamage'),
('AddedLightningDamageQuiver5', 'Sparking', 35, 28, 'Adds 1 to (21-32) Lightning damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, lightning, attack', 500, 'LightningDamage'),
('AddedLightningDamageQuiver6', 'Crackling', 28, 22, 'Adds 1 to (18-27) Lightning damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, lightning, attack', 500, 'LightningDamage'),
('AddedLightningDamageQuiver7', 'Snapping', 22, 17, 'Adds 1 to (15-22) Lightning damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, lightning, attack', 500, 'LightningDamage'),
('AddedLightningDamageQuiver8', 'Buzzing', 13, 9, 'Adds 1 to (10-15) Lightning damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, lightning, attack', 500, 'LightningDamage'),
('AddedLightningDamageQuiver9', 'Humming', 1, 1, 'Adds 1 to (4-6) Lightning damage to Attacks', 'ring, gloves, quiver', 'damage, elemental, lightning, attack', 500, 'LightningDamage'),

-- //
-- Armour
-- //

-- //
-- Str
-- //

-- Armour
('Armour1', 'Impervious', 79, 63, '+(257-276) to Armour', 'str_armour, body_armour', 'defences', 1000, 'Armour'),
('Armour2', 'Unmoving', 74, 59, '+(226-256) to Armour', 'str_armour, body_armour, shield', 'defences', 1000, 'Armour'),
('Armour3', 'Abating', 66, 52, '+(203-225) to Armour', 'str_armour, body_armour, shield', 'defences', 1000, 'Armour'),
('Armour4', 'Enveloped', 59, 47, '+(161-202) to Armour', 'str_armour, body_armour, shield, helmet', 'defences', 1000, 'Armour'),
('Armour5', 'Encased', 47, 37, '+(123-160) to Armour', 'str_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'Armour'),
('Armour6', 'Carapaced', 35, 28, '+(103-122) to Armour', 'str_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'Armour'),
('Armour7', 'Plated', 29, 23, '+(83-102) to Armour', 'str_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'Armour'),
('Armour8', 'Fortified', 23, 18, '+(69-82) to Armour', 'str_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'Armour'),
('Armour9', 'Ribbed', 17, 13, '+(51-68) to Armour', 'str_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'Armour'),
('Armour10', 'Studded', 11, 8, '+(28-50) to Armour', 'str_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'Armour'),
('Armour11', 'Lacquered', 1, 1, '+(16-27) to Armour', 'str_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'Armour'),

-- Armour Percent
('ArmourPercent1', 'Impenetrable', 82, 65, '(101-110)% increased Armour', 'str_armour, body_armour, shield', 'defences', 1000, 'ArmourPercent'),
('ArmourPercent2', 'Impregnable', 75, 60, '(92-100)% increased Armour', 'str_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourPercent'),
('ArmourPercent3', 'Girded', 66, 52, '(80-91)% increased Armour', 'str_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourPercent'),
('ArmourPercent4', 'Thickened', 51, 40, '(68-79)% increased Armour', 'str_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourPercent'),
('ArmourPercent5', 'Buttressed', 39, 31, '(56-67)% increased Armour', 'str_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourPercent'),
('ArmourPercent6', 'Lobstered', 27, 21, '(43-55)% increased Armour', 'str_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourPercent'),
('ArmourPercent7', 'Layered', 15, 12, '(27-42)% increased Armour', 'str_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourPercent'),
('ArmourPercent8', 'Reinforced', 2, 1, '(15-26)% increased Armour', 'str_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourPercent'),

-- Armour Life Hybrid
('ArmourLifeHybrid1', 'Crocodile', 78, 62, '(39-42)% increased Armour\n+(42-49) to maximum Life', 'str_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourLifeHybrid'),
('ArmourLifeHybrid2', 'Octopus', 60, 48, '(33-38)% increased Armour\n+(33-41) to maximum Life', 'str_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourLifeHybrid'),
('ArmourLifeHybrid3', 'Nautilus', 44, 35, '(27-32)% increased Armour\n+(26-32) to maximum Life', 'str_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourLifeHybrid'),
('ArmourLifeHybrid4', 'Urchin', 30, 24, '(21-26)% increased Armour\n+(20-25) to maximum Life', 'str_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourLifeHybrid'),
('ArmourLifeHybrid5', 'Lobster', 19, 15, '(14-20)% increased Armour\n+(11-19) to maximum Life', 'str_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourLifeHybrid'),
('ArmourLifeHybrid6', 'Oyster', 10, 8, '(6-13)% increased Armour\n+(7-10) to maximum Life', 'str_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourLifeHybrid'),

-- Armour Hybrid
('ArmourHybrid1', 'Hardened', 78, 62, '+(70-86) to Armour\n(39-42)% increased Armour', 'str_armour, body_armour', 'defences', 1000, 'ArmourHybrid'),
('ArmourHybrid2', 'Shelled', 60, 48, '+(54-69) to Armour\n(33-38)% increased Armour', 'str_armour, body_armour', 'defences', 1000, 'ArmourHybrid'),
('ArmourHybrid3', 'Pangolin', 44, 35, '+(40-53) to Armour\n(27-32)% increased Armour', 'str_armour, body_armour', 'defences', 1000, 'ArmourHybrid'),
('ArmourHybrid4', 'Tortoise', 30, 24, '+(30-39) to Armour\n(21-26)% increased Armour', 'str_armour, body_armour', 'defences', 1000, 'ArmourHybrid'),
('ArmourHybrid5', 'Snail', 19, 15, '+(12-29) to Armour\n(14-20)% increased Armour', 'str_armour, body_armour', 'defences', 1000, 'ArmourHybrid'),
('ArmourHybrid6', 'Abalone', 10, 8, '+(7-11) to Armour\n(6-13)% increased Armour', 'str_armour, body_armour', 'defences', 1000, 'ArmourHybrid'),

-- //
-- Dex
-- //

-- Evasion
('Evasion1', 'Fugitive', 79, 63, '+(233-251) to Evasion Rating', 'dex_armour, body_armour', 'defences', 1000, 'Evasion'),
('Evasion2', 'Lissome', 74, 59, '+(205-232) to Evasion Rating', 'dex_armour, body_armour, shield', 'defences', 1000, 'Evasion'),
('Evasion3', 'Adroit', 66, 52, '+(182-204) to Evasion Rating', 'dex_armour, body_armour, shield', 'defences', 1000, 'Evasion'),
('Evasion4', 'Elusory', 59, 47, '+(143-181) to Evasion Rating', 'dex_armour, body_armour, shield, helmet', 'defences', 1000, 'Evasion'),
('Evasion5', 'Vaporous', 47, 37, '+(108-142) to Evasion Rating', 'dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'Evasion'),
('Evasion6', 'Phased', 35, 28, '+(89-107) to Evasion Rating', 'dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'Evasion'),
('Evasion7', 'Blurred', 29, 23, '+(71-88) to Evasion Rating', 'dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'Evasion'),
('Evasion8', 'Fleet', 23, 18, '+(57-70) to Evasion Rating', 'dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'Evasion'),
('Evasion9', 'Acrobat', 17, 13, '+(40-56) to Evasion Rating', 'dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'Evasion'),
('Evasion10', 'Dancer', 11, 8, '+(19-39) to Evasion Rating', 'dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'Evasion'),
('Evasion11', 'Agile', 1, 1, '+(11-18) to Evasion Rating', 'dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'Evasion'),

-- Evasion Percent
('EvasionPercent1', 'Illusion', 82, 65, '(101-110)% increased Evasion Rating', 'dex_armour, body_armour, shield', 'defences', 1000, 'EvasionPercent'),
('EvasionPercent2', 'Mirage', 75, 60, '(92-100)% increased Evasion Rating', 'dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionPercent'),
('EvasionPercent3', 'Nightmare', 66, 52, '(80-91)% increased Evasion Rating', 'dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionPercent'),
('EvasionPercent4', 'Phantasm', 51, 40, '(68-79)% increased Evasion Rating', 'dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionPercent'),
('EvasionPercent5', 'Wraith', 39, 31, '(56-67)% increased Evasion Rating', 'dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionPercent'),
('EvasionPercent6', 'Spectre', 27, 21, '(43-55)% increased Evasion Rating', 'dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionPercent'),
('EvasionPercent7', 'Ghost', 15, 12, '(27-42)% increased Evasion Rating', 'dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionPercent'),
('EvasionPercent8', 'Shade', 2, 1, '(15-26)% increased Evasion Rating', 'dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionPercent'),

-- Evasion Life Hybrid
('EvasionLifeHybrid1', 'Stag', 78, 62, '(39-42)% increased Evasion Rating\n+(42-49) to maximum Life', 'dex_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EvasionLifeHybrid'),
('EvasionLifeHybrid2', 'Ibex', 60, 48, '(33-38)% increased Evasion Rating\n+(33-41) to maximum Life', 'dex_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EvasionLifeHybrid'),
('EvasionLifeHybrid3', 'Ram', 44, 35, '(27-32)% increased Evasion Rating\n+(26-32) to maximum Life', 'dex_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EvasionLifeHybrid'),
('EvasionLifeHybrid4', 'Mouflon', 30, 24, '(21-26)% increased Evasion Rating\n+(20-25) to maximum Life', 'dex_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EvasionLifeHybrid'),
('EvasionLifeHybrid5', 'Fawn', 19, 15, '(14-20)% increased Evasion Rating\n+(11-19) to maximum Life', 'dex_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EvasionLifeHybrid'),
('EvasionLifeHybrid6', 'Flea', 10, 8, '(6-13)% increased Evasion Rating\n+(7-10) to maximum Life', 'dex_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EvasionLifeHybrid'),

-- Evasion Hybrid
('EvasionHybrid1', 'Antelope', 78, 62, '+(63-79) to Evasion Rating\n(39-42)% increased Evasion Rating', 'dex_armour, body_armour', 'defences', 1000, 'EvasionHybrid'),
('EvasionHybrid2', 'Caribou', 60, 48, '+(48-62) to Evasion Rating\n(33-38)% increased Evasion Rating', 'dex_armour, body_armour', 'defences', 1000, 'EvasionHybrid'),
('EvasionHybrid3', 'Deer', 44, 35, '+(35-47) to Evasion Rating\n(27-32)% increased Evasion Rating', 'dex_armour, body_armour', 'defences', 1000, 'EvasionHybrid'),
('EvasionHybrid4', 'Moose', 30, 24, '+(25-34) to Evasion Rating\n(21-26)% increased Evasion Rating', 'dex_armour, body_armour', 'defences', 1000, 'EvasionHybrid'),
('EvasionHybrid5', 'Buck', 19, 15, '+(9-24) to Evasion Rating\n(14-20)% increased Evasion Rating', 'dex_armour, body_armour', 'defences', 1000, 'EvasionHybrid'),
('EvasionHybrid6', 'Impala', 10, 8, '+(5-8) to Evasion Rating\n(6-13)% increased Evasion Rating', 'dex_armour, body_armour', 'defences', 1000, 'EvasionHybrid'),

-- //
-- Int
-- //

-- Energy Shield
('EnergyShield1', 'Resplendent', 79, 63, '+(91-96) to maximum Energy Shield', 'int_armour, body_armour', 'defences', 1000, 'EnergyShield'),
('EnergyShield2', 'Incandescent', 74, 59, '+(81-90) to maximum Energy Shield', 'int_armour, body_armour, shield', 'defences', 1000, 'EnergyShield'),
('EnergyShield3', 'Scintillating', 66, 52, '+(74-80) to maximum Energy Shield', 'int_armour, body_armour, shield', 'defences', 1000, 'EnergyShield'),
('EnergyShield4', 'Dazzling', 59, 47, '+(61-73) to maximum Energy Shield', 'int_armour, body_armour, shield, helmet', 'defences', 1000, 'EnergyShield'),
('EnergyShield5', 'Blazing', 47, 37, '+(48-60) to maximum Energy Shield', 'int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EnergyShield'),
('EnergyShield6', 'Pulsing', 35, 28, '+(42-47) to maximum Energy Shield', 'int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EnergyShield'),
('EnergyShield7', 'Radiating', 29, 23, '+(36-41) to maximum Energy Shield', 'int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EnergyShield'),
('EnergyShield8', 'Glowing', 23, 18, '+(31-35) to maximum Energy Shield', 'int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EnergyShield'),
('EnergyShield9', 'Glittering', 17, 13, '+(25-30) to maximum Energy Shield', 'int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EnergyShield'),
('EnergyShield10', 'Glimmering', 11, 8, '+(18-24) to maximum Energy Shield', 'int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EnergyShield'),
('EnergyShield11', 'Shining', 1, 1, '+(10-17) to maximum Energy Shield', 'int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EnergyShield'),

-- Energy Shield Percent
('EnergyShieldPercent1', 'Unfaltering', 82, 65, '(101-110)% increased Energy Shield', 'int_armour, body_armour, shield', 'defences', 1000, 'EnergyShieldPercent'),
('EnergyShieldPercent2', 'Unassailable', 75, 60, '(92-100)% increased Energy Shield', 'int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EnergyShieldPercent'),
('EnergyShieldPercent3', 'Indomitable', 66, 52, '(80-91)% increased Energy Shield', 'int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EnergyShieldPercent'),
('EnergyShieldPercent4', 'Dauntless', 51, 40, '(68-79)% increased Energy Shield', 'int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EnergyShieldPercent'),
('EnergyShieldPercent5', 'Fearless', 39, 31, '(56-67)% increased Energy Shield', 'int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EnergyShieldPercent'),
('EnergyShieldPercent6', 'Resolute', 27, 21, '(43-55)% increased Energy Shield', 'int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EnergyShieldPercent'),
('EnergyShieldPercent7', 'Strong-Willed', 15, 12, '(27-42)% increased Energy Shield', 'int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EnergyShieldPercent'),
('EnergyShieldPercent8', 'Protective', 2, 1, '(15-26)% increased Energy Shield', 'int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EnergyShieldPercent'),

-- Energy Shield Life Hybrid
('EnergyShieldLifeHybrid1', 'Pope', 78, 62, '(39-42)% increased Energy Shield\n+(42-49) to maximum Life', 'int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EnergyShieldLifeHybrid'),
('EnergyShieldLifeHybrid2', 'Exarch', 60, 48, '(33-38)% increased Energy Shield\n+(33-41) to maximum Life', 'int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EnergyShieldLifeHybrid'),
('EnergyShieldLifeHybrid3', 'Bishop', 44, 35, '(27-32)% increased Energy Shield\n+(26-32) to maximum Life', 'int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EnergyShieldLifeHybrid'),
('EnergyShieldLifeHybrid4', 'Abbot', 30, 24, '(21-26)% increased Energy Shield\n+(20-25) to maximum Life', 'int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EnergyShieldLifeHybrid'),
('EnergyShieldLifeHybrid5', 'Prior', 19, 15, '(14-20)% increased Energy Shield\n+(11-19) to maximum Life', 'int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EnergyShieldLifeHybrid'),
('EnergyShieldLifeHybrid6', 'Monk', 10, 8, '(6-13)% increased Energy Shield\n+(7-10) to maximum Life', 'int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EnergyShieldLifeHybrid'),

-- Energy Shield Hybrid
('EnergyShieldHybrid1', 'Divine', 78, 62, '+(26-30) to maximum Energy Shield\n(39-42)% increased Energy Shield', 'int_armour, body_armour', 'defences', 1000, 'EnergyShieldHybrid'),
('EnergyShieldHybrid2', 'Archon', 60, 48, '+(21-25) to maximum Energy Shield\n(33-38)% increased Energy Shield', 'int_armour, body_armour', 'defences', 1000, 'EnergyShieldHybrid'),
('EnergyShieldHybrid3', 'High Priest', 44, 35, '+(17-20) to maximum Energy Shield\n(27-32)% increased Energy Shield', 'int_armour, body_armour', 'defences', 1000, 'EnergyShieldHybrid'),
('EnergyShieldHybrid4', 'Priest', 30, 24, '+(14-16) to maximum Energy Shield\n(21-26)% increased Energy Shield', 'int_armour, body_armour', 'defences', 1000, 'EnergyShieldHybrid'),
('EnergyShieldHybrid5', 'Cardinal', 19, 15, '+(8-13) to maximum Energy Shield\n(14-20)% increased Energy Shield', 'int_armour, body_armour', 'defences', 1000, 'EnergyShieldHybrid'),
('EnergyShieldHybrid6', 'Deacon', 10, 8, '+(4-7) to maximum Energy Shield\n(6-13)% increased Energy Shield', 'int_armour, body_armour', 'defences', 1000, 'EnergyShieldHybrid'),

-- //
-- Str/Dex
-- //

-- Armour/Evasion
('ArmourEvasion1', 'Versatile', 79, 63, '+(118-138) to Armour\n+(108-126) to Evasion Rating', 'str_dex_armour, body_armour', 'defences', 1000, 'ArmourEvasion'),
('ArmourEvasion2', 'Adaptable', 69, 55, '+(99-117) to Armour\n+(89-107) to Evasion Rating', 'str_dex_armour, body_armour, shield', 'defences', 1000, 'ArmourEvasion'),
('ArmourEvasion3', 'Resilient', 58, 46, '+(79-98) to Armour\n+(70-88) to Evasion Rating', 'str_dex_armour, body_armour, shield', 'defences', 1000, 'ArmourEvasion'),
('ArmourEvasion4', 'Sturdy', 46, 36, '+(66-78) to Armour\n+(58-69) to Evasion Rating', 'str_dex_armour, body_armour, shield, helmet', 'defences', 1000, 'ArmourEvasion'),
('ArmourEvasion5', 'Durable', 38, 30, '+(54-65) to Armour\n+(47-57) to Evasion Rating', 'str_dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEvasion'),
('ArmourEvasion6', 'Flexible', 30, 24, '+(36-53) to Armour\n+(31-46) to Evasion Rating', 'str_dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEvasion'),
('ArmourEvasion7', 'Pliant', 18, 14, '+(15-35) to Armour\n+(10-30) to Evasion Rating', 'str_dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEvasion'),
('ArmourEvasion8', 'Supple', 1, 1, '+(8-14) to Armour\n+(6-9) to Evasion Rating', 'str_dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEvasion'),

-- Armour/Evasion Percent
('ArmourEvasionPercent1', 'Victor', 82, 65, '(101-110)% increased Armour and Evasion', 'str_dex_armour, body_armour, shield', 'defences', 1000, 'ArmourEvasionPercent'),
('ArmourEvasionPercent2', 'Legend', 75, 60, '(92-100)% increased Armour and Evasion', 'str_dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEvasionPercent'),
('ArmourEvasionPercent3', 'Hero', 66, 52, '(80-91)% increased Armour and Evasion', 'str_dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEvasionPercent'),
('ArmourEvasionPercent4', 'Duelist', 51, 40, '(68-79)% increased Armour and Evasion', 'str_dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEvasionPercent'),
('ArmourEvasionPercent5', 'Gladiator', 39, 31, '(56-67)% increased Armour and Evasion', 'str_dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEvasionPercent'),
('ArmourEvasionPercent6', 'Fencer', 27, 21, '(43-55)% increased Armour and Evasion', 'str_dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEvasionPercent'),
('ArmourEvasionPercent7', 'Brawler', 15, 12, '(27-42)% increased Armour and Evasion', 'str_dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEvasionPercent'),
('ArmourEvasionPercent8', 'Scrapper', 2, 1, '(15-26)% increased Armour and Evasion', 'str_dex_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEvasionPercent'),

-- Armour/Evasion Life Hybrid
('ArmourEvasionLifeHybrid1', 'Predator', 78, 62, '(39-42)% increased Armour and Evasion\n+(42-49) to maximum Life', 'str_dex_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourEvasionLifeHybrid'),
('ArmourEvasionLifeHybrid2', 'Aggressor', 60, 48, '(33-38)% increased Armour and Evasion\n+(33-41) to maximum Life', 'str_dex_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourEvasionLifeHybrid'),
('ArmourEvasionLifeHybrid3', 'Assailant', 44, 35, '(27-32)% increased Armour and Evasion\n+(26-32) to maximum Life', 'str_dex_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourEvasionLifeHybrid'),
('ArmourEvasionLifeHybrid4', 'Brute', 30, 24, '(21-26)% increased Armour and Evasion\n+(20-25) to maximum Life', 'str_dex_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourEvasionLifeHybrid'),
('ArmourEvasionLifeHybrid5', 'Thug', 19, 15, '(14-20)% increased Armour and Evasion\n+(11-19) to maximum Life', 'str_dex_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourEvasionLifeHybrid'),
('ArmourEvasionLifeHybrid6', 'Bully', 10, 8, '(6-13)% increased Armour and Evasion\n+(7-10) to maximum Life', 'str_dex_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourEvasionLifeHybrid'),

-- Armour/Evasion Hybrid
('ArmourEvasionHybrid1', 'Centurion', 78, 62, '+(35-43) to Armour\n+(32-39) to Evasion Rating\n(39-42)% increased Armour and Evasion', 'str_dex_armour, body_armour', 'defences', 1000, 'ArmourEvasionHybrid'),
('ArmourEvasionHybrid2', 'Knight', 60, 48, '+(28-34) to Armour\n+(25-31) to Evasion Rating\n(33-38)% increased Armour and Evasion', 'str_dex_armour, body_armour', 'defences', 1000, 'ArmourEvasionHybrid'),
('ArmourEvasionHybrid3', 'Warrior', 44, 35, '+(21-27) to Armour\n+(18-24) to Evasion Rating\n(27-32)% increased Armour and Evasion', 'str_dex_armour, body_armour', 'defences', 1000, 'ArmourEvasionHybrid'),
('ArmourEvasionHybrid4', 'Veteran', 30, 24, '+(16-20) to Armour\n+(13-17) to Evasion Rating\n(21-26)% increased Armour and Evasion', 'str_dex_armour, body_armour', 'defences', 1000, 'ArmourEvasionHybrid'),
('ArmourEvasionHybrid5', 'Fighter', 19, 15, '+(7-15) to Armour\n+(6-12) to Evasion Rating\n(14-20)% increased Armour and Evasion', 'str_dex_armour, body_armour', 'defences', 1000, 'ArmourEvasionHybrid'),
('ArmourEvasionHybrid6', 'Swordsman', 10, 8, '+(4-6) to Armour\n+(3-5) to Evasion Rating\n(6-13)% increased Armour and Evasion', 'str_dex_armour, body_armour', 'defences', 1000, 'ArmourEvasionHybrid'),

-- //
-- Str/Int
-- //

-- Armour/Energy Shield
('ArmourEnergyShield1', 'Godly', 79, 63, '+(118-138) to Armour\n+(43-48) to maximum Energy Shield', 'str_int_armour, body_armour', 'defences', 1000, 'ArmourEnergyShield'),
('ArmourEnergyShield2', 'Saintly', 69, 55, '+(99-117) to Armour\n+(37-42) to maximum Energy Shield', 'str_int_armour, body_armour, shield', 'defences', 1000, 'ArmourEnergyShield'),
('ArmourEnergyShield3', 'Consecrated', 58, 46, '+(79-98) to Armour\n+(30-36) to maximum Energy Shield', 'str_int_armour, body_armour, shield', 'defences', 1000, 'ArmourEnergyShield'),
('ArmourEnergyShield4', 'Beatified', 46, 36, '+(66-78) to Armour\n+(26-29) to maximum Energy Shield', 'str_int_armour, body_armour, shield, helmet', 'defences', 1000, 'ArmourEnergyShield'),
('ArmourEnergyShield5', 'Hallowed', 38, 30, '+(54-65) to Armour\n+(22-25) to maximum Energy Shield', 'str_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEnergyShield'),
('ArmourEnergyShield6', 'Sanctified', 30, 24, '+(36-53) to Armour\n+(16-21) to maximum Energy Shield', 'str_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEnergyShield'),
('ArmourEnergyShield7', 'Anointed', 18, 14, '+(15-35) to Armour\n+(9-15) to maximum Energy Shield', 'str_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEnergyShield'),
('ArmourEnergyShield8', 'Blessed', 1, 1, '+(8-14) to Armour\n+(5-8) to maximum Energy Shield', 'str_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEnergyShield'),

-- Armour/Energy Shield Percent
('ArmourEnergyShieldPercent1', 'Interpermeated', 82, 65, '(101-110)% increased Armour and Energy Shield', 'str_int_armour, body_armour, shield', 'defences', 1000, 'ArmourEnergyShieldPercent'),
('ArmourEnergyShieldPercent2', 'Inspired', 75, 60, '(92-100)% increased Armour and Energy Shield', 'str_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEnergyShieldPercent'),
('ArmourEnergyShieldPercent3', 'Interpolated', 66, 52, '(80-91)% increased Armour and Energy Shield', 'str_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEnergyShieldPercent'),
('ArmourEnergyShieldPercent4', 'Inculcated', 51, 40, '(68-79)% increased Armour and Energy Shield', 'str_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEnergyShieldPercent'),
('ArmourEnergyShieldPercent5', 'Infused', 39, 31, '(56-67)% increased Armour and Energy Shield', 'str_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEnergyShieldPercent'),
('ArmourEnergyShieldPercent6', 'Instilled', 27, 21, '(43-55)% increased Armour and Energy Shield', 'str_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEnergyShieldPercent'),
('ArmourEnergyShieldPercent7', 'Ingrained', 15, 12, '(27-42)% increased Armour and Energy Shield', 'str_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEnergyShieldPercent'),
('ArmourEnergyShieldPercent8', 'Infixed', 2, 1, '(15-26)% increased Armour and Energy Shield', 'str_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'ArmourEnergyShieldPercent'),

-- Armour/Energy Shield Life Hybrid
('ArmourEnergyShieldLifeHybrid1', 'Prophet', 78, 62, '(39-42)% increased Armour and Energy Shield\n+(42-49) to maximum Life', 'str_int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourEnergyShieldLifeHybrid'),
('ArmourEnergyShieldLifeHybrid2', 'Visionary', 60, 48, '(33-38)% increased Armour and Energy Shield\n+(33-41) to maximum Life', 'str_int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourEnergyShieldLifeHybrid'),
('ArmourEnergyShieldLifeHybrid3', 'Haruspex', 44, 35, '(27-32)% increased Armour and Energy Shield\n+(26-32) to maximum Life', 'str_int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourEnergyShieldLifeHybrid'),
('ArmourEnergyShieldLifeHybrid4', 'Druid', 30, 24, '(21-26)% increased Armour and Energy Shield\n+(20-25) to maximum Life', 'str_int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourEnergyShieldLifeHybrid'),
('ArmourEnergyShieldLifeHybrid5', 'Auspex', 19, 15, '(14-20)% increased Armour and Energy Shield\n+(11-19) to maximum Life', 'str_int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourEnergyShieldLifeHybrid'),
('ArmourEnergyShieldLifeHybrid6', 'Augur', 10, 8, '(6-13)% increased Armour and Energy Shield\n+(7-10) to maximum Life', 'str_int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'ArmourEnergyShieldLifeHybrid'),

-- Armour/Energy Shield Hybrid
('ArmourEnergyShieldHybrid1', 'Grand', 78, 62, '+(35-43) to Armour\n+(13-15) to maximum Energy Shield\n(39-42)% increased Armour and Energy Shield', 'str_int_armour, body_armour', 'defences', 1000, 'ArmourEnergyShieldHybrid'),
('ArmourEnergyShieldHybrid2', 'Paladin', 60, 48, '+(28-34) to Armour\n+(11-12) to maximum Energy Shield\n(33-38)% increased Armour and Energy Shield', 'str_int_armour, body_armour', 'defences', 1000, 'ArmourEnergyShieldHybrid'),
('ArmourEnergyShieldHybrid3', 'Crusader', 44, 35, '+(21-27) to Armour\n+(9-10) to maximum Energy Shield\n(27-32)% increased Armour and Energy Shield', 'str_int_armour, body_armour', 'defences', 1000, 'ArmourEnergyShieldHybrid'),
('ArmourEnergyShieldHybrid4', 'Inquisitor', 30, 24, '+(16-20) to Armour\n+(7-8) to maximum Energy Shield\n(21-26)% increased Armour and Energy Shield', 'str_int_armour, body_armour', 'defences', 1000, 'ArmourEnergyShieldHybrid'),
('ArmourEnergyShieldHybrid5', 'Noble', 19, 15, '+(7-15) to Armour\n+(5-6) to maximum Energy Shield\n(14-20)% increased Armour and Energy Shield', 'str_int_armour, body_armour', 'defences', 1000, 'ArmourEnergyShieldHybrid'),
('ArmourEnergyShieldHybrid6', 'Faithful', 10, 8, '+(4-6) to Armour\n+(2-4) to maximum Energy Shield\n(6-13)% increased Armour and Energy Shield', 'str_int_armour, body_armour', 'defences', 1000, 'ArmourEnergyShieldHybrid'),

-- //
-- Dex/Int
-- //

-- Evasion/Energy Shield
('EvasionEnergyShield1', 'Banshee', 79, 63, '+(108-126) to Evasion Rating\n+(43-48) to maximum Energy Shield', 'dex_int_armour, body_armour', 'defences', 1000, 'EvasionEnergyShield'),
('EvasionEnergyShield2', 'Apparition', 69, 55, '+(89-107) to Evasion Rating\n+(37-42) to maximum Energy Shield', 'dex_int_armour, body_armour, shield', 'defences', 1000, 'EvasionEnergyShield'),
('EvasionEnergyShield3', 'Eidolon', 58, 46, '+(70-88) to Evasion Rating\n+(30-36) to maximum Energy Shield', 'dex_int_armour, body_armour, shield', 'defences', 1000, 'EvasionEnergyShield'),
('EvasionEnergyShield4', 'Spirit', 46, 36, '+(58-69) to Evasion Rating\n+(26-29) to maximum Energy Shield', 'dex_int_armour, body_armour, shield, helmet', 'defences', 1000, 'EvasionEnergyShield'),
('EvasionEnergyShield5', 'Cherub', 38, 30, '+(47-57) to Evasion Rating\n+(22-25) to maximum Energy Shield', 'dex_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionEnergyShield'),
('EvasionEnergyShield6', 'Sylph', 30, 24, '+(31-46) to Evasion Rating\n+(16-21) to maximum Energy Shield', 'dex_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionEnergyShield'),
('EvasionEnergyShield7', 'Nymph', 18, 14, '+(10-30) to Evasion Rating\n+(9-15) to maximum Energy Shield', 'dex_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionEnergyShield'),
('EvasionEnergyShield8', 'Will-o-wisp', 1, 1, '+(6-9) to Evasion Rating\n+(5-8) to maximum Energy Shield', 'dex_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionEnergyShield'),

-- Evasion/Energy Shield Percent
('EvasionEnergyShieldPercent1', 'Incorporeal', 82, 65, '(101-110)% increased Evasion and Energy Shield', 'dex_int_armour, body_armour, shield', 'defences', 1000, 'EvasionEnergyShieldPercent'),
('EvasionEnergyShieldPercent2', 'Illusory', 75, 60, '(92-100)% increased Evasion and Energy Shield', 'dex_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionEnergyShieldPercent'),
('EvasionEnergyShieldPercent3', 'Unreal', 66, 52, '(80-91)% increased Evasion and Energy Shield', 'dex_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionEnergyShieldPercent'),
('EvasionEnergyShieldPercent4', 'Evanescent', 51, 40, '(68-79)% increased Evasion and Energy Shield', 'dex_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionEnergyShieldPercent'),
('EvasionEnergyShieldPercent5', 'Ephemeral', 39, 31, '(56-67)% increased Evasion and Energy Shield', 'dex_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionEnergyShieldPercent'),
('EvasionEnergyShieldPercent6', 'Unworldly', 27, 21, '(43-55)% increased Evasion and Energy Shield', 'dex_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionEnergyShieldPercent'),
('EvasionEnergyShieldPercent7', 'Ethereal', 15, 12, '(27-42)% increased Evasion and Energy Shield', 'dex_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionEnergyShieldPercent'),
('EvasionEnergyShieldPercent8', 'Shadowy', 2, 1, '(15-26)% increased Evasion and Energy Shield', 'dex_int_armour, body_armour, shield, helmet, gloves, boots', 'defences', 1000, 'EvasionEnergyShieldPercent'),

-- Evasion/Energy Shield Life Hybrid
('EvasionEnergyShieldLifeHybrid1', 'Maestro', 78, 62, '(39-42)% increased Evasion and Energy Shield\n+(42-49) to maximum Life', 'dex_int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EvasionEnergyShieldLifeHybrid'),
('EvasionEnergyShieldLifeHybrid2', 'Minstrel', 60, 48, '(33-38)% increased Evasion and Energy Shield\n+(33-41) to maximum Life', 'dex_int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EvasionEnergyShieldLifeHybrid'),
('EvasionEnergyShieldLifeHybrid3', 'Bard', 44, 35, '(27-32)% increased Evasion and Energy Shield\n+(26-32) to maximum Life', 'dex_int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EvasionEnergyShieldLifeHybrid'),
('EvasionEnergyShieldLifeHybrid4', 'Troubadour', 30, 24, '(21-26)% increased Evasion and Energy Shield\n+(20-25) to maximum Life', 'dex_int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EvasionEnergyShieldLifeHybrid'),
('EvasionEnergyShieldLifeHybrid5', 'Musician', 19, 15, '(14-20)% increased Evasion and Energy Shield\n+(11-19) to maximum Life', 'dex_int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EvasionEnergyShieldLifeHybrid'),
('EvasionEnergyShieldLifeHybrid6', 'Poet', 10, 8, '(6-13)% increased Evasion and Energy Shield\n+(7-10) to maximum Life', 'dex_int_armour, body_armour, helmet, gloves', 'life,defences', 1000, 'EvasionEnergyShieldLifeHybrid'),

-- Evasion/Energy Shield Hybrid
('EvasionEnergyShieldHybrid1', 'Stalker', 78, 62, '+(32-39) to Evasion Rating\n+(13-15) to maximum Energy Shield\n(39-42)% increased Evasion and Energy Shield', 'dex_int_armour, body_armour', 'defences', 1000, 'EvasionEnergyShieldHybrid'),
('EvasionEnergyShieldHybrid2', 'Rogue', 60, 48, '+(25-31) to Evasion Rating\n+(11-12) to maximum Energy Shield\n(33-38)% increased Evasion and Energy Shield', 'dex_int_armour, body_armour', 'defences', 1000, 'EvasionEnergyShieldHybrid'),
('EvasionEnergyShieldHybrid3', 'Phantom', 44, 35, '+(18-24) to Evasion Rating\n+(9-10) to maximum Energy Shield\n(27-32)% increased Evasion and Energy Shield', 'dex_int_armour, body_armour', 'defences', 1000, 'EvasionEnergyShieldHybrid'),
('EvasionEnergyShieldHybrid4', 'Chaser', 30, 24, '+(13-17) to Evasion Rating\n+(7-8) to maximum Energy Shield\n(21-26)% increased Evasion and Energy Shield', 'dex_int_armour, body_armour', 'defences', 1000, 'EvasionEnergyShieldHybrid'),
('EvasionEnergyShieldHybrid5', 'Tracker', 19, 15, '+(6-12) to Evasion Rating\n+(5-6) to maximum Energy Shield\n(14-20)% increased Evasion and Energy Shield', 'dex_int_armour, body_armour', 'defences', 1000, 'EvasionEnergyShieldHybrid'),
('EvasionEnergyShieldHybrid6', 'Pursuer', 10, 8, '+(3-5) to Evasion Rating\n+(2-4) to maximum Energy Shield\n(6-13)% increased Evasion and Energy Shield', 'dex_int_armour, body_armour', 'defences', 1000, 'EvasionEnergyShieldHybrid'),

-- //
-- Armour Shared
-- //

-- Thorns
('Thorns1', 'Jagged', 75, 60, '(101-151) to (146-220) Physical Thorns damage', 'body_armour, shield, belt', 'damage,physical', 1000, 'Thorns'),
('Thorns2', 'Edged', 61, 48, '(64-97) to (97-145) Physical Thorns damage', 'body_armour, shield, belt', 'damage,physical', 1000, 'Thorns'),
('Thorns3', 'Spiked', 48, 38, '(40-60) to (61-92) Physical Thorns damage', 'body_armour, shield, belt', 'damage,physical', 1000, 'Thorns'),
('Thorns4', 'Pointed', 35, 28, '(24-35) to (35-53) Physical Thorns damage', 'body_armour, shield, belt', 'damage,physical', 1000, 'Thorns'),
('Thorns5', 'Barbed', 20, 16, '(11-16) to (15-23) Physical Thorns damage', 'body_armour, shield, belt', 'damage,physical', 1000, 'Thorns'),
('Thorns6', 'Spiny', 10, 8, '(5-7) to (7-10) Physical Thorns damage', 'body_armour, shield, belt', 'damage,physical', 1000, 'Thorns'),
('Thorns7', 'Thorny', 1, 1, '(1-2) to (3-4) Physical Thorns damage', 'body_armour, shield, belt', 'damage,physical', 1000, 'Thorns'),

-- Spirit
('Spirit1', 'Queen', 78, 62, '+(57-61) to Spirit', 'body_armour', 'spirit', 100, 'Spirit'),
('Spirit2', 'Princess', 66, 52, '+(54-56) to Spirit', 'body_armour', 'spirit', 200, 'Spirit'),
('Spirit3', 'Duchess', 55, 44, '+(51-53) to Spirit', 'body_armour', 'spirit', 300, 'Spirit'),
('Spirit4', 'Countess', 47, 37, '+(47-50) to Spirit', 'body_armour, amulet', 'spirit', 400, 'Spirit'),
('Spirit5', 'Marchioness', 41, 32, '+(43-46) to Spirit', 'body_armour, amulet', 'spirit', 500, 'Spirit'),
('Spirit6', 'Viscountess', 34, 27, '+(38-42) to Spirit', 'body_armour, amulet', 'spirit', 500, 'Spirit'),
('Spirit7', 'Baronness', 25, 20, '+(34-37) to Spirit', 'body_armour, amulet', 'spirit', 500, 'Spirit'),
('Spirit8', 'Lady', 16, 12, '+(30-33) to Spirit', 'body_armour, amulet', 'spirit', 500, 'Spirit'),

-- //
-- Global Shared
-- //

-- Life
('Life1', 'Prime', 82, 65, '+(200-214) to maximum Life', 'body_armour', 'life', 1000, 'Life'),
('Life2', 'Rapturous', 78, 62, '+(190-199) to maximum Life', 'body_armour', 'life', 1000, 'Life'),
('Life3', 'Vigorous', 74, 59, '+(175-189) to maximum Life', 'body_armour, shield', 'life', 1000, 'Life'),
('Life4', 'Fecund', 68, 54, '+(150-174) to maximum Life', 'body_armour, shield, helmet, belt', 'life', 1000, 'Life'),
('Life5', 'Athletes', 56, 44, '+(120-149) to maximum Life', 'body_armour, shield, helmet, gloves, boots, belt, amulet', 'life', 1000, 'Life'),
('Life6', 'Virile', 44, 35, '+(100-119) to maximum Life', 'body_armour, shield, helmet, gloves, boots, belt, amulet, ring', 'life', 1000, 'Life'),
('Life7', 'Rotund', 36, 28, '+(85-99) to maximum Life', 'body_armour, shield, helmet, gloves, boots, belt, amulet, ring', 'life', 1000, 'Life'),
('Life8', 'Robust', 30, 24, '+(70-84) to maximum Life', 'body_armour, shield, helmet, gloves, boots, belt, amulet, ring', 'life', 1000, 'Life'),
('Life9', 'Stout', 24, 19, '+(60-69) to maximum Life', 'body_armour, shield, helmet, gloves, boots, belt, amulet, ring', 'life', 1000, 'Life'),
('Life10', 'Stalwart', 18, 14, '+(40-59) to maximum Life', 'body_armour, shield, helmet, gloves, boots, belt, amulet, ring', 'life', 1000, 'Life'),
('Life11', 'Sanguine', 11, 8, '+(30-39) to maximum Life', 'body_armour, shield, helmet, gloves, boots, belt, amulet, ring', 'life', 1000, 'Life'),
('Life12', 'Healthy', 5, 4, '+(20-29) to maximum Life', 'body_armour, shield, helmet, gloves, boots, belt, amulet, ring', 'life', 1000, 'Life'),
('Life13', 'Hale', 1, 1, '+(10-19) to maximum Life', 'body_armour, shield, helmet, gloves, boots, belt, amulet, ring', 'life', 1000, 'Life'),

-- Mana
('Mana1', 'Blue', 69, 55, '+(150-164) to maximum Mana', 'ring, amulet, focus, sceptre, wand', 'mana', 1000, 'Mana'),
('Mana2', 'Mazarine', 63, 50, '+(125-149) to maximum Mana', 'ring, amulet, helmet, focus, sceptre, wand', 'mana', 1000, 'Mana'),
('Mana3', 'Chalybeous', 53, 42, '+(105-124) to maximum Mana', 'ring, amulet, belt, helmet, gloves, boots, focus, sceptre, wand', 'mana', 1000, 'Mana'),
('Mana4', 'Gentian', 43, 34, '+(90-104) to maximum Mana', 'ring, amulet, belt, helmet, gloves, boots, focus, sceptre, wand', 'mana', 1000, 'Mana'),
('Mana5', 'Opalescent', 36, 28, '+(80-89) to maximum Mana', 'ring, amulet, belt, helmet, gloves, boots, focus, sceptre, wand', 'mana', 1000, 'Mana'),
('Mana6', 'Aqua', 31, 24, '+(65-79) to maximum Mana', 'ring, amulet, belt, helmet, gloves, boots, focus, sceptre, wand', 'mana', 1000, 'Mana'),
('Mana7', 'Cerulean', 25, 20, '+(55-64) to maximum Mana', 'ring, amulet, belt, helmet, gloves, boots, focus, sceptre, wand', 'mana', 1000, 'Mana'),
('Mana8', 'Teal', 19, 15, '+(35-54) to maximum Mana', 'ring, amulet, belt, helmet, gloves, boots, focus, sceptre, wand', 'mana', 1000, 'Mana'),
('Mana9', 'Azure', 12, 9, '+(25-34) to maximum Mana', 'ring, amulet, belt, helmet, gloves, boots, focus, sceptre, wand', 'mana', 1000, 'Mana'),
('Mana10', 'Cobalt', 6, 4, '+(15-24) to maximum Mana', 'ring, amulet, belt, helmet, gloves, boots, focus, sceptre, wand', 'mana', 1000, 'Mana'),
('Mana11', 'Beryl', 1, 1, '+(10-14) to maximum Mana', 'ring, amulet, belt, helmet, gloves, boots, focus, sceptre, wand', 'mana', 1000, 'Mana'),

-- Rarity
('Rarity1', 'Dragon', 81, 64, '(23-25)% increased Rarity of Items found', 'ring, amulet, helmet', '', 1000, 'Rarity'),
('Rarity2', 'Pirate', 65, 52, '(20-22)% increased Rarity of Items found', 'ring, amulet, helmet', '', 1000, 'Rarity'),
('Rarity3', 'Hoarder', 47, 37, '(16-19)% increased Rarity of Items found', 'ring, amulet, helmet', '', 1000, 'Rarity'),
('Rarity4', 'Collector', 29, 23, '(12-15)% increased Rarity of Items found', 'ring, amulet, helmet', '', 1000, 'Rarity'),
('Rarity5', 'Magpie', 10, 8, '(8-11)% increased Rarity of Items found', 'ring, amulet, helmet', '', 1000, 'Rarity'),

-- //
-- Specific Affixes
-- //

-- Amulet

-- Life Percent
('LifePercent1', 'Confident', 80, 64, '(7-8)% increased maximum Life', 'amulet', 'life', 300, 'LifePercent'),
('LifePercent2', 'Optimistic', 61, 48, '(5-6)% increased maximum Life', 'amulet', 'life', 300, 'LifePercent'),
('LifePercent3', 'Hopeful', 36, 28, '(3-4)% increased maximum Life', 'amulet', 'life', 300, 'LifePercent'),

-- Mana Percent
('ManaPercent1', 'Mnemonic', 79, 63, '(7-8)% increased maximum Mana', 'amulet', 'mana', 300, 'ManaPercent'),
('ManaPercent2', 'Perceptive', 60, 48, '(5-6)% increased maximum Mana', 'amulet', 'mana', 300, 'ManaPercent'),
('ManaPercent3', 'Cognizant', 35, 28, '(3-4)% increased maximum Mana', 'amulet', 'mana', 300, 'ManaPercent'),

-- Armour Percent
('ArmourPercentAmulet1', 'Impregnable', 77, 61, '(45-50)% increased Armour', 'amulet', 'defences', 1000, 'ArmourPercent'),
('ArmourPercentAmulet2', 'Girded', 70, 56, '(39-44)% increased Armour', 'amulet', 'defences', 1000, 'ArmourPercent'),
('ArmourPercentAmulet3', 'Thickened', 56, 44, '(33-38)% increased Armour', 'amulet', 'defences', 1000, 'ArmourPercent'),
('ArmourPercentAmulet4', 'Buttressed', 42, 33, '(27-32)% increased Armour', 'amulet', 'defences', 1000, 'ArmourPercent'),
('ArmourPercentAmulet5', 'Lobstered', 30, 24, '(21-26)% increased Armour', 'amulet', 'defences', 1000, 'ArmourPercent'),
('ArmourPercentAmulet6', 'Layered', 18, 14, '(15-20)% increased Armour', 'amulet', 'defences', 1000, 'ArmourPercent'),
('ArmourPercentAmulet7', 'Reinforced', 2, 1, '(10-13)% increased Armour', 'amulet', 'defences', 1000, 'ArmourPercent'),

-- Evasion Percent
('EvasionPercentAmulet1', 'Mirage', 77, 61, '(45-50)% increased Evasion Rating', 'amulet', 'defences', 1000, 'EvasionPercent'),
('EvasionPercentAmulet2', 'Nightmare', 70, 56, '(39-44)% increased Evasion Rating', 'amulet', 'defences', 1000, 'EvasionPercent'),
('EvasionPercentAmulet3', 'Phantasm', 56, 44, '(33-38)% increased Evasion Rating', 'amulet', 'defences', 1000, 'EvasionPercent'),
('EvasionPercentAmulet4', 'Wraith', 42, 33, '(27-32)% increased Evasion Rating', 'amulet', 'defences', 1000, 'EvasionPercent'),
('EvasionPercentAmulet5', 'Spectre', 30, 24, '(21-26)% increased Evasion Rating', 'amulet', 'defences', 1000, 'EvasionPercent'),
('EvasionPercentAmulet6', 'Ghost', 18, 14, '(15-20)% increased Evasion Rating', 'amulet', 'defences', 1000, 'EvasionPercent'),
('EvasionPercentAmulet7', 'Shade', 2, 1, '(10-13)% increased Evasion Rating', 'amulet', 'defences', 1000, 'EvasionPercent'),

-- Energy Shield Percent
('EnergyShieldPercentAmulet1', 'Unassailable', 77, 61, '(45-50)% increased Energy Shield', 'amulet', 'defences', 1000, 'EnergyShieldPercent'),
('EnergyShieldPercentAmulet2', 'Indomitable', 70, 56, '(39-44)% increased Energy Shield', 'amulet', 'defences', 1000, 'EnergyShieldPercent'),
('EnergyShieldPercentAmulet3', 'Dauntless', 56, 44, '(33-38)% increased Energy Shield', 'amulet', 'defences', 1000, 'EnergyShieldPercent'),
('EnergyShieldPercentAmulet4', 'Fearless', 42, 33, '(27-32)% increased Energy Shield', 'amulet', 'defences', 1000, 'EnergyShieldPercent'),
('EnergyShieldPercentAmulet5', 'Resolute', 30, 24, '(21-26)% increased Energy Shield', 'amulet', 'defences', 1000, 'EnergyShieldPercent'),
('EnergyShieldPercentAmulet6', 'Strong-Willed', 18, 14, '(15-20)% increased Energy Shield', 'amulet', 'defences', 1000, 'EnergyShieldPercent'),
('EnergyShieldPercentAmulet7', 'Protective', 2, 1, '(10-13)% increased Energy Shield', 'amulet', 'defences', 1000, 'EnergyShieldPercent'),

-- Spell Damage
('SpellDamageAmulet1', 'Incanter', 76, 60, '(27-30)% increased Spell Damage', 'amulet', 'damage,caster', 1000, 'SpellDamage'),
('SpellDamageAmulet2', 'Occultist', 62, 49, '(23-26)% increased Spell Damage', 'amulet', 'damage,caster', 1000, 'SpellDamage'),
('SpellDamageAmulet3', 'Professor', 50, 40, '(18-22)% increased Spell Damage', 'amulet', 'damage,caster', 1000, 'SpellDamage'),
('SpellDamageAmulet4', 'Scholar', 38, 30, '(13-17)% increased Spell Damage', 'amulet', 'damage,caster', 1000, 'SpellDamage'),
('SpellDamageAmulet5', 'Adept', 20, 16, '(8-12)% increased Spell Damage', 'amulet', 'damage,caster', 1000, 'SpellDamage'),
('SpellDamageAmulet6', 'Apprentice', 5, 4, '(3-7)% increased Spell Damage', 'amulet', 'damage,caster', 1000, 'SpellDamage'),

-- Ring

-- Evasion
('EvasionRing1', 'Adroit', 74, 59, '+(177-203) to Evasion Rating', 'ring', 'defences', 1000, 'Evasion'),
('EvasionRing2', 'Elusory', 66, 52, '+(152-176) to Evasion Rating', 'ring', 'defences', 1000, 'Evasion'),
('EvasionRing3', 'Vaporous', 57, 45, '+(124-151) to Evasion Rating', 'ring', 'defences', 1000, 'Evasion'),
('EvasionRing4', 'Phased', 48, 38, '+(94-123) to Evasion Rating', 'ring', 'defences', 1000, 'Evasion'),
('EvasionRing5', 'Blurred', 37, 29, '+(70-93) to Evasion Rating', 'ring', 'defences', 1000, 'Evasion'),
('EvasionRing6', 'Fleet', 28, 22, '+(45-69) to Evasion Rating', 'ring', 'defences', 1000, 'Evasion'),
('EvasionRing7', 'Acrobat', 17, 13, '+(34-44) to Evasion Rating', 'ring', 'defences', 1000, 'Evasion'),
('EvasionRing8', 'Dancer', 11, 8, '+(16-33) to Evasion Rating', 'ring', 'defences', 1000, 'Evasion'),
('EvasionRing9', 'Agile', 1, 1, '+(8-15) to Evasion Rating', 'ring', 'defences', 1000, 'Evasion'),

-- Fire Damage
('FireDamageRing1', 'Magmatic', 76, 60, '(27-30)% increased Fire Damage', 'ring', 'damage,elemental,fire', 500, 'FireDamage'),
('FireDamageRing2', 'Volcanic', 64, 51, '(23-26)% increased Fire Damage', 'ring', 'damage,elemental,fire', 500, 'FireDamage'),
('FireDamageRing3', 'Cauterising', 50, 40, '(18-22)% increased Fire Damage', 'ring', 'damage,elemental,fire', 500, 'FireDamage'),
('FireDamageRing4', 'Blistering', 36, 28, '(13-17)% increased Fire Damage', 'ring', 'damage,elemental,fire', 500, 'FireDamage'),
('FireDamageRing5', 'Sizzling', 22, 18, '(8-12)% increased Fire Damage', 'ring', 'damage,elemental,fire', 500, 'FireDamage'),
('FireDamageRing6', 'Searing', 8, 7, '(3-7)% increased Fire Damage', 'ring', 'damage,elemental,fire', 500, 'FireDamage'),

-- Cold Damage
('ColdDamageRing1', 'Crystalline', 76, 60, '(27-30)% increased Cold Damage', 'ring', 'damage,elemental,cold', 500, 'ColdDamage'),
('ColdDamageRing2', 'Hailing', 64, 51, '(23-26)% increased Cold Damage', 'ring', 'damage,elemental,cold', 500, 'ColdDamage'),
('ColdDamageRing3', 'Snowy', 50, 40, '(18-22)% increased Cold Damage', 'ring', 'damage,elemental,cold', 500, 'ColdDamage'),
('ColdDamageRing4', 'Alpine', 36, 28, '(13-17)% increased Cold Damage', 'ring', 'damage,elemental,cold', 500, 'ColdDamage'),
('ColdDamageRing5', 'Biting', 24, 18, '(8-12)% increased Cold Damage', 'ring', 'damage,elemental,cold', 500, 'ColdDamage'),
('ColdDamageRing6', 'Bitter', 10, 7, '(3-7)% increased Cold Damage', 'ring', 'damage,elemental,cold', 500, 'ColdDamage'),

-- Lightning Damage
('LightningDamageRing1', 'Smiting', 76, 60, '(27-30)% increased Lightning Damage', 'ring', 'damage,elemental,lightning', 500, 'LightningDamage'),
('LightningDamageRing2', 'Striking', 64, 51, '(23-26)% increased Lightning Damage', 'ring', 'damage,elemental,lightning', 500, 'LightningDamage'),
('LightningDamageRing3', 'Coursing', 50, 40, '(18-22)% increased Lightning Damage', 'ring', 'damage,elemental,lightning', 500, 'LightningDamage'),
('LightningDamageRing4', 'Bolting', 36, 28, '(13-17)% increased Lightning Damage', 'ring', 'damage,elemental,lightning', 500, 'LightningDamage'),
('LightningDamageRing5', 'Hissing', 23, 18, '(8-12)% increased Lightning Damage', 'ring', 'damage,elemental,lightning', 500, 'LightningDamage'),
('LightningDamageRing6', 'Charged', 9, 7, '(3-7)% increased Lightning Damage', 'ring', 'damage,elemental,lightning', 500, 'LightningDamage'),

-- Chaos Damage
('ChaosDamageRing1', 'Vile', 78, 62, '(27-30)% increased Chaos Damage', 'ring', 'damage,chaos', 500, 'ChaosDamage'),
('ChaosDamageRing2', 'Malignant', 66, 52, '(23-26)% increased Chaos Damage', 'ring', 'damage,chaos', 500, 'ChaosDamage'),
('ChaosDamageRing3', 'Darkened', 52, 41, '(18-22)% increased Chaos Damage', 'ring', 'damage,chaos', 500, 'ChaosDamage'),
('ChaosDamageRing4', 'Clouded', 38, 30, '(13-17)% increased Chaos Damage', 'ring', 'damage,chaos', 500, 'ChaosDamage'),
('ChaosDamageRing5', 'Tainted', 26, 20, '(8-12)% increased Chaos Damage', 'ring', 'damage,chaos', 500, 'ChaosDamage'),
('ChaosDamageRing6', 'Impure', 11, 8, '(3-7)% increased Chaos Damage', 'ring', 'damage,chaos', 500, 'ChaosDamage'),

-- Belt

-- Armour
('ArmourBelt1', 'Unmoving', 82, 65, '+(225-255) to Armour', 'belt', 'defences', 1000, 'Armour'),
('ArmourBelt2', 'Abating', 74, 59, '+(196-224) to Armour', 'belt', 'defences', 1000, 'Armour'),
('ArmourBelt3', 'Enveloped', 66, 52, '+(169-195) to Armour', 'belt', 'defences', 1000, 'Armour'),
('ArmourBelt4', 'Encased', 57, 45, '+(139-168) to Armour', 'belt', 'defences', 1000, 'Armour'),
('ArmourBelt5', 'Carapaced', 48, 38, '+(107-138) to Armour', 'belt', 'defences', 1000, 'Armour'),
('ArmourBelt6', 'Plated', 37, 29, '+(82-106) to Armour', 'belt', 'defences', 1000, 'Armour'),
('ArmourBelt7', 'Fortified', 28, 22, '+(55-81) to Armour', 'belt', 'defences', 1000, 'Armour'),
('ArmourBelt8', 'Ribbed', 17, 13, '+(43-54) to Armour', 'belt', 'defences', 1000, 'Armour'),
('ArmourBelt9', 'Studded', 11, 8, '+(23-42) to Armour', 'belt', 'defences', 1000, 'Armour'),
('ArmourBelt10', 'Lacquered', 1, 1, '+(12-22) to Armour', 'belt', 'defences', 1000, 'Armour'),

-- Flask Life Recovery Rate
('FlaskLifeRecoveryRate1', 'Regenerating', 77, 61, '(35-40)% increased Flask Life Recovery rate', 'belt', 'life', 800, 'FlaskLifeRecoveryRate'),
('FlaskLifeRecoveryRate2', 'Rejuvenating', 63, 50, '(29-34)% increased Flask Life Recovery rate', 'belt', 'life', 800, 'FlaskLifeRecoveryRate'),
('FlaskLifeRecoveryRate3', 'Refreshing', 49, 39, '(23-28)% increased Flask Life Recovery rate', 'belt', 'life', 800, 'FlaskLifeRecoveryRate'),
('FlaskLifeRecoveryRate4', 'Renewing', 35, 28, '(17-22)% increased Flask Life Recovery rate', 'belt', 'life', 800, 'FlaskLifeRecoveryRate'),
('FlaskLifeRecoveryRate5', 'Recovering', 21, 16, '(11-16)% increased Flask Life Recovery rate', 'belt', 'life', 800, 'FlaskLifeRecoveryRate'),
('FlaskLifeRecoveryRate6', 'Restoring', 5, 4, '(5-10)% increased Flask Life Recovery rate', 'belt', 'life', 800, 'FlaskLifeRecoveryRate'),

-- Flask Mana Recovery Rate
('FlaskManaRecoveryRate1', 'Inspiring', 77, 61, '(35-40)% increased Flask Mana Recovery rate', 'belt', 'mana', 800, 'FlaskManaRecoveryRate'),
('FlaskManaRecoveryRate2', 'Galvanizing', 63, 50, '(29-34)% increased Flask Mana Recovery rate', 'belt', 'mana', 800, 'FlaskManaRecoveryRate'),
('FlaskManaRecoveryRate3', 'Exciting', 49, 39, '(23-28)% increased Flask Mana Recovery rate', 'belt', 'mana', 800, 'FlaskManaRecoveryRate'),
('FlaskManaRecoveryRate4', 'Heartening', 35, 28, '(17-22)% increased Flask Mana Recovery rate', 'belt', 'mana', 800, 'FlaskManaRecoveryRate'),
('FlaskManaRecoveryRate5', 'Stirring', 21, 16, '(11-16)% increased Flask Mana Recovery rate', 'belt', 'mana', 800, 'FlaskManaRecoveryRate'),
('FlaskManaRecoveryRate6', 'Affecting', 5, 4, '(5-10)% increased Flask Mana Recovery rate', 'belt', 'mana', 800, 'FlaskManaRecoveryRate'),

-- Helmet

-- Armour/Mana Hybrid
('ArmourManaHybrid1', 'Ancestral', 78, 62, '(39-42)% increased Armour\n+(33-39) to maximum Mana', 'str_armour, helmet', 'mana,defences', 1000, 'ArmourManaHybrid'),
('ArmourManaHybrid2', 'Chieftain', 60, 48, '(33-38)% increased Armour\n+(27-32) to maximum Mana', 'str_armour, helmet', 'mana,defences', 1000, 'ArmourManaHybrid'),
('ArmourManaHybrid3', 'Colossal', 44, 35, '(27-32)% increased Armour\n+(21-26) to maximum Mana', 'str_armour, helmet', 'mana,defences', 1000, 'ArmourManaHybrid'),
('ArmourManaHybrid4', 'Regal', 30, 24, '(21-26)% increased Armour\n+(17-20) to maximum Mana', 'str_armour, helmet', 'mana,defences', 1000, 'ArmourManaHybrid'),
('ArmourManaHybrid5', 'Venerable', 19, 15, '(14-20)% increased Armour\n+(9-16) to maximum Mana', 'str_armour, helmet', 'mana,defences', 1000, 'ArmourManaHybrid'),
('ArmourManaHybrid6', 'Imposing', 10, 8, '(6-13)% increased Armour\n+(6-8) to maximum Mana', 'str_armour, helmet', 'mana,defences', 1000, 'ArmourManaHybrid'),

-- Evasion/Mana Hybrid
('EvasionManaHybrid1', 'Wanderer', 78, 62, '(39-42)% increased Evasion Rating\n+(33-39) to maximum Mana', 'dex_armour, helmet', 'mana,defences', 1000, 'EvasionManaHybrid'),
('EvasionManaHybrid2', 'Wayfarer', 60, 48, '(33-38)% increased Evasion Rating\n+(27-32) to maximum Mana', 'dex_armour, helmet', 'mana,defences', 1000, 'EvasionManaHybrid'),
('EvasionManaHybrid3', 'Explorer', 44, 35, '(27-32)% increased Evasion Rating\n+(21-26) to maximum Mana', 'dex_armour, helmet', 'mana,defences', 1000, 'EvasionManaHybrid'),
('EvasionManaHybrid4', 'Traveller', 30, 24, '(21-26)% increased Evasion Rating\n+(17-20) to maximum Mana', 'dex_armour, helmet', 'mana,defences', 1000, 'EvasionManaHybrid'),
('EvasionManaHybrid5', 'Drifter', 19, 15, '(14-20)% increased Evasion Rating\n+(9-16) to maximum Mana', 'dex_armour, helmet', 'mana,defences', 1000, 'EvasionManaHybrid'),
('EvasionManaHybrid6', 'Nomad', 10, 8, '(6-13)% increased Evasion Rating\n+(6-8) to maximum Mana', 'dex_armour, helmet', 'mana,defences', 1000, 'EvasionManaHybrid'),

-- Energy Shield/Mana Hybrid
('EnergyShieldManaHybrid1', 'Angel', 78, 62, '(39-42)% increased Energy Shield\n+(33-39) to maximum Mana', 'int_armour, helmet', 'mana,defences', 1000, 'EnergyShieldManaHybrid'),
('EnergyShieldManaHybrid2', 'Heavenly', 60, 48, '(33-38)% increased Energy Shield\n+(27-32) to maximum Mana', 'int_armour, helmet', 'mana,defences', 1000, 'EnergyShieldManaHybrid'),
('EnergyShieldManaHybrid3', 'Celestial', 44, 35, '(27-32)% increased Energy Shield\n+(21-26) to maximum Mana', 'int_armour, helmet', 'mana,defences', 1000, 'EnergyShieldManaHybrid'),
('EnergyShieldManaHybrid4', 'Sacred', 30, 24, '(21-26)% increased Energy Shield\n+(17-20) to maximum Mana', 'int_armour, helmet', 'mana,defences', 1000, 'EnergyShieldManaHybrid'),
('EnergyShieldManaHybrid5', 'Serene', 19, 15, '(14-20)% increased Energy Shield\n+(9-16) to maximum Mana', 'int_armour, helmet', 'mana,defences', 1000, 'EnergyShieldManaHybrid'),
('EnergyShieldManaHybrid6', 'Imbued', 10, 8, '(6-13)% increased Energy Shield\n+(6-8) to maximum Mana', 'int_armour, helmet', 'mana,defences', 1000, 'EnergyShieldManaHybrid'),

-- Armour/Evasion Mana Hybrid
('ArmourEvasionManaHybrid1', 'Cerberus', 78, 62, '(39-42)% increased Armour and Evasion\n+(33-39) to maximum Mana', 'str_dex_armour, helmet', 'mana,defences', 1000, 'ArmourEvasionManaHybrid'),
('ArmourEvasionManaHybrid2', 'Minotaur', 60, 48, '(33-38)% increased Armour and Evasion\n+(27-32) to maximum Mana', 'str_dex_armour, helmet', 'mana,defences', 1000, 'ArmourEvasionManaHybrid'),
('ArmourEvasionManaHybrid3', 'Bull', 44, 35, '(27-32)% increased Armour and Evasion\n+(21-26) to maximum Mana', 'str_dex_armour, helmet', 'mana,defences', 1000, 'ArmourEvasionManaHybrid'),
('ArmourEvasionManaHybrid4', 'Chimeral', 30, 24, '(21-26)% increased Armour and Evasion\n+(17-20) to maximum Mana', 'str_dex_armour, helmet', 'mana,defences', 1000, 'ArmourEvasionManaHybrid'),
('ArmourEvasionManaHybrid5', 'Rhex', 19, 15, '(14-20)% increased Armour and Evasion\n+(9-16) to maximum Mana', 'str_dex_armour, helmet', 'mana,defences', 1000, 'ArmourEvasionManaHybrid'),
('ArmourEvasionManaHybrid6', 'Rhoa', 10, 8, '(6-13)% increased Armour and Evasion\n+(6-8) to maximum Mana', 'str_dex_armour, helmet', 'mana,defences', 1000, 'ArmourEvasionManaHybrid'),

-- Armour/Energy Shield Mana Hybrid
('ArmourEnergyShieldManaHybrid1', 'Whale', 78, 62, '(39-42)% increased Armour and Energy Shield\n+(33-39) to maximum Mana', 'str_int_armour, helmet', 'mana,defences', 1000, 'ArmourEnergyShieldManaHybrid'),
('ArmourEnergyShieldManaHybrid2', 'Orca', 60, 48, '(33-38)% increased Armour and Energy Shield\n+(27-32) to maximum Mana', 'str_int_armour, helmet', 'mana,defences', 1000, 'ArmourEnergyShieldManaHybrid'),
('ArmourEnergyShieldManaHybrid3', 'Dolphin', 44, 35, '(27-32)% increased Armour and Energy Shield\n+(21-26) to maximum Mana', 'str_int_armour, helmet', 'mana,defences', 1000, 'ArmourEnergyShieldManaHybrid'),
('ArmourEnergyShieldManaHybrid4', 'Shark', 30, 24, '(21-26)% increased Armour and Energy Shield\n+(17-20) to maximum Mana', 'str_int_armour, helmet', 'mana,defences', 1000, 'ArmourEnergyShieldManaHybrid'),
('ArmourEnergyShieldManaHybrid5', 'Swordfish', 19, 15, '(14-20)% increased Armour and Energy Shield\n+(9-16) to maximum Mana', 'str_int_armour, helmet', 'mana,defences', 1000, 'ArmourEnergyShieldManaHybrid'),
('ArmourEnergyShieldManaHybrid6', 'Coelacanth', 10, 8, '(6-13)% increased Armour and Energy Shield\n+(6-8) to maximum Mana', 'str_int_armour, helmet', 'mana,defences', 1000, 'ArmourEnergyShieldManaHybrid'),

-- Evasion/Energy Shield Mana Hybrid
('EvasionEnergyShieldManaHybrid1', 'Falcon', 78, 62, '(39-42)% increased Evasion and Energy Shield\n+(33-39) to maximum Mana', 'dex_int_armour, helmet', 'mana,defences', 1000, 'EvasionEnergyShieldManaHybrid'),
('EvasionEnergyShieldManaHybrid2', 'Eagle', 60, 48, '(33-38)% increased Evasion and Energy Shield\n+(27-32) to maximum Mana', 'dex_int_armour, helmet', 'mana,defences', 1000, 'EvasionEnergyShieldManaHybrid'),
('EvasionEnergyShieldManaHybrid3', 'Hawk', 44, 35, '(27-32)% increased Evasion and Energy Shield\n+(21-26) to maximum Mana', 'dex_int_armour, helmet', 'mana,defences', 1000, 'EvasionEnergyShieldManaHybrid'),
('EvasionEnergyShieldManaHybrid4', 'Owl', 30, 24, '(21-26)% increased Evasion and Energy Shield\n+(17-20) to maximum Mana', 'dex_int_armour, helmet', 'mana,defences', 1000, 'EvasionEnergyShieldManaHybrid'),
('EvasionEnergyShieldManaHybrid5', 'Kingfisher', 19, 15, '(14-20)% increased Evasion and Energy Shield\n+(9-16) to maximum Mana', 'dex_int_armour, helmet', 'mana,defences', 1000, 'EvasionEnergyShieldManaHybrid'),
('EvasionEnergyShieldManaHybrid6', 'Vulture', 10, 8, '(6-13)% increased Evasion and Energy Shield\n+(6-8) to maximum Mana', 'dex_int_armour, helmet', 'mana,defences', 1000, 'EvasionEnergyShieldManaHybrid'),

-- Boots

-- Armour Stun Hybrid
('ArmourStunHybrid1', 'Mammoth', 78, 62, '(39-42)% increased Armour\n+(95-136) to Stun Threshold', 'str_armour, str_shield, boots', 'defences', 1000, 'ArmourStunHybrid'),
('ArmourStunHybrid2', 'Elephant', 60, 48, '(33-38)% increased Armour\n+(64-94) to Stun Threshold', 'str_armour, str_shield, boots', 'defences', 1000, 'ArmourStunHybrid'),
('ArmourStunHybrid3', 'Rhino', 44, 35, '(27-32)% increased Armour\n+(41-63) to Stun Threshold', 'str_armour, str_shield, boots', 'defences', 1000, 'ArmourStunHybrid'),
('ArmourStunHybrid4', 'Armadillo', 30, 24, '(21-26)% increased Armour\n+(25-40) to Stun Threshold', 'str_armour, str_shield, boots', 'defences', 1000, 'ArmourStunHybrid'),
('ArmourStunHybrid5', 'Crab', 19, 15, '(14-20)% increased Armour\n+(14-24) to Stun Threshold', 'str_armour, str_shield, boots', 'defences', 1000, 'ArmourStunHybrid'),
('ArmourStunHybrid6', 'Beetle', 10, 8, '(6-13)% increased Armour\n+(8-13) to Stun Threshold', 'str_armour, str_shield, boots', 'defences', 1000, 'ArmourStunHybrid'),

-- Evasion Stun Hybrid
('EvasionStunHybrid1', 'Hummingbird', 78, 62, '(39-42)% increased Evasion Rating\n+(95-136) to Stun Threshold', 'dex_armour, dex_shield, boots', 'defences', 1000, 'EvasionStunHybrid'),
('EvasionStunHybrid2', 'Dragonfly', 60, 48, '(33-38)% increased Evasion Rating\n+(64-94) to Stun Threshold', 'dex_armour, dex_shield, boots', 'defences', 1000, 'EvasionStunHybrid'),
('EvasionStunHybrid3', 'Wasp', 44, 35, '(27-32)% increased Evasion Rating\n+(41-63) to Stun Threshold', 'dex_armour, dex_shield, boots', 'defences', 1000, 'EvasionStunHybrid'),
('EvasionStunHybrid4', 'Butterfly', 30, 24, '(21-26)% increased Evasion Rating\n+(25-40) to Stun Threshold', 'dex_armour, dex_shield, boots', 'defences', 1000, 'EvasionStunHybrid'),
('EvasionStunHybrid5', 'Moth', 19, 15, '(14-20)% increased Evasion Rating\n+(14-24) to Stun Threshold', 'dex_armour, dex_shield, boots', 'defences', 1000, 'EvasionStunHybrid'),
('EvasionStunHybrid6', 'Mosquito', 10, 8, '(6-13)% increased Evasion Rating\n+(8-13) to Stun Threshold', 'dex_armour, dex_shield, boots', 'defences', 1000, 'EvasionStunHybrid'),

-- Energy Shield Stun Hybrid
('EnergyShieldStunHybrid1', 'Seraphim', 78, 62, '(39-42)% increased Energy Shield\n+(95-136) to Stun Threshold', 'int_armour, boots', 'defences', 1000, 'EnergyShieldStunHybrid'),
('EnergyShieldStunHybrid2', 'Djinn', 60, 48, '(33-38)% increased Energy Shield\n+(64-94) to Stun Threshold', 'int_armour, boots', 'defences', 1000, 'EnergyShieldStunHybrid'),
('EnergyShieldStunHybrid3', 'Naga', 44, 35, '(27-32)% increased Energy Shield\n+(41-63) to Stun Threshold', 'int_armour, boots', 'defences', 1000, 'EnergyShieldStunHybrid'),
('EnergyShieldStunHybrid4', 'Boggart', 30, 24, '(21-26)% increased Energy Shield\n+(25-40) to Stun Threshold', 'int_armour, boots', 'defences', 1000, 'EnergyShieldStunHybrid'),
('EnergyShieldStunHybrid5', 'Gremlin', 19, 15, '(14-20)% increased Energy Shield\n+(14-24) to Stun Threshold', 'int_armour, boots', 'defences', 1000, 'EnergyShieldStunHybrid'),
('EnergyShieldStunHybrid6', 'Pixie', 10, 8, '(6-13)% increased Energy Shield\n+(8-13) to Stun Threshold', 'int_armour, boots', 'defences', 1000, 'EnergyShieldStunHybrid'),

-- Armour/Evasion Stun Hybrid
('ArmourEvasionStunHybrid1', 'Warlord', 78, 62, '(39-42)% increased Armour and Evasion\n+(95-136) to Stun Threshold', 'str_dex_armour, str_dex_shield, boots', 'defences', 1000, 'ArmourEvasionStunHybrid'),
('ArmourEvasionStunHybrid2', 'General', 60, 48, '(33-38)% increased Armour and Evasion\n+(64-94) to Stun Threshold', 'str_dex_armour, str_dex_shield, boots', 'defences', 1000, 'ArmourEvasionStunHybrid'),
('ArmourEvasionStunHybrid3', 'Marshal', 44, 35, '(27-32)% increased Armour and Evasion\n+(41-63) to Stun Threshold', 'str_dex_armour, str_dex_shield, boots', 'defences', 1000, 'ArmourEvasionStunHybrid'),
('ArmourEvasionStunHybrid4', 'Magnate', 30, 24, '(21-26)% increased Armour and Evasion\n+(25-40) to Stun Threshold', 'str_dex_armour, str_dex_shield, boots', 'defences', 1000, 'ArmourEvasionStunHybrid'),
('ArmourEvasionStunHybrid5', 'Commander', 19, 15, '(14-20)% increased Armour and Evasion\n+(14-24) to Stun Threshold', 'str_dex_armour, str_dex_shield, boots', 'defences', 1000, 'ArmourEvasionStunHybrid'),
('ArmourEvasionStunHybrid6', 'Captain', 10, 8, '(6-13)% increased Armour and Evasion\n+(8-13) to Stun Threshold', 'str_dex_armour, str_dex_shield, boots', 'defences', 1000, 'ArmourEvasionStunHybrid'),

-- Armour/Energy Shield Stun Hybrid
('ArmourEnergyShieldStunHybrid1', 'Sentinel', 78, 62, '(39-42)% increased Armour and Energy Shield\n+(95-136) to Stun Threshold', 'str_int_armour, str_int_shield, boots', 'defences', 1000, 'ArmourEnergyShieldStunHybrid'),
('ArmourEnergyShieldStunHybrid2', 'Warden', 60, 48, '(33-38)% increased Armour and Energy Shield\n+(64-94) to Stun Threshold', 'str_int_armour, str_int_shield, boots', 'defences', 1000, 'ArmourEnergyShieldStunHybrid'),
('ArmourEnergyShieldStunHybrid3', 'Guardian', 44, 35, '(27-32)% increased Armour and Energy Shield\n+(41-63) to Stun Threshold', 'str_int_armour, str_int_shield, boots', 'defences', 1000, 'ArmourEnergyShieldStunHybrid'),
('ArmourEnergyShieldStunHybrid4', 'Keeper', 30, 24, '(21-26)% increased Armour and Energy Shield\n+(25-40) to Stun Threshold', 'str_int_armour, str_int_shield, boots', 'defences', 1000, 'ArmourEnergyShieldStunHybrid'),
('ArmourEnergyShieldStunHybrid5', 'Protector', 19, 15, '(14-20)% increased Armour and Energy Shield\n+(14-24) to Stun Threshold', 'str_int_armour, str_int_shield, boots', 'defences', 1000, 'ArmourEnergyShieldStunHybrid'),
('ArmourEnergyShieldStunHybrid6', 'Defender', 10, 8, '(6-13)% increased Armour and Energy Shield\n+(8-13) to Stun Threshold', 'str_int_armour, str_int_shield, boots', 'defences', 1000, 'ArmourEnergyShieldStunHybrid'),

-- Evasion/Energy Shield Stun Hybrid
('EvasionEnergyShieldStunHybrid1', 'Intuitive', 78, 62, '(39-42)% increased Evasion and Energy Shield\n+(95-136) to Stun Threshold', 'dex_int_armour, boots', 'defences', 1000, 'EvasionEnergyShieldStunHybrid'),
('EvasionEnergyShieldStunHybrid2', 'Psychic', 60, 48, '(33-38)% increased Evasion and Energy Shield\n+(64-94) to Stun Threshold', 'dex_int_armour, boots', 'defences', 1000, 'EvasionEnergyShieldStunHybrid'),
('EvasionEnergyShieldStunHybrid3', 'Telepath', 44, 35, '(27-32)% increased Evasion and Energy Shield\n+(41-63) to Stun Threshold', 'dex_int_armour, boots', 'defences', 1000, 'EvasionEnergyShieldStunHybrid'),
('EvasionEnergyShieldStunHybrid4', 'Illusionist', 30, 24, '(21-26)% increased Evasion and Energy Shield\n+(25-40) to Stun Threshold', 'dex_int_armour, boots', 'defences', 1000, 'EvasionEnergyShieldStunHybrid'),
('EvasionEnergyShieldStunHybrid5', 'Mentalist', 19, 15, '(14-20)% increased Evasion and Energy Shield\n+(14-24) to Stun Threshold', 'dex_int_armour, boots', 'defences', 1000, 'EvasionEnergyShieldStunHybrid'),
('EvasionEnergyShieldStunHybrid6', 'Trickster', 10, 8, '(6-13)% increased Evasion and Energy Shield\n+(8-13) to Stun Threshold', 'dex_int_armour, boots', 'defences', 1000, 'EvasionEnergyShieldStunHybrid'),

-- Movement Speed
('MovementSpeed1', 'Hellion', 82, 65, '35% increased Movement Speed', 'boots', 'speed', 1000, 'MovementSpeed'),
('MovementSpeed2', 'Cheetah', 70, 56, '30% increased Movement Speed', 'boots', 'speed', 1000, 'MovementSpeed'),
('MovementSpeed3', 'Gazelle', 50, 40, '25% increased Movement Speed', 'boots', 'speed', 1000, 'MovementSpeed'),
('MovementSpeed4', 'Stallion', 30, 24, '20% increased Movement Speed', 'boots', 'speed', 1000, 'MovementSpeed'),
('MovementSpeed5', 'Sprinter', 15, 12, '15% increased Movement Speed', 'boots', 'speed', 1000, 'MovementSpeed'),
('MovementSpeed6', 'Runner', 1, 1, '10% increased Movement Speed', 'boots', 'speed', 1000, 'MovementSpeed'),


-- Staff
('ManaStaff1', 'Blue', 69, 55, '+(210-230) to maximum Mana', 'staff', 'mana', 1000, 'Mana'),
('ManaStaff2', 'Mazarine', 63, 50, '+(175-209) to maximum Mana', 'staff', 'mana', 1000, 'Mana'),
('ManaStaff3', 'Chalybeous', 53, 42, '+(147-174) to maximum Mana', 'staff', 'mana', 1000, 'Mana'),
('ManaStaff4', 'Gentian', 43, 34, '+(126-146) to maximum Mana', 'staff', 'mana', 1000, 'Mana'),
('ManaStaff5', 'Opalescent', 36, 28, '+(112-125) to maximum Mana', 'staff', 'mana', 1000, 'Mana'),
('ManaStaff6', 'Aqua', 31, 24, '+(91-111) to maximum Mana', 'staff', 'mana', 1000, 'Mana'),
('ManaStaff7', 'Cerulean', 25, 20, '+(77-90) to maximum Mana', 'staff', 'mana', 1000, 'Mana'),
('ManaStaff8', 'Sapphire', 19, 15, '+(49-76) to maximum Mana', 'staff', 'mana', 1000, 'Mana'),
('ManaStaff9', 'Azure', 12, 9, '+(35-48) to maximum Mana', 'staff', 'mana', 1000, 'Mana'),
('ManaStaff10', 'Cobalt', 6, 4, '+(21-34) to maximum Mana', 'staff', 'mana', 1000, 'Mana'),
('ManaStaff11', 'Beryl', 1, 1, '+(14-20) to maximum Mana', 'staff', 'mana', 1000, 'Mana'),

-- Shield

-- Block Chance
('BlockChance1', 'Unyielding', 82, 65, '(76-81)% increased Block chance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'defences', 1000, 'BlockChance'),
('BlockChance2', 'Enduring', 74, 59, '(70-75)% increased Block chance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'defences', 1000, 'BlockChance'),
('BlockChance3', 'Unwavering', 61, 48, '(64-69)% increased Block chance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'defences', 1000, 'BlockChance'),
('BlockChance4', 'Warded', 46, 36, '(58-63)% increased Block chance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'defences', 1000, 'BlockChance'),
('BlockChance5', 'Adamant', 30, 24, '(52-57)% increased Block chance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'defences', 1000, 'BlockChance'),
('BlockChance6', 'Unrelenting', 15, 12, '(46-51)% increased Block chance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'defences', 1000, 'BlockChance'),
('BlockChance7', 'Steadfast', 2, 1, '(40-45)% increased Block chance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'defences', 1000, 'BlockChance'),

-- Sceptre

-- Ally Added Physical Damage
('AllyAddedPhysicalDamage1', 'Flaring', 76, 60, 'Allies in your Presence deal (12-19) to (22-32) added Attack Physical Damage', 'sceptre', 'damage,physical,attack', 200, 'AllyPhysicalDamage'),
('AllyAddedPhysicalDamage2', 'Tempered', 64, 51, 'Allies in your Presence deal (10-15) to (18-26) added Attack Physical Damage', 'sceptre', 'damage,physical,attack', 300, 'AllyPhysicalDamage'),
('AllyAddedPhysicalDamage3', 'RazorSharp', 52, 41, 'Allies in your Presence deal (7-11) to (14-20) added Attack Physical Damage', 'sceptre', 'damage,physical,attack', 400, 'AllyPhysicalDamage'),
('AllyAddedPhysicalDamage4', 'Annealed', 44, 35, 'Allies in your Presence deal (6-10) to (12-17) added Attack Physical Damage', 'sceptre', 'damage,physical,attack', 500, 'AllyPhysicalDamage'),
('AllyAddedPhysicalDamage5', 'Gleaming', 35, 28, 'Allies in your Presence deal (5-7) to (9-13) added Attack Physical Damage', 'sceptre', 'damage,physical,attack', 500, 'AllyPhysicalDamage'),
('AllyAddedPhysicalDamage6', 'Honed', 28, 22, 'Allies in your Presence deal (4-6) to (8-11) added Attack Physical Damage', 'sceptre', 'damage,physical,attack', 500, 'AllyPhysicalDamage'),
('AllyAddedPhysicalDamage7', 'Polished', 19, 15, 'Allies in your Presence deal (2-4) to (5-8) added Attack Physical Damage', 'sceptre', 'damage,physical,attack', 500, 'AllyPhysicalDamage'),
('AllyAddedPhysicalDamage8', 'Burnished', 13, 10, 'Allies in your Presence deal (2-3) to (4-6) added Attack Physical Damage', 'sceptre', 'damage,physical,attack', 500, 'AllyPhysicalDamage'),
('AllyAddedPhysicalDamage9', 'Glinting', 5, 4, 'Allies in your Presence deal (1-2) to (3-4) added Attack Physical Damage', 'sceptre', 'damage,physical,attack', 500, 'AllyPhysicalDamage'),

-- Ally Added Fire Damage
('AllyAddedFireDamage1', 'Cremating', 76, 60, 'Allies in your Presence deal (19-29) to (30-45) added Attack Fire Damage', 'sceptre', 'damage,elemental,fire,attack', 200, 'AllyFireDamage'),
('AllyAddedFireDamage2', 'Blasting', 64, 51, 'Allies in your Presence deal (16-24) to (25-38) added Attack Fire Damage', 'sceptre', 'damage,elemental,fire,attack', 300, 'AllyFireDamage'),
('AllyAddedFireDamage3', 'Incinerating', 52, 41, 'Allies in your Presence deal (13-19) to (20-30) added Attack Fire Damage', 'sceptre', 'damage,elemental,fire,attack', 400, 'AllyFireDamage'),
('AllyAddedFireDamage4', 'Scorching', 44, 35, 'Allies in your Presence deal (11-16) to (17-26) added Attack Fire Damage', 'sceptre', 'damage,elemental,fire,attack', 500, 'AllyFireDamage'),
('AllyAddedFireDamage5', 'Flaming', 35, 28, 'Allies in your Presence deal (8-13) to (14-20) added Attack Fire Damage', 'sceptre', 'damage,elemental,fire,attack', 500, 'AllyFireDamage'),
('AllyAddedFireDamage6', 'Burning', 28, 22, 'Allies in your Presence deal (7-11) to (12-17) added Attack Fire Damage', 'sceptre', 'damage,elemental,fire,attack', 500, 'AllyFireDamage'),
('AllyAddedFireDamage7', 'Smoking', 20, 15, 'Allies in your Presence deal (5-8) to (9-13) added Attack Fire Damage', 'sceptre', 'damage,elemental,fire,attack', 500, 'AllyFireDamage'),
('AllyAddedFireDamage8', 'Smouldering', 12, 10, 'Allies in your Presence deal (3-5) to (6-9) added Attack Fire Damage', 'sceptre', 'damage,elemental,fire,attack', 500, 'AllyFireDamage'),
('AllyAddedFireDamage9', 'Heated', 1, 4, 'Allies in your Presence deal (1-2) to (3-4) added Attack Fire Damage', 'sceptre', 'damage,elemental,fire,attack', 500, 'AllyFireDamage'),

-- Ally Added Cold Damage
('AllyAddedColdDamage1', 'Entombing', 77, 60, 'Allies in your Presence deal (16-24) to (25-37) added Attack Cold Damage', 'sceptre', 'damage,elemental,cold,attack', 200, 'AllyColdDamage'),
('AllyAddedColdDamage2', 'Polar', 65, 51, 'Allies in your Presence deal (13-20) to (21-31) added Attack Cold Damage', 'sceptre', 'damage,elemental,cold,attack', 300, 'AllyColdDamage'),
('AllyAddedColdDamage3', 'Glaciated', 53, 41, 'Allies in your Presence deal (10-15) to (16-24) added Attack Cold Damage', 'sceptre', 'damage,elemental,cold,attack', 400, 'AllyColdDamage'),
('AllyAddedColdDamage4', 'Frozen', 45, 35, 'Allies in your Presence deal (9-13) to (14-21) added Attack Cold Damage', 'sceptre', 'damage,elemental,cold,attack', 500, 'AllyColdDamage'),
('AllyAddedColdDamage5', 'Freezing', 36, 28, 'Allies in your Presence deal (7-10) to (11-17) added Attack Cold Damage', 'sceptre', 'damage,elemental,cold,attack', 500, 'AllyColdDamage'),
('AllyAddedColdDamage6', 'Frigid', 29, 22, 'Allies in your Presence deal (6-9) to (10-14) added Attack Cold Damage', 'sceptre', 'damage,elemental,cold,attack', 500, 'AllyColdDamage'),
('AllyAddedColdDamage7', 'Icy', 21, 15, 'Allies in your Presence deal (4-6) to (7-11) added Attack Cold Damage', 'sceptre', 'damage,elemental,cold,attack', 500, 'AllyColdDamage'),
('AllyAddedColdDamage8', 'Chilled', 13, 10, 'Allies in your Presence deal (3-4) to (5-8) added Attack Cold Damage', 'sceptre', 'damage,elemental,cold,attack', 500, 'AllyColdDamage'),
('AllyAddedColdDamage9', 'Frosted', 1, 4, 'Allies in your Presence deal (1-2) to (3-4) added Attack Cold Damage', 'sceptre', 'damage,elemental,cold,attack', 500, 'AllyColdDamage'),

-- Ally Added Lightning Damage
('AllyAddedLightningDamage1', 'Electrocuting', 76, 60, 'Allies in your Presence deal (1-4) to (48-71) added Attack Lightning Damage', 'sceptre', 'damage,elemental,lightning,attack', 200, 'AllyLightningDamage'),
('AllyAddedLightningDamage2', 'Discharging', 64, 51, 'Allies in your Presence deal (1-3) to (40-59) added Attack Lightning Damage', 'sceptre', 'damage,elemental,lightning,attack', 300, 'AllyLightningDamage'),
('AllyAddedLightningDamage3', 'Shocking', 52, 41, 'Allies in your Presence deal (1-2) to (31-47) added Attack Lightning Damage', 'sceptre', 'damage,elemental,lightning,attack', 400, 'AllyLightningDamage'),
('AllyAddedLightningDamage4', 'Arcing', 44, 35, 'Allies in your Presence deal (1-2) to (27-40) added Attack Lightning Damage', 'sceptre', 'damage,elemental,lightning,attack', 500, 'AllyLightningDamage'),
('AllyAddedLightningDamage5', 'Sparking', 35, 28, 'Allies in your Presence deal 1 to (21-32) added Attack Lightning Damage', 'sceptre', 'damage,elemental,lightning,attack', 500, 'AllyLightningDamage'),
('AllyAddedLightningDamage6', 'Crackling', 28, 22, 'Allies in your Presence deal 1 to (18-27) added Attack Lightning Damage', 'sceptre', 'damage,elemental,lightning,attack', 500, 'AllyLightningDamage'),
('AllyAddedLightningDamage7', 'Snapping', 22, 15, 'Allies in your Presence deal 1 to (15-22) added Attack Lightning Damage', 'sceptre', 'damage,elemental,lightning,attack', 500, 'AllyLightningDamage'),
('AllyAddedLightningDamage8', 'Buzzing', 13, 10, 'Allies in your Presence deal 1 to (10-15) added Attack Lightning Damage', 'sceptre', 'damage,elemental,lightning,attack', 500, 'AllyLightningDamage'),
('AllyAddedLightningDamage9', 'Humming', 1, 4, 'Allies in your Presence deal 1 to (5-7) added Attack Lightning Damage', 'sceptre', 'damage,elemental,lightning,attack', 500, 'AllyLightningDamage'),

-- Ally Damage Percent
('AllyDamagePercent1', 'Empowering', 82, 65, 'Allies in your Presence deal (105-119)% increased Damage', 'sceptre', 'damage', 50, 'AllyDamagePercent'),
('AllyDamagePercent2', 'Inspirational', 70, 56, 'Allies in your Presence deal (90-104)% increased Damage', 'sceptre', 'damage', 100, 'AllyDamagePercent'),
('AllyDamagePercent3', 'Motivating', 58, 46, 'Allies in your Presence deal (75-89)% increased Damage', 'sceptre', 'damage', 200, 'AllyDamagePercent'),
('AllyDamagePercent4', 'Persuasive', 45, 36, 'Allies in your Presence deal (65-74)% increased Damage', 'sceptre', 'damage', 400, 'AllyDamagePercent'),
('AllyDamagePercent5', 'Provocative', 31, 24, 'Allies in your Presence deal (55-64)% increased Damage', 'sceptre', 'damage', 600, 'AllyDamagePercent'),
('AllyDamagePercent6', 'Instigative', 19, 15, 'Allies in your Presence deal (45-54)% increased Damage', 'sceptre', 'damage', 1000, 'AllyDamagePercent'),
('AllyDamagePercent7', 'Agitative', 8, 6, 'Allies in your Presence deal (35-44)% increased Damage', 'sceptre', 'damage', 1000, 'AllyDamagePercent'),
('AllyDamagePercent8', 'Coercive', 1, 1, 'Allies in your Presence deal (25-34)% increased Damage', 'sceptre', 'damage', 1000, 'AllyDamagePercent'),

-- Ally Accuracy Rating
('AllyAccuracyRating1', 'Ranger', 63, 50, 'Allies in your Presence have +(347-450) to Accuracy Rating', 'sceptre', 'attack', 400, 'AllyAccuracyRating'),
('AllyAccuracyRating2', 'Hunter', 50, 40, 'Allies in your Presence have +(237-346) to Accuracy Rating', 'sceptre', 'attack', 800, 'AllyAccuracyRating'),
('AllyAccuracyRating3', 'Steady', 41, 32, 'Allies in your Presence have +(168-236) to Accuracy Rating', 'sceptre', 'attack', 800, 'AllyAccuracyRating'),
('AllyAccuracyRating4', 'Consistent', 33, 26, 'Allies in your Presence have +(124-167) to Accuracy Rating', 'sceptre', 'attack', 800, 'AllyAccuracyRating'),
('AllyAccuracyRating5', 'Deliberate', 26, 20, 'Allies in your Presence have +(85-123) to Accuracy Rating', 'sceptre', 'attack', 800, 'AllyAccuracyRating'),
('AllyAccuracyRating6', 'Focused', 20, 16, 'Allies in your Presence have +(61-84) to Accuracy Rating', 'sceptre', 'attack', 800, 'AllyAccuracyRating'),
('AllyAccuracyRating7', 'Reliable', 12, 9, 'Allies in your Presence have +(33-60) to Accuracy Rating', 'sceptre', 'attack', 800, 'AllyAccuracyRating'),
('AllyAccuracyRating8', 'Precise', 1, 1, 'Allies in your Presence have +(11-32) to Accuracy Rating', 'sceptre', 'attack', 800, 'AllyAccuracyRating'),

-- Increased Spirit
('IncreasedSpirit1', 'King', 82, 65, '(61-65)% increased Spirit', 'sceptre', 'spirit', 50, 'IncreasedSpirit'),
('IncreasedSpirit2', 'Prince', 73, 58, '(56-60)% increased Spirit', 'sceptre', 'spirit', 100, 'IncreasedSpirit'),
('IncreasedSpirit3', 'Duke', 60, 48, '(51-55)% increased Spirit', 'sceptre', 'spirit', 200, 'IncreasedSpirit'),
('IncreasedSpirit4', 'Count', 46, 36, '(45-50)% increased Spirit', 'sceptre', 'spirit', 400, 'IncreasedSpirit'),
('IncreasedSpirit5', 'Marquess', 35, 28, '(39-44)% increased Spirit', 'sceptre', 'spirit', 600, 'IncreasedSpirit'),
('IncreasedSpirit6', 'Viscount', 23, 18, '(33-38)% increased Spirit', 'sceptre', 'spirit', 1000, 'IncreasedSpirit'),
('IncreasedSpirit7', 'Baron', 11, 8, '(27-32)% increased Spirit', 'sceptre', 'spirit', 1000, 'IncreasedSpirit'),
('IncreasedSpirit8', 'Lord', 1, 1, '(30-36)% increased Spirit', 'sceptre', 'spirit', 1000, 'IncreasedSpirit'),

-- Hybrid Spirit and Mana
('HybridSpiritMana1', 'Chancellor', 78, 62, '(35-38)% increased Spirit\n+(42-45) to maximum Mana', 'sceptre', 'spirit, mana', 100, 'HybridSpiritMana'),
('HybridSpiritMana2', 'Diplomat', 62, 49, '(31-34)% increased Spirit\n+(38-41) to maximum Mana', 'sceptre', 'spirit, mana', 200, 'HybridSpiritMana'),
('HybridSpiritMana3', 'Envoy', 50, 40, '(27-30)% increased Spirit\n+(34-37) to maximum Mana', 'sceptre', 'spirit, mana', 400, 'HybridSpiritMana'),
('HybridSpiritMana4', 'Minister', 39, 31, '(23-26)% increased Spirit\n+(29-33) to maximum Mana', 'sceptre', 'spirit, mana', 600, 'HybridSpiritMana'),
('HybridSpiritMana5', 'Emissary', 28, 22, '(19-22)% increased Spirit\n+(25-28) to maximum Mana', 'sceptre', 'spirit, mana', 1000, 'HybridSpiritMana'),
('HybridSpiritMana6', 'Counselor', 12, 9, '(15-18)% increased Spirit\n+(21-24) to maximum Mana', 'sceptre', 'spirit, mana', 1000, 'HybridSpiritMana'),
('HybridSpiritMana7', 'Advisor', 3, 2, '(10-14)% increased Spirit\n+(17-20) to maximum Mana', 'sceptre', 'spirit, mana', 1000, 'HybridSpiritMana');

INSERT INTO suffixes (id, affix_name, ilvl, clvl, effect, item_tags, craft_tags, weighting, family) VALUES
-- //
-- Jewels
-- //

-- //
-- Ruby
-- //

-- //
-- Emerald
-- //

-- //
-- Sapphire
-- //

-- //
-- Weapons
-- //

-- //
-- One Hand
-- //

-- Melee Level
('MeleeSkillGemLevel1', 'War', 81, 64, '+5 to Level of all Melee Skills', 'one_hand_weapon', 'attack', 100, 'IncreaseGemLevel'),
('MeleeSkillGemLevel2', 'Battle', 55, 44, '+4 to Level of all Melee Skills', 'one_hand_weapon', 'attack', 250, 'IncreaseGemLevel'),
('MeleeSkillGemLevel3', 'Conflict', 36, 28, '+3 to Level of all Melee Skills', 'one_hand_weapon, amulet', 'attack', 500, 'IncreaseGemLevel'),
('MeleeSkillGemLevel4', 'Dueling', 18, 14, '+2 to Level of all Melee Skills', 'one_hand_weapon, amulet, gloves', 'attack', 750, 'IncreaseGemLevel'),
('MeleeSkillGemLevel5', 'Combat', 2, 1, '+1 to Level of all Melee Skills', 'one_hand_weapon, amulet, gloves', 'attack', 1000, 'IncreaseGemLevel'),

-- Spell Levels
('SpellSkillGemLevel1', 'Wizard', 78, 64, '+4 to Level of all Spell Skills', 'wand', 'caster,gem', 50, 'IncreaseGemLevel'),
('SpellSkillGemLevel2', 'Sorcerer', 55, 44, '+3 to Level of all Spell Skills', 'wand, amulet', 'caster,gem', 100, 'IncreaseGemLevel'),
('SpellSkillGemLevel3', 'Enchanter', 25, 20, '+2 to Level of all Spell Skills', 'wand, amulet', 'caster,gem', 150, 'IncreaseGemLevel'),
('SpellSkillGemLevel4', 'Mage', 5, 4, '+1 to Level of all Spell Skills', 'wand, amulet', 'caster,gem', 200, 'IncreaseGemLevel'),

('PhysicalSpellSkillGemLevel1', 'Grief', 81, 64, '+5 to Level of all Physical Spell Skills', 'wand', 'physical,caster,gem', 100, 'IncreaseGemLevel'),
('PhysicalSpellSkillGemLevel2', 'Desolation', 55, 44, '+4 to Level of all Physical Spell Skills', 'wand', 'physical,caster,gem', 250, 'IncreaseGemLevel'),
('PhysicalSpellSkillGemLevel3', 'Torment', 36, 28, '+3 to Level of all Physical Spell Skills', 'wand', 'physical,caster,gem', 500, 'IncreaseGemLevel'),
('PhysicalSpellSkillGemLevel4', 'Suffering', 18, 14, '+2 to Level of all Physical Spell Skills', 'wand', 'physical,caster,gem', 750, 'IncreaseGemLevel'),
('PhysicalSpellSkillGemLevel5', 'Agony', 2, 1, '+1 to Level of all Physical Spell Skills', 'wand', 'physical,caster,gem', 1000, 'IncreaseGemLevel'),

('FireSpellSkillGemLevel1', 'Inferno', 81, 64, '+5 to Level of all Fire Spell Skills', 'wand', 'elemental,fire,caster,gem', 100, 'IncreaseGemLevel'),
('FireSpellSkillGemLevel2', 'Immolation', 55, 44, '+4 to Level of all Fire Spell Skills', 'wand', 'elemental,fire,caster,gem', 250, 'IncreaseGemLevel'),
('FireSpellSkillGemLevel3', 'Flames', 36, 28, '+3 to Level of all Fire Spell Skills', 'wand', 'elemental,fire,caster,gem', 500, 'IncreaseGemLevel'),
('FireSpellSkillGemLevel4', 'Cinders', 18, 14, '+2 to Level of all Fire Spell Skills', 'wand', 'elemental,fire,caster,gem', 750, 'IncreaseGemLevel'),
('FireSpellSkillGemLevel5', 'Coals', 2, 1, '+1 to Level of all Fire Spell Skills', 'wand', 'elemental,fire,caster,gem', 1000, 'IncreaseGemLevel'),

('ColdSpellSkillGemLevel1', 'Frostbite', 81, 64, '+5 to Level of all Cold Spell Skills', 'wand', 'elemental,cold,caster,gem', 100, 'IncreaseGemLevel'),
('ColdSpellSkillGemLevel2', 'Rime', 55, 44, '+4 to Level of all Cold Spell Skills', 'wand', 'elemental,cold,caster,gem', 250, 'IncreaseGemLevel'),
('ColdSpellSkillGemLevel3', 'Ice', 36, 28, '+3 to Level of all Cold Spell Skills', 'wand', 'elemental,cold,caster,gem', 500, 'IncreaseGemLevel'),
('ColdSpellSkillGemLevel4', 'Sleet', 18, 14, '+2 to Level of all Cold Spell Skills', 'wand', 'elemental,cold,caster,gem', 750, 'IncreaseGemLevel'),
('ColdSpellSkillGemLevel5', 'Snow', 2, 1, '+1 to Level of all Cold Spell Skills', 'wand', 'elemental,cold,caster,gem', 1000, 'IncreaseGemLevel'),

('LightningSpellSkillGemLevel1', 'Thunder', 81, 64, '+5 to Level of all Lightning Spell Skills', 'wand', 'elemental,lightning,caster,gem', 100, 'IncreaseGemLevel'),
('LightningSpellSkillGemLevel2', 'Voltage', 55, 44, '+4 to Level of all Lightning Spell Skills', 'wand', 'elemental,lightning,caster,gem', 250, 'IncreaseGemLevel'),
('LightningSpellSkillGemLevel3', 'Electricity', 36, 28, '+3 to Level of all Lightning Spell Skills', 'wand', 'elemental,lightning,caster,gem', 500, 'IncreaseGemLevel'),
('LightningSpellSkillGemLevel4', 'Static', 18, 14, '+2 to Level of all Lightning Spell Skills', 'wand', 'elemental,lightning,caster,gem', 750, 'IncreaseGemLevel'),
('LightningSpellSkillGemLevel5', 'Sparks', 2, 1, '+1 to Level of all Lightning Spell Skills', 'wand', 'elemental,lightning,caster,gem', 1000, 'IncreaseGemLevel'),

('ChaosSpellSkillGemLevel1', 'Armageddon', 81, 64, '+5 to Level of all Chaos Spell Skills', 'wand', 'chaos,caster,gem', 100, 'IncreaseGemLevel'),
('ChaosSpellSkillGemLevel2', 'Havoc', 55, 44, '+4 to Level of all Chaos Spell Skills', 'wand', 'chaos,caster,gem', 250, 'IncreaseGemLevel'),
('ChaosSpellSkillGemLevel3', 'Ruin', 36, 28, '+3 to Level of all Chaos Spell Skills', 'wand', 'chaos,caster,gem', 500, 'IncreaseGemLevel'),
('ChaosSpellSkillGemLevel4', 'Turmoil', 18, 14, '+2 to Level of all Chaos Spell Skills', 'wand', 'chaos,caster,gem', 750, 'IncreaseGemLevel'),
('ChaosSpellSkillGemLevel5', 'Anarchy', 2, 1, '+1 to Level of all Chaos Spell Skills', 'wand', 'chaos,caster,gem', 1000, 'IncreaseGemLevel'),

-- Cast Speed
('CastSpeed1', 'Finesse', 80, 64, '(33-35)% increased Cast Speed', 'wand', 'caster,speed', 250, 'CastSpeed'),
('CastSpeed2', 'Prestidigitation', 70, 56, '(29-32)% increased Cast Speed', 'focus, wand', 'caster,speed', 500, 'CastSpeed'),
('CastSpeed3', 'Legerdemain', 60, 48, '(25-28)% increased Cast Speed', 'focus, wand, amulet', 'caster,speed', 1000, 'CastSpeed'),
('CastSpeed4', 'Sortilege', 45, 36, '(21-24)% increased Cast Speed', 'focus, wand, ring, amulet', 'caster,speed', 1000, 'CastSpeed'),
('CastSpeed5', 'Expertise', 30, 24, '(17-20)% increased Cast Speed', 'focus, wand, ring, amulet', 'caster,speed', 1000, 'CastSpeed'),
('CastSpeed6', 'Nimbleness', 15, 12, '(13-16)% increased Cast Speed', 'focus, wand, ring, amulet', 'caster,speed', 1000, 'CastSpeed'),
('CastSpeed7', 'Talent', 1, 1, '(9-12)% increased Cast Speed', 'focus, wand, ring, amulet', 'caster,speed', 1000, 'CastSpeed'),

-- //
-- Two Hand
-- //

-- Melee Level
('MeleeSkillGemLevelTwoHand1', 'War', 81, 64, '+7 to Level of all Melee Skills', 'two_hand_weapon', 'attack', 100, 'IncreaseGemLevel'),
('MeleeSkillGemLevelTwoHand2', 'Battle', 55, 44, '+(5-6) to Level of all Melee Skills', 'two_hand_weapon', 'attack', 250, 'IncreaseGemLevel'),
('MeleeSkillGemLevelTwoHand3', 'Conflict', 36, 28, '+4 to Level of all Melee Skills', 'two_hand_weapon', 'attack', 500, 'IncreaseGemLevel'),
('MeleeSkillGemLevelTwoHand4', 'Dueling', 18, 14, '+3 to Level of all Melee Skills', 'two_hand_weapon', 'attack', 750, 'IncreaseGemLevel'),
('MeleeSkillGemLevelTwoHand5', 'Combat', 2, 1, '+(1-2) to Level of all Melee Skills', 'two_hand_weapon', 'attack', 1000, 'IncreaseGemLevel'),

-- Spell Levels
('SpellSkillGemLevelStaff1', 'Sorcerer', 78, 64, '+(5-6) to Level of all Spell Skills', 'staff', 'caster, gem', 50, 'IncreaseGemLevel'),
('SpellSkillGemLevelStaff2', 'Evoker', 55, 44, '+4 to Level of all Spell Skills', 'staff', 'caster, gem', 100, 'IncreaseGemLevel'),
('SpellSkillGemLevelStaff3', 'Enchanter', 25, 20, '+3 to Level of all Spell Skills', 'staff', 'caster, gem', 150, 'IncreaseGemLevel'),
('SpellSkillGemLevelStaff4', 'Mage', 5, 4, '+(1-2) to Level of all Spell Skills', 'staff', 'caster, gem', 200, 'IncreaseGemLevel'),

('PhysicalSpellSkillGemLevelStaff1', 'Grief', 81, 64, '+7 to Level of all Physical Spell Skills', 'staff', 'physical, caster, gem', 100, 'IncreaseGemLevel'),
('PhysicalSpellSkillGemLevelStaff2', 'Desolation', 55, 44, '+(5-6) to Level of all Physical Spell Skills', 'staff', 'physical, caster, gem', 250, 'IncreaseGemLevel'),
('PhysicalSpellSkillGemLevelStaff3', 'Torment', 36, 28, '+4 to Level of all Physical Spell Skills', 'staff', 'physical, caster, gem', 500, 'IncreaseGemLevel'),
('PhysicalSpellSkillGemLevelStaff4', 'Suffering', 18, 14, '+3 to Level of all Physical Spell Skills', 'staff', 'physical, caster, gem', 750, 'IncreaseGemLevel'),
('PhysicalSpellSkillGemLevelStaff5', 'Agony', 2, 1, '+(1-2) to Level of all Physical Spell Skills', 'staff', 'physical, caster, gem', 1000, 'IncreaseGemLevel'),

('FireSpellSkillGemLevelStaff1', 'Inferno', 81, 64, '+7 to Level of all Fire Spell Skills', 'staff', 'elemental, fire, caster, gem', 100, 'IncreaseGemLevel'),
('FireSpellSkillGemLevelStaff2', 'Immolation', 55, 44, '+(5-6) to Level of all Fire Spell Skills', 'staff', 'elemental, fire, caster, gem', 250, 'IncreaseGemLevel'),
('FireSpellSkillGemLevelStaff3', 'Flames', 36, 28, '+4 to Level of all Fire Spell Skills', 'staff', 'elemental, fire, caster, gem', 500, 'IncreaseGemLevel'),
('FireSpellSkillGemLevelStaff4', 'Cinders', 18, 14, '+3 to Level of all Fire Spell Skills', 'staff', 'elemental, fire, caster, gem', 750, 'IncreaseGemLevel'),
('FireSpellSkillGemLevelStaff5', 'Coals', 2, 1, '+(1-2) to Level of all Fire Spell Skills', 'staff', 'elemental, fire, caster, gem', 1000, 'IncreaseGemLevel'),

('ColdSpellSkillGemLevelStaff1', 'Frostbite', 81, 64, '+7 to Level of all Cold Spell Skills', 'staff', 'elemental, cold, caster, gem', 100, 'IncreaseGemLevel'),
('ColdSpellSkillGemLevelStaff2', 'Rime', 55, 44, '+(5-6) to Level of all Cold Spell Skills', 'staff', 'elemental, cold, caster, gem', 250, 'IncreaseGemLevel'),
('ColdSpellSkillGemLevelStaff3', 'Ice', 36, 28, '+4 to Level of all Cold Spell Skills', 'staff', 'elemental, cold, caster, gem', 500, 'IncreaseGemLevel'),
('ColdSpellSkillGemLevelStaff4', 'Sleet', 18, 14, '+3 to Level of all Cold Spell Skills', 'staff', 'elemental, cold, caster, gem', 750, 'IncreaseGemLevel'),
('ColdSpellSkillGemLevelStaff5', 'Snow', 2, 1, '+(1-2) to Level of all Cold Spell Skills', 'staff', 'elemental, cold, caster, gem', 1000, 'IncreaseGemLevel'),

('LightningSpellSkillGemLevelStaff1', 'Thunder', 81, 64, '+7 to Level of all Lightning Spell Skills', 'staff', 'elemental, lightning, caster, gem', 100, 'IncreaseGemLevel'),
('LightningSpellSkillGemLevelStaff2', 'Voltage', 55, 44, '+(5-6) to Level of all Lightning Spell Skills', 'staff', 'elemental, lightning, caster, gem', 250, 'IncreaseGemLevel'),
('LightningSpellSkillGemLevelStaff3', 'Electricity', 36, 28, '+4 to Level of all Lightning Spell Skills', 'staff', 'elemental, lightning, caster, gem', 500, 'IncreaseGemLevel'),
('LightningSpellSkillGemLevelStaff4', 'Static', 18, 14, '+3 to Level of all Lightning Spell Skills', 'staff', 'elemental, lightning, caster, gem', 750, 'IncreaseGemLevel'),
('LightningSpellSkillGemLevelStaff5', 'Sparks', 2, 1, '+(1-2) to Level of all Lightning Spell Skills', 'staff', 'elemental, lightning, caster, gem', 1000, 'IncreaseGemLevel'),

('ChaosSpellSkillGemLevelStaff1', 'Armageddon', 81, 64, '+7 to Level of all Chaos Spell Skills', 'staff', 'chaos, caster, gem', 100, 'IncreaseGemLevel'),
('ChaosSpellSkillGemLevelStaff2', 'Havoc', 55, 44, '+(5-6) to Level of all Chaos Spell Skills', 'staff', 'chaos, caster, gem', 250, 'IncreaseGemLevel'),
('ChaosSpellSkillGemLevelStaff3', 'Ruin', 36, 28, '+4 to Level of all Chaos Spell Skills', 'staff', 'chaos, caster, gem', 500, 'IncreaseGemLevel'),
('ChaosSpellSkillGemLevelStaff4', 'Turmoil', 18, 14, '+3 to Level of all Chaos Spell Skills', 'staff', 'chaos, caster, gem', 750, 'IncreaseGemLevel'),
('ChaosSpellSkillGemLevelStaff5', 'Anarchy', 2, 1, '+(1-2) to Level of all Chaos Spell Skills', 'staff', 'chaos, caster, gem', 1000, 'IncreaseGemLevel'),

-- Cast Speed
('CastSpeedStaff1', 'Finesse', 80, 64, '(50-52)% increased Cast Speed', 'staff', 'caster, speed', 250, 'CastSpeed'),
('CastSpeedStaff2', 'Prestidigitation', 70, 56, '(44-49)% increased Cast Speed', 'staff', 'caster, speed', 500, 'CastSpeed'),
('CastSpeedStaff3', 'Legerdemain', 60, 48, '(38-43)% increased Cast Speed', 'staff', 'caster, speed', 1000, 'CastSpeed'),
('CastSpeedStaff4', 'Sortilege', 45, 36, '(32-37)% increased Cast Speed', 'staff', 'caster, speed', 1000, 'CastSpeed'),
('CastSpeedStaff5', 'Expertise', 30, 24, '(26-31)% increased Cast Speed', 'staff', 'caster, speed', 1000, 'CastSpeed'),
('CastSpeedStaff6', 'Nimbleness', 15, 12, '(20-25)% increased Cast Speed', 'staff', 'caster, speed', 1000, 'CastSpeed'),
('CastSpeedStaff7', 'Talent', 1, 1, '(14-19)% increased Cast Speed', 'staff', 'caster, speed', 1000, 'CastSpeed'),

-- //
-- Weapons Shared
-- //

-- Life Leech
('LifeLeech1', 'Vampire', 81, 64, 'Leeches (9-9.9)% of Physical Damage as Life', 'weapon', 'life, physical, attack', 1000, 'LifeLeech'),
('LifeLeech2', 'Lamprey', 68, 54, 'Leeches (8-8.9)% of Physical Damage as Life', 'weapon', 'life, physical, attack', 1000, 'LifeLeech'),
('LifeLeech3', 'Remora', 54, 43, 'Leeches (7-7.9)% of Physical Damage as Life', 'weapon', 'life, physical, attack', 1000, 'LifeLeech'),
('LifeLeech4', 'Locust', 38, 30, 'Leeches (6-6.9)% of Physical Damage as Life', 'weapon', 'life, physical, attack', 1000, 'LifeLeech'),
('LifeLeech5', 'Parasite', 21, 16, 'Leeches (5-5.9)% of Physical Damage as Life', 'weapon', 'life, physical, attack', 1000, 'LifeLeech'),

-- Mana Leech
('ManaLeech1', 'Desperate', 81, 64, 'Leeches (8-8.9)% of Physical Damage as Mana', 'weapon', 'mana, physical, attack', 1000, 'ManaLeech'),
('ManaLeech2', 'Drought', 68, 54, 'Leeches (7-7.9)% of Physical Damage as Mana', 'weapon', 'mana, physical, attack', 1000, 'ManaLeech'),
('ManaLeech3', 'Arid', 54, 43, 'Leeches (6-6.9)% of Physical Damage as Mana', 'weapon', 'mana, physical, attack', 1000, 'ManaLeech'),
('ManaLeech4', 'Parched', 38, 30, 'Leeches (5-5.9)% of Physical Damage as Mana', 'weapon', 'mana, physical, attack', 1000, 'ManaLeech'),
('ManaLeech5', 'Thirsty', 21, 16, 'Leeches (4-4.9)% of Physical Damage as Mana', 'weapon', 'mana, physical, attack', 1000, 'ManaLeech'),

-- Life on Hit
('LifeOnHit1', 'Nourishment', 40, 32, 'Grants 5 Life per Enemy Hit', 'weapon', 'life,attack', 1000, 'LifeOnHit'),
('LifeOnHit2', 'Regrowth', 30, 24, 'Grants 4 Life per Enemy Hit', 'weapon', 'life,attack', 1000, 'LifeOnHit'),
('LifeOnHit3', 'Restoration', 20, 16, 'Grants 3 Life per Enemy Hit', 'weapon', 'life,attack', 1000, 'LifeOnHit'),
('LifeOnHit4', 'Rejuvenation', 8, 6, 'Grants 2 Life per Enemy Hit', 'weapon', 'life,attack', 1000, 'LifeOnHit'),

-- Attack Speed
('IncreasedAttackSpeed1', 'Celebration', 77, 61, '(26-28)% increased Attack Speed', 'weapon', 'attack, speed', 100, 'IncreasedAttackSpeed'),
('IncreasedAttackSpeed2', 'Infamy', 60, 48, '(23-25)% increased Attack Speed', 'weapon', 'attack, speed', 200, 'IncreasedAttackSpeed'),
('IncreasedAttackSpeed3', 'Fame', 45, 36, '(20-22)% increased Attack Speed', 'weapon', 'attack, speed', 500, 'IncreasedAttackSpeed'),
('IncreasedAttackSpeed4', 'Acclaim', 37, 29, '(17-19)% increased Attack Speed', 'weapon', 'attack, speed', 500, 'IncreasedAttackSpeed'),
('IncreasedAttackSpeed5', 'Renown', 30, 24, '(14-16)% increased Attack Speed', 'weapon, gloves, quiver', 'attack, speed', 1000, 'IncreasedAttackSpeed'),
('IncreasedAttackSpeed6', 'Mastery', 22, 17, '(11-13)% increased Attack Speed', 'weapon, gloves, quiver', 'attack, speed', 1000, 'IncreasedAttackSpeed'),
('IncreasedAttackSpeed7', 'Ease', 11, 8, '(8-10)% increased Attack Speed', 'weapon, gloves, quiver', 'attack, speed', 1000, 'IncreasedAttackSpeed'),
('IncreasedAttackSpeed8', 'Skill', 1, 1, '(5-7)% increased Attack Speed', 'weapon, gloves, quiver', 'attack, speed', 1000, 'IncreasedAttackSpeed'),

-- Crit Chance
('CriticalStrikeChance1', 'Unmaking', 73, 58, '+(4.41-5)% to Critical Hit Chance', 'weapon', 'attack,critical', 125, 'CriticalStrikeChance'),
('CriticalStrikeChance2', 'Ruin', 59, 47, '+(3.81-4.4)% to Critical Hit Chance', 'weapon', 'attack,critical', 250, 'CriticalStrikeChance'),
('CriticalStrikeChance3', 'Calamity', 44, 35, '+(3.11-3.8)% to Critical Hit Chance', 'weapon', 'attack,critical', 500, 'CriticalStrikeChance'),
('CriticalStrikeChance4', 'Disaster', 30, 24, '+(2.11-2.7)% to Critical Hit Chance', 'weapon', 'attack,critical', 1000, 'CriticalStrikeChance'),
('CriticalStrikeChance5', 'Havoc', 20, 16, '+(1.51-2.1)% to Critical Hit Chance', 'weapon', 'attack,critical', 1000, 'CriticalStrikeChance'),
('CriticalStrikeChance6', 'Menace', 1, 1, '+(1.01-1.5)% to Critical Hit Chance', 'weapon', 'attack,critical', 1000, 'CriticalStrikeChance'),

-- Crit Multi
('CriticalStrikeMultiplier1', 'Destruction', 73, 58, '+(35-39)% to Critical Damage Bonus', 'weapon', 'damage,attack,critical', 125, 'CriticalStrikeMultiplier'),
('CriticalStrikeMultiplier2', 'Ferocity', 59, 47, '+(30-34)% to Critical Damage Bonus', 'weapon', 'damage,attack,critical', 250, 'CriticalStrikeMultiplier'),
('CriticalStrikeMultiplier3', 'Fury', 44, 35, '+(25-29)% to Critical Damage Bonus', 'weapon', 'damage,attack,critical', 500, 'CriticalStrikeMultiplier'),
('CriticalStrikeMultiplier4', 'Rage', 30, 24, '+(20-24)% to Critical Damage Bonus', 'weapon', 'damage,attack,critical', 1000, 'CriticalStrikeMultiplier'),
('CriticalStrikeMultiplier5', 'Anger', 21, 16, '+(15-19)% to Critical Damage Bonus', 'weapon', 'damage,attack,critical', 1000, 'CriticalStrikeMultiplier'),
('CriticalStrikeMultiplier6', 'Ire', 8, 6, '+(10-14)% to Critical Damage Bonus', 'weapon', 'damage,attack,critical', 1000, 'CriticalStrikeMultiplier'),

-- Light Radius
('LightRadiusAndAccuracy1', 'Radiance', 30, 24, '+(41-60) to Accuracy Rating\n15% increased Light Radius', 'weapon, ring, amulet, helmet', 'attack', 1000, 'LightRadiusAndAccuracy'),
('LightRadiusAndAccuracy2', 'Light', 15, 12, '+(21-40) to Accuracy Rating\n10% increased Light Radius', 'weapon, ring, amulet, helmet', 'attack', 1000, 'LightRadiusAndAccuracy'),
('LightRadiusAndAccuracy3', 'Shining', 8, 6, '+(10-20) to Accuracy Rating\n5% increased Light Radius', 'weapon, ring, amulet, helmet', 'attack', 1000, 'LightRadiusAndAccuracy'),

-- Stun Duration
('StunDuration1', 'Concussion', 71, 56, '(27-30)% increased Stun Duration', 'weapon', '', 1000, 'StunDuration'),
('StunDuration2', 'Staggering', 58, 46, '(23-26)% increased Stun Duration', 'weapon', '', 1000, 'StunDuration'),
('StunDuration3', 'Slamming', 44, 35, '(20-22)% increased Stun Duration', 'weapon', '', 1000, 'StunDuration'),
('StunDuration4', 'Stunning', 30, 24, '(17-19)% increased Stun Duration', 'weapon', '', 1000, 'StunDuration'),
('StunDuration5', 'Dazing', 18, 14, '(14-16)% increased Stun Duration', 'weapon', '', 1000, 'StunDuration'),
('StunDuration6', 'Impact', 5, 4, '(11-13)% increased Stun Duration', 'weapon', '', 1000, 'StunDuration'),

-- Stun Buildup
('StunBuildup1', 'Champion', 74, 59, 'Causes (71-80)% increased Stun Buildup', 'weapon', '', 1000, 'StunBuildup'),
('StunBuildup2', 'Gladiator', 58, 46, 'Causes (61-70)% increased Stun Buildup', 'weapon', '', 1000, 'StunBuildup'),
('StunBuildup3', 'Combatant', 44, 35, 'Causes (51-60)% increased Stun Buildup', 'weapon', '', 1000, 'StunBuildup'),
('StunBuildup4', 'Boxer', 30, 24, 'Causes (41-50)% increased Stun Buildup', 'weapon', '', 1000, 'StunBuildup'),
('StunBuildup5', 'Brawler', 20, 16, 'Causes (31-40)% increased Stun Buildup', 'weapon', '', 1000, 'StunBuildup'),
('StunBuildup6', 'Pugilist', 5, 4, 'Causes (21-30)% increased Stun Buildup', 'weapon', '', 1000, 'StunBuildup'),

-- Spell Crit
('SpellCriticalStrikeChance1', 'Unmaking', 76, 60, '(100-109)% increased Critical Hit Chance for Spells', 'wand, staff', 'caster,critical', 125, 'SpellCriticalStrikeChance'),
('SpellCriticalStrikeChance2', 'Ruin', 59, 47, '(80-99)% increased Critical Hit Chance for Spells', 'wand, focus, staff', 'caster,critical', 250, 'SpellCriticalStrikeChance'),
('SpellCriticalStrikeChance3', 'Calamity', 41, 32, '(60-79)% increased Critical Hit Chance for Spells', 'wand, focus, staff', 'caster,critical', 500, 'SpellCriticalStrikeChance'),
('SpellCriticalStrikeChance4', 'Disaster', 28, 22, '(40-59)% increased Critical Hit Chance for Spells', 'wand, focus, staff', 'caster,critical', 1000, 'SpellCriticalStrikeChance'),
('SpellCriticalStrikeChance5', 'Havoc', 21, 16, '(20-39)% increased Critical Hit Chance for Spells', 'wand, focus, staff', 'caster,critical', 1000, 'SpellCriticalStrikeChance'),
('SpellCriticalStrikeChance6', 'Menace', 11, 8, '(10-19)% increased Critical Hit Chance for Spells', 'wand, focus, staff', 'caster,critical', 1000, 'SpellCriticalStrikeChance'),

-- Spell Crit Multi
('SpellCriticalStrikeMultiplier1', 'Destruction', 73, 58, '+(35-39)% to Critical Spell Damage Bonus', 'wand, staff', 'caster,critical', 125, 'SpellCriticalStrikeMultiplier'),
('SpellCriticalStrikeMultiplier2', 'Ferocity', 59, 47, '+(30-34)% to Critical Spell Damage Bonus', 'wand, focus, staff', 'caster,critical', 250, 'SpellCriticalStrikeMultiplier'),
('SpellCriticalStrikeMultiplier3', 'Fury', 44, 35, '+(25-29)% to Critical Spell Damage Bonus', 'wand, focus, staff', 'caster,critical', 500, 'SpellCriticalStrikeMultiplier'),
('SpellCriticalStrikeMultiplier4', 'Rage', 30, 24, '+(20-24)% to Critical Spell Damage Bonus', 'wand, focus, staff', 'caster,critical', 1000, 'SpellCriticalStrikeMultiplier'),
('SpellCriticalStrikeMultiplier5', 'Anger', 21, 16, '+(15-19)% to Critical Spell Damage Bonus', 'wand, focus, staff', 'caster,critical', 1000, 'SpellCriticalStrikeMultiplier'),
('SpellCriticalStrikeMultiplier6', 'Ire', 8, 6, '+(10-14)% to Critical Spell Damage Bonus', 'wand, focus, staff', 'caster,critical', 1000, 'SpellCriticalStrikeMultiplier'),

-- Mana Light Radius
('ManaLightRadius1', 'Hearth', 30, 24, '(18-22)% increased Mana Regeneration Rate\n15% increased Light Radius', 'wand, staff, sceptre, ring', 'mana', 1000, 'ManaLightRadius'),
('ManaLightRadius2', 'Kindling', 15, 12, '(13-17)% increased Mana Regeneration Rate\n10% increased Light Radius', 'wand, staff, sceptre, ring', 'mana', 1000, 'ManaLightRadius'),
('ManaLightRadius3', 'Warmth', 8, 6, '(8-12)% increased Mana Regeneration Rate\n5% increased Light Radius', 'wand, staff, sceptre, ring', 'mana', 1000, 'ManaLightRadius'),

-- Ignite Chance
('IgniteChance1', 'Conflagration', 75, 60, '(91-100)% increased chance to Ignite', 'wand, staff', 'elemental,fire', 500, 'IgniteChance'),
('IgniteChance2', 'Combustion', 60, 48, '(81-90)% increased chance to Ignite', 'wand, staff', 'elemental,fire', 500, 'IgniteChance'),
('IgniteChance3', 'Incineration', 45, 36, '(71-80)% increased chance to Ignite', 'wand, staff', 'elemental,fire', 1000, 'IgniteChance'),
('IgniteChance4', 'Scorching', 30, 24, '(61-70)% increased chance to Ignite', 'wand, staff', 'elemental,fire', 1000, 'IgniteChance'),
('IgniteChance5', 'Ignition', 15, 12, '(51-60)% increased chance to Ignite', 'wand, staff', 'elemental,fire', 1000, 'IgniteChance'),

-- Freeze Buildup
('FreezeBuildup1', 'Arctic', 75, 60, '(71-80)% increased Freeze Buildup', 'wand, staff', 'elemental,cold', 500, 'FreezeBuildup'),
('FreezeBuildup2', 'Hyperboreal', 60, 48, '(61-70)% increased Freeze Buildup', 'wand, staff', 'elemental,cold', 500, 'FreezeBuildup'),
('FreezeBuildup3', 'Glacier', 45, 36, '(51-60)% increased Freeze Buildup', 'wand, staff', 'elemental,cold', 1000, 'FreezeBuildup'),
('FreezeBuildup4', 'Bleakness', 30, 24, '(41-50)% increased Freeze Buildup', 'wand, staff', 'elemental,cold', 1000, 'FreezeBuildup'),
('FreezeBuildup5', 'Freezing', 15, 12, '(31-40)% increased Freeze Buildup', 'wand, staff', 'elemental,cold', 1000, 'FreezeBuildup'),

-- Shock Chance
('ShockChance1', 'Thunderbolt', 75, 60, '(91-100)% increased chance to Shock', 'wand, staff', 'elemental,lightning', 500, 'ShockChance'),
('ShockChance2', 'Voltages', 60, 48, '(81-90)% increased chance to Shock', 'wand, staff', 'elemental,lightning', 500, 'ShockChance'),
('ShockChance3', 'Electrocution', 45, 36, '(71-80)% increased chance to Shock', 'wand, staff', 'elemental,lightning', 1000, 'ShockChance'),
('ShockChance4', 'Zapping', 30, 24, '(61-70)% increased chance to Shock', 'wand, staff', 'elemental,lightning', 1000, 'ShockChance'),
('ShockChance5', 'Shocking', 15, 12, '(51-60)% increased chance to Shock', 'wand, staff', 'elemental,lightning', 1000, 'ShockChance'),

-- //
-- Armour
-- //

-- Stun Threshold
('StunThreshold1', 'Obsidian Skin', 72, 57, '+(254-304) to Stun Threshold', 'body_armour, boots, shield, belt', '', 800, 'StunThreshold'),
('StunThreshold2', 'Corundum Skin', 63, 50, '+(207-253) to Stun Threshold', 'body_armour, boots, shield, belt', '', 800, 'StunThreshold'),
('StunThreshold3', 'Adamantite Skin', 54, 43, '+(164-206) to Stun Threshold', 'body_armour, boots, shield, belt', '', 800, 'StunThreshold'),
('StunThreshold4', 'Platinum Skin', 45, 36, '+(125-163) to Stun Threshold', 'body_armour, boots, shield, belt', '', 800, 'StunThreshold'),
('StunThreshold5', 'Granite Skin', 36, 28, '+(98-124) to Stun Threshold', 'body_armour, boots, shield, belt', '', 800, 'StunThreshold'),
('StunThreshold6', 'Steel Skin', 29, 23, '+(73-97) to Stun Threshold', 'body_armour, boots, shield, belt', '', 800, 'StunThreshold'),
('StunThreshold7', 'Iron Skin', 22, 17, '+(50-72) to Stun Threshold', 'body_armour, boots, shield, belt', '', 800, 'StunThreshold'),
('StunThreshold8', 'Stone Skin', 15, 12, '+(30-49) to Stun Threshold', 'body_armour, boots, shield, belt', '', 800, 'StunThreshold'),
('StunThreshold9', 'Reinforced Skin', 8, 6, '+(12-29) to Stun Threshold', 'body_armour, boots, shield, belt', '', 800, 'StunThreshold'),
('StunThreshold10', 'Thick Skin', 1, 1, '+(6-11) to Stun Threshold', 'body_armour, boots, shield, belt', '', 800, 'StunThreshold'),

-- Life Regen
('LifeRegeneration1', 'Phoenix', 81, 64, '(33.1-36) Life Regeneration per second', 'body_armour', 'life', 1000, 'LifeRegeneration'),
('LifeRegeneration2', 'Immortality', 75, 60, '(29.1-33) Life Regeneration per second', 'body_armour, amulet', 'life', 1000, 'LifeRegeneration'),
('LifeRegeneration3', 'Resurgence', 68, 54, '(23.1-29) Life Regeneration per second', 'body_armour, belt, amulet', 'life', 1000, 'LifeRegeneration'),
('LifeRegeneration4', 'Recuperation', 58, 46, '(18.1-23) Life Regeneration per second', 'body_armour, helmet, boots, belt, amulet', 'life', 1000, 'LifeRegeneration'),
('LifeRegeneration5', 'Convalescence', 47, 37, '(13.1-18) Life Regeneration per second', 'body_armour, helmet, boots, belt, amulet, ring', 'life', 1000, 'LifeRegeneration'),
('LifeRegeneration6', 'Troll', 35, 28, '(9.1-13) Life Regeneration per second', 'body_armour, helmet, boots, belt, amulet, ring', 'life', 1000, 'LifeRegeneration'),
('LifeRegeneration7', 'Hydra', 26, 20, '(6.1-9) Life Regeneration per second', 'body_armour, helmet, boots, belt, amulet, ring', 'life', 1000, 'LifeRegeneration'),
('LifeRegeneration8', 'Starfish', 17, 13, '(4.1-6) Life Regeneration per second', 'body_armour, helmet, boots, belt, amulet, ring', 'life', 1000, 'LifeRegeneration'),
('LifeRegeneration9', 'Flatworm', 11, 8, '(3.1-4) Life Regeneration per second', 'body_armour, helmet, boots, belt, amulet, ring', 'life', 1000, 'LifeRegeneration'),
('LifeRegeneration10', 'Lizard', 5, 4, '(2.1-3) Life Regeneration per second', 'body_armour, helmet, boots, belt, amulet, ring', 'life', 1000, 'LifeRegeneration'),
('LifeRegeneration11', 'Newt', 1, 1, '(1-2) Life Regeneration per second', 'body_armour, helmet, boots, belt, amulet, ring', 'life', 1000, 'LifeRegeneration'),

-- Damaging Ailment Duration

-- Bleeding Duration
('BleedingDuration1', 'Staunching', 76, 60, '(56-60)% reduced Bleeding Duration on you', 'body_armour', 'bleed,physical,ailment', 500, 'ReducedAilmentDuration'),
('BleedingDuration2', 'Assuaging', 64, 51, '(51-55)% reduced Bleeding Duration on you', 'body_armour', 'bleed,physical,ailment', 500, 'ReducedAilmentDuration'),
('BleedingDuration3', 'Allaying', 50, 40, '(46-50)% reduced Bleeding Duration on you', 'body_armour', 'bleed,physical,ailment', 500, 'ReducedAilmentDuration'),
('BleedingDuration4', 'Alleviation', 37, 29, '(41-45)% reduced Bleeding Duration on you', 'body_armour', 'bleed,physical,ailment', 500, 'ReducedAilmentDuration'),
('BleedingDuration5', 'Sealing', 21, 16, '(36-40)% reduced Bleeding Duration on you', 'body_armour', 'bleed,physical,ailment', 500, 'ReducedAilmentDuration'),

-- Poison Duration
('PoisonDuration1', 'Antidote', 76, 60, '(56-60)% reduced Poison Duration on you', 'body_armour', 'poison,chaos,ailment', 500, 'ReducedAilmentDuration'),
('PoisonDuration2', 'Panacea', 64, 51, '(51-55)% reduced Poison Duration on you', 'body_armour', 'poison,chaos,ailment', 500, 'ReducedAilmentDuration'),
('PoisonDuration3', 'Cure', 50, 40, '(46-50)% reduced Poison Duration on you', 'body_armour', 'poison,chaos,ailment', 500, 'ReducedAilmentDuration'),
('PoisonDuration4', 'Remedy', 37, 29, '(41-45)% reduced Poison Duration on you', 'body_armour', 'poison,chaos,ailment', 500, 'ReducedAilmentDuration'),
('PoisonDuration5', 'Antitoxin', 21, 16, '(36-40)% reduced Poison Duration on you', 'body_armour', 'poison,chaos,ailment', 500, 'ReducedAilmentDuration'),

-- Ignite Duration
('IgniteDuration1', 'Dousing', 76, 60, '(56-60)% reduced Ignite Duration on you', 'body_armour', 'elemental,fire,ailment', 500, 'ReducedAilmentDuration'),
('IgniteDuration2', 'Quenching', 64, 51, '(51-55)% reduced Ignite Duration on you', 'body_armour', 'elemental,fire,ailment', 500, 'ReducedAilmentDuration'),
('IgniteDuration3', 'Quelling', 50, 40, '(46-50)% reduced Ignite Duration on you', 'body_armour', 'elemental,fire,ailment', 500, 'ReducedAilmentDuration'),
('IgniteDuration4', 'Quashing', 37, 29, '(41-45)% reduced Ignite Duration on you', 'body_armour', 'elemental,fire,ailment', 500, 'ReducedAilmentDuration'),
('IgniteDuration5', 'Damping', 21, 16, '(36-40)% reduced Ignite Duration on you', 'body_armour', 'elemental,fire,ailment', 500, 'ReducedAilmentDuration'),

-- //
-- Global Shared
-- //

-- All Attributes
('AllAttributes1', 'Infinite', 82, 65, '+(23-24) to all Attributes', 'amulet', 'attribute', 800, 'AllAttributes'),
('AllAttributes2', 'Multiverse', 75, 60, '+(21-22) to all Attributes', 'amulet', 'attribute', 800, 'AllAttributes'),
('AllAttributes3', 'Universe', 66, 52, '+(19-20) to all Attributes', 'amulet', 'attribute', 800, 'AllAttributes'),
('AllAttributes4', 'Galaxy', 55, 44, '+(17-18) to all Attributes', 'amulet', 'attribute', 800, 'AllAttributes'),
('AllAttributes5', 'Heavens', 44, 35, '+(14-16) to all Attributes', 'amulet', 'attribute', 800, 'AllAttributes'),
('AllAttributes6', 'Comet', 33, 26, '+(11-13) to all Attributes', 'amulet, ring', 'attribute', 800, 'AllAttributes'),
('AllAttributes7', 'Meteor', 22, 17, '+(8-10) to all Attributes', 'amulet, ring', 'attribute', 800, 'AllAttributes'),
('AllAttributes8', 'Sky', 11, 8, '+(5-7) to all Attributes', 'amulet, ring', 'attribute', 800, 'AllAttributes'),
('AllAttributes9', 'Clouds', 1, 1, '+(2-4) to all Attributes', 'amulet, ring', 'attribute', 800, 'AllAttributes'),

-- Str
('Strength1', 'Titan', 74, 59, '+(31-33) to Strength', 'ring, amulet, belt, str_armour, str_dex_armour, str_int_armour, mace, sword, axe, spear, flail, crossbow, sceptre', 'attribute', 1000, 'Strength'),
('Strength2', 'Leviathan', 66, 52, '+(28-30) to Strength', 'ring, amulet, belt, str_armour, str_dex_armour, str_int_armour, mace, sword, axe, spear, flail, crossbow, sceptre', 'attribute', 1000, 'Strength'),
('Strength3', 'Goliath', 55, 44, '+(25-27) to Strength', 'ring, amulet, belt, str_armour, str_dex_armour, str_int_armour, mace, sword, axe, spear, flail, crossbow, sceptre', 'attribute', 1000, 'Strength'),
('Strength4', 'Gorilla', 44, 35, '+(21-24) to Strength', 'ring, amulet, belt, str_armour, str_dex_armour, str_int_armour, mace, sword, axe, spear, flail, crossbow, sceptre', 'attribute', 1000, 'Strength'),
('Strength5', 'Lion', 33, 26, '+(17-20) to Strength', 'ring, amulet, belt, str_armour, str_dex_armour, str_int_armour, mace, sword, axe, spear, flail, crossbow, sceptre', 'attribute', 1000, 'Strength'),
('Strength6', 'Bear', 22, 17, '+(13-16) to Strength', 'ring, amulet, belt, str_armour, str_dex_armour, str_int_armour, mace, sword, axe, spear, flail, crossbow, sceptre', 'attribute', 1000, 'Strength'),
('Strength7', 'Wrestler', 11, 8, '+(9-12) to Strength', 'ring, amulet, belt, str_armour, str_dex_armour, str_int_armour, mace, sword, axe, spear, flail, crossbow, sceptre', 'attribute', 1000, 'Strength'),
('Strength8', 'Brute', 1, 1, '+(5-8) to Strength', 'ring, amulet, belt, str_armour, str_dex_armour, str_int_armour, mace, sword, axe, spear, flail, crossbow, sceptre', 'attribute', 1000, 'Strength'),

-- Dex
('Dexterity1', 'Phantom', 74, 59, '+(31-33) to Dexterity', 'ring, amulet, gloves, quiver, dex_armour, dex_int_armour, str_dex_armour, sword, spear, claw, quarterstaff, dagger, bow, crossbow', 'attribute', 500, 'Dexterity'),
('Dexterity2', 'Jaguar', 66, 52, '+(28-30) to Dexterity', 'ring, amulet, gloves, quiver, dex_armour, dex_int_armour, str_dex_armour, sword, spear, claw, quarterstaff, dagger, bow, crossbow', 'attribute', 500, 'Dexterity'),
('Dexterity3', 'Leopard', 55, 44, '+(25-27) to Dexterity', 'ring, amulet, gloves, quiver, dex_armour, dex_int_armour, str_dex_armour, sword, spear, claw, quarterstaff, dagger, bow, crossbow', 'attribute', 500, 'Dexterity'),
('Dexterity4', 'Panther', 44, 35, '+(21-24) to Dexterity', 'ring, amulet, gloves, quiver, dex_armour, dex_int_armour, str_dex_armour, sword, spear, claw, quarterstaff, dagger, bow, crossbow', 'attribute', 500, 'Dexterity'),
('Dexterity5', 'Falcon', 33, 26, '+(17-20) to Dexterity', 'ring, amulet, gloves, quiver, dex_armour, dex_int_armour, str_dex_armour, sword, spear, claw, quarterstaff, dagger, bow, crossbow', 'attribute', 500, 'Dexterity'),
('Dexterity6', 'Fox', 22, 17, '+(13-16) to Dexterity', 'ring, amulet, gloves, quiver, dex_armour, dex_int_armour, str_dex_armour, sword, spear, claw, quarterstaff, dagger, bow, crossbow', 'attribute', 500, 'Dexterity'),
('Dexterity7', 'Lynx', 11, 8, '+(9-12) to Dexterity', 'ring, amulet, gloves, quiver, dex_armour, dex_int_armour, str_dex_armour, sword, spear, claw, quarterstaff, dagger, bow, crossbow', 'attribute', 500, 'Dexterity'),
('Dexterity8', 'Mongoose', 1, 1, '+(5-8) to Dexterity', 'ring, amulet, gloves, quiver, dex_armour, dex_int_armour, str_dex_armour, sword, spear, claw, quarterstaff, dagger, bow, crossbow', 'attribute', 500, 'Dexterity'),

-- Int
('Intelligence1', 'Virtuoso', 74, 59, '+(31-33) to Intelligence', 'ring, amulet, helmet, int_armour, str_int_armour, dex_int_armour, dagger, quarterstaff, flail, wand, staff, sceptre', 'attribute', 1000, 'Intelligence'),
('Intelligence2', 'Savant', 66, 52, '+(28-30) to Intelligence', 'ring, amulet, helmet, int_armour, str_int_armour, dex_int_armour, dagger, quarterstaff, flail, wand, staff, sceptre', 'attribute', 1000, 'Intelligence'),
('Intelligence3', 'Sage', 55, 44, '+(25-27) to Intelligence', 'ring, amulet, helmet, int_armour, str_int_armour, dex_int_armour, dagger, quarterstaff, flail, wand, staff, sceptre', 'attribute', 1000, 'Intelligence'),
('Intelligence4', 'Philosopher', 44, 35, '+(21-24) to Intelligence', 'ring, amulet, helmet, int_armour, str_int_armour, dex_int_armour, dagger, quarterstaff, flail, wand, staff, sceptre', 'attribute', 1000, 'Intelligence'),
('Intelligence5', 'Augur', 33, 26, '+(17-20) to Intelligence', 'ring, amulet, helmet, int_armour, str_int_armour, dex_int_armour, dagger, quarterstaff, flail, wand, staff, sceptre', 'attribute', 1000, 'Intelligence'),
('Intelligence6', 'Prodigy', 22, 17, '+(13-16) to Intelligence', 'ring, amulet, helmet, int_armour, str_int_armour, dex_int_armour, dagger, quarterstaff, flail, wand, staff, sceptre', 'attribute', 1000, 'Intelligence'),
('Intelligence7', 'Student', 11, 8, '+(9-12) to Intelligence', 'ring, amulet, helmet, int_armour, str_int_armour, dex_int_armour, dagger, quarterstaff, flail, wand, staff, sceptre', 'attribute', 1000, 'Intelligence'),
('Intelligence8', 'Pupil', 1, 1, '+(5-8) to Intelligence', 'ring, amulet, helmet, int_armour, str_int_armour, dex_int_armour, dagger, quarterstaff, flail, wand, staff, sceptre', 'attribute', 1000, 'Intelligence'),

-- All Elemental Resistances
('AllElementalResistances1', 'Span', 80, 64, '+(17-18)% to all Elemental Resistances', 'str_int_shield, amulet', 'elemental,fire,cold,lightning,resistance', 800, 'AllElementalResistances'),
('AllElementalResistances2', 'Rainbow', 68, 54, '+(15-16)% to all Elemental Resistances', 'str_int_shield, amulet, ring', 'elemental,fire,cold,lightning,resistance', 800, 'AllElementalResistances'),
('AllElementalResistances3', 'Variegation', 54, 43, '+(12-14)% to all Elemental Resistances', 'str_int_shield, amulet, ring', 'elemental,fire,cold,lightning,resistance', 800, 'AllElementalResistances'),
('AllElementalResistances4', 'Kaleidoscope', 40, 32, '+(9-11)% to all Elemental Resistances', 'str_int_shield, amulet, ring', 'elemental,fire,cold,lightning,resistance', 800, 'AllElementalResistances'),
('AllElementalResistances5', 'Prism', 26, 20, '+(6-8)% to all Elemental Resistances', 'str_int_shield, amulet, ring', 'elemental,fire,cold,lightning,resistance', 800, 'AllElementalResistances'),
('AllElementalResistances6', 'Crystal', 12, 9, '+(3-5)% to all Elemental Resistances', 'str_int_shield, amulet, ring', 'elemental,fire,cold,lightning,resistance', 800, 'AllElementalResistances'),

-- Fire Resistance
('FireResistance1', 'Tzteosh', 82, 65, '+(41-45)% to Fire Resistance', 'armour, ring, amulet, belt', 'elemental,fire,resistance', 1000, 'FireResistance'),
('FireResistance2', 'Magma', 71, 56, '+(36-40)% to Fire Resistance', 'armour, ring, amulet, belt', 'elemental,fire,resistance', 1000, 'FireResistance'),
('FireResistance3', 'Volcano', 60, 48, '+(31-35)% to Fire Resistance', 'armour, ring, amulet, belt', 'elemental,fire,resistance', 1000, 'FireResistance'),
('FireResistance4', 'Furnace', 48, 38, '+(26-30)% to Fire Resistance', 'armour, ring, amulet, belt', 'elemental,fire,resistance', 1000, 'FireResistance'),
('FireResistance5', 'Kiln', 36, 28, '+(21-25)% to Fire Resistance', 'armour, ring, amulet, belt', 'elemental,fire,resistance', 1000, 'FireResistance'),
('FireResistance6', 'Drake', 24, 19, '+(16-20)% to Fire Resistance', 'armour, ring, amulet, belt', 'elemental,fire,resistance', 1000, 'FireResistance'),
('FireResistance7', 'Salamander', 12, 9, '+(11-15)% to Fire Resistance', 'armour, ring, amulet, belt', 'elemental,fire,resistance', 1000, 'FireResistance'),
('FireResistance8', 'Whelpling', 1, 1, '+(6-10)% to Fire Resistance', 'armour, ring, amulet, belt', 'elemental,fire,resistance', 1000, 'FireResistance'),

-- Cold Resistance
('ColdResistance1', 'Haast', 82, 65, '+(41-45)% to Cold Resistance', 'armour, ring, amulet, belt', 'elemental,cold,resistance', 1000, 'ColdResistance'),
('ColdResistance2', 'Ice', 71, 56, '+(36-40)% to Cold Resistance', 'armour, ring, amulet, belt', 'elemental,cold,resistance', 1000, 'ColdResistance'),
('ColdResistance3', 'Polar Bear', 60, 48, '+(31-35)% to Cold Resistance', 'armour, ring, amulet, belt', 'elemental,cold,resistance', 1000, 'ColdResistance'),
('ColdResistance4', 'Walrus', 50, 40, '+(26-30)% to Cold Resistance', 'armour, ring, amulet, belt', 'elemental,cold,resistance', 1000, 'ColdResistance'),
('ColdResistance5', 'Yeti', 38, 30, '+(21-25)% to Cold Resistance', 'armour, ring, amulet, belt', 'elemental,cold,resistance', 1000, 'ColdResistance'),
('ColdResistance6', 'Narwhal', 26, 20, '+(16-20)% to Cold Resistance', 'armour, ring, amulet, belt', 'elemental,cold,resistance', 1000, 'ColdResistance'),
('ColdResistance7', 'Penguin', 14, 11, '+(11-15)% to Cold Resistance', 'armour, ring, amulet, belt', 'elemental,cold,resistance', 1000, 'ColdResistance'),
('ColdResistance8', 'Seal', 1, 1, '+(6-10)% to Cold Resistance', 'armour, ring, amulet, belt', 'elemental,cold,resistance', 1000, 'ColdResistance'),

-- Lightning Resistance
('LightningResistance1', 'Ephij', 82, 65, '+(41-45)% to Lightning Resistance', 'armour, ring, amulet, belt', 'elemental,lightning,resistance', 1000, 'LightningResistance'),
('LightningResistance2', 'Lightning', 71, 56, '+(36-40)% to Lightning Resistance', 'armour, ring, amulet, belt', 'elemental,lightning,resistance', 1000, 'LightningResistance'),
('LightningResistance3', 'Maelstrom', 60, 48, '+(31-35)% to Lightning Resistance', 'armour, ring, amulet, belt', 'elemental,lightning,resistance', 1000, 'LightningResistance'),
('LightningResistance4', 'Tempest', 49, 39, '+(26-30)% to Lightning Resistance', 'armour, ring, amulet, belt', 'elemental,lightning,resistance', 1000, 'LightningResistance'),
('LightningResistance5', 'Thunderhead', 37, 29, '+(21-25)% to Lightning Resistance', 'armour, ring, amulet, belt', 'elemental,lightning,resistance', 1000, 'LightningResistance'),
('LightningResistance6', 'Storm', 25, 20, '+(16-20)% to Lightning Resistance', 'armour, ring, amulet, belt', 'elemental,lightning,resistance', 1000, 'LightningResistance'),
('LightningResistance7', 'Squall', 13, 10, '+(11-15)% to Lightning Resistance', 'armour, ring, amulet, belt', 'elemental,lightning,resistance', 1000, 'LightningResistance'),
('LightningResistance8', 'Cloud', 1, 1, '+(6-10)% to Lightning Resistance', 'armour, ring, amulet, belt', 'elemental,lightning,resistance', 1000, 'LightningResistance'),

-- Chaos Resistance
('ChaosResistance1', 'Bameth', 81, 64, '+(24-27)% to Chaos Resistance', 'armour, ring, amulet, belt', 'chaos,resistance', 250, 'ChaosResistance'),
('ChaosResistance2', 'Exile', 68, 54, '+(20-23)% to Chaos Resistance', 'armour, ring, amulet, belt', 'chaos,resistance', 250, 'ChaosResistance'),
('ChaosResistance3', 'Expulsion', 56, 44, '+(16-19)% to Chaos Resistance', 'armour, ring, amulet, belt', 'chaos,resistance', 250, 'ChaosResistance'),
('ChaosResistance4', 'Eviction', 44, 35, '+(12-15)% to Chaos Resistance', 'armour, ring, amulet, belt', 'chaos,resistance', 250, 'ChaosResistance'),
('ChaosResistance5', 'Banishment', 30, 24, '+(8-11)% to Chaos Resistance', 'armour, ring, amulet, belt', 'chaos,resistance', 250, 'ChaosResistance'),
('ChaosResistance6', 'Lost', 16, 12, '+(4-7)% to Chaos Resistance', 'armour, ring, amulet, belt', 'chaos,resistance', 250, 'ChaosResistance'),

-- Attribute Requirements
('AttributeRequirements1', 'Proficient', 60, 48, '35% reduced Attribute Requirements', 'weapon, armour', '', 1000, 'AttributeRequirements'),
('AttributeRequirements2', 'Skilled', 52, 41, '30% reduced Attribute Requirements', 'weapon, armour', '', 1000, 'AttributeRequirements'),
('AttributeRequirements3', 'Talented', 40, 32, '25% reduced Attribute Requirements', 'weapon, armour', '', 1000, 'AttributeRequirements'),
('AttributeRequirements4', 'Apt', 32, 25, '20% reduced Attribute Requirements', 'weapon, armour', '', 1000, 'AttributeRequirements'),
('AttributeRequirements5', 'Worthy', 24, 19, '15% reduced Attribute Requirements', 'weapon, armour', '', 1000, 'AttributeRequirements'),

-- Life per Kill
('LifeGainedFromEnemyDeath1', 'Legend', 77, 61, 'Gain (69-84) Life per Enemy Killed', 'weapon', 'life, resource', 750, 'LifeGainedFromEnemyDeath'),
('LifeGainedFromEnemyDeath2', 'Glory', 66, 52, 'Gain (54-68) Life per Enemy Killed', 'weapon', 'life, resource', 750, 'LifeGainedFromEnemyDeath'),
('LifeGainedFromEnemyDeath3', 'Valour', 55, 44, 'Gain (41-53) Life per Enemy Killed', 'weapon, ring, gloves, quiver', 'life, resource', 750, 'LifeGainedFromEnemyDeath'),
('LifeGainedFromEnemyDeath4', 'Vanquishing', 44, 35, 'Gain (29-40) Life per Enemy Killed', 'weapon, ring, gloves, quiver', 'life, resource', 750, 'LifeGainedFromEnemyDeath'),
('LifeGainedFromEnemyDeath5', 'Conquest', 33, 26, 'Gain (19-28) Life per Enemy Killed', 'weapon, ring, gloves, quiver', 'life, resource', 750, 'LifeGainedFromEnemyDeath'),
('LifeGainedFromEnemyDeath6', 'Triumph', 22, 17, 'Gain (10-18) Life per Enemy Killed', 'weapon, ring, gloves, quiver', 'life, resource', 750, 'LifeGainedFromEnemyDeath'),
('LifeGainedFromEnemyDeath7', 'Victory', 11, 8, 'Gain (7-9) Life per Enemy Killed', 'weapon, ring, gloves, quiver', 'life, resource', 750, 'LifeGainedFromEnemyDeath'),
('LifeGainedFromEnemyDeath8', 'Success', 1, 1, 'Gain (4-6) Life per Enemy Killed', 'weapon, ring, gloves, quiver', 'life, resource', 750, 'LifeGainedFromEnemyDeath'),

-- Mana per Kill
('ManaGainedFromEnemyDeath1', 'Assimilation', 78, 62, 'Gain (36-45) Mana per Enemy Killed', 'weapon', 'mana, resource', 750, 'ManaGainedFromEnemyDeath'),
('ManaGainedFromEnemyDeath2', 'Devouring', 67, 53, 'Gain (28-35) Mana per Enemy Killed', 'weapon', 'mana, resource', 750, 'ManaGainedFromEnemyDeath'),
('ManaGainedFromEnemyDeath3', 'Siphoning', 56, 44, 'Gain (21-27) Mana per Enemy Killed', 'weapon, ring, gloves, quiver', 'mana, resource', 750, 'ManaGainedFromEnemyDeath'),
('ManaGainedFromEnemyDeath4', 'Consumption', 45, 36, 'Gain (15-20) Mana per Enemy Killed', 'weapon, ring, gloves, quiver', 'mana, resource', 750, 'ManaGainedFromEnemyDeath'),
('ManaGainedFromEnemyDeath5', 'Enveloping', 34, 27, 'Gain (10-14) Mana per Enemy Killed', 'weapon, ring, gloves, quiver', 'mana, resource', 750, 'ManaGainedFromEnemyDeath'),
('ManaGainedFromEnemyDeath6', 'Infusion', 23, 18, 'Gain (6-9) Mana per Enemy Killed', 'weapon, ring, gloves, quiver', 'mana, resource', 750, 'ManaGainedFromEnemyDeath'),
('ManaGainedFromEnemyDeath7', 'Osmosis', 12, 9, 'Gain (4-5) Mana per Enemy Killed', 'weapon, ring, gloves, quiver', 'mana, resource', 750, 'ManaGainedFromEnemyDeath'),
('ManaGainedFromEnemyDeath8', 'Absorption', 1, 1, 'Gain (2-3) Mana per Enemy Killed', 'weapon, ring, gloves, quiver', 'mana, resource', 750, 'ManaGainedFromEnemyDeath'),

-- Mana Regen
('ManaRegeneration1', 'Nirvana', 79, 63, '(60-69)% increased Mana Regeneration Rate', 'ring, amulet, focus, staff, sceptre, wand', 'mana, resource', 1000, 'ManaRegeneration'),
('ManaRegeneration2', 'Euphoria', 55, 44, '(50-59)% increased Mana Regeneration Rate', 'ring, amulet, focus, staff, sceptre, wand', 'mana, resource', 1000, 'ManaRegeneration'),
('ManaRegeneration3', 'Bliss', 42, 33, '(40-49)% increased Mana Regeneration Rate', 'ring, amulet, focus, staff, sceptre, wand', 'mana, resource', 1000, 'ManaRegeneration'),
('ManaRegeneration4', 'Elation', 29, 23, '(30-39)% increased Mana Regeneration Rate', 'ring, amulet, focus, staff, sceptre, wand', 'mana, resource', 1000, 'ManaRegeneration'),
('ManaRegeneration5', 'Joy', 18, 14, '(20-29)% increased Mana Regeneration Rate', 'ring, amulet, focus, staff, sceptre, wand', 'mana, resource', 1000, 'ManaRegeneration'),
('ManaRegeneration6', 'Excitement', 1, 1, '(10-19)% increased Mana Regeneration Rate', 'ring, amulet, focus, staff, sceptre, wand', 'mana, resource', 1000, 'ManaRegeneration'),

-- Rarity
('Rarity1', 'Windfall', 75, 60, '(22-25)% increased Rarity of Items found', 'ring, amulet, gloves, boots, helmet', '', 1000, 'Rarity'),
('Rarity2', 'Excavation', 63, 50, '(19-21)% increased Rarity of Items found', 'ring, amulet, gloves, boots, helmet', '', 1000, 'Rarity'),
('Rarity3', 'Archaeology', 40, 32, '(15-18)% increased Rarity of Items found', 'ring, amulet, gloves, boots, helmet', '', 1000, 'Rarity'),
('Rarity4', 'Raiding', 24, 19, '(11-14)% increased Rarity of Items found', 'ring, amulet, gloves, boots, helmet', '', 1000, 'Rarity'),
('Rarity5', 'Plunder', 3, 2, '(6-10)% increased Rarity of Items found', 'ring, amulet, gloves, boots, helmet', '', 1000, 'Rarity'),


-- //
-- Specific Affixes
-- //

-- Amulet
('CriticalStrikeChanceAmulet1', 'Unmaking', 72, 57, '(35-38)% increased Critical Hit Chance', 'amulet', 'critical', 125, 'CriticalStrikeChance'),
('CriticalStrikeChanceAmuletHelm2', 'Ruin', 58, 46, '(30-34)% increased Critical Hit Chance', 'amulet, helmet', 'critical', 250, 'CriticalStrikeChance'),
('CriticalStrikeChanceAmuletHelm3', 'Calamity', 44, 35, '(25-29)% increased Critical Hit Chance', 'amulet, helmet', 'critical', 500, 'CriticalStrikeChance'),
('CriticalStrikeChanceAmuletHelm4', 'Disaster', 30, 24, '(20-24)% increased Critical Hit Chance', 'amulet, helmet', 'critical', 1000, 'CriticalStrikeChance'),
('CriticalStrikeChanceAmuletHelm5', 'Havoc', 20, 16, '(15-19)% increased Critical Hit Chance', 'amulet, helmet', 'critical', 1000, 'CriticalStrikeChance'),
('CriticalStrikeChanceAmuletHelm6', 'Menace', 5, 4, '(10-14)% increased Critical Hit Chance', 'amulet, helmet', 'critical', 1000, 'CriticalStrikeChance'),

('CriticalStrikeMultiplierAmuletGloves1', 'Ferocity', 59, 47, '(30-34)% increased Critical Damage Bonus', 'amulet, gloves', 'critical', 250, 'CriticalStrikeMultiplier'),
('CriticalStrikeMultiplierAmuletGloves3', 'Fury', 45, 36, '(25-29)% increased Critical Damage Bonus', 'amulet, gloves', 'critical', 500, 'CriticalStrikeMultiplier'),
('CriticalStrikeMultiplierAmuletGloves4', 'Rage', 31, 24, '(20-24)% increased Critical Damage Bonus', 'amulet, gloves', 'critical', 1000, 'CriticalStrikeMultiplier'),
('CriticalStrikeMultiplierAmuletGloves5', 'Anger', 21, 16, '(15-19)% increased Critical Damage Bonus', 'amulet, gloves', 'critical', 1000, 'CriticalStrikeMultiplier'),
('CriticalStrikeMultiplierAmuletGloves6', 'Ire', 8, 6, '(10-14)% increased Critical Damage Bonus', 'amulet, gloves', 'critical', 1000, 'CriticalStrikeMultiplier'),

-- Ring

-- Life Leech
('LifeLeechRing1', 'Remora', 54, 43, 'Leech (7-7.9)% of Physical Damage as Life', 'ring', 'life, physical, attack', 1000, 'LifeLeechRing'),
('LifeLeechRing2', 'Locust', 38, 30, 'Leech (6-6.9)% of Physical Damage as Life', 'ring', 'life, physical, attack', 1000, 'LifeLeechRing'),
('LifeLeechRing3', 'Parasite', 21, 16, 'Leech (5-5.9)% of Physical Damage as Life', 'ring', 'life, physical, attack', 1000, 'LifeLeechRing'),

-- Mana Leech
('ManaLeechRing1', 'Arid', 54, 43, 'Leech (6-6.9)% of Physical Damage as Mana', 'ring', 'mana, physical, attack', 1000, 'ManaLeechRing'),
('ManaLeechRing2', 'Parched', 38, 30, 'Leech (5-5.9)% of Physical Damage as Mana', 'ring', 'mana, physical, attack', 1000, 'ManaLeechRing'),
('ManaLeechRing3', 'Thirsty', 21, 16, 'Leech (4-4.9)% of Physical Damage as Mana', 'ring', 'mana, physical, attack', 1000, 'ManaLeechRing'),

-- Belt

-- Flask Charge Gain
('FlaskChargeGain1', 'Overflowing', 81, 64, '(35-40)% increased Flask Charges gained', 'belt', '', 800, 'FlaskChargeGain'),
('FlaskChargeGain2', 'Brimming', 70, 56, '(29-34)% increased Flask Charges gained', 'belt', '', 800, 'FlaskChargeGain'),
('FlaskChargeGain3', 'Pouring', 48, 38, '(23-28)% increased Flask Charges gained', 'belt', '', 800, 'FlaskChargeGain'),
('FlaskChargeGain4', 'Replenishing', 32, 25, '(17-22)% increased Flask Charges gained', 'belt', '', 800, 'FlaskChargeGain'),
('FlaskChargeGain5', 'Restocking', 16, 12, '(11-16)% increased Flask Charges gained', 'belt', '', 800, 'FlaskChargeGain'),
('FlaskChargeGain6', 'Refilling', 2, 1, '(5-10)% increased Flask Charges gained', 'belt', '', 800, 'FlaskChargeGain'),

-- Reduced Flask Charge Use
('ReducedFlaskChargeUse1', 'Nourishing', 81, 64, '(23-25)% reduced Flask Charges used', 'belt', '', 800, 'ReducedFlaskChargeUse'),
('ReducedFlaskChargeUse2', 'Reveling', 72, 57, '(20-22)% reduced Flask Charges used', 'belt', '', 800, 'ReducedFlaskChargeUse'),
('ReducedFlaskChargeUse3', 'Savouring', 50, 40, '(17-19)% reduced Flask Charges used', 'belt', '', 800, 'ReducedFlaskChargeUse'),
('ReducedFlaskChargeUse4', 'Relishing', 33, 26, '(14-16)% reduced Flask Charges used', 'belt', '', 800, 'ReducedFlaskChargeUse'),
('ReducedFlaskChargeUse5', 'Imbibing', 18, 14, '(11-13)% reduced Flask Charges used', 'belt', '', 800, 'ReducedFlaskChargeUse'),
('ReducedFlaskChargeUse6', 'Sipping', 3, 2, '(8-10)% reduced Flask Charges used', 'belt', '', 800, 'ReducedFlaskChargeUse'),

-- Charm Charge Gain
('CharmChargeGain1', 'Abundance', 81, 64, '(35-40)% increased Charm Charges gained', 'belt', '', 800, 'CharmChargeGain'),
('CharmChargeGain2', 'Harvest', 70, 56, '(29-34)% increased Charm Charges gained', 'belt', '', 800, 'CharmChargeGain'),
('CharmChargeGain3', 'Bounty', 48, 38, '(23-28)% increased Charm Charges gained', 'belt', '', 800, 'CharmChargeGain'),
('CharmChargeGain4', 'Fertility', 32, 25, '(17-22)% increased Charm Charges gained', 'belt', '', 800, 'CharmChargeGain'),
('CharmChargeGain5', 'Surplus', 16, 12, '(11-16)% increased Charm Charges gained', 'belt', '', 800, 'CharmChargeGain'),
('CharmChargeGain6', 'Plenty', 2, 1, '(5-10)% increased Charm Charges gained', 'belt', '', 800, 'CharmChargeGain'),

-- Reduced Charm Charge Use
('ReducedCharmChargeUse1', 'Scarcity', 81, 64, '(23-25)% reduced Charm Charges used', 'belt', '', 800, 'ReducedCharmChargeUse'),
('ReducedCharmChargeUse2', 'Economy', 72, 57, '(20-22)% reduced Charm Charges used', 'belt', '', 800, 'ReducedCharmChargeUse'),
('ReducedCharmChargeUse3', 'Restraint', 50, 40, '(17-19)% reduced Charm Charges used', 'belt', '', 800, 'ReducedCharmChargeUse'),
('ReducedCharmChargeUse4', 'Temperance', 33, 26, '(14-16)% reduced Charm Charges used', 'belt', '', 800, 'ReducedCharmChargeUse'),
('ReducedCharmChargeUse5', 'Frugality', 18, 14, '(11-13)% reduced Charm Charges used', 'belt', '', 800, 'ReducedCharmChargeUse'),
('ReducedCharmChargeUse6', 'Austerity', 3, 2, '(8-10)% reduced Charm Charges used', 'belt', '', 800, 'ReducedCharmChargeUse'),

-- Helmet
('Intelligence0', 'Genius', 81, 64, '+(34-36) to Intelligence', 'helmet', 'attribute', 1000, 'Intelligence'),

-- Gloves
('Dexterity0', 'Wind', 81, 64, '+(34-36) to Dexterity', 'gloves', 'attribute', 1000, 'Dexterity'),

('LifeOnHitGloves1', 'Nourishment', 40, 32, 'Grants 5 Life per Enemy Hit with Attacks', 'gloves', 'life,attack', 1000, 'LifeOnHitGloves'),
('LifeOnHitGloves2', 'Regrowth', 30, 24, 'Grants 4 Life per Enemy Hit with Attacks', 'gloves', 'life,attack', 1000, 'LifeOnHitGloves'),
('LifeOnHitGloves3', 'Restoration', 20, 16, 'Grants 3 Life per Enemy Hit with Attacks', 'gloves', 'life,attack', 1000, 'LifeOnHitGloves'),
('LifeOnHitGloves4', 'Rejuvenation', 8, 6, 'Grants 2 Life per Enemy Hit with Attacks', 'gloves', 'life,attack', 1000, 'LifeOnHit'),

-- Boots
('StunThreshold0', 'Titanium Skin', 80, 57, '+(305-352) to Stun Threshold', 'boots', '', 800, 'StunThreshold'),

-- Non Damaging Ailment Duration

-- Shock Duration
('ShockDuration1', 'Grounding', 75, 60, '(56-60)% reduced Shock Duration on you', 'boots', 'elemental,lightning,ailment', 500, 'ReducedAilmentDuration'),
('ShockDuration2', 'Dielectric', 63, 50, '(51-55)% reduced Shock Duration on you', 'boots', 'elemental,lightning,ailment', 500, 'ReducedAilmentDuration'),
('ShockDuration3', 'Impedance', 49, 39, '(46-50)% reduced Shock Duration on you', 'boots', 'elemental,lightning,ailment', 500, 'ReducedAilmentDuration'),
('ShockDuration4', 'Insulation', 36, 28, '(41-45)% reduced Shock Duration on you', 'boots', 'elemental,lightning,ailment', 500, 'ReducedAilmentDuration'),
('ShockDuration5', 'Earthing', 20, 16, '(36-40)% reduced Shock Duration on you', 'boots', 'elemental,lightning,ailment', 500, 'ReducedAilmentDuration'),

-- Chill Duration
('ChillDuration1', 'Reversal', 75, 60, '(56-60)% reduced Chill Duration on you', 'boots', 'elemental,cold,ailment', 500, 'ReducedAilmentDuration'),
('ChillDuration2', 'Dissipation', 63, 50, '(51-55)% reduced Chill Duration on you', 'boots', 'elemental,cold,ailment', 500, 'ReducedAilmentDuration'),
('ChillDuration3', 'Entropy', 49, 39, '(46-50)% reduced Chill Duration on you', 'boots', 'elemental,cold,ailment', 500, 'ReducedAilmentDuration'),
('ChillDuration4', 'Fluidity', 36, 28, '(41-45)% reduced Chill Duration on you', 'boots', 'elemental,cold,ailment', 500, 'ReducedAilmentDuration'),
('ChillDuration5', 'Convection', 20, 16, '(36-40)% reduced Chill Duration on you', 'boots', 'elemental,cold,ailment', 500, 'ReducedAilmentDuration'),

-- Freeze Duration
('FreezeDuration1', 'Thawing', 75, 60, '(56-60)% reduced Freeze Duration on you', 'boots', 'elemental,cold,ailment', 500, 'ReducedAilmentDuration'),
('FreezeDuration2', 'Temperate', 63, 50, '(51-55)% reduced Freeze Duration on you', 'boots', 'elemental,cold,ailment', 500, 'ReducedAilmentDuration'),
('FreezeDuration3', 'Defrosting', 49, 39, '(46-50)% reduced Freeze Duration on you', 'boots', 'elemental,cold,ailment', 500, 'ReducedAilmentDuration'),
('FreezeDuration4', 'Unfreezing', 36, 28, '(41-45)% reduced Freeze Duration on you', 'boots', 'elemental,cold,ailment', 500, 'ReducedAilmentDuration'),
('FreezeDuration5', 'Heating', 20, 16, '(36-40)% reduced Freeze Duration on you', 'boots', 'elemental,cold,ailment', 500, 'ReducedAilmentDuration'),


-- Belt
('Strength0', 'Gods', 81, 64, '+(34-36) to Strength', 'belt', 'attribute', 1000, 'Strength'),

-- Crossbow
('ProjectileSkillGemLevelCrossbow1', 'Sniper', 81, 64, '+7 to Level of all Projectile Skills', 'crossbow', 'attack', 100, 'IncreaseProjectileGemLevel'),
('ProjectileSkillGemLevelCrossbow2', 'Marksman', 55, 44, '+(5-6) to Level of all Projectile Skills', 'crossbow', 'attack', 250, 'IncreaseProjectileGemLevel'),
('ProjectileSkillGemLevelCrossbow3', 'Sharpshooter', 36, 28, '+4 to Level of all Projectile Skills', 'crossbow', 'attack', 500, 'IncreaseProjectileGemLevel'),
('ProjectileSkillGemLevelCrossbow4', 'Fletcher', 18, 14, '+3 to Level of all Projectile Skills', 'crossbow', 'attack', 750, 'IncreaseProjectileGemLevel'),
('ProjectileSkillGemLevelCrossbow5', 'Archer', 2, 1, '+(1-2) to Level of all Projectile Skills', 'crossbow', 'attack', 1000, 'IncreaseProjectileGemLevel'),
('AdditionalAmmo1', 'Bursting', 82, 65, 'Loads 2 additional bolts', 'crossbow', 'attack', 125, 'AdditionalAmmo'),
('AdditionalAmmo2', 'Shelling', 55, 44, 'Loads an additional bolt', 'crossbow', 'attack', 250, 'AdditionalAmmo'),

-- Bow
('ProjectileSkillGemLevel1', 'Sniper', 81, 64, '+5 to Level of all Projectile Skills', 'bow, spear', 'attack', 100, 'IncreaseProjectileGemLevel'),
('ProjectileSkillGemLevel2', 'Marksman', 55, 44, '+4 to Level of all Projectile Skills', 'bow, spear', 'attack', 250, 'IncreaseProjectileGemLevel'),
('ProjectileSkillGemLevel3', 'Sharpshooter', 36, 28, '+3 to Level of all Projectile Skills', 'bow, amulet, spear', 'attack', 500, 'IncreaseProjectileGemLevel'),
('ProjectileSkillGemLevel4', 'Fletcher', 18, 14, '+2 to Level of all Projectile Skills', 'bow, amulet, spear, quiver', 'attack', 750, 'IncreaseProjectileGemLevel'),
('ProjectileSkillGemLevel5', 'Archer', 2, 1, '+1 to Level of all Projectile Skills', 'bow, amulet, spear, quiver', 'attack', 1000, 'IncreaseProjectileGemLevel'),
('AdditionalArrow1', 'Many', 82, 65, 'Bow Attacks fire 2 additional Arrows', 'bow', 'attack', 125, 'AdditionalArrow'),
('AdditionalArrow2', 'Splintering', 55, 44, 'Bow Attacks fire an additional Arrow', 'bow', 'attack', 250, 'AdditionalArrow'),

-- Quiver
('CriticalStrikeChanceQuiver1', 'Unmaking', 72, 57, '(35-38)% increased Critical Hit Chance for Attacks', 'quiver', 'attack,critical', 125, 'CriticalStrikeChance'),
('CriticalStrikeChanceQuiver2', 'Ruin', 58, 46, '(30-34)% increased Critical Hit Chance for Attacks', 'quiver', 'attack,critical', 250, 'CriticalStrikeChance'),
('CriticalStrikeChanceQuiver3', 'Calamity', 44, 35, '(25-29)% increased Critical Hit Chance for Attacks', 'quiver', 'attack,critical', 500, 'CriticalStrikeChance'),
('CriticalStrikeChanceQuiver4', 'Disaster', 30, 24, '(20-24)% increased Critical Hit Chance for Attacks', 'quiver', 'attack,critical', 1000, 'CriticalStrikeChance'),
('CriticalStrikeChanceQuiver5', 'Havoc', 20, 16, '(15-19)% increased Critical Hit Chance for Attacks', 'quiver', 'attack,critical', 1000, 'CriticalStrikeChance'),
('CriticalStrikeChanceQuiver6', 'Menace', 5, 4, '(10-14)% increased Critical Hit Chance for Attacks', 'quiver', 'attack,critical', 1000, 'CriticalStrikeChance'),

('CriticalStrikeMultiplierQuiver1', 'Destruction', 74, 59, '(35-39)% increased Critical Damage Bonus for Attack Damage', 'quiver', 'attack,critical', 125, 'CriticalStrikeMultiplier'),
('CriticalStrikeMultiplierQuiver2', 'Ferocity', 59, 47, '(30-34)% increased Critical Damage Bonus for Attack Damage', 'amulet, gloves, quiver', 'attack,critical', 250, 'CriticalStrikeMultiplier'),
('CriticalStrikeMultiplierQuiver3', 'Fury', 45, 36, '(25-29)% increased Critical Damage Bonus for Attack Damage', 'amulet, gloves, quiver', 'attack,critical', 500, 'CriticalStrikeMultiplier'),
('CriticalStrikeMultiplierQuiver4', 'Rage', 31, 24, '(20-24)% increased Critical Damage Bonus for Attack Damage', 'amulet, gloves, quiver', 'attack,critical', 1000, 'CriticalStrikeMultiplier'),
('CriticalStrikeMultiplierQuiver5', 'Anger', 21, 16, '(15-19)% increased Critical Damage Bonus for Attack Damage', 'amulet, gloves, quiver', 'attack,critical', 1000, 'CriticalStrikeMultiplier'),
('CriticalStrikeMultiplierQuiver6', 'Ire', 8, 6, '(10-14)% increased Critical Damage Bonus for Attack Damage', 'amulet, gloves, quiver', 'attack,critical', 1000, 'CriticalStrikeMultiplier'),

('Pierce1', 'Penetrating', 77, 61, '(24-26)% chance to Pierce an Enemy', 'quiver', 'attack', 500, 'Pierce'),
('Pierce2', 'Skewering', 61, 48, '(21-23)% chance to Pierce an Enemy', 'quiver', 'attack', 500, 'Pierce'),
('Pierce3', 'Puncturing', 44, 35, '(18-20)% chance to Pierce an Enemy', 'quiver', 'attack', 500, 'Pierce'),
('Pierce4', 'Drilling', 26, 20, '(15-17)% chance to Pierce an Enemy', 'quiver', 'attack', 500, 'Pierce'),
('Pierce5', 'Piercing', 11, 8, '(12-14)% chance to Pierce an Enemy', 'quiver', 'attack', 500, 'Pierce'),

-- Focus

-- Energy Shield Recharge Rate
('EnergyShieldRechargeRate1', 'Ardour', 81, 64, '(46-50)% increased Energy Shield Recharge Rate', 'focus', 'defences', 500, 'EnergyShieldRechargeRate'),
('EnergyShieldRechargeRate2', 'Buffering', 69, 55, '(41-45)% increased Energy Shield Recharge Rate', 'focus', 'defences', 500, 'EnergyShieldRechargeRate'),
('EnergyShieldRechargeRate3', 'Dispersal', 58, 46, '(36-40)% increased Energy Shield Recharge Rate', 'focus', 'defences', 500, 'EnergyShieldRechargeRate'),
('EnergyShieldRechargeRate4', 'Diffusion', 45, 36, '(31-35)% increased Energy Shield Recharge Rate', 'focus', 'defences', 500, 'EnergyShieldRechargeRate'),
('EnergyShieldRechargeRate5', 'Enlivening', 33, 26, '(26-30)% increased Energy Shield Recharge Rate', 'focus', 'defences', 500, 'EnergyShieldRechargeRate'),

-- Shield

-- Maximum Fire Resistance
('MaximumFireResistance1', 'Solar Storm', 81, 64, '+3% to Maximum Fire Resistance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'elemental,fire,resistance', 250, 'MaximumFireResistance'),
('MaximumFireResistance2', 'Molten Core', 75, 60, '+2% to Maximum Fire Resistance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'elemental,fire,resistance', 250, 'MaximumFireResistance'),
('MaximumFireResistance3', 'Bushfire', 68, 54, '+1% to Maximum Fire Resistance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'elemental,fire,resistance', 250, 'MaximumFireResistance'),

-- Maximum Cold Resistance
('MaximumColdResistance1', 'Mammoth', 81, 64, '+3% to Maximum Cold Resistance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'elemental,cold,resistance', 250, 'MaximumColdResistance'),
('MaximumColdResistance2', 'Tundra', 75, 60, '+2% to Maximum Cold Resistance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'elemental,cold,resistance', 250, 'MaximumColdResistance'),
('MaximumColdResistance3', 'Furs', 68, 54, '+1% to Maximum Cold Resistance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'elemental,cold,resistance', 250, 'MaximumColdResistance'),

-- Maximum Lightning Resistance
('MaximumLightningResistance1', 'Lightning Rod', 81, 64, '+3% to Maximum Lightning Resistance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'elemental,lightning,resistance', 250, 'MaximumLightningResistance'),
('MaximumLightningResistance2', 'Shockproofing', 75, 60, '+2% to Maximum Lightning Resistance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'elemental,lightning,resistance', 250, 'MaximumLightningResistance'),
('MaximumLightningResistance3', 'Impedance', 68, 54, '+1% to Maximum Lightning Resistance', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'elemental,lightning,resistance', 250, 'MaximumLightningResistance'),

-- Maximum All Elemental Resistances
('MaximumAllElementalResistances1', 'Everlasting', 81, 64, '+2% to all Maximum Elemental Resistances', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'elemental,resistance', 125, 'MaximumAllElementalResistances'),
('MaximumAllElementalResistances2', 'Deathless', 75, 60, '+1% to all Maximum Elemental Resistances', 'str_shield, str_dex_shield, str_int_shield, dex_shield', 'elemental,resistance', 125, 'MaximumAllElementalResistances'),

-- Physical Damage Reduction
('PhysicalDamageReduction1', 'Conservator', 77, 61, '8% additional Physical Damage Reduction', 'str_shield', 'physical', 1000, 'PhysicalDamageReduction'),
('PhysicalDamageReduction2', 'Protector', 66, 52, '7% additional Physical Damage Reduction', 'str_shield', 'physical', 1000, 'PhysicalDamageReduction'),
('PhysicalDamageReduction3', 'Sentry', 53, 42, '6% additional Physical Damage Reduction', 'str_shield', 'physical', 1000, 'PhysicalDamageReduction'),
('PhysicalDamageReduction4', 'Custodian', 41, 32, '5% additional Physical Damage Reduction', 'str_shield', 'physical', 1000, 'PhysicalDamageReduction'),
('PhysicalDamageReduction5', 'Watchman', 32, 25, '4% additional Physical Damage Reduction', 'str_shield', 'physical', 1000, 'PhysicalDamageReduction'),

-- Critical Damage Reduction
('CriticalDamageReduction1', 'Bastion', 81, 64, 'Hits against you have (48-54)% reduced Critical Damage Bonus', 'str_dex_shield', 'damage,critical', 800, 'CriticalDamageReduction'),
('CriticalDamageReduction2', 'Obstruction', 69, 55, 'Hits against you have (42-47)% reduced Critical Damage Bonus', 'str_dex_shield', 'damage,critical', 800, 'CriticalDamageReduction'),
('CriticalDamageReduction3', 'Interference', 58, 46, 'Hits against you have (35-41)% reduced Critical Damage Bonus', 'str_dex_shield', 'damage,critical', 800, 'CriticalDamageReduction'),
('CriticalDamageReduction4', 'Deadening', 45, 36, 'Hits against you have (28-34)% reduced Critical Damage Bonus', 'str_dex_shield', 'damage,critical', 800, 'CriticalDamageReduction'),
('CriticalDamageReduction5', 'Dulling', 33, 26, 'Hits against you have (21-27)% reduced Critical Damage Bonus', 'str_dex_shield', 'damage,critical', 800, 'CriticalDamageReduction'),

-- Sceptre

-- Ally Elemental Resistances
('AllyElementalResistances1', 'Metamorphosis', 80, 64, 'Allies in your Presence have +(17-18)% to all Elemental Resistances', 'sceptre', 'elemental,resistance', 800, 'AllyElementalResistances'),
('AllyElementalResistances2', 'Progression', 68, 54, 'Allies in your Presence have +(15-16)% to all Elemental Resistances', 'sceptre', 'elemental,resistance', 800, 'AllyElementalResistances'),
('AllyElementalResistances3', 'Evolution', 54, 43, 'Allies in your Presence have +(12-14)% to all Elemental Resistances', 'sceptre', 'elemental,resistance', 800, 'AllyElementalResistances'),
('AllyElementalResistances4', 'Adaptation', 40, 32, 'Allies in your Presence have +(9-11)% to all Elemental Resistances', 'sceptre', 'elemental,resistance', 800, 'AllyElementalResistances'),
('AllyElementalResistances5', 'Acclimatisation', 26, 20, 'Allies in your Presence have +(6-8)% to all Elemental Resistances', 'sceptre', 'elemental,resistance', 800, 'AllyElementalResistances'),
('AllyElementalResistances6', 'Adjustment', 12, 9, 'Allies in your Presence have +(3-5)% to all Elemental Resistances', 'sceptre', 'elemental,resistance', 800, 'AllyElementalResistances'),

-- Minion Skill Levels
('MinionSkillGemLevel1', 'Slavedriver', 78, 62, '+4 to Level of all Minion Skills', 'sceptre', 'minion,gem', 100, 'IncreaseGemLevel'),
('MinionSkillGemLevel2', 'Overseer', 55, 44, '+3 to Level of all Minion Skills', 'sceptre, amulet', 'minion,gem', 250, 'IncreaseGemLevel'),
('MinionSkillGemLevel3', 'Despot', 25, 20, '+2 to Level of all Minion Skills', 'sceptre, amulet, helmet', 'minion,gem', 500, 'IncreaseGemLevel'),
('MinionSkillGemLevel4', 'Taskmaster', 2, 1, '+1 to Level of all Minion Skills', 'sceptre, amulet, helmet', 'minion,gem', 750, 'IncreaseGemLevel'),

-- Ally Life Regeneration
('AllyLifeRegeneration1', 'Immortality', 75, 60, 'Allies in your Presence Regenerate (29.1-33) Life per second', 'sceptre', 'life', 1000, 'AllyLifeRegeneration'),
('AllyLifeRegeneration2', 'Resurgence', 68, 54, 'Allies in your Presence Regenerate (23.1-29) Life per second', 'sceptre', 'life', 1000, 'AllyLifeRegeneration'),
('AllyLifeRegeneration3', 'Recuperation', 58, 46, 'Allies in your Presence Regenerate (18.1-23) Life per second', 'sceptre', 'life', 1000, 'AllyLifeRegeneration'),
('AllyLifeRegeneration4', 'Convalescence', 47, 37, 'Allies in your Presence Regenerate (13.1-18) Life per second', 'sceptre', 'life', 1000, 'AllyLifeRegeneration'),
('AllyLifeRegeneration5', 'Troll', 35, 28, 'Allies in your Presence Regenerate (9.1-13) Life per second', 'sceptre', 'life', 1000, 'AllyLifeRegeneration'),
('AllyLifeRegeneration6', 'Hydra', 26, 20, 'Allies in your Presence Regenerate (6.1-9) Life per second', 'sceptre', 'life', 1000, 'AllyLifeRegeneration'),
('AllyLifeRegeneration7', 'Starfish', 17, 13, 'Allies in your Presence Regenerate (4.1-6) Life per second', 'sceptre', 'life', 1000, 'AllyLifeRegeneration'),
('AllyLifeRegeneration8', 'Flatworm', 11, 8, 'Allies in your Presence Regenerate (3.1-4) Life per second', 'sceptre', 'life', 1000, 'AllyLifeRegeneration'),
('AllyLifeRegeneration9', 'Lizard', 5, 4, 'Allies in your Presence Regenerate (2.1-3) Life per second', 'sceptre', 'life', 1000, 'AllyLifeRegeneration'),
('AllyLifeRegeneration10', 'Newt', 1, 1, 'Allies in your Presence Regenerate (1-2) Life per second', 'sceptre', 'life', 1000, 'AllyLifeRegeneration'),

-- Ally Attack Speed
('AllyAttackSpeed1', 'Renown', 55, 44, 'Allies in your Presence have (14-16)% increased Attack Speed', 'sceptre', 'attack,speed', 1000, 'AllyAttackSpeed'),
('AllyAttackSpeed2', 'Mastery', 35, 28, 'Allies in your Presence have (11-13)% increased Attack Speed', 'sceptre', 'attack,speed', 1000, 'AllyAttackSpeed'),
('AllyAttackSpeed3', 'Ease', 20, 16, 'Allies in your Presence have (8-10)% increased Attack Speed', 'sceptre', 'attack,speed', 1000, 'AllyAttackSpeed'),
('AllyAttackSpeed4', 'Skill', 5, 4, 'Allies in your Presence have (5-7)% increased Attack Speed', 'sceptre', 'attack,speed', 1000, 'AllyAttackSpeed'),

-- Ally Cast Speed
('AllyCastSpeed1', 'Sortilege', 56, 44, 'Allies in your Presence have (17-20)% increased Cast Speed', 'sceptre', 'caster,speed', 1000, 'AllyCastSpeed'),
('AllyCastSpeed2', 'Expertise', 36, 28, 'Allies in your Presence have (13-16)% increased Cast Speed', 'sceptre', 'caster,speed', 1000, 'AllyCastSpeed'),
('AllyCastSpeed3', 'Nimbleness', 21, 16, 'Allies in your Presence have (9-12)% increased Cast Speed', 'sceptre', 'caster,speed', 1000, 'AllyCastSpeed'),
('AllyCastSpeed4', 'Talent', 6, 4, 'Allies in your Presence have (5-8)% increased Cast Speed', 'sceptre', 'caster,speed', 1000, 'AllyCastSpeed'),

-- Ally Critical Hit Chance
('AllyCriticalHitChance1', 'Unmaking', 76, 60, 'Allies in your Presence have (35-38)% increased Critical Hit Chance', 'sceptre', 'critical', 125, 'AllyCriticalHitChance'),
('AllyCriticalHitChance2', 'Ruin', 59, 47, 'Allies in your Presence have (30-34)% increased Critical Hit Chance', 'sceptre', 'critical', 250, 'AllyCriticalHitChance'),
('AllyCriticalHitChance3', 'Calamity', 41, 32, 'Allies in your Presence have (25-29)% increased Critical Hit Chance', 'sceptre', 'critical', 500, 'AllyCriticalHitChance'),
('AllyCriticalHitChance4', 'Disaster', 28, 22, 'Allies in your Presence have (20-24)% increased Critical Hit Chance', 'sceptre', 'critical', 1000, 'AllyCriticalHitChance'),
('AllyCriticalHitChance5', 'Havoc', 21, 16, 'Allies in your Presence have (15-19)% increased Critical Hit Chance', 'sceptre', 'critical', 1000, 'AllyCriticalHitChance'),
('AllyCriticalHitChance6', 'Menace', 11, 8, 'Allies in your Presence have (10-14)% increased Critical Hit Chance', 'sceptre', 'critical', 1000, 'AllyCriticalHitChance'),

-- Ally Critical Damage Bonus
('AllyCriticalDamageBonus1', 'Destruction', 73, 58, 'Allies in your Presence have (35-39)% increased Critical Damage Bonus', 'sceptre', 'damage,critical', 125, 'AllyCriticalDamageBonus'),
('AllyCriticalDamageBonus2', 'Ferocity', 59, 47, 'Allies in your Presence have (30-34)% increased Critical Damage Bonus', 'sceptre', 'damage,critical', 250, 'AllyCriticalDamageBonus'),
('AllyCriticalDamageBonus3', 'Fury', 44, 35, 'Allies in your Presence have (25-29)% increased Critical Damage Bonus', 'sceptre', 'damage,critical', 500, 'AllyCriticalDamageBonus'),
('AllyCriticalDamageBonus4', 'Rage', 30, 24, 'Allies in your Presence have (20-24)% increased Critical Damage Bonus', 'sceptre', 'damage,critical', 1000, 'AllyCriticalDamageBonus'),
('AllyCriticalDamageBonus5', 'Anger', 21, 16, 'Allies in your Presence have (15-19)% increased Critical Damage Bonus', 'sceptre', 'damage,critical', 1000, 'AllyCriticalDamageBonus'),
('AllyCriticalDamageBonus6', 'Ire', 8, 6, 'Allies in your Presence have (10-14)% increased Critical Damage Bonus', 'sceptre', 'damage,critical', 1000, 'AllyCriticalDamageBonus'),

-- Presence Area
('PresenceArea1', 'Influence', 72, 57, '(66-80)% increased Presence Area of Effect', 'sceptre', '', 500, 'PresenceArea'),
('PresenceArea2', 'Guidance', 56, 44, '(56-65)% increased Presence Area of Effect', 'sceptre', '', 500, 'PresenceArea'),
('PresenceArea3', 'Outreach', 40, 32, '(46-55)% increased Presence Area of Effect', 'sceptre', '', 500, 'PresenceArea'),
('PresenceArea4', 'Direction', 23, 18, '(36-45)% increased Presence Area of Effect', 'sceptre', '', 500, 'PresenceArea'),

-- Minion Life
('MinionLife1', 'Rector', 80, 64, 'Minions have (46-50)% increased maximum Life', 'sceptre', 'life,minion', 1000, 'MinionLife'),
('MinionLife2', 'Administrator', 64, 51, 'Minions have (41-45)% increased maximum Life', 'sceptre', 'life,minion', 1000, 'MinionLife'),
('MinionLife3', 'Headmaster', 48, 38, 'Minions have (36-40)% increased maximum Life', 'sceptre', 'life,minion', 1000, 'MinionLife'),
('MinionLife4', 'Director', 32, 25, 'Minions have (31-35)% increased maximum Life', 'sceptre', 'life,minion', 1000, 'MinionLife'),
('MinionLife5', 'Tutor', 16, 12, 'Minions have (26-30)% increased maximum Life', 'sceptre', 'life,minion', 1000, 'MinionLife'),
('MinionLife6', 'Mentor', 2, 1, 'Minions have (21-25)% increased maximum Life', 'sceptre', 'life,minion', 1000, 'MinionLife');