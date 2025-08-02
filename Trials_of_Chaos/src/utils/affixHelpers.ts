import { Affix, AffixFamilyGroup } from '../types/affixes';
import { Base } from '../types/items';
import { Enchant } from '../types/enchants';

interface ActiveSelection {
  slot: string;
  subtype: string;
  shieldType?: string;
  baseType?: string;
  ringSlot?: 'left' | 'right';
}

interface AffixMatchResult {
  prefixes: AffixFamilyGroup[];
  suffixes: AffixFamilyGroup[];
}

export const selectRandomEnchant = (
  enchants: Enchant[],
  itemClass: string,
  base?: Base // Optional base parameter for enhanced filtering
): Enchant | null => {
  // Filter enchants based on item class and item slots
  const applicableEnchants = enchants.filter((enchant) => {
    // Check if the enchant is active (handle both boolean and number types)
    const isActive = enchant.active === true || enchant.active === 1;
    if (!isActive) return false;

    // Get the item slots this enchant can apply to
    const enchantSlots = enchant.item_slots
      ? enchant.item_slots.split(', ')
      : [];

    // Map item class to enchant slot categories (matching your DB structure)
    const getSlotCategory = (itemClass: string): string => {
      switch (itemClass) {
        case 'Helmet':
          return 'helmet';
        case 'Body Armour':
          return 'body_armour';
        case 'Gloves':
          return 'gloves';
        case 'Boots':
          return 'boots';
        case 'Shield':
        case 'Focus':
        case 'Quiver':
          return 'offhand';
        case 'One Hand Axe':
        case 'Two Hand Axe':
        case 'One Hand Mace':
        case 'Two Hand Mace':
        case 'One Hand Sword':
        case 'Two Hand Sword':
        case 'Claw':
        case 'Dagger':
        case 'Flail':
        case 'Spear':
        case 'Bow':
        case 'Crossbow':
        case 'Staff':
        case 'Quarterstaff':
        case 'Wand':
        case 'Sceptre':
          return 'weapon';
        case 'Ring':
          return 'ring';
        case 'Belt':
          return 'belt';
        case 'Amulet':
          return 'amulet';
        case 'Jewel':
          return 'jewel';
        default:
          return '';
      }
    };

    const itemSlotCategory = getSlotCategory(itemClass);

    // Check if this enchant can apply to this item slot
    // First check for exact slot match
    let slotMatches = enchantSlots.includes(itemSlotCategory);

    // If no exact match, check for broader category matches (like 'armour' for armor pieces)
    if (!slotMatches) {
      if (
        ['helmet', 'body_armour', 'gloves', 'boots'].includes(itemSlotCategory)
      ) {
        slotMatches = enchantSlots.includes('armour');
      }
    }

    if (!slotMatches) return false;

    // If the enchant has item_tags, check compatibility
    if (enchant.item_tags && base) {
      const enchantTags = enchant.item_tags.split(', ');
      const baseTags = base.item_tags
        ? base.item_tags.split(',').map((t) => t.trim())
        : [];

      // For weapons, check specific weapon type compatibility
      if (itemSlotCategory === 'weapon') {
        // Map item class to weapon tags (matching your DB tags)
        const getWeaponTags = (itemClass: string): string[] => {
          switch (itemClass) {
            case 'One Hand Axe':
            case 'One Hand Mace':
            case 'One Hand Sword':
            case 'Claw':
            case 'Dagger':
            case 'Flail':
            case 'Spear':
            case 'Wand':
            case 'Sceptre':
              return ['one_hand'];
            case 'Two Hand Axe':
            case 'Two Hand Mace':
            case 'Two Hand Sword':
            case 'Quarterstaff':
              return ['two_hand'];
            case 'Bow':
              return ['bow'];
            case 'Crossbow':
              return ['crossbow'];
            case 'Staff':
              return ['staff'];
            default:
              return [];
          }
        };

        const weaponTags = getWeaponTags(itemClass);
        // Check if any weapon tag matches any enchant tag
        if (
          weaponTags.length > 0 &&
          !weaponTags.some((tag) => enchantTags.includes(tag))
        ) {
          return false;
        }
      }

      // For shields and armor, check attribute requirements
      if (
        ['offhand', 'helmet', 'body_armour', 'gloves', 'boots'].includes(
          itemSlotCategory
        )
      ) {
        // If it's a shield, allow shield enchants
        if (itemClass === 'Shield' && enchantTags.includes('shield')) {
          return true;
        }

        // If it's a focus, allow focus enchants
        if (itemClass === 'Focus' && enchantTags.includes('focus')) {
          return true;
        }

        // For armor pieces, check if the enchant's armor type matches the base
        if (
          ['helmet', 'body_armour', 'gloves', 'boots'].includes(
            itemSlotCategory
          )
        ) {
          // Check if any base tag matches any enchant tag
          const hasMatchingTag = baseTags.some((baseTag) =>
            enchantTags.includes(baseTag)
          );
          if (enchantTags.length > 0 && !hasMatchingTag) {
            return false;
          }
        }

        // For shields, check armor attribute compatibility
        if (itemSlotCategory === 'offhand' && itemClass === 'Shield') {
          // Check if any base tag matches any enchant tag
          const hasMatchingTag = baseTags.some((baseTag) =>
            enchantTags.includes(baseTag)
          );
          if (enchantTags.length > 0 && !hasMatchingTag) {
            return false;
          }
        }
      }
    }

    return true;
  });

  if (applicableEnchants.length === 0) {
    return null;
  }

  // Select a random enchant from applicable ones, considering weighting
  const totalWeight = applicableEnchants.reduce(
    (sum, enchant) => sum + (enchant.weighting || 1000),
    0
  );
  let random = Math.random() * totalWeight;

  for (const enchant of applicableEnchants) {
    random -= enchant.weighting || 1000;
    if (random <= 0) {
      return enchant;
    }
  }

  // Fallback to last enchant
  return applicableEnchants[applicableEnchants.length - 1];
};

export const generateEnchantValue = (enchant: Enchant): number | null => {
  // Use the existing getValueRanges function to parse the enchant effect
  const valueRanges = getValueRanges(enchant.effect);

  if (valueRanges.length === 0) {
    return null;
  }

  // For enchants, we typically only have one value range
  const range = valueRanges[0];

  if (range.min === range.max) {
    return range.min;
  }

  const randomValue = Math.random() * (range.max - range.min) + range.min;

  // Round decimal values to 2 decimal places, integers stay as integers
  return range.isDecimal
    ? Math.round(randomValue * 100) / 100
    : Math.round(randomValue);
};

export const applyValueToEffect = (
  effect: string,
  value: number | null
): string => {
  if (value === null) return effect;

  // Replace the first range pattern with the generated value
  const rangePattern = /\(([^)]+)\)/;
  const match = effect.match(rangePattern);

  if (match) {
    // Format the value based on whether it's decimal or integer
    const formattedValue = Number.isInteger(value)
      ? value.toString()
      : value.toFixed(2).replace(/\.?0+$/, '');
    return effect.replace(rangePattern, formattedValue);
  }

  return effect;
};

export const generateImplicitValue = (
  base: Base
): { text: string; value: number | null } => {
  if (!base.implicit) return { text: '', value: null };

  // Check for decimal ranges first like (1.5-2.5)
  const decimalRangeMatch = base.implicit.match(
    /\((\d+\.\d+)-(\d+(?:\.\d+)?)\)/
  );
  if (decimalRangeMatch) {
    const min = parseFloat(decimalRangeMatch[1]);
    const max = parseFloat(decimalRangeMatch[2]);
    const randomValue = Math.random() * (max - min) + min;
    const roundedValue = Math.floor(randomValue * 100) / 100;
    const processedText = base.implicit.replace(
      /\((\d+\.\d+)-(\d+(?:\.\d+)?)\)/,
      roundedValue.toString()
    );
    return { text: processedText, value: roundedValue };
  }

  // Check for integer ranges like (10-20) - must not have decimals
  const integerRangeMatch = base.implicit.match(/\((\d+)-(\d+)\)/);
  if (integerRangeMatch) {
    const min = parseInt(integerRangeMatch[1]);
    const max = parseInt(integerRangeMatch[2]);
    const randomValue = Math.floor(Math.random() * (max - min + 1)) + min;
    const processedText = base.implicit.replace(
      /\((\d+)-(\d+)\)/,
      randomValue.toString()
    );
    return { text: processedText, value: randomValue };
  }

  // If no range found, return the original text and null value
  return { text: base.implicit, value: null };
};

const priorityMap: { [key: string]: number } = {
  // Damage
  PhysicalPercent: 1,
  PhysicalPercentAccuracy: 2,
  PhysicalDamage: 3,
  FireDamage: 4,
  ColdDamage: 5,
  LightningDamage: 6,
  ChaosDamage: 7,
  SpellDamage: 8,

  // Defenses
  Life: 10,
  Mana: 11,
  Armour: 12,
  ArmourPercent: 13,
  ArmourStunHybrid: 14,
  ArmourLifeHybrid: 15,
  ArmourManaHybrid: 16,
  Evasion: 15,
  EvasionLifeHybrid: 16,
  EnergyShield: 17,
  EnergyShieldLifeHybrid: 18,
  EvasionEnergyShieldHybrid: 19,
  EvasionEnergyShieldLifeHybrid: 20,

  // Attributes
  Strength: 25,
  Dexterity: 26,
  Intelligence: 27,
  AllAttributes: 28,
  AttributeRequirements: 29,

  // Resistances
  FireResistance: 30,
  ColdResistance: 31,
  LightningResistance: 32,
  ChaosResistance: 33,
  ElementalResistances: 34,

  // Miscellaneous
  IncreaseGemLevel: 41,
  LifeRegeneration: 42,
  CriticalStrikeChance: 43,
};

const getPriority = (family: string) => priorityMap[family] || 999;

const getCraftTagPriority = (craftTags: string): number => {
  if (!craftTags) return 999;
  const tagOrder = [
    'caster',
    'gem',
    'physical',
    'elemental',
    'fire',
    'cold',
    'lightning',
    'chaos',
  ];
  const tags = craftTags.split(',').map((t) => t.trim());

  // Build a priority value based on the order and presence of tags
  let priority = 0;
  for (let i = 0; i < tagOrder.length; i++) {
    if (tags.includes(tagOrder[i])) {
      priority += Math.pow(10, i);
    }
  }
  return priority === 0 ? 999 : priority;
};

export const getMatchingAffixes = (
  baseType: string,
  itemLevel: number,
  activeSelection: ActiveSelection | null,
  bases: Base[],
  affixesData: Affix[]
): AffixMatchResult => {
  if (!activeSelection?.baseType || !affixesData)
    return { prefixes: [], suffixes: [] };

  const selectedBase = bases.find((base) => base.base_name === baseType);
  if (!selectedBase) return { prefixes: [], suffixes: [] };

  const baseTags = selectedBase.item_tags
    ? selectedBase.item_tags.split(',').map((t) => t.trim())
    : [];
  const baseClass = selectedBase.item_class;

  // Get item class mapping for affixes
  const getItemClassForAffixes = (itemClass: string): string => {
    switch (itemClass) {
      case 'One Hand Axe':
      case 'One Hand Mace':
      case 'One Hand Sword':
      case 'Claw':
      case 'Dagger':
      case 'Flail':
      case 'Spear':
        return 'one_hand_weapon';
      case 'Two Hand Axe':
      case 'Two Hand Mace':
      case 'Two Hand Sword':
      case 'Crossbow':
      case 'Quarterstaff':
        return 'two_hand_weapon';
      case 'Bow':
        return 'bow';
      case 'Sceptre':
        return 'sceptre';
      case 'Staff':
        return 'staff';
      case 'Wand':
        return 'wand';
      case 'Helmet':
        return 'helmet';
      case 'Body Armour':
        return 'body_armour';
      case 'Gloves':
        return 'gloves';
      case 'Boots':
        return 'boots';
      case 'Shield':
        if (baseTags.includes('str_armour')) return 'str_shield';
        if (baseTags.includes('str_dex_armour')) return 'str_dex_shield';
        if (baseTags.includes('str_int_armour')) return 'str_int_shield';
        if (baseTags.includes('dex_armour')) return 'dex_shield';
        return 'shield';
      case 'Ring':
        return 'ring';
      case 'Belt':
        return 'belt';
      case 'Amulet':
        return 'amulet';
      case 'Quiver':
        return 'quiver';
      case 'Focus':
        return 'focus';
      default:
        return itemClass.toLowerCase();
    }
  };

  let itemTypeForAffixes = getItemClassForAffixes(baseClass);

  if (baseType.includes('Ruby')) {
    itemTypeForAffixes = 'ruby';
  } else if (baseType.includes('Emerald')) {
    itemTypeForAffixes = 'emerald';
  } else if (baseType.includes('Sapphire')) {
    itemTypeForAffixes = 'sapphire';
  } else if (baseType.includes('Diamond')) {
    itemTypeForAffixes = 'diamond';
  }

  // Filter affixes that can spawn on this item type and level
  const applicableAffixes = affixesData.filter((affix) => {
    // Check if item level is sufficient
    const levelMatches = itemLevel >= affix.ilvl;
    if (!levelMatches) return false;

    // Check if item type matches
    const affixItemTypes = affix.item_tags
      ? affix.item_tags.split(',').map((t) => t.trim())
      : [];

    const itemTypeMatches = affixItemTypes.some((type) => {
      if (
        ['ruby', 'emerald', 'sapphire', 'diamond'].includes(itemTypeForAffixes)
      ) {
        // Direct match for the specific jewel type
        if (type === itemTypeForAffixes) return true;

        // Allow ruby/emerald/sapphire-specific affixes on diamond jewels
        if (
          itemTypeForAffixes === 'diamond' &&
          ['ruby', 'emerald', 'sapphire'].includes(type)
        )
          return true;
      }
      // Direct item type match
      if (type === itemTypeForAffixes) return true;

      // Generic weapon match (for affixes that work on all weapons)
      if (
        type === 'weapon' &&
        ['one_hand_weapon', 'two_hand_weapon'].includes(itemTypeForAffixes)
      )
        return true;

      // One-hand weapon match (for affixes that work on all one-hand weapons)
      if (
        type === 'one_hand_weapon' &&
        itemTypeForAffixes === 'one_hand_weapon'
      )
        return true;

      // Two-hand weapon match (for affixes that work on all two-hand weapons)
      if (
        type === 'two_hand_weapon' &&
        itemTypeForAffixes === 'two_hand_weapon'
      )
        return true;

      // Bow match (for affixes that work on bows)
      if (type === 'bow' && itemTypeForAffixes === 'bow') return true;

      // Specific weapon type matches - map base item class to affix tags
      const weaponTypeMapping: { [key: string]: string[] } = {
        'One Hand Axe': ['axe'],
        'Two Hand Axe': ['axe'],
        'One Hand Mace': ['mace'],
        'Two Hand Mace': ['mace'],
        'One Hand Sword': ['sword'],
        'Two Hand Sword': ['sword'],
        Claw: ['claw'],
        Dagger: ['dagger'],
        Flail: ['flail'],
        Spear: ['spear'],
        Bow: ['bow'],
        Crossbow: ['crossbow'],
        Staff: ['staff'],
        Quarterstaff: ['quarterstaff'],
        Wand: ['wand'],
        Sceptre: ['sceptre'],
      };

      const specificWeaponTypes = weaponTypeMapping[baseClass] || [];
      if (specificWeaponTypes.includes(type)) return true;

      // Generic armor match (for affixes that work on all armor)
      if (
        type === 'armour' &&
        ['helmet', 'body_armour', 'gloves', 'boots'].includes(
          itemTypeForAffixes
        )
      ) {
        return true;
      }

      // For shields, also check generic 'shield' tag
      if (type === 'shield' && itemTypeForAffixes.includes('shield')) {
        return true;
      }

      if (type === 'armour' && itemTypeForAffixes.includes('shield')) {
        return true;
      }

      if (
        ['helmet', 'body_armour', 'gloves', 'boots'].includes(
          itemTypeForAffixes
        ) ||
        itemTypeForAffixes.includes('shield')
      ) {
        const armorAttributeTags = baseTags.filter((tag) =>
          tag.includes('_armour')
        );
        // Check if this affix supports the armor attribute type
        if (armorAttributeTags.some((armorTag) => type === armorTag)) {
          return true;
        }
      }

      return false;
    });

    // If basic item type doesn't match, reject immediately
    if (!itemTypeMatches) return false;

    // ONLY apply additional defensive filtering for affixes that have the 'defences' craft tag
    if (affix.craft_tags && affix.craft_tags.includes('defences')) {
      // For defensive affixes, they must include BOTH the specific item type AND the armor attribute
      const hasSpecificItemType =
        affixItemTypes.includes(itemTypeForAffixes) ||
        (itemTypeForAffixes.includes('shield') &&
          affixItemTypes.includes('shield'));

      if (!hasSpecificItemType) {
        // If it doesn't include the specific item type, reject it
        return false;
      }

      // Also check that the armor attribute matches (for shields and armor)
      if (itemTypeForAffixes.includes('shield')) {
        const armorAttributeTags = baseTags.filter((tag) =>
          tag.includes('_armour')
        );
        // For shields, allow specific shield type affixes OR matching armor attribute
        const hasMatchingDefensiveType =
          affixItemTypes.includes(itemTypeForAffixes) || // Specific shield type (str_shield, etc.)
          armorAttributeTags.some((baseTag) =>
            affixItemTypes.includes(baseTag)
          ); // Armor attribute match

        if (!hasMatchingDefensiveType) return false;
      } else if (
        ['helmet', 'body_armour', 'gloves', 'boots'].includes(
          itemTypeForAffixes
        )
      ) {
        const armorAttributeTags = baseTags.filter((tag) =>
          tag.includes('_armour')
        );
        const hasMatchingDefensiveType = armorAttributeTags.some((baseTag) =>
          affixItemTypes.includes(baseTag)
        );

        if (!hasMatchingDefensiveType) return false;
      }
    }

    // For shields, always check shield-specific armor attribute tags OR allow generic shield affixes
    if (itemTypeForAffixes.includes('shield')) {
      const requiredShieldTags = baseTags.filter((tag) =>
        tag.includes('_armour')
      );

      if (requiredShieldTags.length > 0) {
        // Different logic for prefixes vs suffixes
        if (affix.affix_type.toLowerCase() === 'prefix') {
          // For prefixes: Allow specific shield type affixes OR generic shield affixes OR matching armor attribute
          const hasMatchingShieldAttribute =
            affixItemTypes.includes(itemTypeForAffixes) ||
            affixItemTypes.includes('shield') ||
            requiredShieldTags.some((requiredTag) =>
              affixItemTypes.includes(requiredTag)
            );

          if (!hasMatchingShieldAttribute) return false;
        } else {
          // For suffixes: More permissive - allow generic armour, shield, specific shield types, or matching armor attribute
          const hasMatchingShieldAttribute =
            affixItemTypes.includes(itemTypeForAffixes) || // Specific shield type (str_shield, etc.)
            affixItemTypes.includes('shield') || // Generic shield
            affixItemTypes.includes('armour') || // Generic armour (for resistances)
            requiredShieldTags.some((requiredTag) =>
              affixItemTypes.includes(requiredTag)
            ); // Armor attribute match (str_armour, etc.)

          if (!hasMatchingShieldAttribute) return false;
        }
      }
    }

    return true;
  });

  // First, separate affixes by type (prefix/suffix)
  const prefixAffixes = applicableAffixes.filter(
    (affix) => affix.affix_type.toLowerCase() === 'prefix'
  );
  const suffixAffixes = applicableAffixes.filter(
    (affix) => affix.affix_type.toLowerCase() === 'suffix'
  );

  // Then group each type by family
  const prefixFamilyGroups = prefixAffixes.reduce(
    (groups, affix) => {
      const family = affix.family;
      if (!groups[family]) {
        groups[family] = [];
      }
      groups[family].push(affix);
      return groups;
    },
    {} as Record<string, typeof prefixAffixes>
  );

  const suffixFamilyGroups = suffixAffixes.reduce(
    (groups, affix) => {
      const family = affix.family;
      if (!groups[family]) {
        groups[family] = [];
      }
      groups[family].push(affix);
      return groups;
    },
    {} as Record<string, typeof suffixAffixes>
  );

  // Sort each family group by tier
  Object.keys(prefixFamilyGroups).forEach((family) => {
    prefixFamilyGroups[family].sort((a, b) => {
      if (b.ilvl !== a.ilvl) {
        return b.ilvl - a.ilvl;
      }
      return a.affix_name.localeCompare(b.affix_name);
    });
  });

  Object.keys(suffixFamilyGroups).forEach((family) => {
    suffixFamilyGroups[family].sort((a, b) => {
      if (b.ilvl !== a.ilvl) {
        return b.ilvl - a.ilvl;
      }
      return a.affix_name.localeCompare(b.affix_name);
    });
  });

  // Create family objects with highest tier affix as the representative
  const prefixFamilies: AffixFamilyGroup[] = [];
  const suffixFamilies: AffixFamilyGroup[] = [];

  Object.entries(prefixFamilyGroups).forEach(([family, affixes]) => {
    affixes.sort((a, b) => {
      const craftTagPriorityA = getCraftTagPriority(a.craft_tags || '');
      const craftTagPriorityB = getCraftTagPriority(b.craft_tags || '');

      if (craftTagPriorityA !== craftTagPriorityB) {
        return craftTagPriorityA - craftTagPriorityB;
      }

      if (b.ilvl !== a.ilvl) {
        return b.ilvl - a.ilvl;
      }
      return a.affix_name.localeCompare(b.affix_name);
    });

    const representative = affixes[0];
    const familyObj = { family, affixes, representative };
    prefixFamilies.push(familyObj);
  });

  Object.entries(suffixFamilyGroups).forEach(([family, affixes]) => {
    affixes.sort((a, b) => {
      const craftTagPriorityA = getCraftTagPriority(a.craft_tags || '');
      const craftTagPriorityB = getCraftTagPriority(b.craft_tags || '');

      if (craftTagPriorityA !== craftTagPriorityB) {
        return craftTagPriorityA - craftTagPriorityB;
      }

      if (b.ilvl !== a.ilvl) {
        return b.ilvl - a.ilvl;
      }
      return a.affix_name.localeCompare(b.affix_name);
    });

    const representative = affixes[0];
    const familyObj = { family, affixes, representative };
    suffixFamilies.push(familyObj);
  });

  // Sort families by priority, then highest tier representative, then name
  prefixFamilies.sort((a, b) => {
    const priorityA = getPriority(a.family);
    const priorityB = getPriority(b.family);

    if (priorityA !== priorityB) {
      return priorityA - priorityB;
    }

    if (b.representative.ilvl !== a.representative.ilvl) {
      return b.representative.ilvl - a.representative.ilvl;
    }
    return a.family.localeCompare(b.family);
  });

  suffixFamilies.sort((a, b) => {
    const priorityA = getPriority(a.family);
    const priorityB = getPriority(b.family);

    if (priorityA !== priorityB) {
      return priorityA - priorityB;
    }

    if (b.representative.ilvl !== a.representative.ilvl) {
      return b.representative.ilvl - a.representative.ilvl;
    }
    return a.family.localeCompare(b.family);
  });

  return { prefixes: prefixFamilies, suffixes: suffixFamilies };
};

export const getValueRanges = (
  effect: string
): Array<{ min: number; max: number; isDecimal: boolean }> => {
  const ranges: Array<{ min: number; max: number; isDecimal: boolean }> = [];
  const rangeMatches = effect.match(/\(([^)]+)\)/g);

  if (rangeMatches) {
    rangeMatches.forEach((match: string) => {
      const rangeContent = match.slice(1, -1);

      const decimalRangeMatch = rangeContent.match(
        /^(\d+\.\d+)-(\d+(?:\.\d+)?)$/
      );
      if (decimalRangeMatch) {
        const min = parseFloat(decimalRangeMatch[1]);
        const max = parseFloat(decimalRangeMatch[2]);
        ranges.push({ min, max, isDecimal: true });
        return;
      }

      const integerRangeMatch = rangeContent.match(/^(\d+)-(\d+)$/);
      if (integerRangeMatch) {
        const min = parseInt(integerRangeMatch[1]);
        const max = parseInt(integerRangeMatch[2]);
        ranges.push({ min, max, isDecimal: false });
        return;
      }

      const singleNumber = parseFloat(rangeContent);
      if (!isNaN(singleNumber)) {
        ranges.push({
          min: singleNumber,
          max: singleNumber,
          isDecimal: rangeContent.includes('.'),
        });
      }
    });
  }

  return ranges;
};

export const generateAffixValues = (affix: Affix): number[] => {
  const valueRanges = getValueRanges(affix.effect);
  return valueRanges.map((range) => {
    if (range.min === range.max) {
      return range.min;
    }
    const randomValue = Math.random() * (range.max - range.min) + range.min;
    // Round decimal values to 2 decimal places
    return range.isDecimal
      ? Math.round(randomValue * 100) / 100
      : Math.round(randomValue);
  });
};
