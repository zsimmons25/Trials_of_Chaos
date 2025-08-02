import { Dispatch, SetStateAction } from 'react';
import { Base } from './types/items';
import { Affix, AffixFamilyGroup } from './types/affixes';
import { Enchant } from './types/enchants';
import {
  generateImplicitValue,
  generateAffixValues,
  getMatchingAffixes,
  selectRandomEnchant,
  generateEnchantValue,
} from './utils/affixHelpers';

// Define proper types
interface ActiveSelection {
  slot: string;
  subtype: string;
  shieldType?: string;
  baseType?: string;
  ringSlot?: 'left' | 'right';
}

interface CraftedAffix {
  affix: Affix;
  values: number[];
  id: string;
}

interface CraftedAffixes {
  prefixes: CraftedAffix[];
  suffixes: CraftedAffix[];
}

interface ImplicitResult {
  text: string;
  value: number;
}

interface UseOrbHandlersProps {
  activeSelection: ActiveSelection | null;
  bases: Base[];
  affixesData: Affix[];
  itemLevel: number;
  craftedAffixes: CraftedAffixes;
  setCraftedAffixes: Dispatch<SetStateAction<CraftedAffixes>>;
  itemRarity: 'normal' | 'magic' | 'rare';
  setItemRarity: React.Dispatch<
    React.SetStateAction<'normal' | 'magic' | 'rare'>
  >;
  setAffixLog: Dispatch<SetStateAction<string[]>>;
  setActiveOrb: React.Dispatch<React.SetStateAction<string | null>>;
  setItemQuality: Dispatch<SetStateAction<number>>;
  setItemSockets: Dispatch<SetStateAction<number>>;
  itemCorruption: number;
  setItemCorruption: Dispatch<SetStateAction<number>>;
  enchantsData: Enchant[];
  setEnchantResult: Dispatch<
    SetStateAction<{ enchant: Enchant; value: number | null } | null>
  >;
  setImplicitResult: Dispatch<SetStateAction<ImplicitResult>>;
  setFracturedAffixId: Dispatch<SetStateAction<string | null>>;
  fracturedAffixId: string | null;
  // Omen states
  CorruptionOmen: number;
  WhittlingOmen: number;
  SinistralErasureOmen: number;
  DextralErasureOmen: number;
  SinistralAnnulmentOmen: number;
  DextralAnnulmentOmen: number;
  // Weights
  useWeights: boolean;
  useCustomWeights: boolean;
  customWeights: Record<string, number>;
}

export const useOrbHandlers = (props: UseOrbHandlersProps) => {
  const {
    activeSelection,
    bases,
    affixesData,
    itemLevel,
    craftedAffixes,
    setCraftedAffixes,
    itemRarity,
    setItemRarity,
    setAffixLog,
    setActiveOrb,
    setItemQuality,
    setItemSockets,
    itemCorruption,
    setItemCorruption,
    enchantsData,
    setEnchantResult,
    setImplicitResult,
    setFracturedAffixId,
    fracturedAffixId,
    WhittlingOmen,
    SinistralErasureOmen,
    DextralErasureOmen,
    SinistralAnnulmentOmen,
    DextralAnnulmentOmen,
    CorruptionOmen,
    useWeights,
    useCustomWeights,
    customWeights,
  } = props;

  const getMaxAffixCount = (baseType: string | undefined): number => {
    if (!baseType) return 3;
    const jewelBases = ['ruby', 'emerald', 'sapphire'];
    const isJewelBase = jewelBases.some((jewel) =>
      baseType.toLowerCase().includes(jewel.toLowerCase())
    );
    return isJewelBase ? 2 : 3;
  };

  const selectWeightedAffix = (
    affixes: Affix[],
    useWeights: boolean,
    useCustomWeights: boolean,
    customWeights: Record<string, number>
  ) => {
    if (!useWeights) {
      return affixes[Math.floor(Math.random() * affixes.length)];
    }

    const weights = affixes.map((affix) => {
      if (useCustomWeights && customWeights[affix.id] !== undefined) {
        return customWeights[affix.id];
      }
      return affix.weighting;
    });

    const totalWeight = weights.reduce((sum, weight) => sum + weight, 0);
    if (totalWeight === 0) {
      return affixes[Math.floor(Math.random() * affixes.length)];
    }

    let random = Math.random() * totalWeight;
    for (let i = 0; i < affixes.length; i++) {
      random -= weights[i];
      if (random <= 0) {
        return affixes[i];
      }
    }
    return affixes[affixes.length - 1];
  };

  const selectWeightedAffixFromFamilies = (
    families: AffixFamilyGroup[],
    useWeights: boolean,
    useCustomWeights: boolean,
    customWeights: Record<string, number>
  ) => {
    const allAffixes = families.flatMap((fam) => fam.affixes);
    return selectWeightedAffix(
      allAffixes,
      useWeights,
      useCustomWeights,
      customWeights
    );
  };

  const handleTransmutationOrbUse = () => {
    if (!activeSelection?.baseType || activeSelection?.baseType == 'Diamond') {
      setActiveOrb('');
      return;
    }
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }

    const affixes = getMatchingAffixes(
      activeSelection.baseType,
      itemLevel,
      activeSelection,
      bases,
      affixesData
    );
    setItemRarity('magic');

    // If fractured affix exists, preserve it and only roll the other slot
    let newPrefixes: Array<{ affix: Affix; values: number[]; id: string }> = [];
    let newSuffixes: Array<{ affix: Affix; values: number[]; id: string }> = [];

    const fracturedPrefix = craftedAffixes.prefixes.find(
      (a) => a.affix.id === fracturedAffixId
    );
    const fracturedSuffix = craftedAffixes.suffixes.find(
      (a) => a.affix.id === fracturedAffixId
    );

    // If fractured prefix exists, only roll a suffix; if fractured suffix exists, only roll a prefix
    if (fracturedPrefix) {
      newPrefixes = [fracturedPrefix];
      // Roll a random suffix
      const availableFamilies = affixes.suffixes;
      if (availableFamilies.length > 0) {
        const randomAffix = selectWeightedAffixFromFamilies(
          availableFamilies,
          useWeights,
          useCustomWeights,
          customWeights
        );
        const values = generateAffixValues(randomAffix);
        const uniqueId = `${randomAffix.id}-${Date.now()}-${Math.random()}`;
        newSuffixes = [{ affix: randomAffix, values, id: uniqueId }];
      }
    } else if (fracturedSuffix) {
      newSuffixes = [fracturedSuffix];
      // Roll a random prefix
      const availableFamilies = affixes.prefixes;
      if (availableFamilies.length > 0) {
        const randomAffix = selectWeightedAffixFromFamilies(
          availableFamilies,
          useWeights,
          useCustomWeights,
          customWeights
        );
        const values = generateAffixValues(randomAffix);
        const uniqueId = `${randomAffix.id}-${Date.now()}-${Math.random()}`;
        newPrefixes = [{ affix: randomAffix, values, id: uniqueId }];
      }
    } else {
      // No fractured affix, roll as normal
      // Decide randomly: prefix or suffix
      const isPrefix = Math.random() < 0.5;
      const affixType = isPrefix ? 'prefixes' : 'suffixes';
      const availableFamilies = affixes[affixType];

      if (availableFamilies.length === 0) return;
      const randomAffix = selectWeightedAffixFromFamilies(
        availableFamilies,
        useWeights,
        useCustomWeights,
        customWeights
      );
      const values = generateAffixValues(randomAffix);
      const uniqueId = `${randomAffix.id}-${Date.now()}-${Math.random()}`;

      newPrefixes = isPrefix
        ? [{ affix: randomAffix, values, id: uniqueId }]
        : [];
      newSuffixes = !isPrefix
        ? [{ affix: randomAffix, values, id: uniqueId }]
        : [];
    }

    setCraftedAffixes({
      prefixes: newPrefixes,
      suffixes: newSuffixes,
    });

    setAffixLog([
      `Transmutation Orb - Made Item Magic`,
      ...(newPrefixes.length && !fracturedPrefix
        ? [`Added prefix: ${newPrefixes[0].affix.affix_name}`]
        : []),
      ...(newSuffixes.length && !fracturedSuffix
        ? [`Added suffix: ${newSuffixes[0].affix.affix_name}`]
        : []),
    ]);

    setActiveOrb('');
  };

  const handleAugmentationOrbUse = () => {
    if (!activeSelection?.baseType || activeSelection?.baseType == 'Diamond') {
      setActiveOrb('');
      return;
    }
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (itemRarity !== 'magic') return;

    // Determine which type to add
    const hasPrefix = craftedAffixes.prefixes.length > 0;
    const hasSuffix = craftedAffixes.suffixes.length > 0;

    if (hasPrefix && hasSuffix) return;

    const affixes = getMatchingAffixes(
      activeSelection.baseType,
      itemLevel,
      activeSelection,
      bases,
      affixesData
    );

    let addType: 'prefixes' | 'suffixes';
    if (!hasPrefix && !hasSuffix) {
      // 50/50 roll if no affixes
      addType = Math.random() < 0.5 ? 'prefixes' : 'suffixes';
    } else {
      addType = hasPrefix ? 'suffixes' : 'prefixes';
    }

    // Exclude families already used
    const usedFamilies = new Set(
      craftedAffixes[addType === 'prefixes' ? 'prefixes' : 'suffixes'].map(
        (a) => a.affix.family
      )
    );
    const availableFamilies = affixes[addType].filter(
      (fam) => !usedFamilies.has(fam.family)
    );
    if (availableFamilies.length === 0) return;
    const randomAffix = selectWeightedAffixFromFamilies(
      availableFamilies,
      useWeights,
      useCustomWeights,
      customWeights
    );
    const values = generateAffixValues(randomAffix);
    const uniqueId = `${randomAffix.id}-${Date.now()}-${Math.random()}`;

    setCraftedAffixes((prev) => ({
      prefixes:
        addType === 'prefixes'
          ? [...prev.prefixes, { affix: randomAffix, values, id: uniqueId }]
          : prev.prefixes,
      suffixes:
        addType === 'suffixes'
          ? [...prev.suffixes, { affix: randomAffix, values, id: uniqueId }]
          : prev.suffixes,
    }));

    setAffixLog((prevLog) => [
      `Augmentation Orb - Item had ${!hasPrefix && !hasSuffix ? 'no affix' : hasPrefix ? 'prefix' : 'suffix'}`,
      `Added ${addType.slice(0, -2)}: ${randomAffix.affix_name}`,
      ...prevLog,
    ]);
    if (!hasPrefix && !hasSuffix) {
    } else {
      setActiveOrb('');
    }
  };

  const handleAlterationOrbUse = () => {
    if (!activeSelection?.baseType || activeSelection?.baseType == 'Diamond') {
      setActiveOrb('');
      return;
    }
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (itemRarity !== 'magic') {
      setActiveOrb('');
      return;
    }

    const affixes = getMatchingAffixes(
      activeSelection.baseType,
      itemLevel,
      activeSelection,
      bases,
      affixesData
    );

    // Decide randomly: 1 or 2 affixes
    const affixCount = Math.random() < 0.5 ? 1 : 2;

    let newPrefixes: Array<{ affix: Affix; values: number[]; id: string }> = [];
    let newSuffixes: Array<{ affix: Affix; values: number[]; id: string }> = [];

    // If fractured affix exists, keep it and only reroll the other slot(s)
    const fracturedPrefix = craftedAffixes.prefixes.find(
      (a) => a.affix.id === fracturedAffixId
    );
    const fracturedSuffix = craftedAffixes.suffixes.find(
      (a) => a.affix.id === fracturedAffixId
    );

    if (affixCount === 1) {
      // 50/50 prefix or suffix
      const isPrefix = Math.random() < 0.5;
      if (isPrefix) {
        if (fracturedPrefix) {
          newPrefixes = [fracturedPrefix];
        } else {
          const availableFamilies = affixes.prefixes;
          if (availableFamilies.length > 0) {
            const randomAffix = selectWeightedAffixFromFamilies(
              availableFamilies,
              useWeights,
              useCustomWeights,
              customWeights
            );
            const values = generateAffixValues(randomAffix);
            const uniqueId = `${randomAffix.id}-${Date.now()}-${Math.random()}`;
            newPrefixes = [{ affix: randomAffix, values, id: uniqueId }];
          }
        }
        if (fracturedSuffix) newSuffixes = [fracturedSuffix];
      } else {
        if (fracturedSuffix) {
          newSuffixes = [fracturedSuffix];
        } else {
          const availableFamilies = affixes.suffixes;
          if (availableFamilies.length > 0) {
            const randomAffix = selectWeightedAffixFromFamilies(
              availableFamilies,
              useWeights,
              useCustomWeights,
              customWeights
            );
            const values = generateAffixValues(randomAffix);
            const uniqueId = `${randomAffix.id}-${Date.now()}-${Math.random()}`;
            newSuffixes = [{ affix: randomAffix, values, id: uniqueId }];
          }
        }
        if (fracturedPrefix) newPrefixes = [fracturedPrefix];
      }
    } else {
      // 1 prefix and 1 suffix
      if (fracturedPrefix) {
        newPrefixes = [fracturedPrefix];
      } else if (affixes.prefixes.length > 0) {
        const randomPrefixFamily =
          affixes.prefixes[Math.floor(Math.random() * affixes.prefixes.length)];
        const randomPrefix =
          randomPrefixFamily.affixes[
            Math.floor(Math.random() * randomPrefixFamily.affixes.length)
          ];
        const prefixValues = generateAffixValues(randomPrefix);
        const prefixId = `${randomPrefix.id}-${Date.now()}-${Math.random()}`;
        newPrefixes = [
          { affix: randomPrefix, values: prefixValues, id: prefixId },
        ];
      }
      if (fracturedSuffix) {
        newSuffixes = [fracturedSuffix];
      } else if (affixes.suffixes.length > 0) {
        const randomSuffixFamily =
          affixes.suffixes[Math.floor(Math.random() * affixes.suffixes.length)];
        const randomSuffix =
          randomSuffixFamily.affixes[
            Math.floor(Math.random() * randomSuffixFamily.affixes.length)
          ];
        const suffixValues = generateAffixValues(randomSuffix);
        const suffixId = `${randomSuffix.id}-${Date.now()}-${Math.random()}`;
        newSuffixes = [
          { affix: randomSuffix, values: suffixValues, id: suffixId },
        ];
      }
    }

    setCraftedAffixes({
      prefixes: newPrefixes,
      suffixes: newSuffixes,
    });

    // Build log
    let logEntries: string[] = [];
    if (affixCount === 1) {
      const isPrefix = newPrefixes.length === 1;
      logEntries.push(
        `Alteration Orb - Rolled 1 ${isPrefix ? 'prefix' : 'suffix'}`,
        `Added ${isPrefix ? 'prefix' : 'suffix'}: ${
          isPrefix
            ? newPrefixes[0].affix.affix_name
            : newSuffixes[0].affix.affix_name
        }`
      );
    } else {
      logEntries.push(
        `Alteration Orb - Rolled 1 prefix and 1 suffix`,
        ...(newPrefixes.length
          ? [`Added prefix: ${newPrefixes[0].affix.affix_name}`]
          : []),
        ...(newSuffixes.length
          ? [`Added suffix: ${newSuffixes[0].affix.affix_name}`]
          : [])
      );
    }

    setAffixLog((prevLog) => [...logEntries, ...prevLog]);
  };

  const handleRegalOrbUse = () => {
    if (!activeSelection?.baseType || activeSelection?.baseType == 'Diamond') {
      setActiveOrb('');
      return;
    }
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (itemRarity !== 'magic') {
      setActiveOrb('');
      return;
    }

    const affixes = getMatchingAffixes(
      activeSelection.baseType,
      itemLevel,
      activeSelection,
      bases,
      affixesData
    );

    // Decide randomly to add a prefix or suffix
    const addType: 'prefixes' | 'suffixes' =
      Math.random() < 0.5 ? 'prefixes' : 'suffixes';

    // Exclude families already used
    const usedFamilies = new Set(
      craftedAffixes[addType].map((a) => a.affix.family)
    );
    const availableFamilies = affixes[addType].filter(
      (fam) => !usedFamilies.has(fam.family)
    );
    if (availableFamilies.length === 0) return;

    const randomAffix = selectWeightedAffixFromFamilies(
      availableFamilies,
      useWeights,
      useCustomWeights,
      customWeights
    );
    const values = generateAffixValues(randomAffix);
    const uniqueId = `${randomAffix.id}-${Date.now()}-${Math.random()}`;

    setCraftedAffixes((prev) => ({
      prefixes:
        addType === 'prefixes'
          ? [...prev.prefixes, { affix: randomAffix, values, id: uniqueId }]
          : prev.prefixes,
      suffixes:
        addType === 'suffixes'
          ? [...prev.suffixes, { affix: randomAffix, values, id: uniqueId }]
          : prev.suffixes,
    }));

    setItemRarity('rare');

    setAffixLog((prevLog) => [
      `Regal Orb - Made Item Rare`,
      `Added ${addType.slice(0, -2)}: ${randomAffix.affix_name}`,
      ...prevLog,
    ]);

    setActiveOrb('');
  };

  const handleChaosOrbUse = (ignoreOmens = false) => {
    if (!activeSelection?.baseType) return;
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (itemRarity !== 'rare') {
      setActiveOrb('');
      return;
    }

    const maxAffixesPerType = getMaxAffixCount(activeSelection.baseType);
    const affixes = getMatchingAffixes(
      activeSelection.baseType,
      itemLevel,
      activeSelection,
      bases,
      affixesData
    );

    // Determine which type can be removed based on omens
    let allowedRemoveTypes: ('prefixes' | 'suffixes')[] = [
      'prefixes',
      'suffixes',
    ];

    if (!ignoreOmens) {
      if (SinistralErasureOmen) {
        allowedRemoveTypes = ['prefixes'];
      } else if (DextralErasureOmen) {
        allowedRemoveTypes = ['suffixes'];
      }
    }

    // Get all removable affixes (non-fractured) from allowed types
    const removableAffixes = [
      ...craftedAffixes.prefixes
        .filter((a) => a.affix.id !== fracturedAffixId)
        .map((a) => ({ ...a, type: 'prefixes' as const })),
      ...craftedAffixes.suffixes
        .filter((a) => a.affix.id !== fracturedAffixId)
        .map((a) => ({ ...a, type: 'suffixes' as const })),
    ].filter((a) => allowedRemoveTypes.includes(a.type));

    if (removableAffixes.length === 0) {
      setActiveOrb('');
      return;
    }

    let affixToRemove;

    // Apply Whittling Omen logic
    if (!ignoreOmens && WhittlingOmen) {
      // Find the lowest ilvl among removable affixes
      const lowestIlvl = Math.min(...removableAffixes.map((a) => a.affix.ilvl));
      const lowestIlvlAffixes = removableAffixes.filter(
        (a) => a.affix.ilvl === lowestIlvl
      );
      affixToRemove =
        lowestIlvlAffixes[Math.floor(Math.random() * lowestIlvlAffixes.length)];
    } else {
      // Normal random selection
      affixToRemove =
        removableAffixes[Math.floor(Math.random() * removableAffixes.length)];
    }

    setCraftedAffixes((prev) => {
      let current = { ...prev };

      // Remove the selected affix
      const removeIdx = current[affixToRemove.type].findIndex(
        (a) => a.id === affixToRemove.id
      );
      const removedAffix = current[affixToRemove.type][removeIdx];
      const removedItemTags = removedAffix.affix.item_tags;
      current[affixToRemove.type] = current[affixToRemove.type].filter(
        (_, i) => i !== removeIdx
      );

      // Determine what type to add
      let addType: 'prefixes' | 'suffixes';
      if (current.prefixes.length === maxAffixesPerType) {
        addType = 'suffixes';
      } else if (current.suffixes.length === maxAffixesPerType) {
        addType = 'prefixes';
      } else {
        addType = Math.random() < 0.5 ? 'prefixes' : 'suffixes';
      }

      const matchingTagAffixes = [
        ...affixes.prefixes.flatMap((family) =>
          family.affixes
            .filter((affix) => affix.item_tags === removedItemTags)
            .map((affix) => ({ ...affix, type: 'prefixes' as const }))
        ),
        ...affixes.suffixes.flatMap((family) =>
          family.affixes
            .filter((affix) => affix.item_tags === removedItemTags)
            .map((affix) => ({ ...affix, type: 'suffixes' as const }))
        ),
      ];

      let addedAffix: Affix | null = null;
      if (current[addType].length < maxAffixesPerType) {
        // Special handling for diamond - use matching tag affixes
        if (activeSelection?.baseType === 'Diamond') {
          // Filter out families already used
          const usedFamilies = new Set([
            ...current.prefixes.map((a) => a.affix.family),
            ...current.suffixes.map((a) => a.affix.family),
          ]);

          const availableTagAffixes = matchingTagAffixes.filter(
            (affix) => !usedFamilies.has(affix.family) && affix.type === addType
          );

          if (availableTagAffixes.length > 0) {
            const selectedAffix = selectWeightedAffix(
              availableTagAffixes,
              useWeights,
              useCustomWeights,
              customWeights
            );
            const values = generateAffixValues(selectedAffix);
            const uniqueId = `${selectedAffix.id}-${Date.now()}-${Math.random()}`;

            current[addType] = [
              ...current[addType],
              { affix: selectedAffix, values, id: uniqueId },
            ];
            addedAffix = selectedAffix;
          }
        } else {
          // Regular handling for non-diamond bases
          const availableFamilies = affixes[addType].filter(
            (fam) =>
              !current[addType].some((a) => a.affix.family === fam.family)
          );
          if (availableFamilies.length > 0) {
            const randomAffix = selectWeightedAffixFromFamilies(
              availableFamilies,
              useWeights,
              useCustomWeights,
              customWeights
            );
            const values = generateAffixValues(randomAffix);
            const uniqueId = `${randomAffix.id}-${Date.now()}-${Math.random()}`;
            current[addType] = [
              ...current[addType],
              { affix: randomAffix, values, id: uniqueId },
            ];
            addedAffix = randomAffix;
          }
        }

        setAffixLog((prevLog) => [
          `Chaos Orb - Removed 1 ${affixToRemove.type.slice(0, -2)} and Added 1 ${addType.slice(0, -2)}`,
          ...(addedAffix
            ? [`Added ${addType.slice(0, -2)}: ${addedAffix.affix_name}`]
            : []),
          `Removed ${affixToRemove.type.slice(0, -2)}: ${removedAffix.affix.affix_name}`,
          ...prevLog,
        ]);
      }
      return current;
    });
  };

  const handleAlchemyOrbUse = () => {
    if (!activeSelection?.baseType || activeSelection?.baseType == 'Diamond') {
      setActiveOrb('');
      return;
    }
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }

    const maxAffixesPerType = getMaxAffixCount(activeSelection.baseType);
    const affixes = getMatchingAffixes(
      activeSelection.baseType,
      itemLevel,
      activeSelection,
      bases,
      affixesData
    );
    setItemRarity('rare');

    // Decide random split based on max affixes per type
    let splits: Array<[number, number]>;
    if (maxAffixesPerType === 2) {
      // For jewels always 2/2
      splits = [[2, 2]];
    } else {
      // For regular items: 3/1, 2/2, or 1/3
      splits = [
        [3, 1],
        [2, 2],
        [1, 3],
      ];
    }

    const [prefixCount, suffixCount] =
      splits[Math.floor(Math.random() * splits.length)];

    // Find fractured affixes (if any)
    const fracturedPrefix = craftedAffixes.prefixes.find(
      (a) => a.affix.id === fracturedAffixId
    );
    const fracturedSuffix = craftedAffixes.suffixes.find(
      (a) => a.affix.id === fracturedAffixId
    );

    // Helper to pick random affixes, skipping families already used
    function pickRandomAffixes(
      families: AffixFamilyGroup[],
      count: number,
      skipFamilies: Set<string>
    ) {
      const picked: Array<{ affix: Affix; values: number[]; id: string }> = [];
      const usedFamilies = new Set<string>(skipFamilies);

      for (let i = 0; i < count; i++) {
        // Filter out families that are already used
        const availableFamilies = families.filter(
          (fam) => !usedFamilies.has(fam.family)
        );

        if (availableFamilies.length === 0) break;

        // Use the existing global weighted selection helper
        const selectedAffix = selectWeightedAffixFromFamilies(
          availableFamilies,
          useWeights,
          useCustomWeights,
          customWeights
        );

        picked.push({
          affix: selectedAffix,
          values: generateAffixValues(selectedAffix),
          id: `${selectedAffix.id}-${Date.now()}-${Math.random()}-${i}`,
        });

        // Mark this family as used
        usedFamilies.add(selectedAffix.family);
      }

      return picked;
    }

    // Prepare prefix and suffix pools, preserving fractured affix if present
    let newPrefixes: Array<{ affix: Affix; values: number[]; id: string }> = [];
    let newSuffixes: Array<{ affix: Affix; values: number[]; id: string }> = [];
    let prefixFamiliesToSkip = new Set<string>();
    let suffixFamiliesToSkip = new Set<string>();
    let prefixCountToRoll = prefixCount;
    let suffixCountToRoll = suffixCount;

    if (fracturedPrefix) {
      newPrefixes = [fracturedPrefix];
      prefixFamiliesToSkip.add(fracturedPrefix.affix.family);
      prefixCountToRoll -= 1;
    }
    if (fracturedSuffix) {
      newSuffixes = [fracturedSuffix];
      suffixFamiliesToSkip.add(fracturedSuffix.affix.family);
      suffixCountToRoll -= 1;
    }

    // Roll the rest
    if (prefixCountToRoll > 0) {
      newPrefixes = [
        ...newPrefixes,
        ...pickRandomAffixes(
          affixes.prefixes,
          prefixCountToRoll,
          prefixFamiliesToSkip
        ),
      ];
    }
    if (suffixCountToRoll > 0) {
      newSuffixes = [
        ...newSuffixes,
        ...pickRandomAffixes(
          affixes.suffixes,
          suffixCountToRoll,
          suffixFamiliesToSkip
        ),
      ];
    }

    setCraftedAffixes({
      prefixes: newPrefixes,
      suffixes: newSuffixes,
    });

    setAffixLog(
      [
        `Alchemy Orb - Rolled ${prefixCount} prefix${prefixCount !== 1 ? 'es' : ''} and ${suffixCount} suffix${suffixCount !== 1 ? 'es' : ''}`,
        newPrefixes.length > 0
          ? `Added prefix${newPrefixes.length > 1 ? 'es' : ''}: ${newPrefixes
              .map((p) => p.affix.affix_name)
              .join(', ')}`
          : '',
        newSuffixes.length > 0
          ? `Added suffix${newSuffixes.length > 1 ? 'es' : ''}: ${newSuffixes
              .map((s) => s.affix.affix_name)
              .join(', ')}`
          : '',
      ].filter(Boolean)
    );

    setActiveOrb('');
  };

  const handleExaltedOrbUse = () => {
    if (!activeSelection?.baseType || activeSelection?.baseType == 'Diamond') {
      setActiveOrb('');
      return;
    }
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (itemRarity !== 'rare') {
      setActiveOrb('');
      return;
    }

    if (craftedAffixes.prefixes.length + craftedAffixes.suffixes.length === 6) {
      setActiveOrb('');
    }

    const maxAffixesPerType = getMaxAffixCount(activeSelection.baseType);

    const affixes = getMatchingAffixes(
      activeSelection.baseType,
      itemLevel,
      activeSelection,
      bases,
      affixesData
    );

    // Determine which type can be added (max based on base type)
    const canAddPrefix = craftedAffixes.prefixes.length < maxAffixesPerType;
    const canAddSuffix = craftedAffixes.suffixes.length < maxAffixesPerType;

    if (!canAddPrefix && !canAddSuffix) {
      setActiveOrb('');
      return; // No room for more affixes
    }

    // Randomly choose to add a prefix or suffix, but only if there's room
    let addType: 'prefixes' | 'suffixes';
    if (canAddPrefix && canAddSuffix) {
      addType = Math.random() < 0.5 ? 'prefixes' : 'suffixes';
    } else if (canAddPrefix) {
      addType = 'prefixes';
    } else {
      addType = 'suffixes';
    }

    // Exclude families already used
    const usedFamilies = new Set(
      craftedAffixes[addType].map((a) => a.affix.family)
    );
    const availableFamilies = affixes[addType].filter(
      (fam) => !usedFamilies.has(fam.family)
    );
    if (availableFamilies.length === 0) return;

    // Pick a random family and affix
    const randomAffix = selectWeightedAffixFromFamilies(
      availableFamilies,
      useWeights,
      useCustomWeights,
      customWeights
    );
    const values = generateAffixValues(randomAffix);
    const uniqueId = `${randomAffix.id}-${Date.now()}-${Math.random()}`;

    setCraftedAffixes((prev) => ({
      prefixes:
        addType === 'prefixes'
          ? [...prev.prefixes, { affix: randomAffix, values, id: uniqueId }]
          : prev.prefixes,
      suffixes:
        addType === 'suffixes'
          ? [...prev.suffixes, { affix: randomAffix, values, id: uniqueId }]
          : prev.suffixes,
    }));

    setAffixLog((prevLog) => [
      `Exalted Orb - Added 1 ${addType.slice(0, -2)}`,
      `Added ${addType.slice(0, -2)}: ${randomAffix.affix_name}`,
      ...prevLog,
    ]);
  };

  const handleDivineOrbUse = () => {
    if (!activeSelection?.baseType) return;
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }

    // Reroll implicit value
    const base = bases.find((b) => b.base_name === activeSelection.baseType);
    if (base?.implicit) {
      const implicit = generateImplicitValue(base);
      setImplicitResult({ text: implicit.text, value: implicit.value ?? 0 });
    }

    // Reroll all affix values
    setCraftedAffixes((prev) => ({
      prefixes: prev.prefixes.map((p) =>
        p.affix.id === fracturedAffixId
          ? p
          : { ...p, values: generateAffixValues(p.affix) }
      ),
      suffixes: prev.suffixes.map((s) =>
        s.affix.id === fracturedAffixId
          ? s
          : { ...s, values: generateAffixValues(s.affix) }
      ),
    }));

    setAffixLog((prevLog) => ['Divine Orb - Rerolled all values', ...prevLog]);
  };

  const handleAnnulmentOrbUse = () => {
    if (!activeSelection?.baseType || activeSelection?.baseType == 'Diamond') {
      setActiveOrb('');
      return;
    }
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (itemRarity !== 'magic' && itemRarity !== 'rare') {
      setActiveOrb('');
      return;
    }

    if (craftedAffixes.prefixes.length + craftedAffixes.suffixes.length === 0) {
      setActiveOrb('');
      return;
    }

    // Determine which type(s) can be removed based on omens
    let allowedRemoveTypes: ('prefix' | 'suffix')[] = ['prefix', 'suffix'];

    if (SinistralAnnulmentOmen) {
      allowedRemoveTypes = ['prefix'];
    } else if (DextralAnnulmentOmen) {
      allowedRemoveTypes = ['suffix'];
    }

    // Gather all removable affixes based on omen restrictions
    const allAffixes = [
      ...craftedAffixes.prefixes
        .filter((a) => a.affix.id !== fracturedAffixId)
        .map((a) => ({ ...a, type: 'prefix' as const })),
      ...craftedAffixes.suffixes
        .filter((a) => a.affix.id !== fracturedAffixId)
        .map((a) => ({ ...a, type: 'suffix' as const })),
    ].filter((a) => allowedRemoveTypes.includes(a.type));

    if (allAffixes.length === 0) {
      setActiveOrb('');
      return;
    }

    // Pick a random affix to remove
    const removeIdx = Math.floor(Math.random() * allAffixes.length);
    const toRemove = allAffixes[removeIdx];

    setCraftedAffixes((prev) => {
      if (toRemove.type === 'prefix') {
        return {
          ...prev,
          prefixes: prev.prefixes.filter((a) => a.id !== toRemove.id),
        };
      } else {
        return {
          ...prev,
          suffixes: prev.suffixes.filter((a) => a.id !== toRemove.id),
        };
      }
    });

    setAffixLog((prevLog) => [
      `Annulment Orb - Removed 1 ${toRemove.type}`,
      `Removed ${toRemove.type}: ${toRemove.affix.affix_name}`,
      ...prevLog,
    ]);
  };

  const VaalOrbChaos = (count: number) => {
    if (!activeSelection?.baseType || itemRarity === 'normal') return;

    setCraftedAffixes((prev) => {
      let current = { ...prev };
      const logEntries: string[] = [];

      for (let i = 0; i < count; i++) {
        if (!activeSelection?.baseType) break;
        const maxAffixesPerType = getMaxAffixCount(activeSelection.baseType);
        const affixes = getMatchingAffixes(
          activeSelection.baseType,
          itemLevel,
          activeSelection,
          bases,
          affixesData
        );

        // Get removable affixes (excluding fractured)
        const removableAffixes = [
          ...current.prefixes
            .filter((a) => a.affix.id !== fracturedAffixId)
            .map((a) => ({ ...a, type: 'prefixes' as const })),
          ...current.suffixes
            .filter((a) => a.affix.id !== fracturedAffixId)
            .map((a) => ({ ...a, type: 'suffixes' as const })),
        ];

        if (removableAffixes.length === 0) continue;

        // Remove random affix
        const affixToRemove =
          removableAffixes[Math.floor(Math.random() * removableAffixes.length)];
        const removeIdx = current[affixToRemove.type].findIndex(
          (a) => a.id === affixToRemove.id
        );
        const removedAffix = current[affixToRemove.type][removeIdx];
        current[affixToRemove.type] = current[affixToRemove.type].filter(
          (_, idx) => idx !== removeIdx
        );

        // Determine add type
        const addType: 'prefixes' | 'suffixes' =
          current.prefixes.length === maxAffixesPerType
            ? 'suffixes'
            : current.suffixes.length === maxAffixesPerType
              ? 'prefixes'
              : Math.random() < 0.5
                ? 'prefixes'
                : 'suffixes';

        // Add new affix
        let addedAffix: Affix | null = null;
        if (current[addType].length < maxAffixesPerType) {
          const availableFamilies = affixes[addType].filter(
            (fam) =>
              !current[addType].some((a) => a.affix.family === fam.family)
          );

          if (availableFamilies.length > 0) {
            const randomAffix = selectWeightedAffixFromFamilies(
              availableFamilies,
              useWeights,
              useCustomWeights,
              customWeights
            );
            const values = generateAffixValues(randomAffix);
            const uniqueId = `${randomAffix.id}-${Date.now()}-${Math.random()}-${i}`;

            current[addType] = [
              ...current[addType],
              { affix: randomAffix, values, id: uniqueId },
            ];
            addedAffix = randomAffix;
          }
        }

        logEntries.push(
          `Vaal Chaos ${i + 1}: Removed ${affixToRemove.type.slice(0, -2)}: ${removedAffix.affix.affix_name}`,
          ...(addedAffix
            ? [
                `Vaal Chaos ${i + 1}: Added ${addType.slice(0, -2)}: ${addedAffix.affix_name}`,
              ]
            : [])
        );
      }

      setAffixLog((prevLog) => [...logEntries, ...prevLog]);
      return current;
    });
  };

  const handleVaalOrbUse = () => {
    if (!activeSelection?.baseType) return;
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }

    const roll = CorruptionOmen
      ? Math.floor(Math.random() * 3)
      : Math.floor(Math.random() * 4);

    if (roll === 0) {
      const amount = Math.floor(Math.random() * 3) + 1;
      VaalOrbChaos(amount);
      setItemCorruption(1);
      const logAmount =
        amount === 1 ? 'Single' : amount === 2 ? 'Double' : 'Triple';
      setTimeout(() => {
        setAffixLog((prevLog) => [
          'Vaal Orb - Corrupted Item',
          `Vaal Orb - ${logAmount} Chaos`,
          ...prevLog,
        ]);
        setActiveOrb('');
      }, 10);
      return;
    }

    if (roll === 1) {
      // Add an additional socket past the max, but not for certain bases
      setItemCorruption(1);
      const base = bases.find((b) => b.base_name === activeSelection?.baseType);
      const noSocketClasses = [
        'Amulet',
        'Belt',
        'Focus',
        'Jewel',
        'Ring',
        'Quiver',
      ];

      // Special handling for jewels - add or remove an affix
      if (
        base &&
        base.item_class === 'Jewel' &&
        activeSelection?.baseType !== 'Diamond'
      ) {
        const totalAffixes =
          craftedAffixes.prefixes.length + craftedAffixes.suffixes.length;

        // 50/50 chance to add or remove
        const shouldAdd = Math.random() < 0.5;

        if (shouldAdd) {
          // Add an affix (ignoring limits)
          const affixes = getMatchingAffixes(
            activeSelection.baseType,
            itemLevel,
            activeSelection,
            bases,
            affixesData
          );

          const addType: 'prefixes' | 'suffixes' =
            Math.random() < 0.5 ? 'prefixes' : 'suffixes';

          // Get available families
          const usedFamilies = new Set(
            craftedAffixes[addType].map((a) => a.affix.family)
          );
          const availableFamilies = affixes[addType].filter(
            (fam) => !usedFamilies.has(fam.family)
          );

          if (availableFamilies.length > 0) {
            const randomAffix = selectWeightedAffixFromFamilies(
              availableFamilies,
              useWeights,
              useCustomWeights,
              customWeights
            );
            const values = generateAffixValues(randomAffix);
            const uniqueId = `${randomAffix.id}-${Date.now()}-${Math.random()}`;

            setCraftedAffixes((prev) => {
              const newState = {
                ...prev,
                [addType]: [
                  ...prev[addType],
                  { affix: randomAffix, values, id: uniqueId },
                ],
              };

              // If magic and results in 2 prefixes or suffixes, upgrade to rare
              if (
                itemRarity === 'magic' &&
                (newState.prefixes.length === 2 ||
                  newState.suffixes.length === 2)
              ) {
                setItemRarity('rare');
              }

              return newState;
            });

            setAffixLog((prevLog) => [
              'Vaal Orb - Corrupted Item',
              `Vaal Orb - Added ${addType.slice(0, -2)}: ${randomAffix.affix_name}`,
              ...prevLog,
            ]);
          }
        } else {
          // Remove an affix
          if (totalAffixes > 0) {
            const removableAffixes = [
              ...craftedAffixes.prefixes
                .filter((a) => a.affix.id !== fracturedAffixId)
                .map((a) => ({ ...a, type: 'prefixes' as const })),
              ...craftedAffixes.suffixes
                .filter((a) => a.affix.id !== fracturedAffixId)
                .map((a) => ({ ...a, type: 'suffixes' as const })),
            ];

            if (removableAffixes.length > 0) {
              const affixToRemove =
                removableAffixes[
                  Math.floor(Math.random() * removableAffixes.length)
                ];

              setCraftedAffixes((prev) => ({
                ...prev,
                [affixToRemove.type]: prev[affixToRemove.type].filter(
                  (a) => a.id !== affixToRemove.id
                ),
              }));

              setAffixLog((prevLog) => [
                'Vaal Orb - Corrupted Item',
                `Vaal Orb - Removed ${affixToRemove.type.slice(0, -2)}: ${affixToRemove.affix.affix_name}`,
                ...prevLog,
              ]);
            }
          }
        }
      } else if (base && !noSocketClasses.includes(base.item_class)) {
        setItemSockets((prev) => prev + 1);
        setAffixLog((prevLog) => [
          'Vaal Orb - Corrupted Item',
          'Vaal Orb - Additional Socket Added',
          ...prevLog,
        ]);
      } else {
        setAffixLog((prevLog) => [
          'Vaal Orb - Corrupted Item',
          'Vaal Orb - Additional Socket Failed (This Base Cannot Have Sockets)',
          ...prevLog,
        ]);
      }
      setActiveOrb('');
      return;
    }

    if (roll === 2) {
      // Add an enchantment
      setItemCorruption(1);
      const base = bases.find((b) => b.base_name === activeSelection?.baseType);

      if (base && enchantsData) {
        const enchantsArray = Array.isArray(enchantsData)
          ? enchantsData
          : [enchantsData];
        const selectedEnchant = selectRandomEnchant(
          enchantsArray,
          base.item_class,
          base
        );

        if (selectedEnchant) {
          const enchantValue = generateEnchantValue(selectedEnchant);
          setEnchantResult({
            enchant: selectedEnchant,
            value: enchantValue,
          });

          setAffixLog((prevLog) => [
            'Vaal Orb - Corrupted Item',
            `Vaal Orb - Enchantment Added: ${selectedEnchant.effect}`,
            ...prevLog,
          ]);
          setActiveOrb('');
          return;
        }
      }
    }

    if (roll === 3) {
      setItemCorruption(1);
      setAffixLog((prevLog) => [
        'Vaal Orb - Corrupted Item',
        'Vaal Orb - Nothing happened',
        ...prevLog,
      ]);
      setActiveOrb('');
      return;
    }
  };

  const handleWhetstoneUse = () => {
    if (!activeSelection?.baseType) return;
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }

    // Find the selected base
    const base = bases.find((b) => b.base_name === activeSelection.baseType);
    if (!base) return;

    // Only allow on weapons, but not sceptre, staff, or wand
    const weaponTypes = [
      'One Hand Axe',
      'Two Hand Axe',
      'One Hand Mace',
      'Two Hand Mace',
      'One Hand Sword',
      'Two Hand Sword',
      'Claw',
      'Dagger',
      'Flail',
      'Spear',
      'Bow',
      'Crossbow',
      'Quarterstaff',
    ];
    if (!weaponTypes.includes(base.item_class)) {
      setActiveOrb('');
      return;
    }
    setItemQuality(20);
    setActiveOrb('');
  };

  const handleScrapUse = () => {
    if (!activeSelection?.baseType) return;
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }

    // Find the selected base
    const base = bases.find((b) => b.base_name === activeSelection.baseType);
    if (!base) return;

    // Only allow on armour
    const armourTypes = ['Helmet', 'Body Armour', 'Gloves', 'Boots', 'Shield'];
    if (!armourTypes.includes(base.item_class)) {
      setActiveOrb('');
      return;
    }
    setItemQuality(20);
    setActiveOrb('');
  };

  const handleArtificerUse = () => {
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (!activeSelection?.baseType) return;

    // Find the selected base
    const base = bases.find((b) => b.base_name === activeSelection.baseType);
    if (!base) return;

    // Only allow on weapons and armour
    const weaponClasses = [
      'One Hand Axe',
      'Two Hand Axe',
      'One Hand Mace',
      'Two Hand Mace',
      'One Hand Sword',
      'Two Hand Sword',
      'Claw',
      'Dagger',
      'Flail',
      'Spear',
      'Bow',
      'Crossbow',
      'Staff',
      'Quarterstaff',
      'Wand',
      'Sceptre',
    ];
    const armourClasses = [
      'Helmet',
      'Body Armour',
      'Gloves',
      'Boots',
      'Focus',
      'Shield',
    ];

    const isWeapon = weaponClasses.includes(base.item_class);
    const isArmour = armourClasses.includes(base.item_class);

    if (!isWeapon && !isArmour) {
      setActiveOrb('');
      return;
    }

    // Determine max sockets
    const twoSockets = [
      'Two Hand Axe',
      'Two Hand Mace',
      'Two Hand Sword',
      'Bow',
      'Crossbow',
      'Staff',
      'Quarterstaff',
      'Body Armour',
    ];
    const maxSockets = twoSockets.includes(base.item_class) ? 2 : 1;

    setItemSockets(maxSockets);
    setActiveOrb('');
  };

  const handleScouringOrbUse = () => {
    if (!activeSelection?.baseType || activeSelection?.baseType == 'Diamond') {
      setActiveOrb('');
      return;
    }
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }

    // Find the fractured affix before clearing
    let fracturedAffix = null;
    if (fracturedAffixId) {
      fracturedAffix =
        craftedAffixes.prefixes.find((a) => a.affix.id === fracturedAffixId) ||
        craftedAffixes.suffixes.find((a) => a.affix.id === fracturedAffixId);
    }

    // Clear affixes, but preserve fractured affix if it exists
    setCraftedAffixes({
      prefixes:
        fracturedAffix &&
        craftedAffixes.prefixes.some((a) => a.affix.id === fracturedAffixId)
          ? [fracturedAffix]
          : [],
      suffixes:
        fracturedAffix &&
        craftedAffixes.suffixes.some((a) => a.affix.id === fracturedAffixId)
          ? [fracturedAffix]
          : [],
    });

    setAffixLog((prevLog) => ['Scouring Orb - Made Item Normal', ...prevLog]);
    setItemRarity('normal');
    setActiveOrb('');
  };

  const handleFracturingOrbUse = () => {
    // Only works on rare items with exactly 4 affixes and no fractured affix yet
    const totalAffixes =
      craftedAffixes.prefixes.length + craftedAffixes.suffixes.length;
    if (itemRarity !== 'rare' || totalAffixes !== 4 || fracturedAffixId) {
      setActiveOrb('');
      return;
    }

    // Combine all affixes into one array with type info
    const allAffixes = [
      ...craftedAffixes.prefixes.map((a) => ({
        ...a,
        type: 'prefix' as const,
      })),
      ...craftedAffixes.suffixes.map((a) => ({
        ...a,
        type: 'suffix' as const,
      })),
    ];

    // Pick a random affix to fracture
    const randomIdx = Math.floor(Math.random() * allAffixes.length);
    const fractured = allAffixes[randomIdx];

    setFracturedAffixId(fractured.affix.id);

    setAffixLog((prevLog) => [
      `Fracturing Orb - Fractured ${fractured.type}: ${fractured.affix.affix_name}`,
      ...prevLog,
    ]);
    setActiveOrb('');
  };

  const handleTeardropUse = () => {
    if (
      ['Diamond', 'Ruby', 'Emerald', 'Sapphire'].includes(
        activeSelection?.baseType ?? ''
      ) ||
      !activeSelection?.baseType
    ) {
      setActiveOrb('');
      return;
    }
    // Only usable on corrupted rare items
    if (itemCorruption !== 1 || itemRarity !== 'rare') {
      setActiveOrb('');
      return;
    }

    // Helper to get all affixes for this base and ilvl
    const affixes = getMatchingAffixes(
      activeSelection.baseType,
      itemLevel,
      activeSelection,
      bases,
      affixesData
    );

    // Helper to shift tier up or down for a given affix
    function shiftAffixTier(currentAffix: Affix, allTiers: Affix[]) {
      // Find current index in the sorted tiers (highest tier first)
      const sorted = [...allTiers].sort((a, b) => b.ilvl - a.ilvl);
      const idx = sorted.findIndex((a) => a.id === currentAffix.id);
      if (idx === -1) return currentAffix;

      // Randomly decide to go up or down a tier
      const direction = Math.random() < 0.5 ? -1 : 1;
      const newIdx = idx + direction;

      // Clamp to valid range
      if (newIdx < 0 || newIdx >= sorted.length) return currentAffix;
      return sorted[newIdx];
    }

    // Update prefixes
    setCraftedAffixes((prev) => {
      const newPrefixes = prev.prefixes.map(({ affix, values, id }) => {
        if (affix.id === fracturedAffixId) return { affix, values, id };
        const family = affix.family;
        const allTiers =
          affixes.prefixes.find((fam) => fam.family === family)?.affixes || [];
        const newAffix = shiftAffixTier(affix, allTiers);
        // If tier changed, reroll values
        return {
          affix: newAffix,
          values:
            newAffix.id === affix.id ? values : generateAffixValues(newAffix),
          id,
        };
      });

      const newSuffixes = prev.suffixes.map(({ affix, values, id }) => {
        if (affix.id === fracturedAffixId) return { affix, values, id };
        const family = affix.family;
        const allTiers =
          affixes.suffixes.find((fam) => fam.family === family)?.affixes || [];
        const newAffix = shiftAffixTier(affix, allTiers);
        return {
          affix: newAffix,
          values:
            newAffix.id === affix.id ? values : generateAffixValues(newAffix),
          id,
        };
      });

      return { prefixes: newPrefixes, suffixes: newSuffixes };
    });

    setAffixLog((prevLog) => [
      'Teardrop - Raised or Lowered each Affix by 1 Tier',
      ...prevLog,
    ]);
  };

  const EssenceMap: { [key: string]: string } = {
    Enhancement: 'defence',
    Torment: 'physical',
    Ruin: 'chaos',
    Body: 'life',
    Flames: 'fire',
    Battle: 'attack',
    Mind: 'mana',
    Ice: 'cold',
    Sorcery: 'caster',
    Infinite: 'attribute',
    Electricity: 'lightning',
    Haste: 'speed',
  };

  const handleEssenceUse = (essenceKey: string) => {
    if (!activeSelection?.baseType || activeSelection?.baseType == 'Diamond') {
      setActiveOrb('');
      return;
    }
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (itemRarity !== 'normal') {
      setActiveOrb('');
      return;
    }

    const craftTag = EssenceMap[essenceKey];

    const affixes = getMatchingAffixes(
      activeSelection.baseType,
      itemLevel,
      activeSelection,
      bases,
      affixesData
    );

    // Find affixes with the mapped craft tag
    const matchingAffixes = [
      ...affixes.prefixes.flatMap((family) =>
        family.affixes
          .filter(
            (affix) => affix.craft_tags && affix.craft_tags.includes(craftTag)
          )
          .map((affix) => ({ ...affix, type: 'prefix' as const }))
      ),
      ...affixes.suffixes.flatMap((family) =>
        family.affixes
          .filter(
            (affix) => affix.craft_tags && affix.craft_tags.includes(craftTag)
          )
          .map((affix) => ({ ...affix, type: 'suffix' as const }))
      ),
    ];

    if (matchingAffixes.length === 0) {
      setAffixLog((prevLog) => [
        `${essenceKey} Essence - No Available ${craftTag} Affixes`,
        ...prevLog,
      ]);
      setActiveOrb('');
      return;
    }

    setItemRarity('magic');

    // Use weighted selection instead of random
    const selectedAffix = selectWeightedAffix(
      matchingAffixes,
      useWeights,
      useCustomWeights,
      customWeights
    );
    const values = generateAffixValues(selectedAffix);
    const uniqueId = `${selectedAffix.id}-${Date.now()}-${Math.random()}`;

    // Find the selected affix with type info
    const randomAffix = matchingAffixes.find(
      (affix) => affix.id === selectedAffix.id
    )!;

    setCraftedAffixes((prev) => ({
      prefixes:
        randomAffix.type === 'prefix'
          ? [...prev.prefixes, { affix: randomAffix, values, id: uniqueId }]
          : prev.prefixes,
      suffixes:
        randomAffix.type === 'suffix'
          ? [...prev.suffixes, { affix: randomAffix, values, id: uniqueId }]
          : prev.suffixes,
    }));

    setAffixLog((prevLog) => [
      `${essenceKey} Essence - Made Item Magic`,
      `Added ${randomAffix.type}: ${randomAffix.affix_name}`,
      ...prevLog,
    ]);

    setActiveOrb('');
  };

  // Update handleGreaterEssenceUse function:
  const handleGreaterEssenceUse = (essenceKey: string) => {
    if (!activeSelection?.baseType || activeSelection?.baseType == 'Diamond') {
      setActiveOrb('');
      return;
    }
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (itemRarity !== 'magic') {
      setActiveOrb('');
      return;
    }

    const craftTag = EssenceMap[essenceKey];

    const affixes = getMatchingAffixes(
      activeSelection.baseType,
      itemLevel,
      activeSelection,
      bases,
      affixesData
    );

    // Gather all used families from current affixes
    const usedFamilies = new Set([
      ...craftedAffixes.prefixes.map((a) => a.affix.family),
      ...craftedAffixes.suffixes.map((a) => a.affix.family),
    ]);

    // Filter out affixes whose family is already present
    const matchingAffixes = [
      ...affixes.prefixes.flatMap((family) =>
        family.affixes
          .filter(
            (affix) =>
              affix.craft_tags &&
              affix.craft_tags.includes(craftTag) &&
              !usedFamilies.has(family.family)
          )
          .map((affix) => ({ ...affix, type: 'prefix' as const }))
      ),
      ...affixes.suffixes.flatMap((family) =>
        family.affixes
          .filter(
            (affix) =>
              affix.craft_tags &&
              affix.craft_tags.includes(craftTag) &&
              !usedFamilies.has(family.family)
          )
          .map((affix) => ({ ...affix, type: 'suffix' as const }))
      ),
    ];

    if (matchingAffixes.length === 0) {
      setAffixLog((prevLog) => [
        `Greater ${essenceKey} Essence - No Available ${craftTag} Affixes`,
        ...prevLog,
      ]);
      setActiveOrb('');
      return;
    }

    setItemRarity('rare');

    // Use weighted selection instead of random
    const selectedAffix = selectWeightedAffix(
      matchingAffixes,
      useWeights,
      useCustomWeights,
      customWeights
    );
    const values = generateAffixValues(selectedAffix);
    const uniqueId = `${selectedAffix.id}-${Date.now()}-${Math.random()}`;

    // Find the selected affix with type info
    const randomAffix = matchingAffixes.find(
      (affix) => affix.id === selectedAffix.id
    )!;

    setCraftedAffixes((prev) => ({
      prefixes:
        randomAffix.type === 'prefix'
          ? [...prev.prefixes, { affix: randomAffix, values, id: uniqueId }]
          : prev.prefixes,
      suffixes:
        randomAffix.type === 'suffix'
          ? [...prev.suffixes, { affix: randomAffix, values, id: uniqueId }]
          : prev.suffixes,
    }));

    setAffixLog((prevLog) => [
      `Greater ${essenceKey} Essence - Made Item Rare`,
      `Added ${randomAffix.type}: ${randomAffix.affix_name}`,
      ...prevLog,
    ]);

    setActiveOrb('');
  };

  return {
    handleTransmutationOrbUse,
    handleAugmentationOrbUse,
    handleAlterationOrbUse,
    handleRegalOrbUse,
    handleChaosOrbUse,
    handleAlchemyOrbUse,
    handleExaltedOrbUse,
    handleDivineOrbUse,
    handleAnnulmentOrbUse,
    handleVaalOrbUse,
    handleWhetstoneUse,
    handleScrapUse,
    handleArtificerUse,
    handleScouringOrbUse,
    handleFracturingOrbUse,
    handleTeardropUse,
    handleEssenceUse,
    handleGreaterEssenceUse,
  };
};
