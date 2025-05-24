import { useSuspenseQuery } from '@tanstack/react-query';
import { itemqfn, ItemsResponse } from './handlers/itemsquery';
import { affixqfn } from './handlers/affixesquery';
import { Affix } from './types/affixes';

function CorruptedRares() {
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

  const { data: itemAndBaseData } = useSuspenseQuery<ItemsResponse>({
    queryKey: ['items'],
    queryFn: itemqfn,
    refetchOnWindowFocus: false,
  });
  const { items, bases } = itemAndBaseData!;

  const { data: affixes } = useSuspenseQuery<Affix[]>({
    queryKey: ['affixes'],
    queryFn: affixqfn,
    refetchOnWindowFocus: false,
  });

  const TWO_HANDED_ITEM_CLASSES = new Set([
    'Crossbow',
    'Quarterstaff',
    'Two Hand Sword',
    'Two Hand Axe',
    'Two Hand Mace',
  ]);

  const look = (
    affixNameToFind?: string,
    itemClass?: string
  ): Affix | undefined => {
    if (!affixNameToFind || !affixes) {
      return undefined;
    }

    const candidates = affixes.filter((a) => a.affix_name === affixNameToFind);

    if (candidates.length === 0) {
      return undefined;
    }
    if (candidates.length === 1) {
      return candidates[0];
    }

    // Use item_class to find affix for two-handed or one-handed
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

  interface ActiveAffixWithValue {
    definition: Affix;
    values: (number | undefined)[];
  }

  return (
    <div className='flex flex-wrap items-start justify-center gap-8 p-4'>
      {items.map((currentItem) => {
        const currentBase = bases.find(
          (b) => b.base_name === currentItem.base_type
        )!;

        const affixSlotsConfig = [
          {
            name: currentItem.prefix1,
            values: [currentItem.p1v1, currentItem.p1v2],
          },
          {
            name: currentItem.prefix2,
            values: [currentItem.p2v1, currentItem.p2v2],
          },
          {
            name: currentItem.prefix3,
            values: [currentItem.p3v1, currentItem.p3v2],
          },
          { name: currentItem.suffix1, values: [currentItem.s1v] },
          { name: currentItem.suffix2, values: [currentItem.s2v] },
          { name: currentItem.suffix3, values: [currentItem.s3v] },
        ];

        const resolvedAffixes: ActiveAffixWithValue[] = [];
        for (const slot of affixSlotsConfig) {
          if (slot.name) {
            const definition = look(slot.name, currentItem.item_class);
            if (definition) {
              resolvedAffixes.push({ definition, values: slot.values });
            }
          }
        }

        const dmgParts = (currentBase.physical_dmg || '0')
          .split('-')
          .map((n) => +n);
        const bMin = dmgParts[0];
        const bMax = dmgParts.length > 1 ? dmgParts[1] : bMin;

        let totalFlatPdMin = 0;
        let totalFlatPdMax = 0;
        let totalIncreasedPdPercent = 0;
        let totalFlatFdMin = 0;
        let totalFlatFdMax = 0;
        let totalFlatCdMin = 0;
        let totalFlatCdMax = 0;
        let totalFlatLdMin = 0;
        let totalFlatLdMax = 0;
        let totalFlatCHdMin = 0;
        let totalFlatCHdMax = 0;
        let totalIncreasedAttackSpeedPercent = 0;
        let totalFlatArmour = 0;
        let totalFlatES = 0;
        let totalFlatEvasion = 0;
        let totalIncreasedArmourPercent = 0;
        let totalIncreasedESPercent = 0;
        let totalIncreasedEvasionPercent = 0;
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
              if (definition.effect.includes('Energy Shield')) {
                totalFlatES += v1 || 0;
              }
              break;
            case 'DefencesPercent':
              if (definition.effect.includes('Energy Shield')) {
                totalIncreasedESPercent += v1 || 0;
              }
              break;
            case 'DefencesAndLife':
              if (definition.effect.includes('Energy Shield')) {
                totalIncreasedESPercent += v1 || 0;
              }
              if (definition.effect.includes('Life')) {
                totalFlatLife += v2 || 0;
              }
              break;
            // Add addiontal cases later
          }
        }
        // Calculate final weapon stats
        const pdMin = Math.round(
          (bMin + totalFlatPdMin) * (1 + totalIncreasedPdPercent / 100)
        );
        const pdMax = Math.floor(
          (bMax + totalFlatPdMax) * (1 + totalIncreasedPdPercent / 100)
        );
        const fdMin = totalFlatFdMin;
        const fdMax = totalFlatFdMax;
        const cdMin = totalFlatCdMin;
        const cdMax = totalFlatCdMax;
        const ldMin = totalFlatLdMin;
        const ldMax = totalFlatLdMax;
        const chdMin = totalFlatCHdMin;
        const chdMax = totalFlatCHdMax;

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
        // Calculate final local defences
        const baseArmour = currentBase.armour || 0;
        const finalArmour = Math.round(
          (baseArmour + totalFlatArmour) *
            (1 + totalIncreasedArmourPercent / 100)
        );
        const baseES = currentBase.energy_shield || 0;
        const finalES = Math.round(
          (baseES + totalFlatES) * (1 + totalIncreasedESPercent / 100)
        );
        const baseEvasion = currentBase.evasion || 0;
        const finalEvasion = Math.round(
          (baseEvasion + totalFlatEvasion) *
            (1 + totalIncreasedEvasionPercent / 100)
        );
        // Calculate final attribute requirements
        let displayStrReq = currentBase.str_req ?? 0;
        let displayDexReq = currentBase.dex_req ?? 0;
        let displayIntReq = currentBase.int_req ?? 0;
        const displayLvlReq = currentBase.lvl_req || 0;

        let strReqReduced = false;
        let dexReqReduced = false;
        let intReqReduced = false;

        for (const activeAffix of resolvedAffixes) {
          const { definition, values } = activeAffix;
          if (definition.affix_name === 'Apt' && values[0] !== undefined) {
            const reductionPercent = values[0];
            const originalStrReq = displayStrReq;
            const originalDexReq = displayDexReq;
            const originalIntReq = displayIntReq;

            displayStrReq = Math.floor(
              displayStrReq * (1 - reductionPercent / 100)
            );
            displayDexReq = Math.floor(
              displayDexReq * (1 - reductionPercent / 100)
            );
            displayIntReq = Math.floor(
              displayIntReq * (1 - reductionPercent / 100)
            );

            if (displayStrReq < originalStrReq) strReqReduced = true;
            if (displayDexReq < originalDexReq) dexReqReduced = true;
            if (displayIntReq < originalIntReq) intReqReduced = true;
          }
        }

        let itemSpecificStatsDisplay;
        if (currentItem.item_class === 'Quarterstaff') {
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
                  Critical Strike Chance:{' '}
                  <span className='text-white'>{crit}</span>
                  <br />
                </>
              )}
              {aps && (
                <>
                  Attacks per Second:{' '}
                  <span className='text-indigo-400'>{aps}</span>
                  <br />
                </>
              )}
            </>
          );
        } else if (currentItem.item_class === 'Body Armour') {
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
                  Energy Shield:{' '}
                  <span className='text-indigo-400'>{finalES}</span>
                  <br />
                </>
              )}
              {finalEvasion > 0 && (
                <>
                  Evasion:{' '}
                  <span className='text-indigo-400'>{finalEvasion}</span>
                  <br />
                </>
              )}
            </>
          );
        }

        return (
          <div
            key={currentItem.id}
            className='font-Insmallcaps w-80 border border-yellow-400 bg-black text-sm text-white'
          >
            {/* Item Header Block */}
            <div className='relative mb-1 flex h-16 w-full items-center justify-center'>
              {rhl}
              {rhm}
              {rhr}
              <span className='absolute inset-0 flex flex-col items-center justify-center text-center text-lg font-semibold text-gold'>
                <span>{currentItem.item_name}</span>
                <span>{currentItem.base_type}</span>
              </span>
            </div>

            {/* Item Class & Local Values Block */}
            <p className='my-2 text-center text-gray-400'>
              {currentItem.item_class}
              <br />
              {itemSpecificStatsDisplay}
            </p>
            {rsep}

            <p className='my-2 text-center text-gray-400'>
              {/* Lvl Req Block */}
              Requires: Level{' '}
              <span className='text-white'>{displayLvlReq}</span>
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
                  Str
                  {displayDexReq > 0 || displayIntReq > 0 ? ', ' : ''}
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
                  Dex
                  {displayIntReq > 0 ? ', ' : ''}
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
            {currentItem.enchant && (
              <>
                <p className='mx-px my-2 text-center text-indigo-400'>
                  {currentItem.enchant}
                </p>
                {rsep}
              </>
            )}
            {/* Implicit Block */}
            {currentItem.implicit && (
              <>
                <p className='mx-px my-2 text-center text-indigo-400'>
                  {currentItem.implicit}
                </p>
                {rsep}
              </>
            )}
            {/* Explicits Block */}
            <div className='mx-px my-2 text-center text-indigo-400'>
              {resolvedAffixes.flatMap((activeAffix, affixIndex) => {
                const { definition, values } = activeAffix;
                let effectString = definition.effect;
                const valsToSub = [...values];
                effectString = effectString.replace(/\(\d+–\d+\)/g, () => {
                  const val = valsToSub.shift();
                  return val !== undefined ? String(val) : '(?)';
                });
                return effectString
                  .split('\n')
                  .map((linePart, linePartIndex) => (
                    <div
                      key={`affix-${affixIndex}-line-${linePartIndex}`}
                      className='relative py-px'
                    >
                      <span>{linePart}</span>
                      <div className='group absolute right-0 top-1/2 mr-1 inline-block -translate-y-1/2 transform'>
                        {' '}
                        <span className='-inset-0 cursor-help text-xs text-gray-600'>
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
        );
      })}
    </div>
  );
}

export default CorruptedRares;
