import React from 'react';
import { Affix } from './types/affixes';
import { Base, Item } from './types/items';

interface ItemDisplayProps {
  item: Item;
  bases: Base[];
  affixes: Affix[];
  rarity: 'normal' | 'magic' | 'rare';
  fracturedAffixId?: string | null;
}

interface ActiveAffixWithValue {
  definition: Affix;
  values: (number | undefined)[];
}

const TWO_HANDED_ITEM_CLASSES = new Set([
  'Crossbow',
  'Quarterstaff',
  'Staff',
  'Two Hand Sword',
  'Two Hand Axe',
  'Two Hand Mace',
]);

// Regex Patterns
// Matches a range like (1-10)
const RANGE_PATTERN = /\((\d+)[–\-−](\d+)\)/;
// Matches multiple ranges like (1-10)
const RANGE_PATTERN_GLOBAL = /\((\d+)[–\-−](\d+)\)/g;
// Matches multiple ranges like +(1-10)
const PLUS_RANGE_PATTERN_GLOBAL = /\+\((\d+)[–\-−](\d+)\)/g;
// Matches "Adds (X-Y) to (A-B)"
const ADDS_TO_PATTERN = /Adds \((\d+)[–\-−](\d+)\) to \((\d+)[–\-−](\d+)\)/;
// Matches "X to (A-B)"
const X_TO_RANGE_PATTERN = /(\d+) to \((\d+)[–\-−](\d+)\)/;
// Matches floats ranges like (1.53-2.54)
const FLOAT_PATTERN = /\((\d+(?:\.\d+)?)[–\-−](\d+(?:\.\d+)?)\)/g;
// Matches a single number
const SINGLE_NUMBER_PATTERN = /(\d+)/;

export const ItemDisplay: React.FC<ItemDisplayProps> = ({
  item,
  bases,
  affixes,
  rarity,
  fracturedAffixId,
}) => {
  const currentBase = bases.find((b) => b.base_name === item.base_type)!;

  // Update the look function to handle both IDs and names
  const look = (
    affixIdentifier?: string,
    itemClass?: string
  ): Affix | undefined => {
    if (!affixIdentifier || !affixes) {
      return undefined;
    }

    const byId = affixes.find((a) => a.id === affixIdentifier);
    if (byId) {
      return byId;
    }

    // Fallback to finding by name (for backward compatibility)
    const candidates = affixes.filter((a) => a.affix_name === affixIdentifier);
    if (candidates.length === 0) return undefined;
    if (candidates.length === 1) return candidates[0];

    if (itemClass) {
      const isItemTwoHanded = TWO_HANDED_ITEM_CLASSES.has(itemClass);
      if (isItemTwoHanded) {
        const twoHandMatch = candidates.find((c) =>
          c.item_tags.includes('two_hand_weapon')
        );
        if (twoHandMatch) return twoHandMatch;
      } else {
        const oneHandMatch = candidates.find((c) =>
          c.item_tags.includes('one_hand_weapon')
        );
        if (oneHandMatch) return oneHandMatch;
      }
    }
    return candidates[0];
  };

  const extractMultipleRangesFromEffect = (effect: string) => {
    const cleanEffect = effect.replace(/\n/g, ' ').trim();
    // Matches "Adds (X-Y) to (A-B)"
    const addsToMatch = cleanEffect.match(ADDS_TO_PATTERN);
    if (addsToMatch) {
      return {
        range1: {
          min: parseInt(addsToMatch[1]),
          max: parseInt(addsToMatch[2]),
        },
        range2: {
          min: parseInt(addsToMatch[3]),
          max: parseInt(addsToMatch[4]),
        },
      };
    }
    // Matches "X to (A-B)"
    const xToRangeMatch = cleanEffect.match(X_TO_RANGE_PATTERN);
    if (xToRangeMatch) {
      return {
        range1: {
          min: parseInt(xToRangeMatch[1]),
          max: parseInt(xToRangeMatch[1]),
        },
        range2: {
          min: parseInt(xToRangeMatch[2]),
          max: parseInt(xToRangeMatch[3]),
        },
      };
    }
    const ranges: { min: number; max: number }[] = [];
    const foundPatterns = new Set<string>();
    // Patterns for general ranges like (X-Y) or +(X-Y)
    const patterns = [RANGE_PATTERN_GLOBAL, PLUS_RANGE_PATTERN_GLOBAL];
    for (const pattern of patterns) {
      let match;
      pattern.lastIndex = 0; // Reset lastIndex for global regex
      while ((match = pattern.exec(cleanEffect)) !== null) {
        const min = parseInt(match[1]);
        const max = parseInt(match[2]);
        const patternKey = `${min}-${max}`;
        if (!foundPatterns.has(patternKey)) {
          ranges.push({ min, max });
          foundPatterns.add(patternKey);
        }
      }
    }
    return { range1: ranges[0] || null, range2: ranges[1] || null };
  };

  const processImplicitDisplay = (
    implicitText: string,
    actualValue: number | null
  ) => {
    if (!implicitText) return null;

    // If the text doesn't contain any ranges
    const hasRange = /\((\d+(?:\.\d+)?)[–\-−](\d+(?:\.\d+)?)\)/.test(
      implicitText
    );
    if (!hasRange) {
      return implicitText;
    }

    // Matches a range like (1-10) or (1.5-2.5)
    const rangeMatch = implicitText.match(RANGE_PATTERN);
    if (rangeMatch && actualValue !== null) {
      return implicitText.replace(RANGE_PATTERN, actualValue.toString());
    }

    // Matches a single number
    const singleMatch = implicitText.match(SINGLE_NUMBER_PATTERN);
    if (singleMatch && actualValue !== null) {
      return implicitText.replace(
        SINGLE_NUMBER_PATTERN,
        actualValue.toString()
      );
    }

    return implicitText;
  };

  const processAffixEffect = (
    definition: Affix,
    values: (number | undefined)[]
  ) => {
    const ranges = extractMultipleRangesFromEffect(definition.effect);
    let effectString = definition.effect;
    const valsToSub = [...values];

    // Matches "Adds (X-Y) to (A-B)"
    if (ADDS_TO_PATTERN.test(effectString)) {
      const val1 = valsToSub.shift();
      const val2 = valsToSub.shift();
      effectString = effectString.replace(
        ADDS_TO_PATTERN,
        () =>
          `Adds ${val1 !== undefined ? val1 : '(?)'} to ${val2 !== undefined ? val2 : '(?)'}`
      );
    }
    // Matches "X to (A-B)"
    else if (X_TO_RANGE_PATTERN.test(effectString)) {
      const val1 = valsToSub.shift();
      const val2 = valsToSub.shift();
      effectString = effectString.replace(X_TO_RANGE_PATTERN, () => {
        const minVal = val1 !== undefined ? val1 : ranges.range1?.min ?? '(?)';
        const maxVal = val2 !== undefined ? val2 : ranges.range2?.max ?? '(?)';
        return `${minVal} to ${maxVal}`;
      });
    }
    // Handle multi-line effects
    else if (effectString.includes('\n')) {
      const lines = effectString.split('\n');
      const processedLines = lines.map((line) => {
        let processedLine = line;

        // Handle percentage patterns like "(75-79)%" first
        const percentPattern = /\((\d+(?:\.\d+)?)[–\-−](\d+(?:\.\d+)?)\)%/;
        if (percentPattern.test(processedLine)) {
          const val = valsToSub.shift();
          processedLine = processedLine.replace(percentPattern, () => {
            return val !== undefined ? `${val}%` : '(?)%';
          });
        }

        // Handle plus patterns like "+(175-200)"
        const plusFlatPattern = /\+\((\d+(?:\.\d+)?)[–\-−](\d+(?:\.\d+)?)\)/;
        if (plusFlatPattern.test(processedLine)) {
          const val = valsToSub.shift();
          processedLine = processedLine.replace(plusFlatPattern, () => {
            return val !== undefined ? `+${val}` : '+(?)';
          });
        }

        // Handle regular patterns like "(1-10)"
        const rangePattern = /\((\d+(?:\.\d+)?)[–\-−](\d+(?:\.\d+)?)\)/;
        if (rangePattern.test(processedLine)) {
          const val = valsToSub.shift();
          processedLine = processedLine.replace(rangePattern, () => {
            return val !== undefined ? String(val) : '(?)';
          });
        }

        return processedLine;
      });

      effectString = processedLines.join('\n');
    }
    // Handle single-line patterns with + prefix like "+(4.41-5)% to Critical Hit Chance"
    else {
      const plusRangePattern = /\+\((\d+(?:\.\d+)?)[–\-−](\d+(?:\.\d+)?)\)/;
      if (plusRangePattern.test(effectString)) {
        effectString = effectString.replace(plusRangePattern, () => {
          const val = valsToSub.shift();
          return val !== undefined ? `+${val}` : '+(?)';
        });
      } else {
        // Fallback to general range replacement
        effectString = effectString.replace(RANGE_PATTERN_GLOBAL, () => {
          const val = valsToSub.shift();
          return val !== undefined ? String(val) : '(?)';
        });
      }
    }
    // Replace all float ranges
    effectString = effectString.replace(FLOAT_PATTERN, () => {
      const val = valsToSub.shift();
      return val !== undefined ? String(val) : '(?)';
    });

    return effectString;
  };

  const affixSlotsConfig = [
    { name: item.prefix1, values: [item.p1v1, item.p1v2] },
    { name: item.prefix2, values: [item.p2v1, item.p2v2] },
    { name: item.prefix3, values: [item.p3v1, item.p3v2] },
    { name: item.suffix1, values: [item.s1v] },
    { name: item.suffix2, values: [item.s2v] },
    { name: item.suffix3, values: [item.s3v] },
  ];

  const resolvedAffixes: ActiveAffixWithValue[] = [];
  for (const slot of affixSlotsConfig) {
    if (slot.name) {
      const definition = look(slot.name, currentBase.item_class);
      if (definition) {
        resolvedAffixes.push({
          definition,
          values: slot.values.map((v) => (v === null ? undefined : v)),
        });
      }
    }
  }

  const dmgParts = (currentBase.physical_dmg || '0')
    .split('-')
    .map((n: string) => +n);
  const bMin = dmgParts[0];
  const bMax = dmgParts.length > 1 ? dmgParts[1] : bMin;

  let totalFlatPdMin = 0,
    totalFlatPdMax = 0,
    totalIncreasedPdPercent = 0;
  let totalFlatFdMin = 0,
    totalFlatFdMax = 0;
  let totalFlatCdMin = 0,
    totalFlatCdMax = 0;
  let totalFlatLdMin = 0,
    totalFlatLdMax = 0;
  let totalFlatCHdMin = 0,
    totalFlatCHdMax = 0;
  let totalIncreasedAttackSpeedPercent = 0;
  let totalFlatArmour = 0,
    totalFlatES = 0,
    totalFlatEvasion = 0;
  let totalIncreasedArmourPercent = 0,
    totalIncreasedESPercent = 0,
    totalIncreasedEvasionPercent = 0;
  let totalFlatLife = 0;
  let totalFlatCritChance = 0;

  for (const activeAffix of resolvedAffixes) {
    const { definition, values } = activeAffix;
    const v1 = values[0];
    const v2 = values[1];
    switch (definition.family) {
      case 'PhysicalDamage':
        totalFlatPdMin += v1 || 0;
        totalFlatPdMax += v2 || 0;
        break;
      case 'PhysicalPercent':
        totalIncreasedPdPercent += v1 || 0;
        break;
      case 'PhysicalPercentAccuracy':
        totalIncreasedPdPercent += v1 || 0;
        break;
      case 'FireDamage':
        totalFlatFdMin += v1 || 0;
        totalFlatFdMax += v2 || 0;
        break;
      case 'ColdDamage':
        totalFlatCdMin += v1 || 0;
        totalFlatCdMax += v2 || 0;
        break;
      case 'LightningDamage':
        totalFlatLdMin += v1 || 0;
        totalFlatLdMax += v2 || 0;
        break;
      case 'ChaosDamage':
        totalFlatCHdMin += v1 || 0;
        totalFlatCHdMax += v2 || 0;
        break;
      case 'IncreasedAttackSpeed':
        totalIncreasedAttackSpeedPercent += v1 || 0;
        break;
      case 'CriticalStrikeChance':
        totalFlatCritChance += v1 || 0;
        break;
      case 'Armour':
        totalFlatArmour += v1 || 0;
        break;
      case 'Evasion':
        totalFlatEvasion += v1 || 0;
        break;
      case 'EnergyShield':
        totalFlatES += v1 || 0;
        break;
      case 'ArmourPercent':
        totalIncreasedArmourPercent += v1 || 0;
        break;
      case 'EvasionPercent':
        totalIncreasedEvasionPercent += v1 || 0;
        break;
      case 'EnergyShieldPercent':
        totalIncreasedESPercent += v1 || 0;
        break;
      case 'ArmourLifeHybrid':
        totalIncreasedArmourPercent += v1 || 0;
        totalFlatLife += v2 || 0;
        break;
      case 'EvasionLifeHybrid':
        totalIncreasedEvasionPercent += v1 || 0;
        totalFlatLife += v2 || 0;
        break;
      case 'EnergyShieldLifeHybrid':
        totalIncreasedESPercent += v1 || 0;
        totalFlatLife += v2 || 0;
        break;
      case 'ArmourHybrid':
        totalFlatArmour += v1 || 0;
        totalIncreasedArmourPercent += v2 || 0;
        break;
      case 'EvasionHybrid':
        totalFlatEvasion += v1 || 0;
        totalIncreasedEvasionPercent += v2 || 0;
        break;
      case 'EnergyShieldHybrid':
        totalFlatES += v1 || 0;
        totalIncreasedESPercent += v2 || 0;
        break;
      case 'ArmourEvasion':
        totalFlatArmour += v1 || 0;
        totalFlatEvasion += v2 || 0;
        break;
      case 'ArmourEnergyShield':
        totalFlatArmour += v1 || 0;
        totalFlatES += v2 || 0;
        break;
      case 'EvasionEnergyShield':
        totalFlatEvasion += v1 || 0;
        totalFlatES += v2 || 0;
        break;
      case 'ArmourEvasionPercent':
        totalIncreasedArmourPercent += v1 || 0;
        totalIncreasedEvasionPercent += v1 || 0;
        break;
      case 'ArmourEnergyShieldPercent':
        totalIncreasedArmourPercent += v1 || 0;
        totalIncreasedESPercent += v1 || 0;
        break;
      case 'EvasionEnergyShieldPercent':
        totalIncreasedEvasionPercent += v1 || 0;
        totalIncreasedESPercent += v1 || 0;
        break;
      case 'ArmourEvasionLifeHybrid':
        totalIncreasedArmourPercent += v1 || 0;
        totalIncreasedEvasionPercent += v1 || 0;
        totalFlatLife += v2 || 0;
        break;
      case 'ArmourEnergyShieldLifeHybrid':
        totalIncreasedArmourPercent += v1 || 0;
        totalIncreasedESPercent += v1 || 0;
        totalFlatLife += v2 || 0;
        break;
      case 'EvasionEnergyShieldLifeHybrid':
        totalIncreasedEvasionPercent += v1 || 0;
        totalIncreasedESPercent += v1 || 0;
        totalFlatLife += v2 || 0;
        break;
      case 'Life':
        totalFlatLife += v1 || 0;
        break;

      // Need to add additional cases later
    }
  }

  const qualityMultiplier = item.quality ? 1 + item.quality / 100 : 1;

  const pdMin = Math.round(
    (bMin + totalFlatPdMin) *
      (1 + totalIncreasedPdPercent / 100) *
      qualityMultiplier
  );
  const pdMax = Math.floor(
    (bMax + totalFlatPdMax) *
      (1 + totalIncreasedPdPercent / 100) *
      qualityMultiplier
  );
  const fdMin = totalFlatFdMin,
    fdMax = totalFlatFdMax;
  const cdMin = totalFlatCdMin,
    cdMax = totalFlatCdMax;
  const ldMin = totalFlatLdMin,
    ldMax = totalFlatLdMax;
  const chdMin = totalFlatCHdMin,
    chdMax = totalFlatCHdMax;
  const baseCrit = parseFloat(currentBase.crit_chance || '0');
  const finalCrit = baseCrit + totalFlatCritChance;
  const crit = finalCrit > 0 ? `${finalCrit.toFixed(2)}%` : '';
  const baseAps = parseFloat(currentBase.aps || '0');
  const aps =
    baseAps > 0
      ? (
          Math.floor(
            baseAps * (1 + totalIncreasedAttackSpeedPercent / 100) * 100
          ) / 100
        ).toFixed(2)
      : '';
  const baseArmour = currentBase.armour || 0;
  const baseES = currentBase.energy_shield || 0;
  const baseEvasion = currentBase.evasion || 0;
  const finalArmour = Math.round(
    (baseArmour + totalFlatArmour) *
      (1 + (totalIncreasedArmourPercent + (item.quality || 0)) / 100)
  );
  const finalES = Math.round(
    (baseES + totalFlatES) *
      (1 + (totalIncreasedESPercent + (item.quality || 0)) / 100)
  );
  const finalEvasion = Math.round(
    (baseEvasion + totalFlatEvasion) *
      (1 + (totalIncreasedEvasionPercent + (item.quality || 0)) / 100)
  );
  const baseLvlReq = currentBase.lvl_req || 0;
  const highestAffixClvl = resolvedAffixes.reduce(
    (maxClvl, activeAffix) =>
      Math.max(maxClvl, activeAffix.definition.clvl || 0),
    0
  );
  const displayLvlReq = Math.max(baseLvlReq, highestAffixClvl);
  let displayStrReq = currentBase.str_req ?? 0,
    displayDexReq = currentBase.dex_req ?? 0,
    displayIntReq = currentBase.int_req ?? 0;
  let strReqReduced = false,
    dexReqReduced = false,
    intReqReduced = false;

  for (const activeAffix of resolvedAffixes) {
    const { definition, values } = activeAffix;
    if (definition.affix_name === 'Apt' && values[0] !== undefined) {
      const reductionPercent = values[0];
      const originalStrReq = displayStrReq,
        originalDexReq = displayDexReq,
        originalIntReq = displayIntReq;
      displayStrReq = Math.floor(displayStrReq * (1 - reductionPercent / 100));
      displayDexReq = Math.floor(displayDexReq * (1 - reductionPercent / 100));
      displayIntReq = Math.floor(displayIntReq * (1 - reductionPercent / 100));
      if (displayStrReq < originalStrReq) strReqReduced = true;
      if (displayDexReq < originalDexReq) dexReqReduced = true;
      if (displayIntReq < originalIntReq) intReqReduced = true;
    }
  }

  let itemSpecificStatsDisplay;
  if (['weapon'].some((tag) => currentBase.item_tags.includes(tag))) {
    itemSpecificStatsDisplay = (
      <>
        {item.quality > 0 && (
          <>
            Quality: <span className='text-indigo-400'>{item.quality}%</span>
            <br />
          </>
        )}
        {pdMin > 0 && pdMax > 0 && (
          <>
            Physical Damage:{' '}
            <span
              className={
                pdMin === bMin && pdMax === bMax
                  ? 'text-white'
                  : 'text-indigo-400'
              }
            >
              {pdMin}-{pdMax}
            </span>
            <br />
          </>
        )}
        {fdMin > 0 && fdMax > 0 && (
          <>
            Fire Damage:{' '}
            <span className='text-red-400'>
              {fdMin}-{fdMax}
            </span>
            <br />
          </>
        )}
        {cdMin > 0 && cdMax > 0 && (
          <>
            Cold Damage:{' '}
            <span className='text-cyan-300'>
              {cdMin}-{cdMax}
            </span>
            <br />
          </>
        )}
        {ldMin > 0 && ldMax > 0 && (
          <>
            Lightning Damage:{' '}
            <span className='text-yellow-300'>
              {ldMin}-{ldMax}
            </span>
            <br />
          </>
        )}
        {chdMin > 0 && chdMax > 0 && (
          <>
            Chaos Damage:{' '}
            <span className='text-violet-600'>
              {chdMin}-{chdMax}
            </span>
            <br />
          </>
        )}
        {crit && (
          <>
            Critical Strike Chance:{' '}
            <span
              className={
                finalCrit === baseCrit ? 'text-white' : 'text-indigo-400'
              }
            >
              {crit}
            </span>
            <br />
          </>
        )}
        {aps && (
          <>
            Attacks per Second:{' '}
            <span
              className={
                parseFloat(aps) === baseAps ? 'text-white' : 'text-indigo-400'
              }
            >
              {aps}
            </span>
            <br />
          </>
        )}
      </>
    );
  } else if (
    ['armour', 'shield', 'offhand'].some((tag) =>
      currentBase.item_tags.includes(tag)
    )
  ) {
    itemSpecificStatsDisplay = (
      <>
        {item.quality > 0 && (
          <>
            Quality: <span className='text-indigo-400'>{item.quality}%</span>
            <br />
          </>
        )}
        {finalArmour > 0 && (
          <>
            Armour:{' '}
            <span
              className={
                finalArmour === baseArmour ? 'text-white' : 'text-indigo-400'
              }
            >
              {finalArmour}
            </span>
            <br />
          </>
        )}
        {finalES > 0 && (
          <>
            Energy Shield:{' '}
            <span
              className={finalES === baseES ? 'text-white' : 'text-indigo-400'}
            >
              {finalES}
            </span>
            <br />
          </>
        )}
        {finalEvasion > 0 && (
          <>
            Evasion:{' '}
            <span
              className={
                finalEvasion === baseEvasion ? 'text-white' : 'text-indigo-400'
              }
            >
              {finalEvasion}
            </span>
            <br />
          </>
        )}
      </>
    );
  } else if (currentBase.item_tags === 'belt') {
    itemSpecificStatsDisplay = (
      <>
        Charm Slots: <span className='text-white'>3</span>
        <br />
      </>
    );
  }

  const implicitDisplay = currentBase.implicit
    ? processImplicitDisplay(currentBase.implicit, item.implicit)
    : null;

  const nhl = (
    <img
      src='https://www.poe2wiki.net/w/images/3/3a/Item_UI_header_normal_left.png'
      alt='header left'
      className='h-full'
    />
  );
  const nhm = (
    <div
      className='h-full flex-grow bg-repeat-x'
      style={{
        backgroundImage: `url('https://www.poe2wiki.net/w/images/8/8e/Item_UI_header_normal_middle.png')`,
        backgroundSize: 'auto 100%',
      }}
    />
  );
  const nhr = (
    <img
      src='https://www.poe2wiki.net/w/images/5/54/Item_UI_header_normal_right.png'
      alt='header right'
      className='h-full'
    />
  );
  const nsep = (
    <img
      className='mx-auto my-1'
      src='https://www.poe2wiki.net/w/images/b/bd/Item_UI_separator_normal.png'
      alt='normal separator'
    />
  );
  const mhl = (
    <img
      src='https://web.poecdn.com/protected/image/item/popup2/header-magic-left.png?v=1739989653377&key=o3_dFKQzRKG62y6uHCs7jQ'
      alt='header left'
      className='h-full'
    />
  );
  const mhm = (
    <div
      className='h-full flex-grow bg-repeat-x'
      style={{
        backgroundImage: `url('https://web.poecdn.com/protected/image/item/popup2/header-magic-middle.png?v=1739989653377&key=23gaDOOaTXEb7bKEt0GMfA')`,
        backgroundSize: 'auto 100%',
      }}
    />
  );
  const mhr = (
    <img
      src='https://web.poecdn.com/protected/image/item/popup2/header-magic-right.png?v=1739989653377&key=Z4fOOCC3bnyTIZvSCJZSqw'
      alt='header right'
      className='h-full'
    />
  );
  const msep = (
    <img
      className='mx-auto my-1'
      src='https://web.poecdn.com/protected/image/item/popup/separator-magic.png?v=1739989653457&key=WHdxxKesPGQwo-o2yd6V8Q'
      alt='normal separator'
    />
  );
  const rhl = (
    <img
      src='https://web.poecdn.com/protected/image/item/popup2/header-double-rare-left.png?v=1739989653373&key=GlFK9dDlo33Cw3Ak7P5MnA'
      alt='header left rare'
      className='h-full'
    />
  );
  const rhm = (
    <div
      className='h-full flex-grow bg-repeat-x'
      style={{
        backgroundImage: `url('https://web.poecdn.com/protected/image/item/popup2/header-double-rare-middle.png?v=1739989653373&key=yJGcA667EzDzrPzd1_9-vg')`,
        backgroundSize: 'auto 100%',
      }}
    />
  );
  const rhr = (
    <img
      src='https://web.poecdn.com/protected/image/item/popup2/header-double-rare-right.png?v=1739989653373&key=rXqdxbUkuIkWyVJPJVY9cQ'
      alt='header right rare'
      className='h-full'
    />
  );
  const rsep = (
    <img
      className='mx-auto my-1'
      src='https://web.poecdn.com/protected/image/item/popup/separator-rare.png?v=1739989653457&key=CSxkkdAMEQ9oW5h6DEQewQ'
      alt='rare separator'
    />
  );

  // Header and separator selection based on rarity
  let headerLeft, headerMid, headerRight, separator;
  if (rarity === 'normal') {
    headerLeft = nhl;
    headerMid = nhm;
    headerRight = nhr;
    separator = nsep;
  } else if (rarity === 'magic') {
    headerLeft = mhl;
    headerMid = mhm;
    headerRight = mhr;
    separator = msep;
  } else {
    headerLeft = rhl;
    headerMid = rhm;
    headerRight = rhr;
    separator = rsep;
  }

  // Color classes based on rarity
  const rarityTextColor =
    rarity === 'normal'
      ? 'text-white'
      : rarity === 'magic'
        ? 'text-blue-300'
        : 'text-gold';

  const rarityBorderColor =
    rarity === 'normal'
      ? 'border-zinc-400'
      : rarity === 'magic'
        ? 'border-blue-400'
        : 'border-yellow-400';

  return (
    <div className={`mx-4 mb-4 flex items-center`}>
      <div
        className={`w-80 ${rarityBorderColor} border bg-black font-Insmallcaps text-sm text-white`}
      >
        {/* Item Header */}
        <div className='relative mb-1 flex h-16 w-full items-center justify-center'>
          {headerLeft}
          {headerMid}
          {headerRight}
          <span
            className={`absolute inset-0 flex flex-col items-center justify-center text-center text-lg font-semibold ${rarityTextColor}`}
          >
            <span>{item.item_name}</span>
            <span>{item.base_type}</span>
          </span>
        </div>

        {/* Local Stats Block */}
        <p className='my-2 text-center text-gray-400'>
          {currentBase.item_class}
          <br />
          {itemSpecificStatsDisplay}
        </p>
        {separator}

        {/* Lvl Req Block */}
        {displayLvlReq > 0 && (
          <>
            <p className='my-2 text-center text-gray-400'>
              Requires: Level{' '}
              <span
                className={
                  highestAffixClvl > baseLvlReq
                    ? 'text-indigo-400'
                    : 'text-white'
                }
              >
                {displayLvlReq}
              </span>
              {displayStrReq > 0 || displayDexReq > 0 || displayIntReq > 0
                ? ', '
                : ''}
              {/* Str Req Block */}
              {displayStrReq > 0 && (
                <>
                  <span
                    className={strReqReduced ? 'text-indigo-400' : 'text-white'}
                  >
                    {displayStrReq}
                  </span>{' '}
                  Str{displayDexReq > 0 || displayIntReq > 0 ? ', ' : ''}
                </>
              )}
              {/* Dex Req Block */}
              {displayDexReq > 0 && (
                <>
                  <span
                    className={dexReqReduced ? 'text-indigo-400' : 'text-white'}
                  >
                    {displayDexReq}
                  </span>{' '}
                  Dex{displayIntReq > 0 ? ', ' : ''}
                </>
              )}
              {/* Int Req Block */}
              {displayIntReq > 0 && (
                <>
                  <span
                    className={intReqReduced ? 'text-indigo-400' : 'text-white'}
                  >
                    {displayIntReq}
                  </span>{' '}
                  Int
                </>
              )}
            </p>
            {(rarity !== 'normal' || implicitDisplay) &&
              resolvedAffixes.length > 0 &&
              separator}
          </>
        )}

        {/* Enchant Block */}
        {item.enchant && (
          <>
            <p className='mx-px my-2 text-center text-cyan-100'>
              {item.enchant}
            </p>
            {separator}
          </>
        )}

        {/* Implicit Block */}
        {implicitDisplay && (
          <>
            <p className='mx-px my-2 text-center text-indigo-400'>
              {implicitDisplay}
            </p>
            {(rarity !== 'normal' || implicitDisplay) &&
              resolvedAffixes.length > 0 &&
              separator}
          </>
        )}

        {/* Explicits Block */}
        <div className='mx-px my-2 text-center'>
          {resolvedAffixes.flatMap((activeAffix, affixIndex) => {
            const { definition, values } = activeAffix;
            const effectString = processAffixEffect(definition, values);
            const isFractured =
              fracturedAffixId &&
              activeAffix.definition.id === fracturedAffixId;
            return effectString.split('\n').map((linePart, linePartIndex) => (
              <div
                key={`affix-${affixIndex}-line-${linePartIndex}`}
                className='relative py-px'
              >
                <span className={isFractured ? 'text-frac' : 'text-indigo-400'}>
                  {linePart}
                </span>
                <div className='group absolute right-0 top-1/2 mr-1 inline-block -translate-y-1/2 transform'>
                  <span className='-inset-0 text-xs text-gray-600'>
                    T{definition.id.match(/\d+/)?.[0]}
                  </span>
                  <div className='pointer-events-none absolute bottom-full left-1/2 z-10 mb-1 -translate-x-1/2 transform whitespace-nowrap rounded bg-black px-2 py-1 text-xs text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
                    {definition.affix_name}
                  </div>
                </div>
              </div>
            ));
          })}
        </div>
        {item.corrupted && (
          <>
            {separator}
            <p className='mb-3 text-center text-red-600'>Corrupted</p>
          </>
        )}
      </div>

      {/* Item Image */}
      <div
        className={`relative mx-4 flex h-60 w-32 items-center justify-center ${rarityBorderColor} border bg-black bg-opacity-90`}
      >
        <img
          className='h-auto max-h-56 w-auto max-w-32'
          src={`${item.base_type.toLowerCase().replace(/\s+/g, '_')}.webp`}
          alt={item.base_type}
          draggable={false}
        />

        {/* Sockets Block */}
        {item.sockets === 1 && (
          <img
            className='absolute left-1/2 top-1/2 h-10 w-10 -translate-x-1/2 -translate-y-1/2'
            src='socket.png'
            alt='socket 1'
            draggable={false}
          />
        )}
        {item.sockets === 2 &&
          (['Spear', 'Staff'].includes(currentBase.item_class) ? (
            <>
              <img
                className='absolute left-1/2 top-[70px] h-10 w-10 -translate-x-1/2'
                src='socket.png'
                alt='socket 1'
                draggable={false}
              />
              <img
                className='absolute left-1/2 top-[120px] h-10 w-10 -translate-x-1/2'
                src='socket.png'
                alt='socket 2'
                draggable={false}
              />
            </>
          ) : (
            <>
              <img
                className='absolute left-5 top-24 h-10 w-10'
                src='socket.png'
                alt='socket 1'
                draggable={false}
              />
              <img
                className='absolute left-[68px] top-24 h-10 w-10'
                src='socket.png'
                alt='socket 2'
                draggable={false}
              />
            </>
          ))}
        {item.sockets === 3 && (
          <>
            <img
              className='absolute left-5 top-24 h-10 w-10'
              src='socket.png'
              alt='socket 1'
              draggable={false}
            />
            <img
              className='absolute left-[68px] top-24 h-10 w-10'
              src='socket.png'
              alt='socket 2'
              draggable={false}
            />
            <img
              className='absolute left-[68px] top-36 h-10 w-10'
              src='socket.png'
              alt='socket 3'
              draggable={false}
            />
          </>
        )}
      </div>
    </div>
  );
};
