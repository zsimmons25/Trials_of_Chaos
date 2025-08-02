import React, { useState } from 'react';
import { useSuspenseQuery } from '@tanstack/react-query';
import { itemqfn, ItemsResponse } from './handlers/itemsquery';
import { Item } from './types/items';
import { affixqfn } from './handlers/affixesquery';
import { Affix, Affixes } from './types/affixes';
import { enchantsqfn } from './handlers/enchantsquery';
import { Enchant, Enchants } from './types/enchants';
import { socketablesqfn } from './handlers/socketablesquery';
import { Socketable, Socketables } from './types/socketables';
import { SocketablesInv } from './Socketables';
import { ItemSlots } from './ItemSlots';
import { ItemDisplay } from './ItemDisplay';
import { RangeSlider } from './RangeSlider';
import {
  generateImplicitValue,
  getMatchingAffixes,
  getValueRanges,
  generateAffixValues,
  applyValueToEffect,
} from './utils/affixHelpers';
import { useOrbHandlers } from './Orbs';

function Crafting() {
  const [bluebg, setBluebg] = useState(false);
  const [tooltips, setTooltips] = useState(true);
  const [itemLevel, setItemLevel] = useState<number>(82);
  const [activeSelection, setActiveSelection] = useState<{
    slot: string;
    subtype: string;
    shieldType?: string;
    baseType?: string;
    ringSlot?: 'left' | 'right';
  } | null>(null);
  const [itemRarity, setItemRarity] = useState<'normal' | 'magic' | 'rare'>(
    'normal'
  );
  const [implicitResult, setImplicitResult] = useState<{
    text: string;
    value: number;
  }>({ text: '', value: 0 });
  const [affixLog, setAffixLog] = useState<string[]>([]);
  const [expandedAffixFamilies, setExpandedAffixFamilies] = useState<{
    [key: string]: boolean;
  }>({});
  const [expandedCustomWeightFamilies, setExpandedCustomWeightFamilies] =
    useState<{ [key: string]: boolean }>({});
  const [activeOrb, setActiveOrb] = useState<string | null>(null);
  const [activeSocketable, setActiveSocketable] = useState<Socketable | null>(
    null
  );
  const [cursorPos, setCursorPos] = useState<{ x: number; y: number }>({
    x: 0,
    y: 0,
  });
  const [itemQuality, setItemQuality] = useState(0);
  const [itemSockets, setItemSockets] = useState(0);
  const [itemSocket1effect, setItemSocket1effect] = useState('');
  const [itemSocket1type, setitemSocket1type] = useState('');
  const [itemSocket2effect, setItemSocket2effect] = useState('');
  const [itemSocket2type, setitemSocket2type] = useState('');
  const [itemSocket3effect, setItemSocket3effect] = useState('');
  const [itemSocket3type, setitemSocket3type] = useState('');
  const [itemCorruption, setItemCorruption] = useState(0);
  const [enchantResult, setEnchantResult] = useState<{
    enchant: Enchant;
    value: number | null;
  } | null>(null);
  const [CorruptionOmen, setCorruptionOmen] = useState(0);
  const [WhittlingOmen, setWhittlingOmen] = useState(0);
  const [SinistralErasureOmen, setSinistralErasureOmen] = useState(0);
  const [DextralErasureOmen, setDextralErasureOmen] = useState(0);
  const [SinistralAnnulmentOmen, setSinistralAnnulmentOmen] = useState(0);
  const [DextralAnnulmentOmen, setDextralAnnulmentOmen] = useState(0);
  const [fracturedAffixId, setFracturedAffixId] = useState<string | null>(null);
  const [useWeights, setUseWeights] = useState(true);
  const [useCustomWeights, setUseCustomWeights] = useState(false);
  const [customWeights, setCustomWeights] = useState<Record<string, number>>(
    {}
  );

  const [showSocketables, setShowSocketables] = useState(false);

  const [stateHistory, setStateHistory] = useState<
    Array<{
      craftedAffixes: typeof craftedAffixes;
      itemRarity: typeof itemRarity;
      itemQuality: number;
      itemSockets: number;
      itemCorruption: number;
      fracturedAffixId: string | null;
      enchantResult: typeof enchantResult;
      implicitResult: typeof implicitResult;
      affixLog: string[];
      timestamp: number;
    }>
  >([]);

  // Undo Function
  const undoLastAction = () => {
    if (stateHistory.length === 0) return;

    const previousState = stateHistory[stateHistory.length - 1];

    // Restore all state
    setCraftedAffixes(previousState.craftedAffixes);
    setItemRarity(previousState.itemRarity);
    setItemQuality(previousState.itemQuality);
    setItemSockets(previousState.itemSockets);
    setShowSocketables(false);
    setItemCorruption(previousState.itemCorruption);
    setFracturedAffixId(previousState.fracturedAffixId);
    setEnchantResult(previousState.enchantResult);
    setImplicitResult(previousState.implicitResult);
    setAffixLog(previousState.affixLog);

    // Remove the last state from history
    setStateHistory((prev) => prev.slice(0, -1));
  };

  // Save State Function
  const saveStateBeforeAction = () => {
    const currentState = {
      craftedAffixes,
      itemRarity,
      itemQuality,
      itemSockets,
      itemCorruption,
      fracturedAffixId,
      enchantResult,
      implicitResult,
      affixLog,
      timestamp: Date.now(),
    };

    setStateHistory((prev) => [...prev, currentState].slice(-20)); // Keep last 20 states
  };

  const nhl = (
    <img src='/images/header_normal_left.png' alt='header left' className='h-full' />
  );
  const nhm = (
    <div
      className='h-full flex-grow bg-repeat-x'
      style={{
        backgroundImage: `url('header_normal_middle.png')`,
        backgroundSize: 'auto 100%',
      }}
    />
  );
  const nhr = (
    <img src='/images/header_normal_right.png' alt='header right' className='h-full' />
  );

  const chl = (
    <img
      src='/images/header_currency_left.png'
      alt='header left currency'
      className='h-full'
    />
  );
  const chm = (
    <div
      className='h-full flex-grow bg-repeat-x'
      style={{
        backgroundImage: `url('header_currency_middle.png')`,
        backgroundSize: 'auto 100%',
      }}
    />
  );
  const chr = (
    <img
      src='/images/header_currency_right.png'
      alt='header right currency'
      className='h-full'
    />
  );
  const csep = (
    <img
      className='mx-auto my-1'
      src='/images/separator_currency.png'
      alt='currency seperator'
    />
  );

  const { data: itemAndBaseData } = useSuspenseQuery<ItemsResponse>({
    queryKey: ['items'],
    queryFn: itemqfn,
    refetchOnWindowFocus: false,
  });

  const { bases } = itemAndBaseData!;

  const { data: affixesData } = useSuspenseQuery<Affixes>({
    queryKey: ['affixes'],
    queryFn: affixqfn,
    refetchOnWindowFocus: false,
  });

  const { data: enchantsData } = useSuspenseQuery<Enchants>({
    queryKey: ['enchants'],
    queryFn: enchantsqfn,
    refetchOnWindowFocus: false,
  });

  const { data: socketablesData } = useSuspenseQuery<Socketables>({
    queryKey: ['socketables'],
    queryFn: socketablesqfn,
    refetchOnWindowFocus: false,
  });

  const completeSelection = (
    slot: string,
    subtype: string,
    shieldType?: string,
    baseType?: string,
    ringSlot?: 'left' | 'right'
  ) => {
    // Check if we should clear affixes when changing base types
    if (
      activeSelection?.baseType &&
      baseType &&
      activeSelection.baseType !== baseType
    ) {
      const shouldClearAffixes = !areBaseTypesCompatible(
        activeSelection.baseType,
        baseType
      );

      if (shouldClearAffixes) {
        setCraftedAffixes({ prefixes: [], suffixes: [] });
        setAffixLog([]);
        setItemRarity('normal');
        setItemQuality(0);
        setItemSockets(0);
        setItemSocket1effect('');
        setitemSocket1type('');
        setItemSocket2effect('');
        setitemSocket2type('');
        setItemSocket3effect('');
        setitemSocket3type('');
        setShowSocketables(false);
        setItemCorruption(0);
        setEnchantResult(null);
        setFracturedAffixId(null);
        setStateHistory([]);
      }
    }

    // Set the new selection
    const newSelection = {
      slot,
      subtype,
      shieldType,
      baseType,
      ringSlot,
    };

    setStateHistory([]);
    setActiveSelection(newSelection);

    // Special handling for diamond jewels
    if (isDiamondBase(baseType)) {
      // Clear any existing affixes and set to rare
      setCraftedAffixes({ prefixes: [], suffixes: [] });
      setItemRarity('rare');

      // Generate 3 random affixes for diamond
      setTimeout(() => {
        if (!baseType) return;
        const matchingAffixes = getMatchingAffixes(
          baseType,
          itemLevel,
          newSelection,
          bases,
          affixesData
        );

        if (
          matchingAffixes.prefixes.length > 0 ||
          matchingAffixes.suffixes.length > 0
        ) {
          generateDiamondAffixes(matchingAffixes);
        }
      }, 0);
    }
  };

  const matchingAffixes = activeSelection?.baseType
    ? getMatchingAffixes(
        activeSelection.baseType,
        itemLevel,
        activeSelection,
        bases,
        affixesData
      )
    : { prefixes: [], suffixes: [] };

  const toggleAffixFamily = (family: string) => {
    setExpandedAffixFamilies((prev) => ({
      ...prev,
      [family]: !prev[family],
    }));
  };

  const toggleCustomWeightFamily = (family: string) => {
    setExpandedCustomWeightFamilies((prev) => ({
      ...prev,
      [family]: !prev[family],
    }));
  };

  const [craftedAffixes, setCraftedAffixes] = useState<{
    prefixes: Array<{ affix: Affix; values: number[]; id: string }>;
    suffixes: Array<{ affix: Affix; values: number[]; id: string }>;
  }>({
    prefixes: [],
    suffixes: [],
  });

  const updateAffixValue = React.useCallback(
    (
      type: 'prefix' | 'suffix',
      index: number,
      valueIndex: number,
      newValue: number
    ) => {
      const roundedValue = Number.isInteger(newValue)
        ? newValue
        : Math.round(newValue * 100) / 100;

      setCraftedAffixes((prev) => {
        if (type === 'prefix') {
          const newPrefixes = prev.prefixes.slice();
          const targetAffix = { ...newPrefixes[index] };
          targetAffix.values = targetAffix.values.slice();
          targetAffix.values[valueIndex] = roundedValue;
          newPrefixes[index] = targetAffix;

          return {
            ...prev,
            prefixes: newPrefixes,
          };
        } else {
          const newSuffixes = prev.suffixes.slice();
          const targetAffix = { ...newSuffixes[index] };
          targetAffix.values = targetAffix.values.slice();
          targetAffix.values[valueIndex] = roundedValue;
          newSuffixes[index] = targetAffix;

          return {
            ...prev,
            suffixes: newSuffixes,
          };
        }
      });
    },
    []
  );

  const getMaxAffixCount = (baseType: string | undefined): number => {
    if (!baseType) return 3;
    const jewelBases = ['ruby', 'emerald', 'sapphire'];
    const isJewelBase = jewelBases.some((jewel) =>
      baseType.toLowerCase().includes(jewel.toLowerCase())
    );
    return isJewelBase ? 2 : 3;
  };

  const isDiamondBase = (baseType: string | undefined): boolean => {
    return baseType ? baseType.toLowerCase().includes('diamond') : false;
  };

  const generateDiamondAffixes = (matchingAffixes: {
    prefixes: { family: string; affixes: Affix[] }[];
    suffixes: { family: string; affixes: Affix[] }[];
  }) => {
    const getAffixesForJewel = (jewel: 'ruby' | 'emerald' | 'sapphire') => {
      const lowerJewel = jewel.toLowerCase();
      const prefixAffixes = matchingAffixes.prefixes
        .flatMap((family) => family.affixes)
        .filter((affix) => affix.item_tags?.toLowerCase().includes(lowerJewel));
      const suffixAffixes = matchingAffixes.suffixes
        .flatMap((family) => family.affixes)
        .filter((affix) => affix.item_tags?.toLowerCase().includes(lowerJewel));
      return [...prefixAffixes, ...suffixAffixes];
    };

    const usedFamilies = new Set<string>();
    const selectedAffixes: {
      prefixes: { affix: Affix; values: number[]; id: string }[];
      suffixes: { affix: Affix; values: number[]; id: string }[];
    } = { prefixes: [], suffixes: [] };

    // Always pick 1 affix from each jewel type
    (['ruby', 'emerald', 'sapphire'] as const).forEach((jewel) => {
      const candidates = getAffixesForJewel(jewel).filter(
        (affix) => !usedFamilies.has(affix.family)
      );
      if (candidates.length === 0) return;
      const affix = candidates[Math.floor(Math.random() * candidates.length)];
      usedFamilies.add(affix.family);
      const values = generateAffixValues(affix);
      const uniqueId = `${affix.id}-${Date.now()}-${Math.random()}`;
      if (affix.affix_type.toLowerCase() === 'prefix') {
        selectedAffixes.prefixes.push({ affix, values, id: uniqueId });
      } else {
        selectedAffixes.suffixes.push({ affix, values, id: uniqueId });
      }
    });

    setCraftedAffixes(selectedAffixes);
    setAffixLog([`Diamond automatically crafted with 1 affix per jewel type`]);
  };

  const addAffix = (affix: Affix) => {
    const isPrefix = affix.affix_type.toLowerCase() === 'prefix';
    const values = generateAffixValues(affix);
    const uniqueId = `${affix.id}-${Date.now()}-${Math.random()}`;

    setCraftedAffixes((prev) => {
      if (isPrefix) {
        if (prev.prefixes.length >= 3) {
          return prev;
        }
        return {
          ...prev,
          prefixes: [...prev.prefixes, { affix, values, id: uniqueId }],
        };
      } else {
        if (prev.suffixes.length >= 3) {
          return prev;
        }
        return {
          ...prev,
          suffixes: [...prev.suffixes, { affix, values, id: uniqueId }],
        };
      }
    });

    // Collapse family after adding the affix
    //setExpandedAffixFamilies((prev) => ({
    //  ...prev,
    //  [affix.family]: false,
    //}));
  };

  const removeAffix = (affixType: 'prefix' | 'suffix', index: number) => {
    setCraftedAffixes((prev) => {
      if (affixType === 'prefix') {
        return {
          ...prev,
          prefixes: prev.prefixes.filter((_, i) => i !== index),
        };
      } else {
        return {
          ...prev,
          suffixes: prev.suffixes.filter((_, i) => i !== index),
        };
      }
    });
  };

  const getSocketableEffect = (
    socketable: Socketable,
    activeSelection: {
      slot: string;
      subtype: string;
      shieldType?: string;
      baseType?: string;
      ringSlot?: 'left' | 'right';
    } | null
  ): string => {
    if (!activeSelection?.slot) return '';

    const currentSlot = activeSelection.slot.toLowerCase();
    const currentSubtype = activeSelection.subtype?.toLowerCase();

    // For weapons, check subtype first
    if (currentSlot === 'weapon') {
      // Martial weapons
      const martialWeapons = [
        'axe',
        'two_hand_axe',
        'mace',
        'two hand mace',
        'sword',
        'two hand sword',
        'claw',
        'dagger',
        'flail',
        'spear',
        'bow',
        'crossbow',
        'quarterstaff',
      ];

      if (
        martialWeapons.includes(currentSubtype) &&
        socketable.martial_effect
      ) {
        return socketable.martial_effect;
      }

      // Caster weapons
      if (
        ['staff', 'wand'].includes(currentSubtype) &&
        socketable.caster_effect
      ) {
        return socketable.caster_effect;
      }

      // Sceptre
      if (currentSubtype === 'sceptre' && socketable.sceptre_effect) {
        return socketable.sceptre_effect;
      }
    }

    // For armor pieces, check specific slot effects first, then fall back to general armour effect
    switch (currentSlot) {
      case 'helmet':
        return socketable.helmet_effect || socketable.armour_effect || '';

      case 'body armour':
        return socketable.body_effect || socketable.armour_effect || '';

      case 'gloves':
        return socketable.gloves_effect || socketable.armour_effect || '';

      case 'boots':
        return socketable.boots_effect || socketable.armour_effect || '';

      default:
        return socketable.armour_effect || '';
    }
  };

  const getCraftedItemData = (): Item | null => {
    if (!activeSelection?.baseType) return null;

    const selectedBase = bases.find(
      (base) => base.base_name === activeSelection.baseType
    );
    if (!selectedBase) return null;

    const item: Item = {
      id: 0,
      item_name: 'Crafted Item',
      base_type: activeSelection.baseType,
      quality: itemQuality,
      ilvl: itemLevel,
      enchant: enchantResult?.enchant?.effect
        ? applyValueToEffect(enchantResult.enchant.effect, enchantResult.value)
        : null,
      sockets: itemSockets,
      socket1effect: itemSocket1effect,
      socket1type: itemSocket1type,
      socket2effect: itemSocket2effect,
      socket2type: itemSocket2type,
      socket3effect: itemSocket3effect,
      socket3type: itemSocket3type,
      implicit: implicitResult.value ?? 0,
      prefix1: null,
      p1v1: null,
      p1v2: null,
      p1v3: null,
      prefix2: null,
      p2v1: null,
      p2v2: null,
      p2v3: null,
      prefix3: null,
      p3v1: null,
      p3v2: null,
      p3v3: null,
      suffix1: null,
      s1v: null,
      suffix2: null,
      s2v: null,
      suffix3: null,
      s3v: null,
      corrupted: itemCorruption === 1 ? 1 : undefined,
      rarity: itemRarity,
    };

    craftedAffixes.prefixes.forEach((craftedAffix, index) => {
      if (index === 0) {
        item.prefix1 = craftedAffix.affix.id;
        item.p1v1 = craftedAffix.values[0] ?? null;
        item.p1v2 = craftedAffix.values[1] ?? null;
        item.p1v3 = craftedAffix.values[2] ?? null;
      } else if (index === 1) {
        item.prefix2 = craftedAffix.affix.id;
        item.p2v1 = craftedAffix.values[0] ?? null;
        item.p2v2 = craftedAffix.values[1] ?? null;
        item.p2v3 = craftedAffix.values[2] ?? null;
      } else if (index === 2) {
        item.prefix3 = craftedAffix.affix.id;
        item.p3v1 = craftedAffix.values[0] ?? null;
        item.p3v2 = craftedAffix.values[1] ?? null;
        item.p3v3 = craftedAffix.values[2] ?? null;
      }
    });

    craftedAffixes.suffixes.forEach((craftedAffix, index) => {
      if (index === 0) {
        item.suffix1 = craftedAffix.affix.id;
        item.s1v = craftedAffix.values[0] ?? null;
      } else if (index === 1) {
        item.suffix2 = craftedAffix.affix.id;
        item.s2v = craftedAffix.values[0] ?? null;
      } else if (index === 2) {
        item.suffix3 = craftedAffix.affix.id;
        item.s3v = craftedAffix.values[0] ?? null;
      }
    });

    return item;
  };

  const areBaseTypesCompatible = (
    oldBaseType: string,
    newBaseType: string
  ): boolean => {
    const oldBase = bases.find((base) => base.base_name === oldBaseType);
    const newBase = bases.find((base) => base.base_name === newBaseType);

    if (!oldBase || !newBase) {
      return false;
    }

    const weaponClasses = [
      'One Hand Axe',
      'Two Hand Axe',
      'One Hand Mace',
      'Two Hand Mace',
      'One Hand Sword',
      'Two Hand Sword',
      'Bow',
      'Crossbow',
      'Staff',
      'Quarterstaff',
      'Wand',
      'Sceptre',
      'Claw',
      'Dagger',
      'Flail',
      'Spear',
    ];

    if (
      weaponClasses.includes(oldBase.item_class) &&
      weaponClasses.includes(newBase.item_class)
    ) {
      const oldTags = oldBase.item_tags ? oldBase.item_tags.split(', ') : [];
      const newTags = newBase.item_tags ? newBase.item_tags.split(', ') : [];

      const oldHandType = oldTags.find(
        (tag) => tag === 'one_hand_weapon' || tag === 'two_hand_weapon'
      );
      const newHandType = newTags.find(
        (tag) => tag === 'one_hand_weapon' || tag === 'two_hand_weapon'
      );

      // Compatible if both are one_hand_weapon, or both are two_hand_weapon
      if (!oldHandType || !newHandType) return false;
      return oldHandType === newHandType;
    }

    // For armor pieces, check if they have the same attribute requirements
    if (
      ['Helmet', 'Body Armour', 'Gloves', 'Boots', 'Shield'].includes(
        oldBase.item_class
      )
    ) {
      if (oldBase.item_class !== newBase.item_class) return false;

      const oldTags = oldBase.item_tags ? oldBase.item_tags.split(', ') : [];
      const newTags = newBase.item_tags ? newBase.item_tags.split(', ') : [];

      const oldArmorTags = oldTags.filter((tag) => tag.includes('_armour'));
      const newArmorTags = newTags.filter((tag) => tag.includes('_armour'));

      // Must have the same armor attribute tags
      if (oldArmorTags.length !== newArmorTags.length) return false;

      return oldArmorTags.every((tag) => newArmorTags.includes(tag));
    }

    const jewelBases = ['ruby', 'emerald', 'sapphire', 'diamond'];
    if (
      jewelBases.some((jewel) =>
        oldBase.base_name.toLowerCase().includes(jewel)
      ) ||
      jewelBases.some((jewel) =>
        newBase.base_name.toLowerCase().includes(jewel)
      )
    ) {
      return false;
    }

    return oldBase.item_class === newBase.item_class;
  };

  const getUsedFamilies = () => {
    const usedPrefixFamilies = new Set(
      craftedAffixes.prefixes.map((affix) => affix.affix.family)
    );
    const usedSuffixFamilies = new Set(
      craftedAffixes.suffixes.map((affix) => affix.affix.family)
    );

    return { usedPrefixFamilies, usedSuffixFamilies };
  };

  const getDisplayTier = (affix: Affix, familyAffixes: Affix[]): string => {
    // Special handling for IncreaseGemLevel family - reset tiers for each affix type
    if (affix.family === 'IncreaseGemLevel') {
      const currentAffixType = affix.id.replace(/\d+$/, '');

      const compatibleAffixes = familyAffixes.filter((familyAffix) => {
        const familyAffixType = familyAffix.id.replace(/\d+$/, '');
        return familyAffixType === currentAffixType;
      });

      const sortedAffixes = [...compatibleAffixes].sort((a, b) => {
        const tierA = parseInt(a.id.match(/(\d+)$/)?.[0] || '0');
        const tierB = parseInt(b.id.match(/(\d+)$/)?.[0] || '0');
        return tierA - tierB;
      });

      const index = sortedAffixes.findIndex(
        (sortedAffix) => sortedAffix.id === affix.id
      );
      return `T${index + 1}`;
    }
    // Sort affixes by their tier
    const sortedAffixes = [...familyAffixes].sort((a, b) => {
      const tierA = parseInt(a.id.match(/(\d+)$/)?.[0] || '0');
      const tierB = parseInt(b.id.match(/(\d+)$/)?.[0] || '0');
      return tierA - tierB;
    });
    const index = sortedAffixes.findIndex(
      (sortedAffix) => sortedAffix.id === affix.id
    );
    return `T${index + 1}`;
  };

  const switchAffixTier = (oldAffix: Affix, newAffix: Affix) => {
    const isPrefix = oldAffix.affix_type.toLowerCase() === 'prefix';

    setCraftedAffixes((prev) => {
      if (isPrefix) {
        return {
          ...prev,
          prefixes: prev.prefixes.map((craftedAffix) =>
            craftedAffix.affix.id === oldAffix.id
              ? {
                  ...craftedAffix,
                  affix: newAffix,
                  values: generateAffixValues(newAffix),
                }
              : craftedAffix
          ),
        };
      } else {
        return {
          ...prev,
          suffixes: prev.suffixes.map((craftedAffix) =>
            craftedAffix.affix.id === oldAffix.id
              ? {
                  ...craftedAffix,
                  affix: newAffix,
                  values: generateAffixValues(newAffix),
                }
              : craftedAffix
          ),
        };
      }
    });
  };

  React.useEffect(() => {
    if (activeSelection?.baseType) {
      const base = bases.find((b) => b.base_name === activeSelection.baseType);
      if (base?.implicit) {
        const implicit = generateImplicitValue(base);
        setImplicitResult({ text: implicit.text, value: implicit.value ?? 0 });
      } else {
        setImplicitResult({ text: '', value: 0 });
      }
    } else {
      setImplicitResult({ text: '', value: 0 });
    }
  }, [activeSelection?.baseType, bases]);

  React.useEffect(() => {
    if (!activeOrb && !activeSocketable) return;

    const handleMouseMove = (e: MouseEvent) => {
      setCursorPos({ x: e.clientX, y: e.clientY });
    };
    const handleMouseUp = () => {};

    window.addEventListener('mousemove', handleMouseMove);
    window.addEventListener('mouseup', handleMouseUp);

    return () => {
      window.removeEventListener('mousemove', handleMouseMove);
      window.removeEventListener('mouseup', handleMouseUp);
    };
  }, [activeOrb, activeSocketable]);

  React.useEffect(() => {
    if (!activeOrb && !activeSocketable) return;

    let ignore = true;
    const handleGlobalClick = () => {
      if (ignore) {
        ignore = false;
        return;
      }
      setActiveOrb(null);
      setActiveSocketable(null);
    };

    window.addEventListener('click', handleGlobalClick);

    return () => {
      window.removeEventListener('click', handleGlobalClick);
    };
  }, [activeOrb, activeSocketable]);

  const orbHandlers = useOrbHandlers({
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
  });

  const orbHandlerMap: Record<string, () => void> = {
    transmutation: orbHandlers.handleTransmutationOrbUse,
    augmentation: orbHandlers.handleAugmentationOrbUse,
    alteration: orbHandlers.handleAlterationOrbUse,
    regal: orbHandlers.handleRegalOrbUse,
    chaos: orbHandlers.handleChaosOrbUse,
    alchemy: orbHandlers.handleAlchemyOrbUse,
    exalted: orbHandlers.handleExaltedOrbUse,
    divine: orbHandlers.handleDivineOrbUse,
    annulment: orbHandlers.handleAnnulmentOrbUse,
    vaal: orbHandlers.handleVaalOrbUse,
    whetstone: orbHandlers.handleWhetstoneUse,
    scrap: orbHandlers.handleScrapUse,
    artificer: orbHandlers.handleArtificerUse,
    scouring: orbHandlers.handleScouringOrbUse,
    fracturing: orbHandlers.handleFracturingOrbUse,
    teardrop: orbHandlers.handleTeardropUse,
    enhancement: () => orbHandlers.handleEssenceUse('Enhancement'),
    torment: () => orbHandlers.handleEssenceUse('Torment'),
    ruin: () => orbHandlers.handleEssenceUse('Ruin'),
    body: () => orbHandlers.handleEssenceUse('Body'),
    flames: () => orbHandlers.handleEssenceUse('Flames'),
    battle: () => orbHandlers.handleEssenceUse('Battle'),
    mind: () => orbHandlers.handleEssenceUse('Mind'),
    ice: () => orbHandlers.handleEssenceUse('Ice'),
    sorcery: () => orbHandlers.handleEssenceUse('Sorcery'),
    infinite: () => orbHandlers.handleEssenceUse('Infinite'),
    electricity: () => orbHandlers.handleEssenceUse('Electricity'),
    haste: () => orbHandlers.handleEssenceUse('Haste'),
    greaterenhancement: () =>
      orbHandlers.handleGreaterEssenceUse('Enhancement'),
    greatertorment: () => orbHandlers.handleGreaterEssenceUse('Torment'),
    greaterruin: () => orbHandlers.handleGreaterEssenceUse('Ruin'),
    greaterbody: () => orbHandlers.handleGreaterEssenceUse('Body'),
    greaterflames: () => orbHandlers.handleGreaterEssenceUse('Flames'),
    greaterbattle: () => orbHandlers.handleGreaterEssenceUse('Battle'),
    greatermind: () => orbHandlers.handleGreaterEssenceUse('Mind'),
    greaterice: () => orbHandlers.handleGreaterEssenceUse('Ice'),
    greatersorcery: () => orbHandlers.handleGreaterEssenceUse('Sorcery'),
    greaterinfinite: () => orbHandlers.handleGreaterEssenceUse('Infinite'),
    greaterelectricity: () =>
      orbHandlers.handleGreaterEssenceUse('Electricity'),
    greaterhaste: () => orbHandlers.handleGreaterEssenceUse('Haste'),
  };

  const orbImageMap: Record<string, string> = {
    transmutation: 'Transmutation Orb.png',
    augmentation: 'Augmentation Orb.png',
    alteration: 'Alteration Orb.png',
    regal: 'Regal Orb.png',
    chaos: 'Chaos Orb.png',
    alchemy: 'Alchemy Orb.png',
    exalted: 'Exalted Orb.png',
    divine: 'Divine Orb.png',
    annulment: 'Annulment Orb.png',
    vaal: 'Vaal Orb.png',
    whetstone: 'Whetstone.png',
    scrap: 'Scrap.png',
    artificer: 'Artificer.png',
    scouring: 'Scouring Orb.png',
    fracturing: 'Fracturing Orb.png',
    teardrop: 'Teardrop.png',
    enhancement: 'Enhancement Essence.png',
    torment: 'Torment Essence.png',
    ruin: 'Ruin Essence.png',
    body: 'Body Essence.png',
    flames: 'Flames Essence.png',
    battle: 'Battle Essence.png',
    mind: 'Mind Essence.png',
    ice: 'Ice Essence.png',
    sorcery: 'Sorcery Essence.png',
    infinite: 'Infinite Essence.png',
    electricity: 'Electricity Essence.png',
    haste: 'Haste Essence.png',
    greaterenhancement: 'Greater Enhancement Essence.png',
    greatertorment: 'Greater Torment Essence.png',
    greaterruin: 'Greater Ruin Essence.png',
    greaterbody: 'Greater Body Essence.png',
    greaterflames: 'Greater Flames Essence.png',
    greaterbattle: 'Greater Battle Essence.png',
    greatermind: 'Greater Mind Essence.png',
    greaterice: 'Greater Ice Essence.png',
    greatersorcery: 'Greater Sorcery Essence.png',
    greaterinfinite: 'Greater Infinite Essence.png',
    greaterelectricity: 'Greater Electricity Essence.png',
    greaterhaste: 'Greater Haste Essence.png',
  };

  const socketType = activeSocketable?.socket_type.includes('Talisman')
    ? activeSocketable?.socket_type.split('_')[0]
    : activeSocketable?.socket_type;

  return (
    <>
      {activeOrb && orbImageMap[activeOrb] && (
        <img
          src={orbImageMap[activeOrb]}
          alt={activeOrb}
          style={{
            position: 'fixed',
            left: cursorPos.x - 35,
            top: cursorPos.y - 35,
            width: 71,
            height: 71,
            pointerEvents: 'none',
            zIndex: 9999,
            opacity: 0.85,
          }}
          draggable={false}
        />
      )}
      {activeSocketable && (
        <img
          src={
            activeSocketable.id > 13 &&
            (activeSocketable.id < 65 || activeSocketable.id > 75)
              ? `${socketType}_${activeSocketable.socketable_name.match(/(\w+)$/)![0]}.webp`
              : `${socketType}_${activeSocketable.socketable_name.match(/(\w+)/)![0]}.webp`
          }
          alt={activeSocketable.socketable_name}
          style={{
            position: 'fixed',
            left: cursorPos.x - 30,
            top: cursorPos.y - 30,
            width: 60,
            height: 60,
            pointerEvents: 'none',
            zIndex: 9999,
            opacity: 0.85,
          }}
          draggable={false}
        />
      )}
      <div className='flex min-h-screen w-screen flex-col items-center justify-center bg-zinc-700 p-4 text-center text-neutral-300 sm:p-8'>
        {/* Equipment */}
        <ItemSlots
          activeSelection={activeSelection}
          bases={bases}
          onSelectionComplete={(selection) => {
            completeSelection(
              selection.slot,
              selection.subtype,
              selection.shieldType,
              selection.baseType,
              selection.ringSlot
            );
          }}
          itemLevel={itemLevel}
          onItemLevelChange={setItemLevel}
        />

        {/* ItemDisplay and Affixes section */}
        <div className='mt-8 flex w-full max-w-7xl flex-col items-center gap-8'>
          {/* ItemDisplay section */}
          <div className='min-w-[1421px] rounded-lg bg-zinc-800 p-4'>
            <div className='relative mb-4 flex h-10 items-center justify-center'>
              <h3 className='absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 text-lg font-bold text-white'>
                Crafting
              </h3>
              {/* UI Buttons */}
              <button
                onClick={() => {
                  setBluebg((prev) => !prev);
                }}
                className='absolute left-0 flex min-w-16 items-center justify-center gap-2 rounded border border-zinc-500 px-1 py-1 text-2xl text-white transition-colors hover:bg-zinc-200 hover:text-zinc-900'
                title='Blue'
              >
                <span className='text-sm'>{bluebg ? 'Empty' : 'Blue BG'}</span>
              </button>
              <button
                onClick={() => {
                  setTooltips((prev) => !prev);
                }}
                className='absolute left-16 flex min-w-20 items-center justify-center gap-2 rounded border border-zinc-500 px-1 py-1 text-2xl text-white transition-colors hover:bg-zinc-200 hover:text-zinc-900'
                title='Tooltips'
              >
                <span className='text-sm'>
                  {tooltips ? 'Hide TTs' : 'Tooltips'}
                </span>
              </button>
              {itemSockets > 0 ? (
                <button
                  onClick={() => {
                    setShowSocketables((prev) => !prev);
                  }}
                  className='absolute right-[306px] flex gap-2 rounded border border-zinc-500 px-1 py-1 text-2xl text-white transition-colors hover:bg-zinc-200 hover:text-zinc-900'
                  title='Show Socketables'
                >
                  <img
                    className='h-8'
                    src={showSocketables ? 'Chaos Orb.png' : 'socket.png'}
                    alt='Socket'
                  />
                </button>
              ) : null}
              {stateHistory.length > 0 && (
                <button
                  onClick={undoLastAction}
                  className='absolute right-52 flex gap-2 rounded border border-zinc-500 px-1 py-1 text-2xl text-white transition-colors hover:bg-zinc-200 hover:text-zinc-900'
                  title='Undo last action'
                >
                  <span className='h-8 text-2xl'>Undo ↺</span>
                </button>
              )}
              {((activeSelection?.baseType !== 'Diamond' &&
                affixLog.length > 0) ||
                itemQuality ||
                itemSockets > 0) && (
                <button
                  onClick={() => {
                    setCraftedAffixes({ prefixes: [], suffixes: [] });
                    setAffixLog([]);
                    setItemRarity('normal');
                    setItemQuality(0);
                    setItemSockets(0);
                    setItemSocket1effect('');
                    setitemSocket1type('');
                    setItemSocket2effect('');
                    setitemSocket2type('');
                    setItemSocket3effect('');
                    setitemSocket3type('');
                    setShowSocketables(false);
                    setItemCorruption(0);
                    setEnchantResult(null);
                    setFracturedAffixId(null);
                    setStateHistory([]);
                  }}
                  className='absolute right-0 top-1/2 flex -translate-y-1/2 gap-2 rounded border border-zinc-500 px-1 py-1 text-2xl text-white transition-colors hover:bg-zinc-200 hover:text-zinc-900'
                >
                  Clear Crafting
                  <img
                    src='/images/Scouring Orb.png'
                    alt='Scouring Orb'
                    className='h-8 w-8'
                    draggable={false}
                  />
                </button>
              )}
            </div>
            <div className='flex flex-col gap-8 lg:flex-row lg:items-center lg:justify-center'>
              <div className='flex min-h-[354px] flex-1 items-center justify-center'>
                {activeSelection &&
                activeSelection.baseType &&
                getCraftedItemData() ? (
                  <div
                    style={{
                      cursor:
                        activeOrb || activeSocketable ? 'pointer' : 'default',
                    }}
                    onClick={(e) => {
                      e.stopPropagation();
                      if (activeOrb && orbHandlerMap[activeOrb]) {
                        saveStateBeforeAction();
                        orbHandlerMap[activeOrb]();
                      }
                    }}
                  >
                    <ItemDisplay
                      item={getCraftedItemData()!}
                      bases={bases.map((base) =>
                        base.base_name === activeSelection.baseType
                          ? { ...base, implicit: implicitResult.text }
                          : base
                      )}
                      affixes={affixesData}
                      rarity={itemRarity}
                      fracturedAffixId={fracturedAffixId}
                      whittlingOmen={WhittlingOmen}
                      sinistralErasureOmen={SinistralErasureOmen}
                      dextralErasureOmen={DextralErasureOmen}
                      activeSocketable={activeSocketable}
                      onSocketClick={(socketIndex) => {
                        if (activeSocketable) {
                          const effect = getSocketableEffect(
                            activeSocketable,
                            activeSelection
                          );

                          if (effect) {
                            // Apply the effect to the appropriate socket
                            switch (socketIndex) {
                              case 1:
                                setItemSocket1effect(effect);
                                setitemSocket1type(
                                  activeSocketable.socket_type
                                );
                                break;
                              case 2:
                                setItemSocket2effect(effect);
                                setitemSocket2type(
                                  activeSocketable.socket_type
                                );
                                break;
                              case 3:
                                setItemSocket3effect(effect);
                                setitemSocket3type(
                                  activeSocketable.socket_type
                                );
                                break;
                            }
                          }
                        }
                      }}
                    />
                  </div>
                ) : (
                  <div className='flex min-w-[512px] flex-col items-center justify-center border-zinc-600 bg-zinc-900'>
                    <div className='relative flex h-10 w-full items-center justify-center'>
                      {nhl}
                      {nhm}
                      {nhr}
                      <span className='absolute inset-0 flex items-center justify-center font-Insmallcaps text-lg text-white'>
                        Select Base to Start
                      </span>
                    </div>
                    <div className='flex h-52 w-80 items-center justify-center'>
                      <img
                        src='/images/Ultimatum.webp'
                        alt='Ultimatum'
                        className='h-full w-full object-contain'
                        draggable={false}
                      />
                    </div>
                  </div>
                )}
              </div>
              {!showSocketables ? (
                <div className='relative flex h-[177px] min-h-[100px] w-[422px] min-w-[200px] items-center justify-center bg-zinc-900 lg:h-[354px] lg:w-[845px]'>
                  {(() => {
                    const orbButtons = [
                      // First column (left: 2px)
                      {
                        key: 'transmutation',
                        img: 'Transmutation Orb.png',
                        alt: 'Orb of Transmutation',
                        left: '2px',
                        top: '1.5px',
                        description:
                          'Upgrades a Normal item to a Magic item with 1 modifier',
                      },
                      {
                        key: 'augmentation',
                        img: 'Augmentation Orb.png',
                        alt: 'Orb of Augmentation',
                        left: '2px',
                        top: '71.5px',
                        description:
                          'Augments a Magic item with a new random modifier',
                      },
                      {
                        key: 'alteration',
                        img: 'Alteration Orb.png',
                        alt: 'Orb of Alteration',
                        left: '2px',
                        top: '142px',
                        description:
                          'Reforges a magic item with new random modifiers',
                      },
                      {
                        key: 'regal',
                        img: 'Regal Orb.png',
                        alt: 'Regal Orb',
                        left: '2px',
                        top: '212.5px',
                        description:
                          'Upgrades a Magic item to a Rare item, adding 1 modifier',
                      },
                      {
                        key: 'chaos',
                        img: 'Chaos Orb.png',
                        alt: 'Chaos Orb',
                        left: '2px',
                        top: '283px',
                        description:
                          'Removes a random modifier and augments a Rare item with a new random modifier',
                      },

                      // Second column (left: 72.25px)
                      {
                        key: 'alchemy',
                        img: 'Alchemy Orb.png',
                        alt: 'Orb of Alchemy',
                        left: '72.25px',
                        top: '1.5px',
                        description:
                          'Upgrades a Normal item to a Rare item with 4 modifiers',
                      },
                      {
                        key: 'exalted',
                        img: 'Exalted Orb.png',
                        alt: 'Exalted Orb',
                        left: '72.25px',
                        top: '71.5px',
                        description:
                          'Augments a Rare item with a new random modifier',
                      },
                      {
                        key: 'divine',
                        img: 'Divine Orb.png',
                        alt: 'Divine Orb',
                        left: '72.25px',
                        top: '142px',
                        description:
                          'Randomises the numeric values of modifiers on an item',
                      },
                      {
                        key: 'annulment',
                        img: 'Annulment Orb.png',
                        alt: 'Orb of Annulment',
                        left: '72.25px',
                        top: '212.5px',
                        description: 'Removes a random modifier from an item',
                      },
                      {
                        key: 'vaal',
                        img: 'Vaal Orb.png',
                        alt: 'Vaal Orb',
                        left: '72.25px',
                        top: '283px',
                        description:
                          'Modifies an item unpredictably and Corrupts it',
                      },

                      // Third column (left: 142.5px)
                      {
                        key: 'whetstone',
                        img: 'Whetstone.png',
                        alt: "Blacksmith's Whetstone",
                        left: '142.5px',
                        top: '1.5px',
                        description: 'Improves the quality of a martial weapon',
                      },
                      {
                        key: 'scrap',
                        img: 'Scrap.png',
                        alt: "Armourer's Scrap",
                        left: '142.5px',
                        top: '71.5px',
                        description: 'Improves the quality of an armour',
                      },
                      {
                        key: 'artificer',
                        img: 'Artificer.png',
                        alt: "Artificer's Orb",
                        left: '142.5px',
                        top: '142px',
                        description: 'Adds a Socket to a Weapon or Armour',
                      },
                      {
                        key: 'scouring',
                        img: 'Scouring Orb.png',
                        alt: 'Orb of Scouring',
                        left: '142.5px',
                        top: '212.5px',
                        description:
                          'Removes all modifiers from an item and sets rarity to Normal',
                      },
                      {
                        key: 'corruption-omen',
                        img: 'Corruption Omen.png',
                        alt: 'Omen of Corruption',
                        left: '142.5px',
                        top: '283px',
                        description:
                          'While this item is active in your inventory your next Vaal Orb will be more unpredictable',
                        isOmen: true,
                        onClick: () =>
                          setCorruptionOmen(CorruptionOmen === 1 ? 0 : 1),
                        className: CorruptionOmen
                          ? ' border border-red-500'
                          : '',
                      },

                      // Fourth column (left: 212.75px)
                      {
                        key: 'fracturing',
                        img: 'Fracturing Orb.png',
                        alt: 'Fracturing Orb',
                        left: '212.75px',
                        top: '1.5px',
                        description:
                          'Fracture a random modifier on a rare item with at least 4 modifiers, locking it in place.',
                      },
                      {
                        key: 'teardrop',
                        img: 'Teardrop.png',
                        alt: 'Teardrop',
                        left: '212.75px',
                        top: '71.5px',
                        description:
                          'Unpredictably raises or lowers the tier of each modifier on a corrupted rare item',
                      },
                      {
                        key: 'whittling-omen',
                        img: 'Whittling Omen.png',
                        alt: 'Omen of Whittling',
                        left: '212.75px',
                        top: '142px',
                        description:
                          'While this item is active in your inventory your next Chaos Orb will remove the lowest ilvl modifier',
                        isOmen: true,
                        onClick: () =>
                          setWhittlingOmen(WhittlingOmen === 1 ? 0 : 1),
                        className: WhittlingOmen
                          ? ' border border-red-500'
                          : '',
                      },
                      {
                        key: 'sinistral-erasure-omen',
                        img: 'Sinistral Erasure Omen.png',
                        alt: 'Omen of Sinistral Erasure',
                        left: '212.75px',
                        top: '212.5px',
                        description:
                          'While this item is active in your inventory your next Chaos Orb will remove only prefix modifiers',
                        isOmen: true,
                        onClick: () => {
                          setDextralErasureOmen(0);
                          setSinistralErasureOmen(
                            SinistralErasureOmen === 1 ? 0 : 1
                          );
                        },
                        className: SinistralErasureOmen
                          ? ' border border-red-500'
                          : '',
                      },
                      {
                        key: 'dextral-erasure-omen',
                        img: 'Dextral Erasure Omen.png',
                        alt: 'Omen of Dextral Erasure',
                        left: '212.75px',
                        top: '283px',
                        description:
                          'While this item is active in your inventory your next Chaos Orb will remove only suffix modifiers',
                        isOmen: true,
                        onClick: () => {
                          setSinistralErasureOmen(0);
                          setDextralErasureOmen(
                            DextralErasureOmen === 1 ? 0 : 1
                          );
                        },
                        className: DextralErasureOmen
                          ? ' border border-red-500'
                          : '',
                      },

                      // Fifth column (left: 283px)
                      {
                        key: 'enhancement',
                        img: 'Enhancement Essence.png',
                        alt: 'Essence of Enhancement',
                        left: '283px',
                        top: '1.5px',
                        description:
                          'Upgrades a normal item to Magic with one Defence modifier',
                      },
                      {
                        key: 'torment',
                        img: 'Torment Essence.png',
                        alt: 'Essence of Torment',
                        left: '283px',
                        top: '71.5px',
                        description:
                          'Upgrades a normal item to Magic with one Physical modifier',
                      },
                      {
                        key: 'ruin',
                        img: 'Ruin Essence.png',
                        alt: 'Essence of Ruin',
                        left: '283px',
                        top: '142px',
                        description:
                          'Upgrades a normal item to Magic with one Chaos modifier',
                      },
                      {
                        key: 'sinistral-annulment-omen',
                        img: 'Sinistral Annulment Omen.png',
                        alt: 'Omen of Sinistral Annulment',
                        left: '283px',
                        top: '212.5px',
                        description:
                          'While this item is active in your inventory your next Orb of Annulment will remove only prefix modifiers',
                        isOmen: true,
                        onClick: () => {
                          setDextralAnnulmentOmen(0);
                          setSinistralAnnulmentOmen(
                            SinistralAnnulmentOmen === 1 ? 0 : 1
                          );
                        },
                        className: SinistralAnnulmentOmen
                          ? ' border border-red-500'
                          : '',
                      },
                      {
                        key: 'dextral-annulment-omen',
                        img: 'Dextral Annulment Omen.png',
                        alt: 'Omen of Dextral Annulment',
                        left: '283px',
                        top: '283px',
                        description:
                          'While this item is active in your inventory your next Orb of Annulment will remove only suffix modifiers',
                        isOmen: true,
                        onClick: () => {
                          setSinistralAnnulmentOmen(0);
                          setDextralAnnulmentOmen(
                            DextralAnnulmentOmen === 1 ? 0 : 1
                          );
                        },
                        className: DextralAnnulmentOmen
                          ? ' border border-red-500'
                          : '',
                      },

                      // Sixth column (left: 353.25px)
                      {
                        key: 'body',
                        img: 'Body Essence.png',
                        alt: 'Essence of the Body',
                        left: '353.25px',
                        top: '1.5px',
                        description:
                          'Upgrades a normal item to Magic with one Life modifier',
                      },
                      {
                        key: 'flames',
                        img: 'Flames Essence.png',
                        alt: 'Essence of Flames',
                        left: '353.25px',
                        top: '71.5px',
                        description:
                          'Upgrades a normal item to Magic with one Fire modifier',
                      },
                      {
                        key: 'battle',
                        img: 'Battle Essence.png',
                        alt: 'Essence of Battle',
                        left: '353.25px',
                        top: '142px',
                        description:
                          'Upgrades a normal item to Magic with one Attack modifier',
                      },

                      // Seventh column (left: 423.5px)
                      {
                        key: 'mind',
                        img: 'Mind Essence.png',
                        alt: 'Essence of the Mind',
                        left: '423.5px',
                        top: '1.5px',
                        description:
                          'Upgrades a normal item to Magic with one Mana modifier',
                      },
                      {
                        key: 'ice',
                        img: 'Ice Essence.png',
                        alt: 'Essence of Ice',
                        left: '423.5px',
                        top: '71.5px',
                        description:
                          'Upgrades a normal item to Magic with one Cold modifier',
                      },
                      {
                        key: 'sorcery',
                        img: 'Sorcery Essence.png',
                        alt: 'Essence of Sorcery',
                        left: '423.5px',
                        top: '142px',
                        description:
                          'Upgrades a normal item to Magic with one Caster modifier',
                      },

                      // Eighth column (left: 493.75px)
                      {
                        key: 'infinite',
                        img: 'Infinite Essence.png',
                        alt: 'Essence of the Infinite',
                        left: '493.75px',
                        top: '1.5px',
                        description:
                          'Upgrades a normal item to Magic with one Attribute modifier',
                      },
                      {
                        key: 'electricity',
                        img: 'Electricity Essence.png',
                        alt: 'Essence of Electricity',
                        left: '493.75px',
                        top: '71.5px',
                        description:
                          'Upgrades a normal item to Magic with one Lightning modifier',
                      },
                      {
                        key: 'haste',
                        img: 'Haste Essence.png',
                        alt: 'Essence of Haste',
                        left: '493.75px',
                        top: '142px',
                        description:
                          'Upgrades a normal item to Magic with one Speed modifier',
                      },

                      // Ninth column (left: 564px) - Greater Essences
                      {
                        key: 'greaterenhancement',
                        img: 'Greater Enhancement Essence.png',
                        alt: 'Greater Essence of Enhancement',
                        left: '564px',
                        top: '1.5px',
                        description:
                          'Upgrades a Magic item to a Rare item with one Defence modifier',
                      },
                      {
                        key: 'greatertorment',
                        img: 'Greater Torment Essence.png',
                        alt: 'Greater Essence of Torment',
                        left: '564px',
                        top: '71.5px',
                        description:
                          'Upgrades a Magic item to a Rare item with one Physical modifier',
                      },
                      {
                        key: 'greaterruin',
                        img: 'Greater Ruin Essence.png',
                        alt: 'Greater Essence of Ruin',
                        left: '564px',
                        top: '142px',
                        description:
                          'Upgrades a Magic item to a Rare item with one Chaos modifier',
                      },

                      // Tenth column (left: 634.25px)
                      {
                        key: 'greaterbody',
                        img: 'Greater Body Essence.png',
                        alt: 'Greater Essence of the Body',
                        left: '634.25px',
                        top: '1.5px',
                        description:
                          'Upgrades a Magic item to a Rare item with one Life modifier',
                      },
                      {
                        key: 'greaterflames',
                        img: 'Greater Flames Essence.png',
                        alt: 'Greater Essence of Flames',
                        left: '634.25px',
                        top: '71.5px',
                        description:
                          'Upgrades a Magic item to a Rare item with one Fire modifier',
                      },
                      {
                        key: 'greaterbattle',
                        img: 'Greater Battle Essence.png',
                        alt: 'Greater Essence of Battle',
                        left: '634.25px',
                        top: '142px',
                        description:
                          'Upgrades a Magic item to a Rare item with one Attack modifier',
                      },

                      // Eleventh column (left: 704.5px)
                      {
                        key: 'greatermind',
                        img: 'Greater Mind Essence.png',
                        alt: 'Greater Essence of the Mind',
                        left: '704.5px',
                        top: '1.5px',
                        description:
                          'Upgrades a Magic item to a Rare item with one Mana modifier',
                      },
                      {
                        key: 'greaterice',
                        img: 'Greater Ice Essence.png',
                        alt: 'Greater Essence of Ice',
                        left: '704.5px',
                        top: '71.5px',
                        description:
                          'Upgrades a Magic item to a Rare item with one Cold modifier',
                      },
                      {
                        key: 'greatersorcery',
                        img: 'Greater Sorcery Essence.png',
                        alt: 'Greater Essence of Sorcery',
                        left: '704.5px',
                        top: '142px',
                        description:
                          'Upgrades a Magic item to a Rare item with one Caster modifier',
                      },

                      // Twelfth column (left: 774.75px)
                      {
                        key: 'greaterinfinite',
                        img: 'Greater Infinite Essence.png',
                        alt: 'Greater Essence of the Infinite',
                        left: '774.75px',
                        top: '1.5px',
                        description:
                          'Upgrades a Magic item to a Rare item with one Attribute modifier',
                      },
                      {
                        key: 'greaterelectricity',
                        img: 'Greater Electricity Essence.png',
                        alt: 'Greater Essence of Electricity',
                        left: '774.75px',
                        top: '71.5px',
                        description:
                          'Upgrades a Magic item to a Rare item with one Lightning modifier',
                      },
                      {
                        key: 'greaterhaste',
                        img: 'Greater Haste Essence.png',
                        alt: 'Greater Essence of Haste',
                        left: '774.75px',
                        top: '142px',
                        description:
                          'Upgrades a Magic item to a Rare item with one Speed modifier',
                      },
                    ];

                    return (
                      <>
                        {orbButtons.map((button) => (
                          <div
                            key={button.key}
                            className={`group absolute h-[70px] w-[70px] ${button.className ? ' ' + button.className : ''} ${bluebg ? ' bg-slate-950 bg-opacity-70 hover:bg-hoveritem' : ''}`}
                            style={{ left: button.left, top: button.top }}
                          >
                            <img
                              src={button.img}
                              alt={button.alt}
                              className={`z-10 h-[70px] w-[70px] ${
                                button.key === 'augmentation'
                                  ? 'translate-y-[1px]'
                                  : button.key === 'alteration'
                                    ? 'translate-y-[2.5px]'
                                    : button.key === 'chaos'
                                      ? 'translate-x-[1px]'
                                      : button.key === 'alchemy'
                                        ? 'translate-y-[2px]'
                                        : button.key === 'exalted'
                                          ? 'translate-y-[1.5px]'
                                          : button.key === 'vaal'
                                            ? 'translate-x-[1.5px]'
                                            : button.key === 'whetstone'
                                              ? 'translate-x-[1.5px] translate-y-[1px]'
                                              : button.key === 'artificer'
                                                ? 'translate-y-[1px]'
                                                : button.key === 'scouring'
                                                  ? '-translate-x-[1px]'
                                                  : button.key === 'fracturing'
                                                    ? 'translate-y-[2px]'
                                                    : button.key === 'teardrop'
                                                      ? 'translate-y-[1px]'
                                                      : button.key.includes(
                                                            'corruption'
                                                          )
                                                        ? 'translate-x-[1.5px]'
                                                        : button.key.includes(
                                                              'dextral'
                                                            )
                                                          ? 'translate-x-[1.5px]'
                                                          : button.key.includes(
                                                                'greater'
                                                              )
                                                            ? 'translate-x-[1px]'
                                                            : ''
                              }`}
                              onClick={
                                button.isOmen
                                  ? button.onClick
                                  : (e) => {
                                      setActiveOrb(button.key);
                                      setCursorPos({
                                        x: e.clientX,
                                        y: e.clientY,
                                      });
                                    }
                              }
                              draggable={false}
                            />
                            {tooltips && (
                              <div className='pointer-events-none absolute bottom-full left-1/2 z-10 w-96 -translate-x-1/2 transform bg-black font-Insmallcaps text-sm text-white opacity-0 transition-opacity group-hover:opacity-100'>
                                <div className='relative mb-1 flex h-10 w-full items-center justify-center'>
                                  {chl}
                                  {chm}
                                  {chr}
                                  <span className='absolute inset-0 flex items-center justify-center text-lg font-bold text-curr'>
                                    {button.alt}
                                  </span>
                                </div>
                                {/*<p className='my-2 text-center text-neutral-400'>
                                Stack Size:
                                <span className='text-white'>∞</span>
                              </p>{' '}
                              {csep}*/}
                                <p className='mx-px my-2 text-center text-indigo-400'>
                                  {button.description}
                                </p>
                                {csep}
                                {button.isOmen ? (
                                  <p className='my-2 text-center text-neutral-400'>
                                    Click this item in your inventory to set it
                                    to be active.
                                  </p>
                                ) : (
                                  <p className='my-2 text-center text-neutral-400'>
                                    Click this Item then click a Base to apply
                                    it.
                                  </p>
                                )}
                              </div>
                            )}
                          </div>
                        ))}
                      </>
                    );
                  })()}
                  <img
                    src='/images/Inventory.png'
                    alt='Inventory'
                    className='max-h-full max-w-full object-contain'
                    width={845}
                    height={354}
                    draggable={false}
                  />
                </div>
              ) : (
                <div>
                  <SocketablesInv
                    socketables={socketablesData}
                    activeSelection={activeSelection}
                    tooltips={tooltips}
                    onSocketableSelect={(socketable) => {
                      setActiveSocketable(socketable);
                      setCursorPos({ x: 0, y: 0 });
                    }}
                  />
                </div>
              )}
            </div>
          </div>

          {/* Current Affixes Display */}
          {(craftedAffixes.prefixes.length > 0 ||
            craftedAffixes.suffixes.length > 0) && (
            <div className='w-full rounded-lg bg-zinc-800 p-6'>
              <h3 className='mb-4 text-center text-xl font-bold text-white'>
                Current Affixes
              </h3>
              <div className='grid grid-cols-1 gap-8 lg:grid-cols-2'>
                <div className='space-y-2'>
                  <h4 className='text-center text-lg font-semibold text-blue-400'>
                    Prefixes ({craftedAffixes.prefixes.length}/
                    {isDiamondBase(activeSelection?.baseType)
                      ? ``
                      : getMaxAffixCount(activeSelection?.baseType)}
                    )
                  </h4>
                  <div className='space-y-3'>
                    {craftedAffixes.prefixes.map((craftedAffix, index) => {
                      const valueRanges = getValueRanges(
                        craftedAffix.affix.effect
                      );

                      return (
                        <div
                          key={craftedAffix.id}
                          className='rounded bg-zinc-700 p-3'
                        >
                          <div className='mb-2 flex items-center justify-between'>
                            <div className='flex-1'>
                              <div className='text-sm font-medium text-white'>
                                {craftedAffix.affix.affix_name}
                                <br />
                                {![
                                  'Diamond',
                                  'Ruby',
                                  'Emerald',
                                  'Sapphire',
                                ].includes(activeSelection?.baseType ?? '') && (
                                  <>ilvl: {craftedAffix.affix.ilvl}</>
                                )}
                                {activeSelection?.baseType == 'Diamond' && (
                                  <>
                                    jewel type: {craftedAffix.affix.item_tags}
                                  </>
                                )}
                              </div>
                              <div className='text-xs text-blue-300'>
                                {craftedAffix.affix.effect}
                              </div>
                            </div>
                            {!isDiamondBase(activeSelection?.baseType) && (
                              <button
                                onClick={() => {
                                  if (
                                    fracturedAffixId === craftedAffix.affix.id
                                  ) {
                                    setFracturedAffixId(null);
                                  }
                                  removeAffix('prefix', index);
                                }}
                              >
                                <img
                                  src='/images/Annulment Orb.png'
                                  alt='Remove Prefix'
                                  className='h-8 w-8'
                                />
                              </button>
                            )}
                          </div>

                          {/* Value Sliders */}
                          {valueRanges.map((range, valueIndex) => {
                            const isFractured =
                              fracturedAffixId === craftedAffix.affix.id;
                            return (
                              <RangeSlider
                                key={valueIndex}
                                values={[
                                  craftedAffix.values[valueIndex] || range.min,
                                ]}
                                onChange={(values) =>
                                  updateAffixValue(
                                    'prefix',
                                    index,
                                    valueIndex,
                                    values[0]
                                  )
                                }
                                min={range.min}
                                max={range.max}
                                step={range.isDecimal ? 0.01 : 1}
                                disabled={
                                  isFractured || range.min === range.max
                                }
                                color='blue'
                              />
                            );
                          })}
                        </div>
                      );
                    })}
                  </div>
                </div>
                <div className='space-y-2'>
                  <h4 className='text-center text-lg font-semibold text-yellow-400'>
                    Suffixes ({craftedAffixes.suffixes.length}/
                    {isDiamondBase(activeSelection?.baseType)
                      ? ``
                      : getMaxAffixCount(activeSelection?.baseType)}
                    )
                  </h4>
                  <div className='space-y-3'>
                    {craftedAffixes.suffixes.map((craftedAffix, index) => {
                      const valueRanges = getValueRanges(
                        craftedAffix.affix.effect
                      );

                      return (
                        <div
                          key={craftedAffix.id}
                          className='rounded bg-zinc-700 p-3'
                        >
                          <div className='mb-2 flex items-center justify-between'>
                            <div className='flex-1'>
                              <div className='text-sm font-medium text-white'>
                                {craftedAffix.affix.affix_name}
                                <br />
                                {![
                                  'Diamond',
                                  'Ruby',
                                  'Emerald',
                                  'Sapphire',
                                ].includes(activeSelection?.baseType ?? '') && (
                                  <>ilvl: {craftedAffix.affix.ilvl}</>
                                )}
                                {activeSelection?.baseType == 'Diamond' && (
                                  <>
                                    jewel type: {craftedAffix.affix.item_tags}
                                  </>
                                )}
                              </div>
                              <div className='text-xs text-yellow-300'>
                                {craftedAffix.affix.effect}
                              </div>
                            </div>
                            {!isDiamondBase(activeSelection?.baseType) && (
                              <button
                                onClick={() => {
                                  if (
                                    fracturedAffixId === craftedAffix.affix.id
                                  ) {
                                    setFracturedAffixId(null);
                                  }
                                  removeAffix('suffix', index);
                                }}
                              >
                                <img
                                  src='/images/Annulment Orb.png'
                                  alt='Remove Suffix'
                                  className='h-8 w-8'
                                />
                              </button>
                            )}
                          </div>

                          {/* Value Sliders */}
                          {valueRanges.map((range, valueIndex) => {
                            const isFractured =
                              fracturedAffixId === craftedAffix.affix.id;
                            return (
                              <RangeSlider
                                key={valueIndex}
                                values={[
                                  craftedAffix.values[valueIndex] || range.min,
                                ]}
                                onChange={(values) =>
                                  updateAffixValue(
                                    'suffix',
                                    index,
                                    valueIndex,
                                    values[0]
                                  )
                                }
                                min={range.min}
                                max={range.max}
                                step={range.isDecimal ? 0.01 : 1}
                                disabled={
                                  isFractured || range.min === range.max
                                }
                                color='yellow'
                              />
                            );
                          })}
                        </div>
                      );
                    })}
                  </div>
                </div>
              </div>
            </div>
          )}

          {affixLog.length > 0 && (
            <div className='mt-4 w-full rounded-lg bg-zinc-800 p-4'>
              <h4 className='mb-2 text-center text-base font-semibold text-white'>
                Crafting Log
              </h4>
              <ul className='max-h-40 space-y-2 overflow-y-auto text-xs'>
                {affixLog.slice(0, 10).map((entry, idx, arr) => {
                  const logOrbImageMap: Record<string, string> = {
                    'Transmutation Orb': 'Transmutation Orb.png',
                    'Augmentation Orb': 'Augmentation Orb.png',
                    'Alteration Orb': 'Alteration Orb.png',
                    'Regal Orb': 'Regal Orb.png',
                    'Chaos Orb': 'Chaos Orb.png',
                    'Alchemy Orb': 'Alchemy Orb.png',
                    'Exalted Orb': 'Exalted Orb.png',
                    'Divine Orb': 'Divine Orb.png',
                    'Annulment Orb': 'Annulment Orb.png',
                    'Vaal Orb': 'Vaal Orb.png',
                    'Scouring Orb': 'Scouring Orb.png',
                    'Fracturing Orb': 'Fracturing Orb.png',
                    Teardrop: 'Teardrop.png',
                    'Enhancement Essence': 'Enhancement Essence.png',
                    'Torment Essence': 'Torment Essence.png',
                    'Ruin Essence': 'Ruin Essence.png',
                    'Body Essence': 'Body Essence.png',
                    'Flames Essence': 'Flames Essence.png',
                    'Battle Essence': 'Battle Essence.png',
                    'Mind Essence': 'Mind Essence.png',
                    'Ice Essence': 'Ice Essence.png',
                    'Sorcery Essence': 'Sorcery Essence.png',
                    'Infinite Essence': 'Infinite Essence.png',
                    'Electricity Essence': 'Electricity Essence.png',
                    'Haste Essence': 'Haste Essence.png',
                    'Greater Enhancement Essence':
                      'Greater Enhancement Essence.png',
                    'Greater Torment Essence': 'Greater Torment Essence.png',
                    'Greater Ruin Essence': 'Greater Ruin Essence.png',
                    'Greater Body Essence': 'Greater Body Essence.png',
                    'Greater Flames Essence': 'Greater Flames Essence.png',
                    'Greater Battle Essence': 'Greater Battle Essence.png',
                    'Greater Mind Essence': 'Greater Mind Essence.png',
                    'Greater Ice Essence': 'Greater Ice Essence.png',
                    'Greater Sorcery Essence': 'Greater Sorcery Essence.png',
                    'Greater Infinite Essence': 'Greater Infinite Essence.png',
                    'Greater Electricity Essence':
                      'Greater Electricity Essence.png',
                    'Greater Haste Essence': 'Greater Haste Essence.png',
                    Diamond: 'diamond.webp',
                  };

                  const logTextColorMap: Record<string, string> = {
                    'Chaos Orb': 'text-gold',
                    'Alchemy Orb': 'text-gold',
                    'Regal Orb': 'text-gold',
                    'Exalted Orb': 'text-gold',
                    'Divine Orb': 'text-gold',
                    'Annulment Orb': 'text-zinc-200',
                    'Scouring Orb': 'text-zinc-200',
                    'Vaal Orb': 'text-red-600',
                    'Vaal Chaos': 'text-red-600',
                    Teardrop: 'text-red-600',
                    'Fracturing Orb': 'text-frac',
                    Diamond: 'text-sky-100',
                  };

                  const getOrbImageFromEntry = (
                    entry: string,
                    idx: number,
                    arr: string[]
                  ): string => {
                    for (const [orbName, imageName] of Object.entries(
                      logOrbImageMap
                    )) {
                      if (entry.startsWith(orbName)) {
                        return imageName;
                      }
                    }

                    // For "Added/Removed" entries, look backward for the orb that caused it
                    if (
                      entry.startsWith('Added prefix') ||
                      entry.startsWith('Added prefixes') ||
                      entry.startsWith('Added suffix') ||
                      entry.startsWith('Added suffixes') ||
                      entry.startsWith('Removed prefix') ||
                      entry.startsWith('Removed suffix')
                    ) {
                      for (let i = idx - 1; i >= 0; i--) {
                        for (const [orbName, imageName] of Object.entries(
                          logOrbImageMap
                        )) {
                          if (arr[i].startsWith(orbName)) {
                            return imageName;
                          }
                        }
                      }
                    }

                    return 'Chaos Orb.png';
                  };

                  const getTextColorFromEntry = (entry: string): string => {
                    for (const [orbName, color] of Object.entries(
                      logTextColorMap
                    )) {
                      if (entry.startsWith(orbName)) {
                        return color;
                      }
                    }

                    if (entry.includes('Essence')) {
                      return 'text-sky-300';
                    }

                    if (entry.startsWith('Added')) {
                      return 'text-green-400';
                    }
                    if (entry.startsWith('Removed')) {
                      return 'text-red-400';
                    }

                    return 'text-blue-500';
                  };

                  const orbImg = getOrbImageFromEntry(entry, idx, arr);
                  const textColor = getTextColorFromEntry(entry);

                  return (
                    <li
                      key={idx}
                      className='flex items-center gap-3 rounded bg-zinc-800 px-3 py-2 text-lg shadow'
                    >
                      <img
                        src={orbImg}
                        alt={orbImg.replace('.png', '')}
                        className='h-9 w-9 flex-shrink-0'
                        draggable={false}
                      />
                      <span className={`font-semibold ${textColor}`}>
                        {(() => {
                          const essenceErrorMatch = entry.match(
                            /^(Greater )?(\w+ )?Essence - No Available .+$/
                          );
                          if (essenceErrorMatch) {
                            const [essencePart, ...rest] = entry.split(' - ');
                            return (
                              <span className='font-semibold'>
                                <span className='text-sky-300'>
                                  {essencePart + ' - '}
                                </span>
                                <span className='text-red-500'>
                                  {rest.join(' - ')}
                                </span>
                              </span>
                            );
                          }
                          // Default coloring
                          return (
                            <span className={`font-semibold ${textColor}`}>
                              {entry}
                            </span>
                          );
                        })()}
                      </span>
                    </li>
                  );
                })}
              </ul>
            </div>
          )}

          {/* Affixes section */}
          {activeSelection && activeSelection.baseType && (
            <div className='w-full rounded-lg bg-zinc-800 p-6'>
              <h3 className='mb-6 text-center text-xl font-bold text-white'>
                Available Affixes (Item Level {itemLevel})
              </h3>
              <div className='grid grid-cols-1 gap-8 lg:grid-cols-2'>
                {/* Prefixes Column */}
                <div className='space-y-4'>
                  <h4 className='text-center text-lg font-semibold text-blue-400'>
                    Prefixes ({matchingAffixes.prefixes.length})
                  </h4>
                  <div className='space-y-1 overflow-y-auto rounded bg-zinc-900 p-3'>
                    {(() => {
                      // Check if this is a jewel base
                      const isJewelBase =
                        activeSelection?.baseType &&
                        ['ruby', 'emerald', 'sapphire', 'diamond'].some(
                          (jewel) =>
                            activeSelection
                              .baseType!.toLowerCase()
                              .includes(jewel.toLowerCase())
                        );

                      if (isJewelBase) {
                        // For jewels, show individual affixes directly
                        return matchingAffixes.prefixes.flatMap((familyGroup) =>
                          familyGroup.affixes.map((affix) => {
                            const { usedPrefixFamilies } = getUsedFamilies();
                            const isFamilyUsed = usedPrefixFamilies.has(
                              affix.family
                            );

                            return (
                              <div
                                key={affix.id}
                                className='flex items-center justify-between rounded bg-zinc-800 p-2 transition-colors hover:bg-zinc-600'
                              >
                                <div className='flex-1'>
                                  <div className='flex items-center justify-between'>
                                    <span className='flex gap-1 text-sm font-medium text-white'>
                                      {affix.affix_name}
                                      {isFamilyUsed && (
                                        <img
                                          src='/images/Ultimatum.webp'
                                          alt=''
                                          className='h-5 w-5'
                                        />
                                      )}
                                    </span>
                                    <div className='flex items-center gap-3'>
                                      {activeSelection?.baseType ==
                                        'Diamond' && (
                                        <span className='text-xs text-zinc-500'>
                                          Jewel Type: {affix.item_tags}
                                        </span>
                                      )}
                                      {useWeights && (
                                        <span className='text-xs text-zinc-500'>
                                          Weight:{' '}
                                          {useCustomWeights &&
                                          customWeights[affix.id] !== undefined
                                            ? customWeights[affix.id]
                                            : affix.weighting}
                                        </span>
                                      )}
                                    </div>
                                  </div>
                                  <div className='mt-1 text-xs text-blue-300'>
                                    {affix.effect}
                                  </div>
                                </div>
                                {(() => {
                                  const isPrefix =
                                    affix.affix_type.toLowerCase() === 'prefix';

                                  let canAdd = false;
                                  const maxAffixesPerType = getMaxAffixCount(
                                    activeSelection?.baseType
                                  );
                                  canAdd = isPrefix
                                    ? craftedAffixes.prefixes.length <
                                        maxAffixesPerType && !isFamilyUsed
                                    : craftedAffixes.suffixes.length <
                                        maxAffixesPerType && !isFamilyUsed;

                                  // Check if this family has an active affix
                                  const activeAffix = isPrefix
                                    ? craftedAffixes.prefixes.find(
                                        (ca) => ca.affix.family === affix.family
                                      )?.affix
                                    : craftedAffixes.suffixes.find(
                                        (ca) => ca.affix.family === affix.family
                                      )?.affix;

                                  const isSwitching =
                                    activeAffix && activeAffix.id !== affix.id;
                                  const isCurrentTier =
                                    activeAffix && activeAffix.id === affix.id;

                                  return (
                                    activeSelection?.baseType !== 'Diamond' && (
                                      <button
                                        onClick={() => {
                                          if (isSwitching && activeAffix) {
                                            switchAffixTier(activeAffix, affix);
                                          } else {
                                            addAffix(affix);
                                            if (
                                              craftedAffixes.prefixes.length > 0
                                            ) {
                                              setItemRarity('rare');
                                            } else if (
                                              itemRarity === 'normal'
                                            ) {
                                              setItemRarity('magic');
                                            }
                                          }
                                        }}
                                        disabled={!canAdd && !isSwitching}
                                        className={`ml-2 transition-colors ${
                                          canAdd || isSwitching
                                            ? 'hover:opacity-80'
                                            : 'cursor-not-allowed opacity-50'
                                        }`}
                                        title={
                                          isSwitching
                                            ? 'Switch to this tier'
                                            : isFamilyUsed
                                              ? 'Affix Active'
                                              : canAdd
                                                ? 'Add this affix'
                                                : `Maximum prefixes reached`
                                        }
                                      >
                                        <img
                                          src={
                                            isCurrentTier
                                              ? 'Ultimatum.webp'
                                              : isSwitching
                                                ? 'Chaos Orb.png'
                                                : 'Exalted Orb.png'
                                          }
                                          alt={
                                            isSwitching
                                              ? 'Switch Tier'
                                              : 'Add Affix'
                                          }
                                          className='h-8 w-8'
                                          draggable={false}
                                        />
                                      </button>
                                    )
                                  );
                                })()}
                              </div>
                            );
                          })
                        );
                      }
                      return matchingAffixes.prefixes.map((familyGroup) => {
                        // Calculate the sum of all weights in this family
                        const totalWeight = familyGroup.affixes.reduce(
                          (sum, affix) =>
                            sum +
                            (useCustomWeights &&
                            customWeights[affix.id] !== undefined
                              ? customWeights[affix.id]
                              : affix.weighting),
                          0
                        );

                        const { usedPrefixFamilies } = getUsedFamilies();
                        const isFamilyUsed = usedPrefixFamilies.has(
                          familyGroup.family
                        );

                        return (
                          <div key={familyGroup.family} className='space-y-1'>
                            {/* Family header */}
                            <div
                              className={`cursor-pointer rounded p-2 transition-colors ${
                                isFamilyUsed
                                  ? 'bg-zinc-600 opacity-60'
                                  : 'bg-zinc-700 hover:bg-zinc-600'
                              }`}
                              onClick={() =>
                                toggleAffixFamily(familyGroup.family)
                              }
                            >
                              <div className='flex items-center justify-between'>
                                <div className='flex items-center gap-2'>
                                  <span
                                    className={`transform transition-transform ${
                                      expandedAffixFamilies[familyGroup.family]
                                        ? 'rotate-90'
                                        : ''
                                    }`}
                                  >
                                    ▶
                                  </span>
                                  <span className='flex gap-1 text-sm font-medium text-white'>
                                    {familyGroup.family}
                                    {isFamilyUsed && (
                                      <img
                                        src='/images/Ultimatum.webp'
                                        alt=''
                                        className='h-5 w-5'
                                      />
                                    )}
                                  </span>
                                  <span className='text-xs text-zinc-400'>
                                    ({familyGroup.affixes.length} tiers)
                                  </span>
                                </div>
                                {useWeights && (
                                  <div className='flex items-center gap-3'>
                                    <span className='text-xs text-zinc-400'>
                                      Weighting: {totalWeight}
                                    </span>
                                  </div>
                                )}
                              </div>
                              <div className='mt-1 text-sm text-blue-300'>
                                {familyGroup.representative.effect}
                              </div>
                            </div>

                            {/* Expanded tiers */}
                            {expandedAffixFamilies[familyGroup.family] && (
                              <div className='ml-6 space-y-1'>
                                {familyGroup.affixes.map((affix) => {
                                  return (
                                    <div
                                      key={affix.id}
                                      className='flex items-center justify-between rounded bg-zinc-800 p-2 transition-colors hover:bg-zinc-600'
                                    >
                                      <div className='flex-1'>
                                        <div className='flex items-center justify-between'>
                                          <span className='text-sm font-medium text-white'>
                                            {affix.affix_name}
                                            <span className='ml-2 text-xs text-zinc-400'>
                                              {getDisplayTier(
                                                affix,
                                                familyGroup.affixes
                                              )}
                                            </span>
                                          </span>
                                          <div className='flex items-center gap-3'>
                                            <span className='text-xs text-zinc-400'>
                                              iLvl: {affix.ilvl}
                                            </span>
                                            <span className='text-xs text-zinc-500'>
                                              Req Lvl: {affix.clvl}
                                            </span>
                                            {useWeights && (
                                              <span className='text-xs text-zinc-500'>
                                                Weight:{' '}
                                                {useCustomWeights &&
                                                customWeights[affix.id] !==
                                                  undefined
                                                  ? customWeights[affix.id]
                                                  : affix.weighting}
                                              </span>
                                            )}
                                          </div>
                                        </div>
                                        <div className='mt-1 text-xs text-blue-300'>
                                          {affix.effect}
                                        </div>
                                      </div>
                                      {(() => {
                                        const isPrefix =
                                          affix.affix_type.toLowerCase() ===
                                          'prefix';

                                        let canAdd = false;
                                        const maxAffixesPerType =
                                          getMaxAffixCount(
                                            activeSelection?.baseType
                                          );
                                        canAdd = isPrefix
                                          ? craftedAffixes.prefixes.length <
                                              maxAffixesPerType && !isFamilyUsed
                                          : craftedAffixes.suffixes.length <
                                              maxAffixesPerType &&
                                            !isFamilyUsed;

                                        const activeAffix = isPrefix
                                          ? craftedAffixes.prefixes.find(
                                              (ca) =>
                                                ca.affix.family === affix.family
                                            )?.affix
                                          : craftedAffixes.suffixes.find(
                                              (ca) =>
                                                ca.affix.family === affix.family
                                            )?.affix;

                                        const isSwitching =
                                          activeAffix &&
                                          activeAffix.id !== affix.id;
                                        const isCurrentTier =
                                          activeAffix &&
                                          activeAffix.id === affix.id;

                                        return (
                                          activeSelection?.baseType !==
                                            'Diamond' && (
                                            <button
                                              onClick={() => {
                                                if (
                                                  isSwitching &&
                                                  activeAffix
                                                ) {
                                                  switchAffixTier(
                                                    activeAffix,
                                                    affix
                                                  );
                                                } else {
                                                  addAffix(affix);
                                                  if (
                                                    craftedAffixes.prefixes
                                                      .length > 0
                                                  ) {
                                                    setItemRarity('rare');
                                                  } else if (
                                                    itemRarity === 'normal'
                                                  ) {
                                                    setItemRarity('magic');
                                                  }
                                                }
                                              }}
                                              disabled={!canAdd && !isSwitching}
                                              className={`ml-2 transition-colors ${
                                                canAdd || isSwitching
                                                  ? 'hover:opacity-80'
                                                  : 'cursor-not-allowed opacity-50'
                                              }`}
                                              title={
                                                isSwitching
                                                  ? 'Switch to this tier'
                                                  : isFamilyUsed
                                                    ? 'Affix Active'
                                                    : canAdd
                                                      ? 'Add this affix'
                                                      : `Maximum ${isPrefix ? 'prefixes' : 'suffixes'} reached`
                                              }
                                            >
                                              <img
                                                src={
                                                  isCurrentTier
                                                    ? 'Ultimatum.webp'
                                                    : isSwitching
                                                      ? 'Chaos Orb.png'
                                                      : 'Exalted Orb.png'
                                                }
                                                alt={
                                                  isSwitching
                                                    ? 'Switch Tier'
                                                    : 'Add Affix'
                                                }
                                                className='h-8 w-8'
                                                draggable={false}
                                              />
                                            </button>
                                          )
                                        );
                                      })()}
                                    </div>
                                  );
                                })}
                              </div>
                            )}
                          </div>
                        );
                      });
                    })()}
                  </div>
                </div>

                {/* Suffixes Column */}
                <div className='space-y-4'>
                  <h4 className='text-center text-lg font-semibold text-yellow-400'>
                    Suffixes ({matchingAffixes.suffixes.length})
                  </h4>
                  <div className='space-y-1 overflow-y-auto rounded bg-zinc-900 p-3'>
                    {(() => {
                      // Check if this is a jewel base
                      const isJewelBase =
                        activeSelection?.baseType &&
                        ['ruby', 'emerald', 'sapphire', 'diamond'].some(
                          (jewel) =>
                            activeSelection
                              .baseType!.toLowerCase()
                              .includes(jewel.toLowerCase())
                        );

                      if (isJewelBase) {
                        // For jewels, show individual affixes directly
                        return matchingAffixes.suffixes.flatMap((familyGroup) =>
                          familyGroup.affixes.map((affix) => {
                            const { usedSuffixFamilies } = getUsedFamilies();
                            const isFamilyUsed = usedSuffixFamilies.has(
                              affix.family
                            );

                            return (
                              <div
                                key={affix.id}
                                className='flex items-center justify-between rounded bg-zinc-800 p-2 transition-colors hover:bg-zinc-600'
                              >
                                <div className='flex-1'>
                                  <div className='flex items-center justify-between'>
                                    <span className='flex gap-1 text-sm font-medium text-white'>
                                      {affix.affix_name}
                                      {isFamilyUsed && (
                                        <img
                                          src='/images/Ultimatum.webp'
                                          alt=''
                                          className='h-5 w-5'
                                        />
                                      )}
                                    </span>
                                    <div className='flex items-center gap-3'>
                                      {activeSelection?.baseType ==
                                        'Diamond' && (
                                        <span className='text-xs text-zinc-500'>
                                          Jewel Type: {affix.item_tags}
                                        </span>
                                      )}
                                      {useWeights && (
                                        <span className='text-xs text-zinc-500'>
                                          Weight:{' '}
                                          {useCustomWeights &&
                                          customWeights[affix.id] !== undefined
                                            ? customWeights[affix.id]
                                            : affix.weighting}
                                        </span>
                                      )}
                                    </div>
                                  </div>
                                  <div className='mt-1 text-xs text-yellow-300'>
                                    {affix.effect}
                                  </div>
                                </div>
                                {(() => {
                                  const isSuffix =
                                    affix.affix_type.toLowerCase() === 'suffix';

                                  let canAdd = false;
                                  const maxAffixesPerType = getMaxAffixCount(
                                    activeSelection?.baseType
                                  );
                                  canAdd = isSuffix
                                    ? craftedAffixes.suffixes.length <
                                        maxAffixesPerType && !isFamilyUsed
                                    : craftedAffixes.prefixes.length <
                                        maxAffixesPerType && !isFamilyUsed;

                                  const activeAffix =
                                    craftedAffixes.suffixes.find(
                                      (ca) => ca.affix.family === affix.family
                                    )?.affix;

                                  const isSwitching =
                                    activeAffix && activeAffix.id !== affix.id;
                                  const isCurrentTier =
                                    activeAffix && activeAffix.id === affix.id;

                                  return (
                                    activeSelection?.baseType !== 'Diamond' && (
                                      <button
                                        onClick={() => {
                                          if (isSwitching && activeAffix) {
                                            switchAffixTier(activeAffix, affix);
                                          } else {
                                            addAffix(affix);
                                            if (
                                              craftedAffixes.suffixes.length > 0
                                            ) {
                                              setItemRarity('rare');
                                            } else if (
                                              itemRarity === 'normal'
                                            ) {
                                              setItemRarity('magic');
                                            }
                                          }
                                        }}
                                        disabled={!canAdd && !isSwitching}
                                        className={`ml-2 transition-colors ${
                                          canAdd || isSwitching
                                            ? 'hover:opacity-80'
                                            : 'cursor-not-allowed opacity-50'
                                        }`}
                                        title={
                                          isSwitching
                                            ? 'Switch to this tier'
                                            : isFamilyUsed
                                              ? 'Affix Active'
                                              : canAdd
                                                ? 'Add this affix'
                                                : `Maximum suffixes reached`
                                        }
                                      >
                                        <img
                                          src={
                                            isCurrentTier
                                              ? 'Ultimatum.webp'
                                              : isSwitching
                                                ? 'Chaos Orb.png'
                                                : 'Exalted Orb.png'
                                          }
                                          alt={
                                            isSwitching
                                              ? 'Switch Tier'
                                              : 'Add Affix'
                                          }
                                          className='h-8 w-8'
                                          draggable={false}
                                        />
                                      </button>
                                    )
                                  );
                                })()}
                              </div>
                            );
                          })
                        );
                      }
                      return matchingAffixes.suffixes.map((familyGroup) => {
                        const totalWeight = familyGroup.affixes.reduce(
                          (sum, affix) =>
                            sum +
                            (useCustomWeights &&
                            customWeights[affix.id] !== undefined
                              ? customWeights[affix.id]
                              : affix.weighting),
                          0
                        );

                        const { usedSuffixFamilies } = getUsedFamilies();
                        const isFamilyUsed = usedSuffixFamilies.has(
                          familyGroup.family
                        );

                        return (
                          <div key={familyGroup.family} className='space-y-1'>
                            {/* Family header */}
                            <div
                              className={`cursor-pointer rounded p-2 transition-colors ${
                                isFamilyUsed
                                  ? 'bg-zinc-600 opacity-60'
                                  : 'bg-zinc-700 hover:bg-zinc-600'
                              }`}
                              onClick={() =>
                                toggleAffixFamily(familyGroup.family)
                              }
                            >
                              <div className='flex items-center justify-between'>
                                <div className='flex items-center gap-2'>
                                  <span
                                    className={`transform transition-transform ${
                                      expandedAffixFamilies[familyGroup.family]
                                        ? 'rotate-90'
                                        : ''
                                    }`}
                                  >
                                    ▶
                                  </span>
                                  <span className='flex gap-1 text-sm font-medium text-white'>
                                    {familyGroup.family}
                                    {isFamilyUsed && (
                                      <img
                                        src='/images/Ultimatum.webp'
                                        alt=''
                                        className='h-5 w-5'
                                      />
                                    )}
                                  </span>
                                  <span className='text-xs text-zinc-400'>
                                    ({familyGroup.affixes.length} tiers)
                                  </span>
                                </div>
                                {useWeights && (
                                  <div className='flex items-center gap-3'>
                                    <span className='text-xs text-zinc-400'>
                                      Weighting: {totalWeight}
                                    </span>
                                  </div>
                                )}
                              </div>
                              <div className='mt-1 text-sm text-yellow-300'>
                                {familyGroup.representative.effect}
                              </div>
                            </div>

                            {/* Expanded tiers */}
                            {expandedAffixFamilies[familyGroup.family] && (
                              <div className='ml-6 space-y-1'>
                                {familyGroup.affixes.map((affix) => {
                                  return (
                                    <div
                                      key={affix.id}
                                      className='flex items-center justify-between rounded bg-zinc-800 p-2 transition-colors hover:bg-zinc-600'
                                    >
                                      <div className='flex-1'>
                                        <div className='flex items-center justify-between'>
                                          <span className='text-sm font-medium text-white'>
                                            {affix.affix_name}
                                            <span className='ml-2 text-xs text-zinc-400'>
                                              {getDisplayTier(
                                                affix,
                                                familyGroup.affixes
                                              )}
                                            </span>
                                          </span>
                                          <div className='flex items-center gap-3'>
                                            <span className='text-xs text-zinc-400'>
                                              iLvl: {affix.ilvl}
                                            </span>
                                            <span className='text-xs text-zinc-500'>
                                              Req Lvl: {affix.clvl}
                                            </span>
                                            {useWeights && (
                                              <span className='text-xs text-zinc-500'>
                                                Weight:{' '}
                                                {useCustomWeights &&
                                                customWeights[affix.id] !==
                                                  undefined
                                                  ? customWeights[affix.id]
                                                  : affix.weighting}
                                              </span>
                                            )}
                                          </div>
                                        </div>
                                        <div className='mt-1 text-xs text-yellow-300'>
                                          {affix.effect}
                                        </div>
                                      </div>
                                      {(() => {
                                        const isSuffix =
                                          affix.affix_type.toLowerCase() ===
                                          'suffix';

                                        let canAdd = false;
                                        const maxAffixesPerType =
                                          getMaxAffixCount(
                                            activeSelection?.baseType
                                          );
                                        canAdd = isSuffix
                                          ? craftedAffixes.suffixes.length <
                                              maxAffixesPerType && !isFamilyUsed
                                          : craftedAffixes.prefixes.length <
                                              maxAffixesPerType &&
                                            !isFamilyUsed;

                                        const activeAffix =
                                          craftedAffixes.suffixes.find(
                                            (ca) =>
                                              ca.affix.family === affix.family
                                          )?.affix;

                                        const isSwitching =
                                          activeAffix &&
                                          activeAffix.id !== affix.id;
                                        const isCurrentTier =
                                          activeAffix &&
                                          activeAffix.id === affix.id;

                                        return (
                                          activeSelection?.baseType !==
                                            'Diamond' && (
                                            <button
                                              onClick={() => {
                                                if (
                                                  isSwitching &&
                                                  activeAffix
                                                ) {
                                                  switchAffixTier(
                                                    activeAffix,
                                                    affix
                                                  );
                                                } else {
                                                  addAffix(affix);
                                                  if (
                                                    craftedAffixes.suffixes
                                                      .length > 0
                                                  ) {
                                                    setItemRarity('rare');
                                                  } else if (
                                                    itemRarity === 'normal'
                                                  ) {
                                                    setItemRarity('magic');
                                                  }
                                                }
                                              }}
                                              disabled={!canAdd && !isSwitching}
                                              className={`ml-2 transition-colors ${
                                                canAdd || isSwitching
                                                  ? 'hover:opacity-80'
                                                  : 'cursor-not-allowed opacity-50'
                                              }`}
                                              title={
                                                isSwitching
                                                  ? 'Switch to this tier'
                                                  : isFamilyUsed
                                                    ? 'Affix Active'
                                                    : canAdd
                                                      ? 'Add this affix'
                                                      : `Maximum suffixes reached`
                                              }
                                            >
                                              <img
                                                src={
                                                  isCurrentTier
                                                    ? 'Ultimatum.webp'
                                                    : isSwitching
                                                      ? 'Chaos Orb.png'
                                                      : 'Exalted Orb.png'
                                                }
                                                alt={
                                                  isSwitching
                                                    ? 'Switch Tier'
                                                    : 'Add Affix'
                                                }
                                                className='h-8 w-8'
                                                draggable={false}
                                              />
                                            </button>
                                          )
                                        );
                                      })()}
                                    </div>
                                  );
                                })}
                              </div>
                            )}
                          </div>
                        );
                      });
                    })()}
                  </div>
                </div>
                {useWeights && (
                  <span>
                    Total Prefixes Weighting:{' '}
                    {matchingAffixes.prefixes
                      .flatMap((family) => family.affixes)
                      .reduce(
                        (sum, affix) =>
                          sum +
                          (useCustomWeights &&
                          customWeights[affix.id] !== undefined
                            ? customWeights[affix.id]
                            : affix.weighting),
                        0
                      )}
                  </span>
                )}
                {useWeights && (
                  <span>
                    Total Suffixes Weighting:{' '}
                    {matchingAffixes.suffixes
                      .flatMap((family) => family.affixes)
                      .reduce(
                        (sum, affix) =>
                          sum +
                          (useCustomWeights &&
                          customWeights[affix.id] !== undefined
                            ? customWeights[affix.id]
                            : affix.weighting),
                        0
                      )}
                  </span>
                )}
              </div>
              {/* Weight Controls */}
              <div className='mt-6 space-y-4 border-t border-zinc-600 pt-4'>
                <div className='flex justify-center gap-8'>
                  <label className='flex items-center gap-2 text-white'>
                    <input
                      type='checkbox'
                      checked={useWeights}
                      onChange={(e) => {
                        setUseWeights(e.target.checked);
                        if (!e.target.checked) {
                          setUseCustomWeights(false);
                        }
                      }}
                      className='h-4 w-4 rounded border-zinc-400 bg-zinc-700 text-blue-600 focus:ring-blue-500'
                    />
                    Use Weights
                  </label>
                  <label className='flex items-center gap-2 text-white'>
                    <input
                      type='checkbox'
                      checked={useCustomWeights}
                      onChange={(e) => {
                        setUseCustomWeights(e.target.checked);
                        if (e.target.checked) {
                          setUseWeights(true);
                        }
                      }}
                      disabled={!useWeights}
                      className='h-4 w-4 rounded border-zinc-400 bg-zinc-700 text-blue-600 focus:ring-blue-500 disabled:opacity-50'
                    />
                    Use Custom Weights
                  </label>
                </div>
                {useCustomWeights && (
                  <div className='mt-4 w-full rounded-lg bg-zinc-800 p-6'>
                    <h3 className='mb-4 text-center text-xl font-bold text-white'>
                      Custom Weights
                    </h3>
                    <div className='grid grid-cols-1 gap-8 lg:grid-cols-2'>
                      {/* Custom Prefix Weights */}
                      <div className='space-y-4'>
                        <h4 className='text-center text-lg font-semibold text-blue-400'>
                          Prefix Weights
                        </h4>
                        <div className='max-h-60 space-y-2 overflow-y-auto rounded bg-zinc-900 p-3'>
                          {(() => {
                            // Check if this is a jewel base
                            const isJewelBase =
                              activeSelection?.baseType &&
                              ['ruby', 'emerald', 'sapphire', 'diamond'].some(
                                (jewel) =>
                                  activeSelection
                                    .baseType!.toLowerCase()
                                    .includes(jewel.toLowerCase())
                              );

                            if (isJewelBase) {
                              // For jewels, show individual affixes
                              return matchingAffixes.prefixes.flatMap(
                                (familyGroup) =>
                                  familyGroup.affixes.map((affix) => (
                                    <div
                                      key={affix.id}
                                      className='flex items-center justify-between rounded bg-zinc-800 p-2'
                                    >
                                      <div className='flex-1'>
                                        <span className='text-sm font-medium text-white'>
                                          {affix.affix_name}
                                        </span>
                                        <div className='text-xs text-yellow-300'>
                                          {affix.effect}
                                        </div>
                                      </div>
                                      <input
                                        type='number'
                                        min='0'
                                        max='2000'
                                        value={
                                          customWeights[affix.id] ??
                                          affix.weighting
                                        }
                                        onChange={(e) => {
                                          const value =
                                            parseInt(e.target.value) || 0;
                                          setCustomWeights((prev) => ({
                                            ...prev,
                                            [affix.id]: value,
                                          }));
                                        }}
                                        className='ml-2 w-20 rounded border border-zinc-600 bg-zinc-700 px-2 py-1 text-center text-white focus:border-yellow-500'
                                      />
                                    </div>
                                  ))
                              );
                            }
                            return matchingAffixes.prefixes.map(
                              (familyGroup) => (
                                <div
                                  key={familyGroup.family}
                                  className='space-y-1'
                                >
                                  {/* Family header - collapsible */}
                                  <div
                                    className='flex cursor-pointer items-center gap-2 rounded bg-zinc-700 p-2'
                                    onClick={() =>
                                      toggleCustomWeightFamily(
                                        familyGroup.family
                                      )
                                    }
                                  >
                                    <span
                                      className={`transform transition-transform ${
                                        expandedCustomWeightFamilies[
                                          familyGroup.family
                                        ]
                                          ? 'rotate-90'
                                          : ''
                                      }`}
                                    >
                                      ▶
                                    </span>
                                    <span className='text-sm font-medium text-white'>
                                      {familyGroup.family}
                                    </span>
                                    <span className='text-xs text-zinc-400'>
                                      ({familyGroup.affixes.length} tiers)
                                    </span>
                                  </div>
                                  {/* Expanded tiers */}
                                  {expandedCustomWeightFamilies[
                                    familyGroup.family
                                  ] && (
                                    <div className='ml-4 space-y-1'>
                                      {familyGroup.affixes.map((affix) => (
                                        <div
                                          key={affix.id}
                                          className='flex items-center justify-between rounded bg-zinc-800 p-2'
                                        >
                                          <div className='flex-1'>
                                            <span className='text-sm font-medium text-white'>
                                              {affix.affix_name}
                                              <span className='ml-2 text-xs text-zinc-400'>
                                                {getDisplayTier(
                                                  affix,
                                                  familyGroup.affixes
                                                )}
                                              </span>
                                            </span>
                                            <div className='text-xs text-yellow-300'>
                                              {affix.effect}
                                            </div>
                                          </div>
                                          <input
                                            type='number'
                                            min='0'
                                            max='2000'
                                            value={
                                              customWeights[affix.id] ??
                                              affix.weighting
                                            }
                                            onChange={(e) => {
                                              const value =
                                                parseInt(e.target.value) || 0;
                                              setCustomWeights((prev) => ({
                                                ...prev,
                                                [affix.id]: value,
                                              }));
                                            }}
                                            className='ml-2 w-20 rounded border border-zinc-600 bg-zinc-700 px-2 py-1 text-center text-white focus:border-yellow-500'
                                          />
                                        </div>
                                      ))}
                                    </div>
                                  )}
                                </div>
                              )
                            );
                          })()}
                        </div>
                      </div>

                      {/* Custom Suffix Weights */}
                      <div className='space-y-4'>
                        <h4 className='text-center text-lg font-semibold text-yellow-400'>
                          Suffix Weights
                        </h4>
                        <div className='max-h-60 space-y-2 overflow-y-auto rounded bg-zinc-900 p-3'>
                          {(() => {
                            // Check if this is a jewel base
                            const isJewelBase =
                              activeSelection?.baseType &&
                              ['ruby', 'emerald', 'sapphire', 'diamond'].some(
                                (jewel) =>
                                  activeSelection
                                    .baseType!.toLowerCase()
                                    .includes(jewel.toLowerCase())
                              );

                            if (isJewelBase) {
                              // For jewels, show individual affixes
                              return matchingAffixes.suffixes.flatMap(
                                (familyGroup) =>
                                  familyGroup.affixes.map((affix) => (
                                    <div
                                      key={affix.id}
                                      className='flex items-center justify-between rounded bg-zinc-800 p-2'
                                    >
                                      <div className='flex-1'>
                                        <span className='text-sm font-medium text-white'>
                                          {affix.affix_name}
                                        </span>
                                        <div className='text-xs text-yellow-300'>
                                          {affix.effect}
                                        </div>
                                      </div>
                                      <input
                                        type='number'
                                        min='0'
                                        max='2000'
                                        value={
                                          customWeights[affix.id] ??
                                          affix.weighting
                                        }
                                        onChange={(e) => {
                                          const value =
                                            parseInt(e.target.value) || 0;
                                          setCustomWeights((prev) => ({
                                            ...prev,
                                            [affix.id]: value,
                                          }));
                                        }}
                                        className='ml-2 w-20 rounded border border-zinc-600 bg-zinc-700 px-2 py-1 text-center text-white focus:border-yellow-500'
                                      />
                                    </div>
                                  ))
                              );
                            }
                            return matchingAffixes.suffixes.map(
                              (familyGroup) => (
                                <div
                                  key={familyGroup.family}
                                  className='space-y-1'
                                >
                                  {/* Family header - collapsible */}
                                  <div
                                    className='flex cursor-pointer items-center gap-2 rounded bg-zinc-700 p-2'
                                    onClick={() =>
                                      toggleCustomWeightFamily(
                                        familyGroup.family
                                      )
                                    }
                                  >
                                    <span
                                      className={`transform transition-transform ${
                                        expandedCustomWeightFamilies[
                                          familyGroup.family
                                        ]
                                          ? 'rotate-90'
                                          : ''
                                      }`}
                                    >
                                      ▶
                                    </span>
                                    <span className='text-sm font-medium text-white'>
                                      {familyGroup.family}
                                    </span>
                                    <span className='text-xs text-zinc-400'>
                                      ({familyGroup.affixes.length} tiers)
                                    </span>
                                  </div>
                                  {/* Expanded tiers */}
                                  {expandedCustomWeightFamilies[
                                    familyGroup.family
                                  ] && (
                                    <div className='ml-4 space-y-1'>
                                      {familyGroup.affixes.map((affix) => (
                                        <div
                                          key={affix.id}
                                          className='flex items-center justify-between rounded bg-zinc-800 p-2'
                                        >
                                          <div className='flex-1'>
                                            <span className='text-sm font-medium text-white'>
                                              {affix.affix_name}
                                              <span className='ml-2 text-xs text-zinc-400'>
                                                {getDisplayTier(
                                                  affix,
                                                  familyGroup.affixes
                                                )}
                                              </span>
                                            </span>
                                            <div className='text-xs text-yellow-300'>
                                              {affix.effect}
                                            </div>
                                          </div>
                                          <input
                                            type='number'
                                            min='0'
                                            max='2000'
                                            value={
                                              customWeights[affix.id] ??
                                              affix.weighting
                                            }
                                            onChange={(e) => {
                                              const value =
                                                parseInt(e.target.value) || 0;
                                              setCustomWeights((prev) => ({
                                                ...prev,
                                                [affix.id]: value,
                                              }));
                                            }}
                                            className='ml-2 w-20 rounded border border-zinc-600 bg-zinc-700 px-2 py-1 text-center text-white focus:border-yellow-500'
                                          />
                                        </div>
                                      ))}
                                    </div>
                                  )}
                                </div>
                              )
                            );
                          })()}
                        </div>
                      </div>
                    </div>
                  </div>
                )}
              </div>
            </div>
          )}
        </div>
      </div>
    </>
  );
}

export default Crafting;
