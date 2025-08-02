CREATE DATABASE IF NOT EXISTS enchants;
USE enchants;

CREATE TABLE IF NOT EXISTS enchants (
    id VARCHAR(255) PRIMARY KEY,
    effect VARCHAR(255) NOT NULL,
    item_slots VARCHAR(255) NOT NULL,
    item_tags VARCHAR(255),
    scope VARCHAR(255),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    weighting INT NOT NULL DEFAULT 1000
);

INSERT INTO enchants (id, effect, item_slots, item_tags, scope, active) VALUES
-- General
('IncreasedArmourPercent', '(15-25)% increased Armour', 'armour, offhand', 'str_armour, shield', 'local', TRUE),
('IncreasedEvasionPercent', '(15-25)% increased Evasion Rating', 'armour, offhand', 'dex_armour, shield', 'local', TRUE),
('IncreasedEnergyShieldPercent', '(15-25)% increased Energy Shield', 'armour, offhand', 'int_armour, focus', 'local', TRUE),
('IncreasedArmourEvasionPercent', '(15-25)% increased Armour and Evasion', 'armour, offhand', 'str_dex_armour, shield', 'local', TRUE),
('IncreasedArmourEnergyShieldPercent', '(15-25)% increased Armour and Energy Shield', 'armour, offhand', 'str_int_armour, shield', 'local', TRUE),
('IncreasedEvasionEnergyShieldPercent', '(15-25)% increased Evasion and Energy Shield', 'armour, offhand', 'dex_int_armour', 'local', TRUE),
('ReducedLocalAttributeRequirements', '(10-20)% reduced Attribute Requirements', 'weapon, armour, offhand', 'two_hand, one_hand, bow, staff, wand, sceptre, shield, focus, str_armour, dex_armour, int_armour, str_dex_armour, str_int_armour, dex_int_armour', 'local', TRUE),

-- //
-- Armour
-- //

-- Body Armour
('IncreasedThornsDamage', '(40-50)% increased Thorns Damage', 'body_armour, offhand', 'shield', 'local', TRUE),
('PhysicalDamageReduction', '(3-5)% additional Physical Damage Reduction', 'body_armour', '', 'global', TRUE),
('LifeRecoup', '(10-20)% of Damage taken Recouped as Life', 'body_armour', '', 'global', TRUE),
('ManaRecoup', '(10-20)% of Damage taken Recouped as Mana', 'body_armour', '', 'global', TRUE),
('FlatLife', '+(30-40) to maximum Life', 'body_armour', '', 'global', TRUE),
('ChaosResBody', '+(13-19)% to Chaos Resistance', 'body_armour', '', 'global', TRUE),
('MaxiumEleRes', '+1% to all Maximum Elemental Resistances', 'body_armour, amulet', '', 'global', TRUE),

-- Helmet
('IncreasedMinionGemLevel', '+1 to Level of all Minion Gems', 'helmet', '', 'global', TRUE),
('FlatSpirit', '+(20-30) Spirit', 'helmet', '', 'global', TRUE),
('MaximumPowerCharge', '+1 to Maximum Power Charges', 'helmet', '', 'global', TRUE),
('LifePercentRegen', '1-2% of Life Regenerated per Second', 'helmet, ring', '', 'global', FALSE),
('IncreasedLifeRegen', '(15-25)% increased Life Regeneration Rate', 'helmet, ring', '', 'global', TRUE),
('IncreasedManaRegen', '(20-30)% increased Mana Regeneration Rate', 'helmet, ring', '', 'global', TRUE),
('FlatAccuracy', '+(50-100) to Accuracy Rating', 'helmet, quiver', '', 'global', TRUE),
('MaximumColdRes', '+(1-3)% to Maximum Cold Resistance', 'helmet', '', 'global', TRUE),


-- Gloves
('IncreasedMeleeGemLevel', '+1 to Level of all Melee Skills', 'gloves', '', 'global', TRUE),
('MaximumFrenzyCharge', '+1 to Maximum Frenzy Charges', 'gloves', '', 'global', TRUE),
('IncreasedWeaponSwapSpeed', '(20-30)% increased Weapon Swap Speed', 'gloves', '', 'global', TRUE),
('IncreasedArmourBreak', 'Break (10-15)% increased Armour ', 'gloves', '', 'global', TRUE),
('IncreasedSlowEffect', 'Debuffs you inflict have (20-30)% increased Slow Magnitude', 'gloves', '', 'global', FALSE),
('FirePenetration', 'Damage Penetrates (10-15)% Fire Resistance', 'gloves', '', 'global', TRUE),
('ColdPenetration', 'Damage Penetrates (10-15)% Cold Resistance', 'gloves', '', 'global', TRUE),
('LightningPenetration', 'Damage Penetrates (10-15)% Lightning Resistance', 'gloves', '', 'global', TRUE),

-- Boots
('IncreasedMovementSpeed', '(3-5)% increased Movement Speed', 'boots', '', 'local', TRUE),
('ReducedSlowPotency', '(20-30)% reduced Slowing Potency of Debuffs on You', 'boots', '', 'global', TRUE),
('IncreasedStunThreshold', '(20-30)% increased Stun Threshold', 'boots', '', 'global', TRUE),
('IncreasedFreezeThreshold', '(20-30)% increased Freeze Threshold', 'boots', '', 'global', TRUE),
('MaximumLightningRes', '+(1-3)% to Maximum Lightning Resistance', 'boots', '', 'global', TRUE),

-- //
-- Offhands
-- //

-- Focus
('EnergyShieldRechargeTime', '(20-30)% faster start of Energy Shield Recharge', 'offhand', 'focus', 'global', TRUE),
('IncreasedSpellDamage', '(20-30)% increased Spell Damage', 'weapon, offhand', 'wand, focus', 'local', TRUE),
('FlatMana', '+(20-25) to maximum Mana', 'offhand', 'focus, quiver', 'global', TRUE),

-- Shield
('IncreasedBlockChance', '(20-30)% increased Block chance', 'offhand', 'shield', 'local', TRUE),
('MaximumBlockChance', '+3% to maximum Block chance', 'offhand', 'shield', 'global', TRUE),
('LifeGainOnBlock', '(20-25) Life gained when you Block', 'offhand', 'shield', 'global', TRUE),
('ManaGainOnBlock', '(10-15) Mana gained when you Block', 'offhand', 'shield', 'global', TRUE),

-- Quiver
('LifeGainOnKill', 'Gain (20-25) Life per Enemy Killed', 'weapon, offhand', 'quiver, staff, wand', 'global', TRUE),
('ManaGainOnKill', 'Gain (10-15) Mana per Enemy Killed', 'weapon, offhand', 'quiver, staff, wand', 'global', TRUE),
('IncreasedProjectilePierceChance', '(20-30)% chance to Pierce an Enemy', 'offhand', 'quiver', 'global', TRUE),
('RicochetChance', 'Projectiles have (10-20)% chance to Chain an additional time from terrain', 'offhand', 'quiver', 'global', TRUE),
('IncreasedCriticalDamageBonus', '(15-20)% increased Critical Damage Bonus', 'offhand, ring', 'quiver', 'global', TRUE),
('GlobalIncreasedDamage', '(20-30)% increased Damage', 'offhand, ring', 'quiver', 'global', TRUE),
('IncreasedSkillSpeed', '(4-6)% Increased Skill Speed', 'offhand, ring', 'quiver', 'global', TRUE),

-- //
-- Weapons
-- //

-- One Handed
('IncreasedWED', '(20-30)% increased Elemental Damage with Attacks', 'weapon', 'bow, one_hand', 'local', TRUE),
('FlatFireDamage', 'Adds (9-14) to (15-22) Fire Damage', 'weapon', 'bow, one_hand', 'local', TRUE),
('FlatColdDamage', 'Adds (8-12) to (13-19) Cold Damage', 'weapon', 'bow, one_hand', 'local', TRUE),
('FlatLightningDamage', 'Adds (1-2) to (29-43) Lightning Damage', 'weapon', 'bow, one_hand', 'local', TRUE),
('FlatChaosDamage', 'Adds (7-11) to (12-18) Chaos Damage', 'weapon', 'bow, one_hand', 'local', TRUE),

-- Two Handed
('IncreasedWEDTwoHand', '(40-50)% increased Elemental Damage with Attacks', 'weapon', 'two_hand', 'local', TRUE),
('FlatFireDamageTwoHand', 'Adds (13-20) to (21-31) Fire Damage', 'weapon', 'two_hand', 'local', TRUE),
('FlatColdDamageTwoHand', 'Adds (11-17) to (18-26) Cold Damage', 'weapon', 'two_hand', 'local', TRUE),
('FlatLightningDamageTwoHand', 'Adds (1-3) to (41-61) Lightning Damage', 'weapon', 'two_hand', 'local', TRUE),
('FlatChaosDamageTwoHand', 'Adds (10-16) to (17-25) Chaos Damage', 'weapon', 'two_hand', 'local', TRUE),

-- Martial
('IncrasedAttackSpeed', '(6-8)% increased Attack Speed', 'weapon', 'axe, two_hand_axe, mace, two_hand_mace, sword, two_hand_sword, claw, dagger, flail, spear, quarterstaff, bow, crossbow', 'local', TRUE),
('IncreasedPhysicalDamage', '(15-25)% increased Physical Damage', 'weapon', 'axe, two_hand_axe, mace, two_hand_mace, sword, two_hand_sword, claw, dagger, flail, spear, quarterstaff, bow, crossbow', 'local', TRUE),
('IncreasedCriticalDamageMultiplier', '+(10-15)% to Critical Damage Bonus', 'weapon', 'axe, two_hand_axe, mace, two_hand_mace, sword, two_hand_sword, claw, dagger, flail, spear, quarterstaff, bow, crossbow', 'local', TRUE),

-- Melee
('RageGainOnHit', 'Gain 1 Rage on Hit', 'weapon', 'axe, two_hand_axe, mace, two_hand_mace, sword, two_hand_sword, claw, dagger, flail, quarterstaff', 'local', TRUE),
('IncreasedWeaponRange', '(10-20)% increased Melee Strike Range with this weapon', 'weapon', 'axe, two_hand_axe, mace, two_hand_mace, sword, two_hand_sword, claw, dagger, flail, quarterstaff', 'local', TRUE),

-- Ranged
('BlindChance', '(5-10)% chance to Blind Enemies on hit', 'weapon', 'bow, crossbow', 'global', TRUE),
('MaimChance', '(10-15)% chance to Maim Enemies on hit', 'weapon', 'bow, crossbow', 'global', TRUE),
('AdditionalArrow', 'Bow Attacks fire an additional Arrow', 'weapon', 'bow', 'global', TRUE),
('BoltsLoaded', 'Loads an additional Bolt', 'weapon', 'crossbow', 'global', TRUE),

-- Specific
('BleedChance', '(10-15)% chance to cause Bleeding on Hit', 'weapon', 'axe, two_hand_axe, mace, two_hand_mace, sword, two_hand_sword', 'local', TRUE),
('PoisonChance', '(10-15)% chance to Poison on Hit', 'weapon', 'claw, dagger, quarterstaff', 'local', TRUE),

-- Sceptre
('IncreasedAllyDamage', 'Allies in your Presence deal (20-30)% increased Damage', 'weapon', 'sceptre', 'global', TRUE),
('IncreasedAllyAttackSpeed', 'Allies in your Presence have (5-10)% increased Attack Speed', 'weapon', 'sceptre', 'global', TRUE),
('IncreasedAllyCastSpeed', 'Allies in your Presence have (5-10)% increased Cast Speed', 'weapon', 'sceptre', 'global', TRUE),
('IncreasedAllyCritDamage', 'Allies in your Presence have (10-15)% increased Critical Damage Bonus', 'weapon', 'sceptre', 'global', TRUE),
('IncreasedLocalSpirit', '(15-25)% increased Spirit', 'weapon', 'sceptre', 'global', TRUE),

-- Staffs & Wands
('IncreasedSpellDamageTwoHand', '(40-50)% increased Spell Damage', 'weapon', 'staff', 'local', TRUE),
('IncreasedCastSpeed', '(10-15)% increased Cast Speed', 'weapon', 'staff, wand', 'global', TRUE),
('IncreasedSpellCritChance', '(20-30)% increased Critical Hit Chance for Spells', 'weapon', 'staff, wand', 'global', TRUE),
('IncreasedIgniteChance', '(20-30)% increased chance to Ignite', 'weapon', 'staff, wand', 'global', TRUE),
('IncreasedFreezeBuildup', '(20-30)% increased Freeze Buildup', 'weapon', 'staff, wand', 'global', TRUE),
('IncreasedShockChance', '(20-30)% increased chance to Shock', 'weapon', 'staff, wand', 'global', TRUE),
('IncreasedPhysicalGemLevel', '+1 to Level of all Physical Spell Skills', 'weapon', 'staff, wand', 'global', TRUE),
('IncreasedFireGemLevel', '+1 to Level of all Fire Spell Skills', 'weapon', 'staff, wand', 'global', TRUE),
('IncreasedColdGemLevel', '+1 to Level of all Cold Spell Skills', 'weapon', 'staff, wand', 'global', TRUE),
('IncreasedLightningGemLevel', '+1 to Level of all Lightning Spell Skills', 'weapon', 'staff, wand', 'global', TRUE),
('IncreasedChaosGemLevel', '+1 to Level of all Chaos Spell Skills', 'weapon', 'staff, wand', 'global', TRUE),

-- //
-- Jewellery
-- //

-- General
('FlatStrength', '+(10-15) to Strength', 'amulet, belt, ring', '', 'global', TRUE),
('FlatDexterity', '+(10-15) to Dexterity', 'amulet, belt, ring', '', 'global', TRUE),
('FlatIntelligence', '+(10-15) to Intelligence', 'amulet, belt, ring', '', 'global', TRUE),
('AllRes', '+(5-10)% to all Elemental Resistances', 'amulet, ring', '', 'global', TRUE),
('IncreasedRarity', '(10-15)% increased Rarity of Items found', 'amulet, ring', '', 'global', TRUE),

-- Amulet
('IncreasedGemLevel', '+1 to Level of all Skill Gems', 'amulet', '', 'global', TRUE),
('ChargeGainCharm', 'Charms gain (0.08-0.17) charges per Second', 'amulet', '', 'global', TRUE),
('ChargeGainLife', 'Life Flasks gain (0.08-0.17) charges per Second', 'amulet', '', 'global', TRUE),
('ChargeGainMana', 'Mana Flasks gain (0.08-0.17) charges per Second', 'amulet', '', 'global', TRUE),
('LeechLifePhysical', 'Leech 3% of Physical Attack Damage as Life', 'amulet', '', 'global', TRUE),
('LeechManaPhysical', 'Leech 2% of Physical Attack Damage as Mana', 'amulet', '', 'global', TRUE),

-- Belt
('FireRes', '+(20-25)% to Fire Resistance', 'belt', '', 'global', TRUE),
('ColdRes', '+(20-25)% to Cold Resistance', 'belt', '', 'global', TRUE),
('LightningRes', '+(20-25)% to Lightning Resistance', 'belt', '', 'global', TRUE),
('MaxmiumIncreasedEnergyShield', '(15-25)% increased maximum Energy Shield', 'belt', '', 'global', TRUE),
('MaximumEnduranceCharge', '+1 to Maximum Endurance Charges', 'belt', '', 'global', TRUE),
('MaximumFireRes', '+(1-3)% to Maximum Fire Resistance', 'belt', '', 'global', TRUE),

-- Ring
('ChaosResRing', '+(13-19)% to Chaos Resistance', 'ring', '', 'global', TRUE),


-- //
-- Jewels
-- //

('FlatStrengthJewel', '+(4-6) to Strength', 'jewel', '', 'global', TRUE),
('FlatDexterityJewel', '+(4-6) to Dexterity', 'jewel', '', 'global', TRUE),
('FlatIntelligenceJewel', '+(4-6) to Intelligence', 'jewel', '', 'global', TRUE),
('FlatStrengthJewelLeg', '+(5-10) to Strength', 'jewel', '', 'global', FALSE),
('FlatDexterityJewelLeg', '+(5-10) to Dexterity', 'jewel', '', 'global', FALSE),
('FlatIntelligenceJewelLeg', '+(5-10) to Intelligence', 'jewel', '', 'global', FALSE),
('FireResJewel', '+(5-10)% to Fire Resistance', 'jewel', '', 'global', TRUE),
('ColdResJewel', '+(5-10)% to Cold Resistance', 'jewel', '', 'global', TRUE),
('LightningResJewel', '+(5-10)% to Lightning Resistance', 'jewel', '', 'global', TRUE),
('ChaosResJewel', '+(3-7)% to Chaos Resistance', 'jewel', '', 'global', TRUE),
('BlindImmunity', 'Cannot be Blinded', 'jewel', '', 'global', TRUE),
('MaimImmunity', 'Immune to Maim', 'jewel', '', 'global', TRUE),
('HinderImmunity', 'You cannot be Hindered', 'jewel', '', 'global', TRUE),
('CorruptedBloodImmunity', 'Corrupted Blood cannot be inflicted on you', 'jewel', '', 'global', TRUE);