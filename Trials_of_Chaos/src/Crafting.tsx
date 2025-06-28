import React, { useState } from 'react';
import { useSuspenseQuery } from '@tanstack/react-query';
import { useRanger } from '@tanstack/react-ranger';
import { itemqfn, ItemsResponse } from './handlers/itemsquery';
import { affixqfn } from './handlers/affixesquery';
import { Affix, Affixes, AffixFamilyGroup } from './types/affixes';
import { ItemDisplay } from './ItemDisplay';
import { Base, Item } from './types/items';

const RangeSlider = ({
  values,
  onChange,
  min,
  max,
  step = 1,
  disabled = false,
  color = 'blue',
}: {
  values: number[];
  onChange: (values: number[]) => void;
  min: number;
  max: number;
  step?: number;
  disabled?: boolean;
  color?: 'blue' | 'yellow';
}) => {
  const trackElRef = React.useRef<HTMLDivElement>(null);
  const rangerInstance = useRanger({
    values,
    onChange: (instance) => onChange([...instance.sortedValues]),
    min,
    max,
    stepSize: step,
    getRangerElement: () => trackElRef.current,
  });

  if (disabled || min === max) {
    return (
      <div className='mt-2'>
        <div className='text-xs text-zinc-300'>Value: {min} (fixed)</div>
      </div>
    );
  }

  const currentValue = values[0];
  const percentage = rangerInstance.getPercentageForValue(currentValue);
  const colorClasses =
    color === 'blue'
      ? {
          track: 'bg-blue-600',
          handle: 'bg-blue-500 hover:bg-blue-400',
          ring: 'focus:ring-blue-400',
        }
      : {
          track: 'bg-yellow-600',
          handle: 'bg-yellow-500 hover:bg-yellow-400',
          ring: 'focus:ring-yellow-400',
        };

  return (
    <div className='mt-2'>
      <div className='mb-1 flex items-center justify-between text-xs text-zinc-300'>
        <span>Value: {currentValue}</span>
        <span>
          ({min}-{max})
        </span>
      </div>
      <div className='flex h-8 items-center'>
        <div
          ref={trackElRef}
          className='relative h-3 w-full cursor-pointer rounded-full bg-gray-700 transition-colors duration-150 hover:bg-gray-600'
        >
          <div
            className={`absolute inset-y-0 left-0 rounded-full ${colorClasses.track} transition-all duration-150 ease-out`}
            style={{ width: `${percentage}%` }}
          />
          {rangerInstance.handles().map((handle, index) => (
            <div
              key={index}
              onKeyDown={handle.onKeyDownHandler}
              onMouseDown={handle.onMouseDownHandler}
              onTouchStart={handle.onTouchStart}
              role='slider'
              tabIndex={0}
              aria-valuemin={min}
              aria-valuemax={max}
              aria-valuenow={currentValue}
              style={{ left: `${percentage}%` }}
              className={`absolute top-1/2 h-6 w-6 -translate-x-1/2 -translate-y-1/2 transform cursor-grab rounded-full border-2 border-white ${colorClasses.handle} shadow-lg transition-all duration-150 ease-out hover:scale-105 ${colorClasses.ring} focus:outline-none focus:ring-2 focus:ring-opacity-50 active:cursor-grabbing`}
            >
              <div className='absolute inset-1 rounded-full bg-white opacity-30'></div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

function Crafting() {
  const [selectedSlot, setSelectedSlot] = useState<string | null>(null);
  const [selectedSubtype, setSelectedSubtype] = useState<string | null>(null);
  const [selectedShieldType, setSelectedShieldType] = useState<string | null>(
    null
  );
  const [selectedBaseType, setSelectedBaseType] = useState<string | null>(null);
  const [itemLevel, setItemLevel] = useState<number>(82);
  const [activeSelection, setActiveSelection] = useState<{
    slot: string;
    subtype: string;
    shieldType?: string;
    baseType?: string;
    ringSlot?: 'left' | 'right';
  } | null>(null);
  const [expandedTiers, setExpandedTiers] = useState<{
    [key: string]: boolean;
  }>({
    expert: true,
    advanced: false,
    novice: false,
  });
  const [expandedAffixFamilies, setExpandedAffixFamilies] = useState<{
    [key: string]: boolean;
  }>({});
  const [lastSelectedSubtype, setLastSelectedSubtype] = useState<string | null>(
    null
  );
  const [affixLog, setAffixLog] = useState<string[]>([]);
  const [activeOrb, setActiveOrb] = useState<string | null>(null);
  const [cursorPos, setCursorPos] = useState<{ x: number; y: number }>({
    x: 0,
    y: 0,
  });
  const [implicitResult, setImplicitResult] = useState<{
    text: string;
    value: number | null;
  }>({ text: '', value: null });
  const [itemRarity, setItemRarity] = useState<'normal' | 'magic' | 'rare'>(
    'normal'
  );
  const [itemQuality, setItemQuality] = useState(0);
  const [itemSockets, setItemSockets] = useState(0);
  const [itemCorruption, setItemCorruption] = useState(0);
  const [CorruptionOmen, setCorruptionOmen] = useState(0);
  const [fracturedAffixId, setFracturedAffixId] = useState<string | null>(null);

  const nhl = (
    <img
      src='https://www.poe2wiki.net/w/images/3/3a/Item_UI_header_normal_left.png'
      alt='header left'
      className='h-full'
      draggable={false}
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
      draggable={false}
    />
  );

  const { data: itemAndBaseData } = useSuspenseQuery<ItemsResponse>({
    queryKey: ['items'],
    queryFn: itemqfn,
    refetchOnWindowFocus: false,
  });

  const { data: affixesData } = useSuspenseQuery<Affixes>({
    queryKey: ['affixes'],
    queryFn: affixqfn,
    refetchOnWindowFocus: false,
  });

  const { bases } = itemAndBaseData!;

  const weapon_types = [
    'axe',
    'two_hand_axe',
    'mace',
    'two_hand_mace',
    'sword',
    'two_hand_sword',
    'claw',
    'dagger',
    'flail',
    'spear',
    'bow',
    'crossbow',
    'staff',
    'quarterstaff',
    'wand',
    'sceptre',
  ];

  const offhand_types = ['quiver', 'focus', 'buckler', 'shield'];

  const shield_types = ['str', 'str/dex', 'str/int'];

  const armour_types = ['STR', 'DEX', 'INT', 'STR/DEX', 'STR/INT', 'DEX/INT'];

  const getSubtypeOptions = (slotName: string) => {
    switch (slotName.toLowerCase()) {
      case 'weapon':
        return weapon_types;
      case 'offhand':
        return offhand_types;
      case 'helmet':
      case 'body armour':
      case 'gloves':
      case 'boots':
        return armour_types;
      default:
        return [];
    }
  };

  const needsSubtypeSelection = (slotName: string) => {
    const noSubtypeSlots = ['ring', 'belt', 'amulet', 'jewel'];
    return !noSubtypeSlots.includes(slotName.toLowerCase());
  };

  const getItemTags = (slot: string, subtype?: string, shieldType?: string) => {
    const slotLower = slot.toLowerCase();

    // Handle weapon types
    if (slotLower === 'weapon' && subtype) {
      if (
        [
          'crossbow',
          'quarterstaff',
          'two_hand_axe',
          'two_hand_mace',
          'two_hand_sword',
        ].includes(subtype)
      ) {
        return ['two_hand', subtype];
      }
      if (
        ['axe', 'mace', 'sword', 'claw', 'dagger', 'flail', 'spear'].includes(
          subtype
        )
      ) {
        return ['one_hand', subtype];
      }
      return [subtype];
    }

    // Handle offhand types
    if (slotLower === 'offhand' && subtype) {
      if (subtype === 'shield' && shieldType) {
        switch (shieldType) {
          case 'str':
            return ['shield', 'str_armour'];
          case 'str/dex':
            return ['shield', 'str_dex_armour'];
          case 'str/int':
            return ['shield', 'str_int_armour'];
          default:
            return ['shield'];
        }
      }
      if (subtype === 'buckler') {
        return ['shield', 'dex_armour'];
      }
      return [subtype];
    }

    // Handle armour types
    if (
      ['helmet', 'body armour', 'gloves', 'boots'].includes(slotLower) &&
      subtype
    ) {
      switch (subtype) {
        case 'STR':
          return ['str_armour'];
        case 'DEX':
          return ['dex_armour'];
        case 'INT':
          return ['int_armour'];
        case 'STR/DEX':
          return ['str_dex_armour'];
        case 'STR/INT':
          return ['str_int_armour'];
        case 'DEX/INT':
          return ['dex_int_armour'];
        default:
          return [];
      }
    }

    // Handle items that don't need subtype selection
    if (['ring', 'belt', 'amulet', 'jewel'].includes(slotLower)) {
      return [slotLower];
    }

    return [];
  };

  // Update handleSlotClick to save the selection before clearing it
  const handleSlotClick = (slotName: string, ringSlot?: 'left' | 'right') => {
    if (
      activeSelection &&
      activeSelection.slot === slotName &&
      (slotName !== 'Ring' || activeSelection.ringSlot === ringSlot)
    ) {
      // Save the current selection before clearing it
      setLastSelectedSubtype(activeSelection.subtype);
      setActiveSelection(null);
      return;
    }

    setSelectedSlot(slotName);
    setSelectedSubtype(null);
    setSelectedShieldType(null);
    setSelectedBaseType(null);

    // Store which ring slot was clicked
    if (slotName === 'Ring' && ringSlot) {
      setActiveSelection({ slot: slotName, subtype: '', ringSlot });
    }

    // Reset expanded tiers to show only expert
    setExpandedTiers({
      expert: true,
      advanced: false,
      novice: false,
    });
  };

  const handleSubtypeSelect = (subtype: string) => {
    // Check if we should clear affixes when changing subtypes
    if (
      lastSelectedSubtype &&
      lastSelectedSubtype !== subtype &&
      (craftedAffixes.prefixes.length > 0 || craftedAffixes.suffixes.length > 0)
    ) {
      // For armor pieces - clear affixes if armor attribute changed
      if (
        ['helmet', 'body armour', 'gloves', 'boots'].includes(
          selectedSlot?.toLowerCase() || ''
        )
      ) {
        // Get tags for comparison
        const oldTags = getItemTags(selectedSlot!, lastSelectedSubtype);
        const newTags = getItemTags(selectedSlot!, subtype);

        const oldArmorTags = oldTags.filter((tag) => tag.includes('_armour'));
        const newArmorTags = newTags.filter((tag) => tag.includes('_armour'));

        const tagsMatch =
          oldArmorTags.length === newArmorTags.length &&
          oldArmorTags.every((tag) => newArmorTags.includes(tag));

        if (!tagsMatch) {
          setCraftedAffixes({ prefixes: [], suffixes: [] });
          setAffixLog([]);
          setItemRarity('normal');
          setItemQuality(0);
          setItemSockets(0);
        }
      }

      // For weapons
      if (selectedSlot?.toLowerCase() === 'weapon') {
        const oldTags = getItemTags(selectedSlot!, lastSelectedSubtype);
        const newTags = getItemTags(selectedSlot!, subtype);

        // Check if hand type changed (one_hand vs two_hand)
        const oldHandType = oldTags.find(
          (tag) => tag === 'one_hand' || tag === 'two_hand'
        );
        const newHandType = newTags.find(
          (tag) => tag === 'one_hand' || tag === 'two_hand'
        );

        // Check if weapon type changed (axe vs sword vs mace, etc.)
        //const oldWeaponType = oldTags.find(
        //  (tag) => !['one_hand', 'two_hand'].includes(tag)
        //);
        //const newWeaponType = newTags.find(
        //  (tag) => !['one_hand', 'two_hand'].includes(tag)
        //);

        if (oldHandType !== newHandType) {
          setCraftedAffixes({ prefixes: [], suffixes: [] });
          setAffixLog([]);
          setItemRarity('normal');
          setItemQuality(0);
          setItemSockets(0);
        }
      }

      // For offhand items
      if (selectedSlot?.toLowerCase() === 'offhand') {
        if (lastSelectedSubtype !== subtype) {
          setCraftedAffixes({ prefixes: [], suffixes: [] });
          setAffixLog([]);
          setItemRarity('normal');
          setItemQuality(0);
          setItemSockets(0);
        }
      }

      // Clear the lastSelectedSubtype after using it
      setLastSelectedSubtype(null);
    }

    setSelectedSubtype(subtype);
    setSelectedShieldType(null);

    if (subtype === 'buckler') {
      setSelectedShieldType('dex');
      return;
    }

    // if (subtype !== 'shield') {
    //   completeSelection(selectedSlot!, subtype);
    // }
  };

  const handleShieldTypeSelect = (shieldType: string) => {
    // Check if we should clear affixes when changing shield types
    if (activeSelection && selectedSubtype === 'shield') {
      // Create temporary selections to compare compatibility
      const oldSelection = {
        slot: selectedSlot!,
        subtype: selectedSubtype,
        shieldType: activeSelection.shieldType,
      };

      const newSelection = {
        slot: selectedSlot!,
        subtype: selectedSubtype,
        shieldType: shieldType,
      };

      // Check if the armor attribute tags would be different
      const oldTags = getItemTags(
        oldSelection.slot,
        oldSelection.subtype,
        oldSelection.shieldType
      );
      const newTags = getItemTags(
        newSelection.slot,
        newSelection.subtype,
        newSelection.shieldType
      );

      // If the armor attribute tags are different, clear affixes
      const oldArmorTags = oldTags.filter((tag) => tag.includes('_armour'));
      const newArmorTags = newTags.filter((tag) => tag.includes('_armour'));

      const tagsMatch =
        oldArmorTags.length === newArmorTags.length &&
        oldArmorTags.every((tag) => newArmorTags.includes(tag));

      if (!tagsMatch) {
        setCraftedAffixes({ prefixes: [], suffixes: [] });
        setAffixLog([]);
        setItemRarity('normal');
        setItemQuality(0);
        setItemSockets(0);
      }
    }

    setSelectedShieldType(shieldType);
  };

  const getBaseTypes = (
    slot: string,
    subtype?: string,
    shieldType?: string
  ) => {
    const slotLower = slot.toLowerCase();

    // Map slot names and subtypes to item_class values
    const getRequiredItemClass = (slotName: string, weaponSubtype?: string) => {
      switch (slotName) {
        case 'helmet':
          return 'Helmet';
        case 'body armour':
          return 'Body Armour';
        case 'gloves':
          return 'Gloves';
        case 'boots':
          return 'Boots';
        case 'weapon':
          // For weapons, return the specific weapon type as item_class
          if (weaponSubtype) {
            switch (weaponSubtype) {
              case 'axe':
                return 'One Hand Axe';
              case 'two_hand_axe':
                return 'Two Hand Axe';
              case 'mace':
                return 'One Hand Mace';
              case 'two_hand_mace':
                return 'Two Hand Mace';
              case 'sword':
                return 'One Hand Sword';
              case 'two_hand_sword':
                return 'Two Hand Sword';
              case 'claw':
                return 'Claw';
              case 'dagger':
                return 'Dagger';
              case 'flail':
                return 'Flail';
              case 'spear':
                return 'Spear';
              case 'bow':
                return 'Bow';
              case 'crossbow':
                return 'Crossbow';
              case 'staff':
                return 'Staff';
              case 'quarterstaff':
                return 'Quarterstaff';
              case 'wand':
                return 'Wand';
              case 'sceptre':
                return 'Sceptre';
              default:
                return 'Weapon';
            }
          }
          return 'Weapon';
        case 'offhand':
          // For offhand, return the specific offhand type as item_class
          if (subtype) {
            switch (subtype) {
              case 'quiver':
                return 'Quiver';
              case 'focus':
                return 'Focus';
              case 'buckler':
                return 'Shield';
              case 'shield':
                return 'Shield';
              default:
                return 'Offhand';
            }
          }
          return 'Offhand';
        case 'ring':
          return 'Ring';
        case 'belt':
          return 'Belt';
        case 'amulet':
          return 'Amulet';
        case 'jewel':
          return 'Jewel';
        default:
          return null;
      }
    };

    // Get required attribute tags for armor pieces and shields
    const getRequiredAttributeTags = (
      slotName: string,
      armorSubtype?: string,
      shieldType?: string
    ) => {
      // Handle shield attribute tags
      if (slotName === 'offhand' && armorSubtype === 'buckler') {
        // Buckler always uses dex_armour
        return ['dex_armour'];
      }

      if (slotName === 'offhand' && armorSubtype === 'shield' && shieldType) {
        switch (shieldType) {
          case 'str':
            return ['str_armour'];
          case 'str/dex':
            return ['str_dex_armour'];
          case 'str/int':
            return ['str_int_armour'];
          default:
            return [];
        }
      }

      // Handle armor attribute tags
      if (
        !['helmet', 'body armour', 'gloves', 'boots'].includes(slotName) ||
        !armorSubtype
      ) {
        return [];
      }

      switch (armorSubtype) {
        case 'STR':
          return ['str_armour'];
        case 'DEX':
          return ['dex_armour'];
        case 'INT':
          return ['int_armour'];
        case 'STR/DEX':
          return ['str_dex_armour'];
        case 'STR/INT':
          return ['str_int_armour'];
        case 'DEX/INT':
          return ['dex_int_armour'];
        default:
          return [];
      }
    };

    const requiredItemClass = getRequiredItemClass(slotLower, subtype);
    const requiredAttributeTags = getRequiredAttributeTags(
      slotLower,
      subtype,
      shieldType
    );

    if (!requiredItemClass) {
      return { expert: [], advanced: [], novice: [] };
    }

    // Filter bases by item_class and attribute tags
    const filteredBases = bases.filter((base) => {
      if (base.active === 0) {
        return false;
      }

      if (base.item_class !== requiredItemClass) {
        return false;
      }

      // For armor pieces and shields, also check attribute tags
      if (requiredAttributeTags.length > 0) {
        const baseTags = base.item_tags ? base.item_tags.split(', ') : [];
        return requiredAttributeTags.every((tag) => baseTags.includes(tag));
      }

      // For other items (weapons, jewelry, etc.), just item_class is enough
      return true;
    });

    // For jewelry, return all bases in the 'expert' category (since we display them without tiers)
    if (['ring', 'belt', 'amulet', 'jewel'].includes(slotLower)) {
      return {
        expert: filteredBases.sort(
          (a, b) => (a.lvl_req ?? 0) - (b.lvl_req ?? 0)
        ),
        advanced: [],
        novice: [],
      };
    }

    // For non-jewelry, filter by tier tags in item_tags and sort by level requirement
    return {
      expert: filteredBases
        .filter((base) => base.item_tags && base.item_tags.includes('expert'))
        .sort((a, b) => (a.lvl_req ?? 0) - (b.lvl_req ?? 0)),
      advanced: filteredBases
        .filter((base) => base.item_tags && base.item_tags.includes('advanced'))
        .sort((a, b) => (a.lvl_req ?? 0) - (b.lvl_req ?? 0)),
      novice: filteredBases
        .filter((base) => base.item_tags && base.item_tags.includes('novice'))
        .sort((a, b) => (a.lvl_req ?? 0) - (b.lvl_req ?? 0)),
    };
  };

  const handleBaseTypeSelect = (baseType: string) => {
    setSelectedBaseType(baseType);
    completeSelection(
      selectedSlot!,
      selectedSubtype!,
      selectedShieldType || undefined,
      baseType
    );
  };

  const completeSelection = (
    slot: string,
    subtype: string,
    shieldType?: string,
    baseType?: string
  ) => {
    // Check if we should clear affixes when changing base types FIRST
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
      }
    }

    // Then set the new selection
    const newSelection = {
      slot,
      subtype,
      shieldType,
      baseType,
      ringSlot: activeSelection?.ringSlot,
    };

    setActiveSelection(newSelection);
    handleCloseMenu();
  };

  const handleCloseMenu = () => {
    setSelectedSlot(null);
    setSelectedSubtype(null);
    setSelectedShieldType(null);
    setSelectedBaseType(null);
  };

  const toggleTier = (tier: string) => {
    setExpandedTiers((prev) => ({
      expert: tier === 'expert' ? !prev.expert : false,
      advanced: tier === 'advanced' ? !prev.advanced : false,
      novice: tier === 'novice' ? !prev.novice : false,
    }));
  };

  // Add this helper function to get the appropriate image for a base
  const getBaseImage = (base: Base, slot: string, subtype?: string) => {
    const slotLower = slot.toLowerCase();

    //if (base.base_name) {
    //  return {
    //    src: `${base.base_name}.webp`,
    //    alt: base.base_name,
    //   className:
    //      'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
    //  };
    //}

    // For armor pieces, use the subtype
    if (
      ['helmet', 'body armour', 'gloves', 'boots'].includes(slotLower) &&
      subtype
    ) {
      const encodedSubtype = subtype.replace(/\//g, '%2F');
      return {
        src: `${slot} (${encodedSubtype}).webp`,
        alt: `${slot} (${subtype})`,
        className:
          'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
      };
    }

    // For weapons, use the subtype if available
    if (slotLower === 'weapon' && subtype) {
      return {
        src: `${subtype.replace(/_/g, ' ').replace(/\b\w/g, (l) => l.toUpperCase())}.webp`,
        alt: subtype,
        className:
          'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
      };
    }

    // For offhand items
    if (slotLower === 'offhand' && subtype) {
      if (subtype === 'shield' && selectedShieldType) {
        const encodedShieldType = selectedShieldType.replace(/\//g, '%2F');
        return {
          src: `Shield (${encodedShieldType.toUpperCase()}).webp`,
          alt: `${selectedShieldType} Shield`,
          className:
            'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
        };
      }
      return {
        src: `${subtype.replace(/\b\w/g, (l) => l.toUpperCase())}.webp`,
        alt: subtype,
        className:
          'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
      };
    }

    // For accessories
    if (['ring', 'belt', 'amulet', 'jewel'].includes(slotLower)) {
      return {
        src: `${base.base_name.toLowerCase().replace(/\s/g, '_')}.webp`,
        alt: base.base_name.toLowerCase().replace(/\s/g, '_'),
        className:
          'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
      };
    }

    return null;
  };

  const BaseItemSlot = ({
    base,
    slot,
    subtype,
    onClick,
  }: {
    base: Base;
    slot: string;
    subtype?: string;
    onClick: () => void;
  }) => {
    const baseImage = getBaseImage(base, slot, subtype);

    return (
      <div className='flex flex-col items-center'>
        <div
          className='relative inline-flex cursor-pointer flex-col items-center justify-center rounded bg-zinc-800 p-2 text-xs transition-colors hover:bg-zinc-700 sm:text-sm'
          onClick={onClick}
        >
          <div className='relative h-40 w-40'>
            {baseImage && (
              <img
                src={baseImage.src}
                alt={baseImage.alt}
                className='block h-full w-full object-contain'
                draggable={false}
              />
            )}
          </div>
        </div>
        <div className='mt-1 text-center'>
          <div className='text-xs font-medium text-white'>{base.base_name}</div>
          <div className='text-xs text-zinc-400'>
            {(base.lvl_req ?? 0) > 0 && `Lvl ${base.lvl_req ?? 0}`}
            {base.str_req ? ` • ${base.str_req} Str` : ''}
            {base.dex_req ? ` • ${base.dex_req} Dex` : ''}
            {base.int_req ? ` • ${base.int_req} Int` : ''}
            {/* Local values - defensive stats */}
            {(base.armour ?? 0) > 0 && (
              <div className='text-zinc-300'>Armour: {base.armour}</div>
            )}
            {(base.evasion ?? 0) > 0 && (
              <div className='text-zinc-300'>Evasion: {base.evasion}</div>
            )}
            {(base.energy_shield ?? 0) > 0 && (
              <div className='text-zinc-300'>
                Energy Shield: {base.energy_shield}
              </div>
            )}
            {/* Local values - weapon stats */}
            {base.physical_dmg && base.physical_dmg !== '0' && (
              <div className='text-zinc-300'>
                Physical Damage: {base.physical_dmg}
              </div>
            )}
            {base.crit_chance && base.crit_chance !== '0' && (
              <div className='text-zinc-300'>
                Critical Strike Chance: {base.crit_chance}
              </div>
            )}
            {base.aps && base.aps !== '0' && (
              <div className='text-zinc-300'>
                Attacks per Second: {base.aps}
              </div>
            )}
            {base.weapon_range && base.weapon_range !== '0' && (
              <div className='text-zinc-300'>
                Weapon Range: {base.weapon_range}
              </div>
            )}
            {/* Local values - shield stats */}
            {(base.block_chance ?? 0) > 0 && (
              <div className='text-zinc-300'>
                Chance to Block: {base.block_chance}%
              </div>
            )}
            {/* Implicit */}
            {base.implicit && (
              <div className='italic text-blue-300'>{base.implicit}</div>
            )}
          </div>
        </div>
      </div>
    );
  };

  const ItemSlot = ({
    name,
    className = '',
    ringSlot,
  }: {
    name: string;
    className?: string;
    ringSlot?: 'left' | 'right';
  }) => {
    const itemImage =
      activeSelection?.slot === name && activeSelection.baseType
        ? getBaseImage(
            bases.find((b) => b.base_name === activeSelection.baseType)!,
            name,
            activeSelection.subtype
          )
        : null;

    // For offhand slot, check if a two-handed weapon is selected
    const offhandImage =
      name === 'Offhand' &&
      activeSelection?.slot === 'Weapon' &&
      activeSelection.baseType &&
      bases
        .find((b) => b.base_name === activeSelection.baseType)
        ?.item_tags?.includes('two_hand')
        ? {
            src: `${activeSelection.baseType.toLowerCase().replace(/\s/g, '_')}.webp`,
            alt: activeSelection.baseType.toLowerCase().replace(/\s/g, '_'),
            className:
              'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain opacity-60',
          }
        : null;

    const jewelImage =
      name === 'Jewel' &&
      activeSelection?.slot === 'Jewel' &&
      activeSelection.baseType
        ? {
            src: `${activeSelection.baseType}Socket.png`,
            alt: activeSelection.baseType,
            className:
              'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
          }
        : null;

    const ringImage =
      name === 'Ring' &&
      activeSelection?.slot === 'Ring' &&
      activeSelection.baseType &&
      ringSlot === activeSelection.ringSlot
        ? {
            src: `${activeSelection.baseType.toLowerCase().replace(/\s/g, '_')}.webp`,
            alt: activeSelection.baseType.toLowerCase().replace(/\s/g, '_'),
            className:
              'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
          }
        : null;

    const mirrorRingImage =
      name === 'Ring' &&
      activeSelection?.slot === 'Ring' &&
      activeSelection.baseType &&
      ringSlot !== activeSelection.ringSlot
        ? {
            src:
              ringSlot === 'left'
                ? 'MirrorRing.webp'
                : 'MirrorRingFlipped.webp',
            alt: 'Mirror Ring',
            className:
              'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
          }
        : null;

    const displayImage =
      offhandImage || jewelImage || ringImage || mirrorRingImage || itemImage;

    return (
      <div className={`flex items-center justify-center ${className}`}>
        <div
          className={`relative inline-flex cursor-pointer flex-col items-center justify-center rounded border border-zinc-600 text-xs transition-colors sm:text-sm`}
          onClick={() => handleSlotClick(name, ringSlot)}
        >
          <div className='relative'>
            <img src={name + '.png'} alt={name} className='block' />
            {displayImage && (
              <img
                src={displayImage.src}
                alt={displayImage.alt}
                className={displayImage.className}
              />
            )}
          </div>
          <span
            className={`h-5 max-w-36 whitespace-nowrap text-center ${
              (name === 'Amulet' || name === 'Ring') &&
              (activeSelection?.slot === 'Amulet' ||
                activeSelection?.slot === 'Ring')
                ? 'text-xs'
                : 'text-sm'
            }`}
          >
            {activeSelection?.slot === name &&
            activeSelection.baseType &&
            (name !== 'Ring' || ringSlot === activeSelection.ringSlot)
              ? activeSelection.baseType
              : name}
          </span>
        </div>
      </div>
    );
  };

  // Add this helper function to generate a random value within the implicit range
  const generateImplicitValue = (
    base: Base
  ): { text: string; value: number | null } => {
    if (!base.implicit) return { text: '', value: null };

    // Check for decimal ranges first like (1.5-2.5) - must have at least one decimal
    const decimalRangeMatch = base.implicit.match(
      /\((\d+\.\d+)-(\d+(?:\.\d+)?)\)/
    );
    if (decimalRangeMatch) {
      const min = parseFloat(decimalRangeMatch[1]);
      const max = parseFloat(decimalRangeMatch[2]);
      const randomValue = Math.random() * (max - min) + min;
      const roundedValue = Math.floor(randomValue * 10) / 10;
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

  // Add this function to get matching affixes for the selected base
  const getMatchingAffixes = (baseType: string, itemLevel: number) => {
    if (!activeSelection?.baseType || !affixesData)
      return { prefixes: [], suffixes: [] };

    const selectedBase = bases.find((base) => base.base_name === baseType);
    if (!selectedBase) return { prefixes: [], suffixes: [] };

    const baseTags = selectedBase.item_tags
      ? selectedBase.item_tags.split(', ')
      : [];
    const baseClass = selectedBase.item_class;

    // Get item class mapping for affixes
    const getItemClassForAffixes = (itemClass: string) => {
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
          return 'one_hand_weapon';
        case 'Two Hand Axe':
        case 'Two Hand Mace':
        case 'Two Hand Sword':
        case 'Crossbow':
        case 'Staff':
        case 'Quarterstaff':
          return 'two_hand_weapon';
        case 'Bow':
          return 'bow';
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

    const itemTypeForAffixes = getItemClassForAffixes(baseClass);

    // Filter affixes that can spawn on this item type and level
    const applicableAffixes = affixesData.filter((affix) => {
      // Check if item level is sufficient
      const levelMatches = itemLevel >= affix.ilvl;
      if (!levelMatches) return false;

      // Check if item type matches
      const affixItemTypes = affix.item_tags.split(', ');

      const itemTypeMatches = affixItemTypes.some((type) => {
        // Direct item type match
        if (type === itemTypeForAffixes) return true;

        // Generic weapon match (for affixes that work on all weapons)
        if (
          type === 'weapon' &&
          ['one_hand_weapon', 'two_hand_weapon', 'bow'].includes(
            itemTypeForAffixes
          )
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

        if (
          ['helmet', 'body_armour', 'gloves', 'boots'].includes(
            itemTypeForAffixes
          )
        ) {
          const armorAttributeTags = baseTags.filter((tag) =>
            tag.includes('_armour')
          );
          // Check if this affix supports the armor attribute type
          if (armorAttributeTags.some((armorTag) => armorTag === type)) {
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
        const hasSpecificItemType = affixItemTypes.includes(itemTypeForAffixes);

        if (!hasSpecificItemType) {
          // If it doesn't include the specific item type, reject it
          return false;
        }

        // Also check that the armor attribute matches
        const armorAttributeTags = baseTags.filter((tag) =>
          tag.includes('_armour')
        );
        const hasMatchingDefensiveType = armorAttributeTags.some((baseTag) =>
          affixItemTypes.includes(baseTag)
        );

        // For defensive affixes, they must match the armor attribute requirements
        if (!hasMatchingDefensiveType) return false;
      }

      // For shields, always check shield-specific armor attribute tags
      if (itemTypeForAffixes.includes('shield')) {
        const requiredShieldTags = baseTags.filter((tag) =>
          tag.includes('_armour')
        );

        if (requiredShieldTags.length > 0) {
          const hasMatchingShieldAttribute = requiredShieldTags.some(
            (requiredTag) => affixItemTypes.includes(requiredTag)
          );

          if (!hasMatchingShieldAttribute) return false;
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

    // Sort each family group by tier (ilvl descending = highest tier first)
    Object.keys(prefixFamilyGroups).forEach((family) => {
      prefixFamilyGroups[family].sort((a, b) => {
        if (b.ilvl !== a.ilvl) {
          return b.ilvl - a.ilvl; // Higher tier first
        }
        return a.affix_name.localeCompare(b.affix_name);
      });
    });

    Object.keys(suffixFamilyGroups).forEach((family) => {
      suffixFamilyGroups[family].sort((a, b) => {
        if (b.ilvl !== a.ilvl) {
          return b.ilvl - a.ilvl; // Higher tier first
        }
        return a.affix_name.localeCompare(b.affix_name);
      });
    });

    // Create family objects with highest tier affix as the representative
    const prefixFamilies: AffixFamilyGroup[] = [];
    const suffixFamilies: AffixFamilyGroup[] = [];

    Object.entries(prefixFamilyGroups).forEach(([family, affixes]) => {
      const representative = affixes[0]; // Highest tier (first after sorting)
      const familyObj = { family, affixes, representative };
      prefixFamilies.push(familyObj);
    });

    Object.entries(suffixFamilyGroups).forEach(([family, affixes]) => {
      const representative = affixes[0]; // Highest tier (first after sorting)
      const familyObj = { family, affixes, representative };
      suffixFamilies.push(familyObj);
    });

    // Sort families by highest tier representative
    prefixFamilies.sort((a, b) => {
      if (b.representative.ilvl !== a.representative.ilvl) {
        return b.representative.ilvl - a.representative.ilvl;
      }
      return a.family.localeCompare(b.family);
    });

    suffixFamilies.sort((a, b) => {
      if (b.representative.ilvl !== a.representative.ilvl) {
        return b.representative.ilvl - a.representative.ilvl;
      }
      return a.family.localeCompare(b.family);
    });

    // Define custom sort order
    const getPriority = (family: string) => {
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

      return priorityMap[family] || 999;
    };

    // Sort families by priority
    prefixFamilies.sort((a, b) => {
      const priorityA = getPriority(a.family);
      const priorityB = getPriority(b.family);

      return priorityA - priorityB;
    });

    suffixFamilies.sort((a, b) => {
      const priorityA = getPriority(a.family);
      const priorityB = getPriority(b.family);

      return priorityA - priorityB;
    });

    return { prefixes: prefixFamilies, suffixes: suffixFamilies };
  };

  const toggleAffixFamily = (family: string) => {
    setExpandedAffixFamilies((prev) => ({
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

  const updateAffixValue = (
    type: 'prefix' | 'suffix',
    index: number,
    valueIndex: number,
    newValue: number
  ) => {
    setCraftedAffixes((prev) => {
      const newAffixes = { ...prev };
      if (type === 'prefix') {
        newAffixes.prefixes = [...prev.prefixes];
        if (newAffixes.prefixes[index]) {
          newAffixes.prefixes[index] = {
            ...newAffixes.prefixes[index],
            values: [...newAffixes.prefixes[index].values],
          };
          // Round decimal values to 2 decimal places
          const roundedValue = Number.isInteger(newValue)
            ? newValue
            : Math.round(newValue * 100) / 100;
          newAffixes.prefixes[index].values[valueIndex] = roundedValue;
        }
      } else {
        newAffixes.suffixes = [...prev.suffixes];
        if (newAffixes.suffixes[index]) {
          newAffixes.suffixes[index] = {
            ...newAffixes.suffixes[index],
            values: [...newAffixes.suffixes[index].values],
          };
          // Round decimal values to 2 decimal places
          const roundedValue = Number.isInteger(newValue)
            ? newValue
            : Math.round(newValue * 100) / 100;
          newAffixes.suffixes[index].values[valueIndex] = roundedValue;
        }
      }
      return newAffixes;
    });
  };

  const generateAffixValues = (affix: Affix): number[] => {
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

    // Collapse the family after adding the affix
    setExpandedAffixFamilies((prev) => ({
      ...prev,
      [affix.family]: false,
    }));
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

  // Update the getCraftedItemData function to handle the case better
  const getCraftedItemData = (): Item | null => {
    if (!activeSelection?.baseType) return null;

    const selectedBase = bases.find(
      (base) => base.base_name === activeSelection.baseType
    );
    if (!selectedBase) return null;

    // Build the item object with explicit property assignment
    const item: Item = {
      id: 0,
      item_name: 'Crafted Item',
      base_type: activeSelection.baseType,
      quality: itemQuality,
      ilvl: itemLevel,
      enchant: null,
      sockets: itemSockets,
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

    // Add prefixes using affix IDs and values
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

    // Add suffixes using affix IDs and values
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

  // Add these functions before the return statement

  const getValueRanges = (
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

  // Add this helper function to check if base types are compatible for affixes
  const areBaseTypesCompatible = (
    oldBaseType: string,
    newBaseType: string
  ): boolean => {
    const oldBase = bases.find((base) => base.base_name === oldBaseType);
    const newBase = bases.find((base) => base.base_name === newBaseType);

    if (!oldBase || !newBase) return false;

    // If different item classes, they're not compatible
    if (oldBase.item_class !== newBase.item_class) return false;

    // For weapons, they must be the exact same item class
    // This means Two Hand Mace != One Hand Mace, etc.
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

    if (weaponClasses.includes(oldBase.item_class)) {
      return oldBase.item_class === newBase.item_class;
    }

    // For armor pieces, check if they have the same attribute requirements
    if (
      ['Helmet', 'Body Armour', 'Gloves', 'Boots', 'Shield'].includes(
        oldBase.item_class
      )
    ) {
      const oldTags = oldBase.item_tags ? oldBase.item_tags.split(', ') : [];
      const newTags = newBase.item_tags ? newBase.item_tags.split(', ') : [];

      // Get armor attribute tags
      const oldArmorTags = oldTags.filter((tag) => tag.includes('_armour'));
      const newArmorTags = newTags.filter((tag) => tag.includes('_armour'));

      // Must have the same armor attribute tags
      if (oldArmorTags.length !== newArmorTags.length) return false;

      return oldArmorTags.every((tag) => newArmorTags.includes(tag));
    }

    // For jewelry and other items, they're compatible if same item class
    return oldBase.item_class === newBase.item_class;
  };

  // Add helper function to get used families
  const getUsedFamilies = () => {
    const usedPrefixFamilies = new Set(
      craftedAffixes.prefixes.map((affix) => affix.affix.family)
    );
    const usedSuffixFamilies = new Set(
      craftedAffixes.suffixes.map((affix) => affix.affix.family)
    );

    return { usedPrefixFamilies, usedSuffixFamilies };
  };

  React.useEffect(() => {
    if (activeSelection?.baseType) {
      const base = bases.find((b) => b.base_name === activeSelection.baseType);
      if (base?.implicit) {
        setImplicitResult(generateImplicitValue(base));
      } else {
        setImplicitResult({ text: '', value: null });
      }
    } else {
      setImplicitResult({ text: '', value: null });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [activeSelection?.baseType]);

  React.useEffect(() => {
    if (!activeOrb) return;

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
  }, [activeOrb]);

  React.useEffect(() => {
    if (!activeOrb) return;

    let ignore = true;
    const handleGlobalClick = () => {
      if (ignore) {
        ignore = false;
        return;
      }
      setActiveOrb(null);
    };

    window.addEventListener('click', handleGlobalClick);

    return () => {
      window.removeEventListener('click', handleGlobalClick);
    };
  }, [activeOrb]);

  const handleTransmutationOrbUse = () => {
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (!activeSelection?.baseType) return;
    const affixes = getMatchingAffixes(activeSelection.baseType, itemLevel);
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
        const randomFamily =
          availableFamilies[
            Math.floor(Math.random() * availableFamilies.length)
          ];
        const randomAffix =
          randomFamily.affixes[
            Math.floor(Math.random() * randomFamily.affixes.length)
          ];
        const values = generateAffixValues(randomAffix);
        const uniqueId = `${randomAffix.id}-${Date.now()}-${Math.random()}`;
        newSuffixes = [{ affix: randomAffix, values, id: uniqueId }];
      }
    } else if (fracturedSuffix) {
      newSuffixes = [fracturedSuffix];
      // Roll a random prefix
      const availableFamilies = affixes.prefixes;
      if (availableFamilies.length > 0) {
        const randomFamily =
          availableFamilies[
            Math.floor(Math.random() * availableFamilies.length)
          ];
        const randomAffix =
          randomFamily.affixes[
            Math.floor(Math.random() * randomFamily.affixes.length)
          ];
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
      const randomFamily =
        availableFamilies[Math.floor(Math.random() * availableFamilies.length)];
      const randomAffix =
        randomFamily.affixes[
          Math.floor(Math.random() * randomFamily.affixes.length)
        ];
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
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (!activeSelection?.baseType) return;
    if (itemRarity !== 'magic') return; // Only works on magic items

    // Determine which type to add
    const hasPrefix = craftedAffixes.prefixes.length > 0;
    const hasSuffix = craftedAffixes.suffixes.length > 0;

    if (hasPrefix && hasSuffix) return;

    const affixes = getMatchingAffixes(activeSelection.baseType, itemLevel);

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

    // Pick a random family and affix
    const randomFamily =
      availableFamilies[Math.floor(Math.random() * availableFamilies.length)];
    const randomAffix =
      randomFamily.affixes[
        Math.floor(Math.random() * randomFamily.affixes.length)
      ];
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
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (!activeSelection?.baseType) return;
    if (itemRarity !== 'magic') return; // Only works on magic items

    const affixes = getMatchingAffixes(activeSelection.baseType, itemLevel);

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
          const families = affixes.prefixes;
          if (families.length > 0) {
            const randomFamily =
              families[Math.floor(Math.random() * families.length)];
            const randomAffix =
              randomFamily.affixes[
                Math.floor(Math.random() * randomFamily.affixes.length)
              ];
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
          const families = affixes.suffixes;
          if (families.length > 0) {
            const randomFamily =
              families[Math.floor(Math.random() * families.length)];
            const randomAffix =
              randomFamily.affixes[
                Math.floor(Math.random() * randomFamily.affixes.length)
              ];
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
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (!activeSelection?.baseType) return;
    if (itemRarity !== 'magic') return; // Only works on magic items

    const affixes = getMatchingAffixes(activeSelection.baseType, itemLevel);

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

    // Pick a random family and affix
    const randomFamily =
      availableFamilies[Math.floor(Math.random() * availableFamilies.length)];
    const randomAffix =
      randomFamily.affixes[
        Math.floor(Math.random() * randomFamily.affixes.length)
      ];
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

  const handleChaosOrbUse = () => {
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (!activeSelection?.baseType) return;
    const affixes = getMatchingAffixes(activeSelection.baseType, itemLevel);

    let removeType: 'prefixes' | 'suffixes' =
      Math.random() < 0.5 ? 'prefixes' : 'suffixes';
    // Only consider non-fractured affixes for removal
    let candidates = craftedAffixes[removeType].filter(
      (a) => a.affix.id !== fracturedAffixId
    );
    if (candidates.length === 0) {
      removeType = removeType === 'prefixes' ? 'suffixes' : 'prefixes';
      candidates = craftedAffixes[removeType].filter(
        (a) => a.affix.id !== fracturedAffixId
      );
      if (candidates.length === 0) return;
    }

    setCraftedAffixes((prev) => {
      let current = { ...prev };
      if (current[removeType].length === 0) return prev;

      // Only remove non-fractured affixes (by affix definition id)
      const removable = current[removeType].filter(
        (a) => a.affix.id !== fracturedAffixId
      );
      if (removable.length === 0) return prev;

      // Pick a random removable affix (by unique id)
      const toRemove = removable[Math.floor(Math.random() * removable.length)];
      const removeIdx = current[removeType].findIndex(
        (a) => a.id === toRemove.id
      );
      const removedAffix = current[removeType][removeIdx];
      current[removeType] = current[removeType].filter(
        (_, i) => i !== removeIdx
      );

      let addType: 'prefixes' | 'suffixes';
      if (current.prefixes.length === 3) {
        addType = 'suffixes';
      } else if (current.suffixes.length === 3) {
        addType = 'prefixes';
      } else {
        addType = Math.random() < 0.5 ? 'prefixes' : 'suffixes';
      }

      let addedAffix: Affix | null = null;
      if (current[addType].length < 3) {
        const availableFamilies = affixes[addType].filter(
          (fam) => !current[addType].some((a) => a.affix.family === fam.family)
        );
        if (availableFamilies.length > 0) {
          const randomFamily =
            availableFamilies[
              Math.floor(Math.random() * availableFamilies.length)
            ];
          const randomAffix =
            randomFamily.affixes[
              Math.floor(Math.random() * randomFamily.affixes.length)
            ];
          const values = generateAffixValues(randomAffix);
          const uniqueId = `${randomAffix.id}-${Date.now()}-${Math.random()}`;
          current[addType] = [
            ...current[addType],
            { affix: randomAffix, values, id: uniqueId },
          ];
          addedAffix = randomAffix;
        }
        setAffixLog((prevLog) => [
          `Chaos Orb - Removed 1 ${removeType.slice(0, -2)} and Added 1 ${addType.slice(0, -2)}`,
          ...(addedAffix
            ? [`Added ${addType.slice(0, -2)}: ${addedAffix.affix_name}`]
            : []),
          `Removed ${removeType.slice(0, -2)}: ${removedAffix.affix.affix_name}`,
          ...prevLog,
        ]);
      }
      return current;
    });
  };

  const handleAlchemyOrbUse = () => {
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (!activeSelection?.baseType) return;
    const affixes = getMatchingAffixes(activeSelection.baseType, itemLevel);
    setItemRarity('rare');

    // Decide random split: 3/1, 2/2, or 1/3
    const splits: Array<[number, number]> = [
      [3, 1],
      [2, 2],
      [1, 3],
    ];
    const [prefixCount, suffixCount] =
      splits[Math.floor(Math.random() * splits.length)];

    // Pick random families and affixes
    function pickRandomAffixes(families: AffixFamilyGroup[], count: number) {
      const picked: Array<{ affix: Affix; values: number[]; id: string }> = [];
      const usedFamilies = new Set<string>();
      const availableFamilies = [...families];
      while (picked.length < count && availableFamilies.length > 0) {
        const idx = Math.floor(Math.random() * availableFamilies.length);
        const fam = availableFamilies.splice(idx, 1)[0];
        if (!usedFamilies.has(fam.family)) {
          const affix =
            fam.affixes[Math.floor(Math.random() * fam.affixes.length)];
          picked.push({
            affix,
            values: generateAffixValues(affix),
            id: `${affix.id}-${Date.now()}-${Math.random()}`,
          });
          usedFamilies.add(fam.family);
        }
      }
      return picked;
    }

    const newPrefixes = pickRandomAffixes(affixes.prefixes, prefixCount);
    const newSuffixes = pickRandomAffixes(affixes.suffixes, suffixCount);

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
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (!activeSelection?.baseType) return;
    if (itemRarity !== 'rare') return; // Only works on rare items

    if (craftedAffixes.prefixes.length + craftedAffixes.suffixes.length === 6) {
      setActiveOrb('');
    }

    const affixes = getMatchingAffixes(activeSelection.baseType, itemLevel);

    // Determine which type(s) can be added (max 3 of each)
    const canAddPrefix = craftedAffixes.prefixes.length < 3;
    const canAddSuffix = craftedAffixes.suffixes.length < 3;

    if (!canAddPrefix && !canAddSuffix) return; // No room for more affixes

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
    const randomFamily =
      availableFamilies[Math.floor(Math.random() * availableFamilies.length)];
    const randomAffix =
      randomFamily.affixes[
        Math.floor(Math.random() * randomFamily.affixes.length)
      ];
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
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (!activeSelection?.baseType) return;

    // Reroll implicit value
    const base = bases.find((b) => b.base_name === activeSelection.baseType);
    if (base?.implicit) {
      setImplicitResult(generateImplicitValue(base));
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
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (!activeSelection?.baseType) return;
    if (itemRarity !== 'magic' && itemRarity !== 'rare') return;

    if (craftedAffixes.prefixes.length + craftedAffixes.suffixes.length === 0) {
      setActiveOrb('');
    }

    // Gather all affixes
    const allAffixes = [
      ...craftedAffixes.prefixes
        .filter((a) => a.affix.id !== fracturedAffixId)
        .map((a) => ({ ...a, type: 'prefix' })),
      ...craftedAffixes.suffixes
        .filter((a) => a.affix.id !== fracturedAffixId)
        .map((a) => ({ ...a, type: 'suffix' })),
    ];

    if (allAffixes.length === 0) return;

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

  const handleVaalOrbUse = () => {
    const roll = CorruptionOmen
      ? Math.floor(Math.random() * 3)
      : Math.floor(Math.random() * 4);

    if (roll === 0) {
      // Use chaos orb twice
      handleChaosOrbUse();
      handleChaosOrbUse();
      setItemCorruption(1);
      setTimeout(() => {
        setAffixLog((prevLog) => [
          'Vaal Orb - Corrupted Item',
          'Vaal Orb - Double Chaos',
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
      const notAllowedClasses = [
        'Amulet',
        'Ring',
        'Belt',
        'Jewel',
        'Quiver',
        'Focus',
      ];
      if (base && !notAllowedClasses.includes(base.item_class)) {
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
      setAffixLog((prevLog) => [
        'Vaal Orb - Corrupted Item',
        'Vaal Orb - Enchantment Added',
        ...prevLog,
      ]);
      setActiveOrb('');
      return;
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
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (!activeSelection?.baseType) return;

    // Find the selected base
    const base = bases.find((b) => b.base_name === activeSelection.baseType);
    if (!base) return;

    // Only allow on weapons, but not sceptre, staff, or wand
    const weaponTypes = [
      'Axe',
      'Two Hand Axe',
      'Mace',
      'Two Hand Mace',
      'Sword',
      'Two Hand Sword',
      'Claw',
      'Dagger',
      'Flail',
      'Spear',
      'Bow',
      'Crossbow',
      'Quarterstaff',
    ];
    if (!weaponTypes.includes(base.item_class)) return;
    setItemQuality(20);
    setActiveOrb('');
  };

  const handleScrapUse = () => {
    if (itemCorruption) {
      setActiveOrb('');
      return;
    }
    if (!activeSelection?.baseType) return;

    // Find the selected base
    const base = bases.find((b) => b.base_name === activeSelection.baseType);
    if (!base) return;

    // Only allow on armour
    const armourTypes = ['Helmet', 'Body Armour', 'Gloves', 'Boots', 'Shield'];
    if (!armourTypes.includes(base.item_class)) return;
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
      'Shield',
    ];

    const isWeapon = weaponClasses.includes(base.item_class);
    const isArmour = armourClasses.includes(base.item_class);

    if (!isWeapon && !isArmour) return;

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
    // Only usable on corrupted rare items
    if (!activeSelection?.baseType) {
      setActiveOrb('');
      return;
    }
    if (itemCorruption !== 1 || itemRarity !== 'rare') {
      setActiveOrb('');
      return;
    }

    // Helper to get all affixes for this base and ilvl
    const affixes = getMatchingAffixes(activeSelection.baseType, itemLevel);

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

  const orbHandlers: Record<string, () => void> = {
    transmutation: handleTransmutationOrbUse,
    augmentation: handleAugmentationOrbUse,
    alteration: handleAlterationOrbUse,
    regal: handleRegalOrbUse,
    chaos: handleChaosOrbUse,
    alchemy: handleAlchemyOrbUse,
    exalted: handleExaltedOrbUse,
    divine: handleDivineOrbUse,
    annulment: handleAnnulmentOrbUse,
    vaal: handleVaalOrbUse,
    whetstone: handleWhetstoneUse,
    scrap: handleScrapUse,
    artificer: handleArtificerUse,
    scouring: handleScouringOrbUse,
    fracturing: handleFracturingOrbUse,
    teardrop: handleTeardropUse,
  };

  return (
    <>
      {activeOrb == 'transmutation' && (
        <img
          src='Transmutation Orb.png'
          alt='Transmutation Orb'
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
      {activeOrb == 'augmentation' && (
        <img
          src='Augmentation Orb.png'
          alt='Augmentation Orb'
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
      {activeOrb == 'alteration' && (
        <img
          src='Alteration Orb.png'
          alt='Alteration Orb'
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
      {activeOrb == 'regal' && (
        <img
          src='Regal Orb.png'
          alt='Regal Orb'
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
      {activeOrb == 'chaos' && (
        <img
          src='Chaos Orb.png'
          alt='Chaos Orb'
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
      {activeOrb == 'alchemy' && (
        <img
          src='Alchemy Orb.png'
          alt='Alchemy Orb'
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
      {activeOrb == 'exalted' && (
        <img
          src='Exalted Orb.png'
          alt='Exalted Orb'
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
      {activeOrb == 'divine' && (
        <img
          src='Divine Orb.png'
          alt='Divine Orb'
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
      {activeOrb == 'annulment' && (
        <img
          src='Annulment Orb.png'
          alt='Annulment Orb'
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
      {activeOrb == 'vaal' && (
        <img
          src='Vaal Orb.png'
          alt='Vaal Orb'
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
      {activeOrb == 'whetstone' && (
        <img
          src='Whetstone.png'
          alt='Whetstone'
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
      {activeOrb == 'scrap' && (
        <img
          src='Scrap.png'
          alt='Scrap'
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
      {activeOrb == 'artificer' && (
        <img
          src='Artificer.png'
          alt='Artificer'
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
      {activeOrb == 'scouring' && (
        <img
          src='Scouring Orb.png'
          alt='Scouring Orb'
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
      {activeOrb == 'fracturing' && (
        <img
          src='Fracturing Orb.png'
          alt='Fracturing Orb'
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
      {activeOrb == 'teardrop' && (
        <img
          src='Teardrop.png'
          alt='Teardrop'
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
      <div className='flex min-h-screen w-screen flex-col items-center justify-center bg-zinc-700 p-4 text-center text-neutral-300 sm:p-8'>
        <div className='w-full max-w-md rounded-lg bg-zinc-900 bg-opacity-80 shadow-2xl sm:max-w-lg md:max-w-2xl lg:max-w-4xl xl:max-w-5xl'>
          <div className='mx-auto mb-6 grid auto-rows-auto grid-cols-[repeat(5,max-content)] grid-rows-4 items-center justify-center gap-1'>
            {/* ItemSlots */}
            <ItemSlot name='Jewel' className='col-start-3 row-start-1' />
            <ItemSlot
              name='Weapon'
              className='col-span-2 col-start-1 row-span-4 row-start-1 mr-[92px] mt-8'
            />
            <ItemSlot
              name='Offhand'
              className='col-start-5 row-span-4 row-start-1 -ml-16 mt-8'
            />
            <ItemSlot
              name='Helmet'
              className='col-start-3 row-span-3 row-start-1'
            />
            <ItemSlot
              name='Body Armour'
              className='col-start-3 row-span-12 row-start-2 mt-9'
            />
            <ItemSlot
              name='Amulet'
              className='col-start-4 row-span-2 row-start-2 mr-16 mt-7'
            />
            <ItemSlot
              name='Ring'
              className='col-start-2 row-span-2 row-start-3 mb-28 ml-16'
              ringSlot='left'
            />
            <ItemSlot
              name='Ring'
              className='col-start-4 row-span-2 row-start-3 mb-28 mr-16'
              ringSlot='right'
            />
            <ItemSlot name='Gloves' className='col-start-2 row-start-4' />
            <ItemSlot
              name='Belt'
              className='col-start-3 row-span-12 row-start-4 mt-7'
            />
            <ItemSlot name='Boots' className='col-start-4 row-start-4' />
          </div>
        </div>

        {/* Modal for subtype selection */}
        {selectedSlot && (
          <div className='fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50 p-4'>
            <div className='h-[90vh] w-[90vw] max-w-6xl overflow-y-auto rounded-lg bg-zinc-800 p-8'>
              <div className='mb-6 flex items-center justify-between'>
                <h2 className='text-2xl font-bold'>{selectedSlot}</h2>
                <button
                  onClick={handleCloseMenu}
                  className='text-2xl text-neutral-400 hover:text-white'
                >
                  ✕
                </button>
              </div>

              {needsSubtypeSelection(selectedSlot) ? (
                !selectedSubtype ? (
                  <div>
                    <h3 className='mb-4 text-xl'>Select Type:</h3>
                    <div
                      className={`grid gap-4 ${
                        ['helmet', 'body armour', 'gloves', 'boots'].includes(
                          selectedSlot.toLowerCase()
                        )
                          ? 'grid-cols-3'
                          : 'grid-cols-2'
                      }`}
                    >
                      {getSubtypeOptions(selectedSlot).map((type) => (
                        <button
                          key={type}
                          onClick={() => handleSubtypeSelect(type)}
                          className='rounded bg-zinc-700 p-4 text-base transition-colors hover:bg-zinc-600'
                        >
                          {type
                            .replace(/_/g, ' ')
                            .replace(/\b\w/g, (l) => l.toUpperCase())}
                        </button>
                      ))}
                    </div>
                  </div>
                ) : selectedSubtype === 'shield' && !selectedShieldType ? (
                  <div>
                    <div className='mb-6'>
                      <button
                        onClick={() => setSelectedSubtype(null)}
                        className='text-base text-blue-400 hover:text-blue-300'
                      >
                        ← Back
                      </button>
                    </div>
                    <h3 className='mb-4 text-xl'>Select Shield Type:</h3>
                    <div className='grid grid-cols-3 gap-4'>
                      {shield_types.map((type) => (
                        <button
                          key={type}
                          onClick={() => handleShieldTypeSelect(type)}
                          className='rounded bg-zinc-700 p-4 text-base transition-colors hover:bg-zinc-600'
                        >
                          {type
                            .replace(/_/g, ' ')
                            .replace(/\b\w/g, (l) => l.toUpperCase())}
                        </button>
                      ))}
                    </div>
                  </div>
                ) : !selectedBaseType ? (
                  <div>
                    <div className='mb-6'>
                      <button
                        onClick={() => {
                          if (selectedSubtype === 'shield') {
                            setSelectedShieldType(null);
                          } else {
                            setSelectedSubtype(null);
                          }
                        }}
                        className='text-base text-blue-400 hover:text-blue-300'
                      >
                        ← Back
                      </button>
                    </div>
                    <h3 className='mb-4 text-xl'>Select Base Type:</h3>
                    <div className='space-y-4'>
                      {(['expert', 'advanced', 'novice'] as const).map(
                        (tier) => {
                          const tierBases = getBaseTypes(
                            selectedSlot,
                            selectedSubtype,
                            selectedShieldType || undefined
                          )[tier];
                          if (tierBases.length === 0) return null;

                          return (
                            <div
                              key={tier}
                              className='rounded border border-zinc-600'
                            >
                              <button
                                onClick={() => toggleTier(tier)}
                                className='flex w-full items-center justify-between p-4 text-left text-base font-medium capitalize transition-colors hover:bg-zinc-700'
                              >
                                <span
                                  className={
                                    tier === 'expert'
                                      ? 'text-red-400'
                                      : tier === 'advanced'
                                        ? 'text-yellow-400'
                                        : 'text-green-400'
                                  }
                                >
                                  {tier} ({tierBases.length})
                                </span>
                                <span
                                  className={`transform transition-transform ${expandedTiers[tier] ? 'rotate-90' : ''}`}
                                >
                                  ▶
                                </span>
                              </button>
                              {expandedTiers[tier] && (
                                <div className='border-t border-zinc-600 p-6'>
                                  <div className='grid grid-cols-4 gap-6 lg:grid-cols-6'>
                                    {tierBases.map((base) => (
                                      <BaseItemSlot
                                        key={base.base_name}
                                        base={base}
                                        slot={selectedSlot}
                                        subtype={selectedSubtype || undefined}
                                        onClick={() =>
                                          handleBaseTypeSelect(base.base_name)
                                        }
                                      />
                                    ))}
                                  </div>
                                </div>
                              )}
                            </div>
                          );
                        }
                      )}
                    </div>

                    {/* Item Level Input - appears below the tier sections */}
                    <div className='mt-6 rounded-lg bg-zinc-700 p-4'>
                      <div className='flex items-center justify-center gap-4'>
                        <label
                          htmlFor='item-level'
                          className='font-medium text-white'
                        >
                          Item Level:
                        </label>
                        <input
                          id='item-level'
                          type='number'
                          min='1'
                          max='100'
                          value={itemLevel}
                          onChange={(e) =>
                            setItemLevel(parseInt(e.target.value) || 81)
                          }
                          className='w-20 rounded border border-zinc-500 bg-zinc-600 px-3 py-1 text-white focus:border-blue-400 focus:outline-none'
                        />
                      </div>
                    </div>
                  </div>
                ) : null
              ) : (
                // Handle slots that don't need subtype selection (ring, belt, amulet, jewel)
                <div>
                  <h3 className='mb-4 text-xl'>Select Base Type:</h3>
                  <div className='p-6'>
                    <div className='grid grid-cols-4 gap-6 lg:grid-cols-6'>
                      {getBaseTypes(selectedSlot)
                        .expert.concat(getBaseTypes(selectedSlot).advanced)
                        .concat(getBaseTypes(selectedSlot).novice)
                        .map((base) => (
                          <BaseItemSlot
                            key={base.base_name}
                            base={base}
                            slot={selectedSlot}
                            onClick={() => {
                              setSelectedBaseType(base.base_name);
                              completeSelection(
                                selectedSlot,
                                selectedSlot.toLowerCase(),
                                undefined,
                                base.base_name
                              );
                            }}
                          />
                        ))}
                    </div>
                  </div>

                  {/* Item Level Input - also appears for jewelry */}
                  <div className='mx-6 mb-4 rounded-lg bg-zinc-700 p-4'>
                    <div className='flex items-center justify-center gap-4'>
                      <label
                        htmlFor='item-level-jewelry'
                        className='font-medium text-white'
                      >
                        Item Level:
                      </label>
                      <input
                        id='item-level-jewelry'
                        type='number'
                        min='1'
                        max='100'
                        value={itemLevel}
                        onChange={(e) =>
                          setItemLevel(parseInt(e.target.value) || 81)
                        }
                        className='w-20 rounded border border-zinc-500 bg-zinc-600 px-3 py-1 text-white focus:border-blue-400 focus:outline-none'
                      />
                    </div>
                  </div>
                </div>
              )}
            </div>
          </div>
        )}

        {/* ItemDisplay and Affixes section */}
        <div className='mt-8 flex w-full max-w-7xl flex-col items-center gap-8'>
          {/* ItemDisplay section */}
          <div className='rounded-lg bg-zinc-800 p-4'>
            <div className='relative mb-4 flex h-10 items-center justify-center'>
              <h3 className='absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 text-lg font-bold text-white'>
                Crafting
              </h3>
              {(craftedAffixes.prefixes.length > 0 ||
                craftedAffixes.suffixes.length > 0 ||
                itemCorruption) && (
                <button
                  onClick={() => {
                    setCraftedAffixes({ prefixes: [], suffixes: [] });
                    setAffixLog([]);
                    setItemRarity('normal');
                    setItemQuality(0);
                    setItemSockets(0);
                    setItemCorruption(0);
                    setFracturedAffixId(null);
                  }}
                  className='absolute right-0 top-1/2 flex -translate-y-1/2 gap-2 rounded border border-zinc-500 px-1 py-1 text-sm text-white transition-colors hover:bg-zinc-200 hover:text-zinc-900'
                >
                  Clear Crafting
                  <img
                    src='Scouring Orb.png'
                    alt='Scouring Orb'
                    className='h-5 w-5'
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
                      cursor: activeOrb ? 'pointer' : 'default',
                    }}
                    onClick={(e) => {
                      e.stopPropagation();
                      if (activeOrb && orbHandlers[activeOrb]) {
                        orbHandlers[activeOrb]();
                      }
                    }}
                  >
                    <ItemDisplay
                      key={`${activeSelection.baseType}-${craftedAffixes.prefixes.length}-${craftedAffixes.suffixes.length}`}
                      item={getCraftedItemData()!}
                      bases={bases.map((base) =>
                        base.base_name === activeSelection.baseType
                          ? { ...base, implicit: implicitResult.text }
                          : base
                      )}
                      affixes={affixesData}
                      rarity={itemRarity}
                      fracturedAffixId={fracturedAffixId}
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
                        src='Ultimatum.webp'
                        alt='Ultimatum'
                        className='h-full w-full object-contain'
                        draggable={false}
                      />
                    </div>
                  </div>
                )}
              </div>
              <div className='relative flex h-[177px] min-h-[100px] w-[422px] min-w-[200px] items-center justify-center bg-zinc-900 lg:h-[354px] lg:w-[845px]'>
                <img
                  src='Transmutation Orb.png'
                  alt='Transmutation Orb'
                  className='absolute left-0.5 top-0.5 z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('transmutation');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Augmentation Orb.png'
                  alt='Augmentation Orb'
                  className='absolute left-0.5 top-[72px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('augmentation');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Alteration Orb.png'
                  alt='Alteration Orb'
                  className='absolute left-0.5 top-[144px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('alteration');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Regal Orb.png'
                  alt='Regal Orb'
                  className='absolute bottom-[69px] left-0.5 z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('regal');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Chaos Orb.png'
                  alt='Chaos Orb'
                  className='absolute bottom-0 left-0.5 z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('chaos');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Alchemy Orb.png'
                  alt='Alchemy Orb'
                  className='absolute left-[71px] top-0.5 z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('alchemy');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Exalted Orb.png'
                  alt='Exalted Orb'
                  className='absolute left-[71px] top-[72px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('exalted');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Divine Orb.png'
                  alt='Divine Orb'
                  className='absolute left-[71px] top-[144px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('divine');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Annulment Orb.png'
                  alt='Annulment Orb'
                  className='absolute bottom-[69px] left-[71px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('annulment');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Vaal Orb.png'
                  alt='Vaal Orb'
                  className='absolute bottom-0 left-[71px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('vaal');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Whetstone.png'
                  alt='Blacksmith Whetstone'
                  className='absolute left-[142px] top-0.5 z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('whetstone');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Scrap.png'
                  alt='Armourer Scrap'
                  className='absolute left-[142px] top-[72px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('scrap');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Artificer.png'
                  alt='Artificer Orb'
                  className='absolute left-[142px] top-[142px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('artificer');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Scouring Orb.png'
                  alt='Scouring Orb'
                  className='absolute bottom-[71px] left-[142px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('scouring');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Corruption Omen.png'
                  alt='Corruption Omen'
                  className={`absolute bottom-0 left-[142px] z-10 h-[71px] w-[71px] ${CorruptionOmen ? ' border border-red-500' : ''}`}
                  onClick={(e) => {
                    setCorruptionOmen(CorruptionOmen === 1 ? 0 : 1);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Fracturing Orb.png'
                  alt='Fracturing Orb'
                  className='absolute left-[213px] top-0.5 z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('fracturing');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Teardrop.png'
                  alt='Teardrop'
                  className='absolute left-[213px] top-[72px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    setActiveOrb('teardrop');
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Whittling Omen.png'
                  alt='Whittling Omen'
                  className='absolute left-[213px] top-[144px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setWhittlingOmenActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Sinistral Erasure Omen.png'
                  alt='Sinistral Erasure Omen'
                  className='absolute bottom-[69px] left-[213px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setSinistralErasureOmenActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Dextral Erasure Omen.png'
                  alt='Dextral Erasure Omen'
                  className='absolute bottom-0 left-[213px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setDextralErasureOmenActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Body Essence.png'
                  alt='Body Essence'
                  className='absolute left-[284px] top-0.5 z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setBodyEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Torment Essence.png'
                  alt='Torment Essence'
                  className='absolute left-[284px] top-[72px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setTormentEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Mind Essence.png'
                  alt='Mind Essence'
                  className='absolute left-[284px] top-[144px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setMindEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Sinistral Annulment Omen.png'
                  alt='Sinistral Annulment Omen'
                  className='absolute bottom-[69px] left-[284px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setSinistralAnnulmentOmenActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Dextral Annulment Omen.png'
                  alt='Dextral Annulment Omen'
                  className='absolute bottom-0 left-[284px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setDextralAnnulmentOmenActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Electricity Essence.png'
                  alt='Electricity Essence'
                  className='absolute left-[355px] top-0.5 z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setElectricityEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Flames Essence.png'
                  alt='Flames Essence'
                  className='absolute left-[355px] top-[72px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setFlamesEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Ruin Essence.png'
                  alt='Ruin Essence'
                  className='absolute left-[355px] top-[144px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setRuinEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Enhancement Essence.png'
                  alt='Enhancement Essence'
                  className='absolute left-[426px] top-0.5 z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setEnhancementEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Ice Essence.png'
                  alt='Ice Essence'
                  className='absolute left-[426px] top-[72px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setIceEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Battle Essence.png'
                  alt='Battle Essence'
                  className='absolute left-[426px] top-[144px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setBattleEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Infinite Essence.png'
                  alt='Infinite Essence'
                  className='absolute left-[497px] top-0.5 z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setInfiniteEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Haste Essence.png'
                  alt='Haste Essence'
                  className='absolute left-[497px] top-[72px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setHasteEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Sorcery Essence.png'
                  alt='Sorcery Essence'
                  className='absolute left-[497px] top-[144px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setSorceryEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Greater Body Essence.png'
                  alt='Greater Body Essence'
                  className='absolute left-[565px] top-0.5 z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setGreaterBodyEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Greater Torment Essence.png'
                  alt='Greater Torment Essence'
                  className='absolute left-[565px] top-[72px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setGreaterTormentEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Greater Mind Essence.png'
                  alt='Greater Mind Essence'
                  className='absolute left-[565px] top-[144px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setGreaterMindEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Greater Electricity Essence.png'
                  alt='Greater Electricity Essence'
                  className='absolute left-[635px] top-0.5 z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setGreaterElectricityEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Greater Flames Essence.png'
                  alt='Greater Flames Essence'
                  className='absolute left-[635px] top-[72px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setGreater FlamesEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Greater Ruin Essence.png'
                  alt='Greater Ruin Essence'
                  className='absolute left-[635px] top-[144px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setGreaterRuinEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Greater Enhancement Essence.png'
                  alt='Greater Enhancement Essence'
                  className='absolute left-[705px] top-0.5 z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setGreaterEnhancementEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Greater Ice Essence.png'
                  alt='Greater Ice Essence'
                  className='absolute left-[705px] top-[72px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setGreaterIceEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Greater Battle Essence.png'
                  alt='Greater Battle Essence'
                  className='absolute left-[705px] top-[144px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setGreaterBattleEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Greater Infinite Essence.png'
                  alt='Greater Infinite Essence'
                  className='absolute left-[775px] top-0.5 z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setGreaterInfiniteEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Greater Haste Essence.png'
                  alt='Greater Haste Essence'
                  className='absolute left-[775px] top-[72px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setGreaterHasteEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Greater Sorcery Essence.png'
                  alt='Greater Sorcery Essence'
                  className='absolute left-[775px] top-[144px] z-10 h-[71px] w-[71px]'
                  onClick={(e) => {
                    //setGreaterSorceryEssenceActive(true);
                    setCursorPos({ x: e.clientX, y: e.clientY });
                  }}
                  draggable={false}
                />
                <img
                  src='Inventory.png'
                  alt='Inventory'
                  className='max-h-full max-w-full object-contain'
                  width={845}
                  height={354}
                  draggable={false}
                />
              </div>
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
                    Prefixes ({craftedAffixes.prefixes.length}/3)
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
                              </div>
                              <div className='text-xs text-blue-300'>
                                {craftedAffix.affix.effect}
                              </div>
                            </div>
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
                                src='Annulment Orb.png'
                                alt='Remove Prefix'
                                className='h-8 w-8'
                              ></img>
                            </button>
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
                    Suffixes ({craftedAffixes.suffixes.length}/3)
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
                              </div>
                              <div className='text-xs text-yellow-300'>
                                {craftedAffix.affix.effect}
                              </div>
                            </div>
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
                                src='Annulment Orb.png'
                                alt='Remove Suffix'
                                className='h-8 w-8'
                              ></img>
                            </button>
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
                  let orbImg = 'Chaos Orb.png';

                  // If this entry is a roll summary, set orbImg accordingly
                  switch (true) {
                    case entry.startsWith('Transmutation Orb'):
                      orbImg = 'Transmutation Orb.png';
                      break;
                    case entry.startsWith('Augmentation Orb'):
                      orbImg = 'Augmentation Orb.png';
                      break;
                    case entry.startsWith('Alteration Orb'):
                      orbImg = 'Alteration Orb.png';
                      break;
                    case entry.startsWith('Regal Orb'):
                      orbImg = 'Regal Orb.png';
                      break;
                    case entry.startsWith('Chaos Orb'):
                      orbImg = 'Chaos Orb.png';
                      break;
                    case entry.startsWith('Alchemy Orb'):
                      orbImg = 'Alchemy Orb.png';
                      break;
                    case entry.startsWith('Exalted Orb'):
                      orbImg = 'Exalted Orb.png';
                      break;
                    case entry.startsWith('Divine Orb'):
                      orbImg = 'Divine Orb.png';
                      break;
                    case entry.startsWith('Annulment Orb'):
                      orbImg = 'Annulment Orb.png';
                      break;
                    case entry.startsWith('Vaal Orb'):
                      orbImg = 'Vaal Orb.png';
                      break;
                    case entry.startsWith('Scouring Orb'):
                      orbImg = 'Scouring Orb.png';
                      break;
                    case entry.startsWith('Fracturing Orb'):
                      orbImg = 'Fracturing Orb.png';
                      break;
                    case entry.startsWith('Teardrop'):
                      orbImg = 'Teardrop.png';
                      break;
                    case entry.startsWith('Added prefix') ||
                      entry.startsWith('Added prefixes') ||
                      entry.startsWith('Added suffix') ||
                      entry.startsWith('Added suffixes') ||
                      entry.startsWith('Removed prefix') ||
                      entry.startsWith('Removed suffix'):
                      {
                        let found = false;
                        for (let i = idx - 1; i >= 0 && !found; i--) {
                          switch (true) {
                            case arr[i].startsWith('Transmutation Orb'):
                              orbImg = 'Transmutation Orb.png';
                              found = true;
                              break;
                            case arr[i].startsWith('Augmentation Orb'):
                              orbImg = 'Augmentation Orb.png';
                              found = true;
                              break;
                            case arr[i].startsWith('Alteration Orb'):
                              orbImg = 'Alteration Orb.png';
                              found = true;
                              break;
                            case arr[i].startsWith('Regal Orb'):
                              orbImg = 'Regal Orb.png';
                              found = true;
                              break;
                            case arr[i].startsWith('Chaos Orb'):
                              orbImg = 'Chaos Orb.png';
                              found = true;
                              break;
                            case arr[i].startsWith('Alchemy Orb'):
                              orbImg = 'Alchemy Orb.png';
                              found = true;
                              break;
                            case arr[i].startsWith('Exalted Orb'):
                              orbImg = 'Exalted Orb.png';
                              found = true;
                              break;
                            case arr[i].startsWith('Divine Orb'):
                              orbImg = 'Divine Orb.png';
                              found = true;
                              break;
                            case arr[i].startsWith('Annulment Orb'):
                              orbImg = 'Annulment Orb.png';
                              found = true;
                              break;
                            case arr[i].startsWith('Vaal Orb'):
                              orbImg = 'Vaal Orb.png';
                              found = true;
                              break;
                            // Add more orb checks as needed
                          }
                        }
                      }
                      break;
                  }

                  // Color for added/removed/rolled
                  let textColor = 'text-blue-500';
                  switch (true) {
                    case entry.startsWith('Chaos Orb'):
                    case entry.startsWith('Alchemy Orb'):
                    case entry.startsWith('Regal Orb'):
                    case entry.startsWith('Exalted Orb'):
                    case entry.startsWith('Divine Orb'):
                      textColor = 'text-gold';
                      break;
                    case entry.startsWith('Annulment Orb'):
                    case entry.startsWith('Scouring Orb'):
                      textColor = 'text-zinc-200';
                      break;
                    case entry.startsWith('Vaal Orb'):
                    case entry.startsWith('Teardrop'):
                      textColor = 'text-red-600';
                      break;
                    case entry.startsWith('Fracturing Orb'):
                      textColor = 'text-frac';
                      break;
                    case entry.startsWith('Added'):
                      textColor = 'text-green-400';
                      break;
                    case entry.startsWith('Removed'):
                      textColor = 'text-red-400';
                      break;
                    default:
                      textColor = 'text-blue-500';
                  }

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
                        {entry}
                      </span>
                    </li>
                  );
                })}
              </ul>
            </div>
          )}

          {/* Affixes section - only show when base is selected */}
          {activeSelection && activeSelection.baseType && (
            <div className='w-full rounded-lg bg-zinc-800 p-6'>
              <h3 className='mb-6 text-center text-xl font-bold text-white'>
                Available Affixes (Item Level {itemLevel})
              </h3>
              <div className='grid grid-cols-1 gap-8 lg:grid-cols-2'>
                {/* Prefixes Column */}
                <div className='space-y-4'>
                  <h4 className='text-center text-lg font-semibold text-blue-400'>
                    Prefixes (
                    {
                      getMatchingAffixes(activeSelection.baseType, itemLevel)
                        .prefixes.length
                    }
                    )
                  </h4>
                  <div className='space-y-1 overflow-y-auto rounded bg-zinc-900 p-3'>
                    {getMatchingAffixes(
                      activeSelection.baseType,
                      itemLevel
                    ).prefixes.map((familyGroup) => {
                      // Calculate the sum of all weights in this family
                      const totalWeight = familyGroup.affixes.reduce(
                        (sum, affix) => sum + affix.weighting,
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
                                <span className='text-sm font-medium text-white'>
                                  {familyGroup.family}
                                  {isFamilyUsed && (
                                    <span className='ml-2 text-xs text-green-400'>
                                      (Selected)
                                    </span>
                                  )}
                                </span>
                                <span className='text-xs text-zinc-400'>
                                  ({familyGroup.affixes.length} tiers)
                                </span>
                              </div>
                              <div className='flex items-center gap-3'>
                                <span className='text-xs text-zinc-400'>
                                  Total Weight: {totalWeight}
                                </span>
                              </div>
                            </div>
                            <div className='mt-1 text-sm text-blue-300'>
                              {familyGroup.representative.effect}
                            </div>
                          </div>

                          {/* Expanded tiers */}
                          {expandedAffixFamilies[familyGroup.family] && (
                            <div className='ml-6 space-y-1'>
                              {familyGroup.affixes.map((affix, index) => {
                                const isPrefix =
                                  affix.affix_type.toLowerCase() === 'prefix';
                                const canAdd = isPrefix
                                  ? craftedAffixes.prefixes.length < 3 &&
                                    !isFamilyUsed
                                  : craftedAffixes.suffixes.length < 3;

                                return (
                                  <div
                                    key={affix.id}
                                    className='flex items-center justify-between rounded bg-zinc-800 p-2 transition-colors hover:bg-zinc-600'
                                  >
                                    <div className='flex-1'>
                                      <div className='flex items-center justify-between'>
                                        <span className='text-sm font-medium text-white'>
                                          {affix.affix_name}
                                          {index === 0 && (
                                            <span className='ml-2 text-xs text-zinc-400'>
                                              (T1)
                                            </span>
                                          )}
                                        </span>
                                        <div className='flex items-center gap-3'>
                                          <span className='text-xs text-zinc-400'>
                                            Req Lvl: {affix.clvl}
                                          </span>
                                          <span className='text-xs text-zinc-500'>
                                            Weight: {affix.weighting}
                                          </span>
                                          <span className='text-xs text-zinc-500'>
                                            iLvl: {affix.ilvl}
                                          </span>
                                        </div>
                                      </div>
                                      <div className='mt-1 text-xs text-blue-300'>
                                        {affix.effect}
                                      </div>
                                    </div>
                                    <button
                                      onClick={() => {
                                        addAffix(affix);
                                        if (
                                          craftedAffixes.prefixes.length > 0
                                        ) {
                                          setItemRarity('rare');
                                        } else if (itemRarity === 'normal') {
                                          setItemRarity('magic');
                                        }
                                      }}
                                      disabled={!canAdd}
                                      className={`ml-2 rounded px-2 py-1 text-xs text-white transition-colors ${
                                        canAdd
                                          ? 'bg-green-600 hover:bg-green-700'
                                          : 'cursor-not-allowed bg-gray-500'
                                      }`}
                                      title={
                                        isFamilyUsed
                                          ? 'Family already used'
                                          : canAdd
                                            ? 'Add this affix'
                                            : `Maximum ${isPrefix ? 'prefixes' : 'suffixes'} reached`
                                      }
                                    >
                                      +
                                    </button>
                                  </div>
                                );
                              })}
                            </div>
                          )}
                        </div>
                      );
                    })}
                    {getMatchingAffixes(activeSelection.baseType, itemLevel)
                      .prefixes.length === 0 && (
                      <div className='text-center text-zinc-500'>
                        No prefixes available for this item type at level{' '}
                        {itemLevel}
                      </div>
                    )}
                  </div>
                </div>

                {/* Suffixes Column */}
                <div className='space-y-4'>
                  <h4 className='text-center text-lg font-semibold text-yellow-400'>
                    Suffixes (
                    {
                      getMatchingAffixes(activeSelection.baseType, itemLevel)
                        .suffixes.length
                    }
                    )
                  </h4>
                  <div className='space-y-1 overflow-y-auto rounded bg-zinc-900 p-3'>
                    {getMatchingAffixes(
                      activeSelection.baseType,
                      itemLevel
                    ).suffixes.map((familyGroup) => {
                      // Calculate the sum of all weights in this family
                      const totalWeight = familyGroup.affixes.reduce(
                        (sum, affix) => sum + affix.weighting,
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
                                <span className='text-sm font-medium text-white'>
                                  {familyGroup.family}
                                  {isFamilyUsed && (
                                    <span className='ml-2 text-xs text-green-400'>
                                      (Selected)
                                    </span>
                                  )}
                                </span>
                                <span className='text-xs text-zinc-400'>
                                  ({familyGroup.affixes.length} tiers)
                                </span>
                              </div>
                              <div className='flex items-center gap-3'>
                                <span className='text-xs text-zinc-400'>
                                  Total Weight: {totalWeight}
                                </span>
                              </div>
                            </div>
                            <div className='mt-1 text-sm text-yellow-300'>
                              {familyGroup.representative.effect}
                            </div>
                          </div>

                          {/* Expanded tiers */}
                          {expandedAffixFamilies[familyGroup.family] && (
                            <div className='ml-6 space-y-1'>
                              {familyGroup.affixes.map((affix, index) => {
                                const isPrefix =
                                  affix.affix_type.toLowerCase() === 'prefix';
                                const canAdd = isPrefix
                                  ? craftedAffixes.prefixes.length < 3
                                  : craftedAffixes.suffixes.length < 3 &&
                                    !isFamilyUsed;

                                return (
                                  <div
                                    key={affix.id}
                                    className='flex items-center justify-between rounded bg-zinc-800 p-2 transition-colors hover:bg-zinc-600'
                                  >
                                    <div className='flex-1'>
                                      <div className='flex items-center justify-between'>
                                        <span className='text-sm font-medium text-white'>
                                          {affix.affix_name}
                                          {index === 0 && (
                                            <span className='ml-2 text-xs text-zinc-400'>
                                              (T1)
                                            </span>
                                          )}
                                        </span>
                                        <div className='flex items-center gap-3'>
                                          <span className='text-xs text-zinc-400'>
                                            Req Lvl: {affix.clvl}
                                          </span>
                                          <span className='text-xs text-zinc-500'>
                                            Weight: {affix.weighting}
                                          </span>
                                          <span className='text-xs text-zinc-500'>
                                            iLvl: {affix.ilvl}
                                          </span>
                                        </div>
                                      </div>
                                      <div className='mt-1 text-xs text-yellow-300'>
                                        {affix.effect}
                                      </div>
                                    </div>
                                    <button
                                      onClick={() => {
                                        addAffix(affix);
                                        if (
                                          craftedAffixes.suffixes.length > 0
                                        ) {
                                          setItemRarity('rare');
                                        } else if (itemRarity === 'normal') {
                                          setItemRarity('magic');
                                        }
                                      }}
                                      disabled={!canAdd}
                                      className={`ml-2 rounded px-2 py-1 text-xs text-white transition-colors ${
                                        canAdd
                                          ? 'bg-green-600 hover:bg-green-700'
                                          : 'cursor-not-allowed bg-gray-500'
                                      }`}
                                      title={
                                        isFamilyUsed
                                          ? 'Family already used'
                                          : canAdd
                                            ? 'Add this affix'
                                            : `Maximum ${isPrefix ? 'prefixes' : 'suffixes'} reached`
                                      }
                                    >
                                      +
                                    </button>
                                  </div>
                                );
                              })}
                            </div>
                          )}
                        </div>
                      );
                    })}
                    {getMatchingAffixes(activeSelection.baseType, itemLevel)
                      .suffixes.length === 0 && (
                      <div className='text-center text-zinc-500'>
                        No suffixes available for this item type at level{' '}
                        {itemLevel}
                      </div>
                    )}
                  </div>
                </div>
              </div>
            </div>
          )}
        </div>
      </div>
    </>
  );
}

export default Crafting;
