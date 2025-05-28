import React from 'react';
import { Affix } from './types/affixes';

interface ItemDisplayProps {
  item: any;
  bases: any[];
  affixes: Affix[];
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
// Matches a single number
const SINGLE_NUMBER_PATTERN = /(\d+)/;

export const ItemDisplay: React.FC<ItemDisplayProps> = ({
  item,
  bases,
  affixes,
}) => {
  const currentBase = bases.find((b) => b.base_name === item.base_type)!;

  const look = (
    affixNameToFind?: string,
    itemClass?: string
  ): Affix | undefined => {
    if (!affixNameToFind || !affixes) {
      return undefined;
    }
    const candidates = affixes.filter((a) => a.affix_name === affixNameToFind);
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
    // Matches a range like (1-10)
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
      // Matches "X to (A-B)"
    } else if (X_TO_RANGE_PATTERN.test(effectString)) {
      const val1 = valsToSub.shift();
      const val2 = valsToSub.shift();
      effectString = effectString.replace(X_TO_RANGE_PATTERN, () => {
        const minVal = val1 !== undefined ? val1 : ranges.range1?.min ?? '(?)';
        const maxVal = val2 !== undefined ? val2 : ranges.range2?.max ?? '(?)';
        return `${minVal} to ${maxVal}`;
      });
    } else {
      // Matches multiple ranges like (1-10)
      effectString = effectString.replace(RANGE_PATTERN_GLOBAL, () => {
        const val = valsToSub.shift();
        return val !== undefined ? String(val) : '(?)';
      });
    }
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
    .map((n: Number) => +n);
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

  for (const activeAffix of resolvedAffixes) {
    const { definition, values } = activeAffix;
    const v1 = values[0];
    const v2 = values[1];
    switch (definition.family) {
      case 'PhysicalDamage':
        totalFlatPdMin += v1 || 0;
        totalFlatPdMax += v2 || 0;
        break;
      case 'PhysicalPercentAccuracy':
        totalIncreasedPdPercent += v1 || 0;
        break;
      case 'LightningDamage':
        totalFlatLdMin += v1 || 0;
        totalFlatLdMax += v2 || 0;
        break;
      case 'IncreasedAttackSpeed':
        totalIncreasedAttackSpeedPercent += v1 || 0;
        break;
      case 'BaseDefences':
        if (definition.effect.includes('Energy Shield')) totalFlatES += v1 || 0;
        break;
      case 'DefencesPercent':
        if (definition.effect.includes('Energy Shield'))
          totalIncreasedESPercent += v1 || 0;
        break;
      case 'DefencesAndLife':
        if (definition.effect.includes('Energy Shield'))
          totalIncreasedESPercent += v1 || 0;
        if (definition.effect.includes('Life')) totalFlatLife += v2 || 0;
        break;
      // Need to add additional cases later
    }
  }

  const pdMin = Math.round(
    (bMin + totalFlatPdMin) * (1 + totalIncreasedPdPercent / 100)
  );
  const pdMax = Math.floor(
    (bMax + totalFlatPdMax) * (1 + totalIncreasedPdPercent / 100)
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
  const crit = baseCrit > 0 ? `${baseCrit.toFixed(2)}%` : '';
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
  const finalArmour = Math.round(
    (baseArmour + totalFlatArmour) * (1 + totalIncreasedArmourPercent / 100)
  );
  const baseES = currentBase.energy_shield || 0;
  const finalES = Math.round(
    (baseES + totalFlatES) * (1 + totalIncreasedESPercent / 100)
  );
  const baseEvasion = currentBase.evasion || 0;
  const finalEvasion = Math.round(
    (baseEvasion + totalFlatEvasion) * (1 + totalIncreasedEvasionPercent / 100)
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
  if (['weapon', 'bow'].some((tag) => currentBase.item_tags.includes(tag))) {
    itemSpecificStatsDisplay = (
      <>
        {pdMin > 0 && pdMax > 0 && (
          <>
            Physical Damage:{' '}
            <span className='text-indigo-400'>
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
            Critical Strike Chance: <span className='text-white'>{crit}</span>
            <br />
          </>
        )}
        {aps && (
          <>
            Attacks per Second: <span className='text-indigo-400'>{aps}</span>
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
        {finalArmour > 0 && (
          <>
            Armour: <span className='text-indigo-400'>{finalArmour}</span>
            <br />
          </>
        )}
        {finalES > 0 && (
          <>
            Energy Shield: <span className='text-indigo-400'>{finalES}</span>
            <br />
          </>
        )}
        {finalEvasion > 0 && (
          <>
            Evasion: <span className='text-indigo-400'>{finalEvasion}</span>
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
      alt='rare seperator'
    />
  );

  return (
    <div className='mx-4 mb-4 flex items-center'>
      <div className='w-80 border border-yellow-400 bg-black font-Insmallcaps text-sm text-white'>
        {/* Item Header */}
        <div className='relative mb-1 flex h-16 w-full items-center justify-center'>
          {rhl}
          {rhm}
          {rhr}
          <span className='absolute inset-0 flex flex-col items-center justify-center text-center text-lg font-semibold text-gold'>
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
        {rsep}

        {/* Lvl Req Block */}
        <p className='my-2 text-center text-gray-400'>
          Requires: Level{' '}
          <span
            className={
              highestAffixClvl > baseLvlReq ? 'text-indigo-400' : 'text-white'
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
        {rsep}

        {/* Enchant Block */}
        {item.enchant && (
          <>
            <p className='mx-px my-2 text-center text-cyan-100'>
              {item.enchant}
            </p>
            {rsep}
          </>
        )}

        {/* Implicit Block */}
        {implicitDisplay && (
          <>
            <p className='mx-px my-2 text-center text-indigo-400'>
              {implicitDisplay}
            </p>
            {rsep}
          </>
        )}

        {/* Explicits Block */}
        <div className='mx-px my-2 text-center text-indigo-400'>
          {resolvedAffixes.flatMap((activeAffix, affixIndex) => {
            const { definition, values } = activeAffix;
            const effectString = processAffixEffect(definition, values);
            return effectString.split('\n').map((linePart, linePartIndex) => (
              <div
                key={`affix-${affixIndex}-line-${linePartIndex}`}
                className='relative py-px'
              >
                <span>{linePart}</span>
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
        {rsep}

        {/* Corrupted Block */}
        <p className='mb-3 text-red-600'>Corrupted</p>
      </div>

      {/* Item Image */}
      <div className='relative mx-4 flex h-60 w-32 items-center justify-center border border-yellow-400 bg-black bg-opacity-90'>
        <img
          className='h-auto max-h-56 w-auto max-w-32'
          src={`${item.base_type.toLowerCase().replace(/\s+/g, '_')}.webp`}
          alt={`${item.base_type} item art`}
        />

        {/* Sockets Block */}
        {item.sockets !== null && item.sockets >= 1 && (
          <img
            className='absolute left-5 top-24 h-10 w-10'
            src='socket.png'
            alt='socket 1'
          />
        )}
        {item.sockets !== null && item.sockets >= 2 && (
          <img
            className='absolute left-[68px] top-24 h-10 w-10'
            src='socket.png'
            alt='socket 2'
          />
        )}
        {item.sockets !== null && item.sockets >= 3 && (
          <img
            className='absolute left-[68px] top-36 h-10 w-10'
            src='socket.png'
            alt='socket 3'
          />
        )}
      </div>
    </div>
  );
};
