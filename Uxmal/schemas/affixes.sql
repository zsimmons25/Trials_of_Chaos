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
('IncreasedEnergyShieldAndLife6', 'Monk', 10, 8, '(6–13)% increased Energy Shield \n +(7–10) to maximum Life', 'int_armour', 'defenses', 1000, 'DefencesAndLife'),
('IncreasedEnergyShieldPercent6', 'Resolute', 27, 21, '(43–55)% increased Energy Shield', 'int_armour', 'defenses', 1000, 'DefencesPercent'),
('IncreasedEnergyShield10', 'Glimmering', 11, 8, '+(18–24) to maximum Energy Shield', 'int_armour', 'defenses', 1000, 'BaseDefences'),
('AddedLightningDamageTwoHand10', 'Humming', 1, 1, 'Adds 1 to (7–10) Lightning Damage', 'crossbow, quarterstaff, th_sword, th_axe, th_mace', 'elemental_damage, elemental, damage, lightning, attack', 1100, 'LightningDamage'),
('IncreasedPhysicalPercentAccuracy8', 'Squire', 1, 1, '(15–19)% increased Physical Damage \n +(16–20) to Accuracy Rating', 'weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalPercentAccuracy'),
('AddedPhysicalDamage1', 'Flaring', 77, 61, 'Adds (26–39) to (44–66) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 100, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand1', 'Flaring', 77, 61, 'Adds (37–55) to (63–94) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 100, 'PhysicalDamage'),
('AddedPhysicalDamage2', 'Tempered', 65, 52, 'Adds (21–31) to (36–53) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 200, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand2', 'Tempered', 65, 52, 'Adds (29–44) to (50–75) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 200, 'PhysicalDamage'),
('AddedPhysicalDamage3', 'RazorSharp', 54, 43, 'Adds (16–24) to (28–42) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 400, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand3', 'RazorSharp', 54, 43, 'Adds (23–35) to (39–59) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 400, 'PhysicalDamage'),
('AddedPhysicalDamage4', 'Annealed', 46, 36, 'Adds (13–20) to (23–35) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 600, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand4', 'Annealed', 46, 36, 'Adds (19–29) to (33–49) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 600, 'PhysicalDamage'),
('AddedPhysicalDamage5', 'Gleaming', 36, 28, 'Adds (10–15) to (18–26) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand5', 'Gleaming', 36, 28, 'Adds (14–21) to (25–37) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamage6', 'Honed', 29, 23, 'Adds (8–12) to (14–21) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand6', 'Honed', 29, 23, 'Adds (11–17) to (20–30) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamage7', 'Polished', 21, 16, 'Adds (6–9) to (11–16) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand7', 'Polished', 21, 16, 'Adds (8–12) to (15–22) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamage8', 'Burnished', 13, 10, 'Adds (4–6) to (7–11) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand8', 'Burnished', 13, 10, 'Adds (5–8) to (10–15) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamage9', 'Glinting', 2, 1, 'Adds (1–2) to (4–5) Physical Damage', 'bow, one_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage'),
('AddedPhysicalDamageTwoHand9', 'Glinting', 2, 1, 'Adds (2–3) to (5–7) Physical Damage', 'two_hand_weapon', 'physical_damage, physical, damage, attack', 1000, 'PhysicalDamage');

INSERT INTO suffixes (id, affix_name, ilvl, clvl, effect, item_tags, craft_tags, weighting, family) VALUES
('AttributeRequirements4', 'Apt', 32, 25, '20% reduced Attribute Requirements', 'int_armour', '', 900, 'AttributeRequirements'),
('FireResistance6', 'Drake', 24, 19, '+(16–20)% to Fire Resistance', 'int_armour', 'elemental, fire, resistance', 1000, 'FireResistance'),
('Intelligence6', 'Prodigy', 22, 17, '+(13–16) to Intelligence', 'int_armour', 'attribute', 1000, 'Intelligence'),
('IncreasedAttackSpeed6', 'Mastery', 22, 17, '(11–13)% increased Attack Speed', 'weapon', 'attack, speed', 1000, 'IncreasedAttackSpeed'),
('LifeGainedFromEnemyDeath8', 'Success', 1, 1, 'Gain (4–6) Life per Enemy Killed', 'weapon, wand, staff, ring, gloves, quiver, trap', 'life, resource', 750, 'LifeGainedFromEnemyDeath'),
('StunDamageIncrease6', 'Pugilist', 5, 4, 'Causes (21–30)% increased Stun Buildup', 'weapon', '', 1000, 'StunDamageIncrease'),
('MeleeSkillGemLevel1', 'War', 81, 64, '+5 to Level of all Melee Skills', 'one_hand_weapon, spear', 'attack', 100, 'IncreaseGemLevel'),
('MeleeSkillGemLevelTwoHand1', 'War', 81, 64, '+7 to Level of all Melee Skills', 'two_hand_weapon', 'attack', 100, 'IncreaseGemLevel'),
('MeleeSkillGemLevel2', 'Battle', 55, 44, '+4 to Level of all Melee Skills', 'one_hand_weapon, spear', 'attack', 250, 'IncreaseGemLevel'),
('MeleeSkillGemLevelTwoHand2', 'Battle', 55, 44, '+(5-6) to Level of all Melee Skills', 'two_hand_weapon', 'attack', 250, 'IncreaseGemLevel'),
('MeleeSkillGemLevel3', 'Conflict', 36, 28, '+3 to Level of all Melee Skills', 'one_hand_weapon, spear', 'attack', 500, 'IncreaseGemLevel'),
('MeleeSkillGemLevelTwoHand3', 'Conflict', 36, 28, '+4 to Level of all Melee Skills', 'two_hand_weapon', 'attack', 500, 'IncreaseGemLevel'),
('MeleeSkillGemLevel4', 'Dueling', 18, 14, '+2 to Level of all Melee Skills', 'one_hand_weapon, spear', 'attack', 750, 'IncreaseGemLevel'),
('MeleeSkillGemLevelTwoHand4', 'Dueling', 18, 14, '+3 to Level of all Melee Skills', 'two_hand_weapon', 'attack', 750, 'IncreaseGemLevel'),
('MeleeSkillGemLevel5', 'Combat', 2, 1, '+1 to Level of all Melee Skills', 'one_hand_weapon, spear', 'attack', 1000, 'IncreaseGemLevel'),
('MeleeSkillGemLevelTwoHand5', 'Combat', 2, 1, '+(1-2) to Level of all Melee Skills', 'two_hand_weapon', 'attack', 1000, 'IncreaseGemLevel');
