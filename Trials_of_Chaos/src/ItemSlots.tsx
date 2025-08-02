import React, { useState } from 'react';
import { Base } from './types/items';

interface ItemSlotsProps {
  activeSelection: {
    slot: string;
    subtype: string;
    shieldType?: string;
    baseType?: string;
    ringSlot?: 'left' | 'right';
  } | null;
  bases: Base[];
  onSelectionComplete: (selection: {
    slot: string;
    subtype: string;
    shieldType?: string;
    baseType?: string;
    ringSlot?: 'left' | 'right';
  }) => void;
  itemLevel: number;
  onItemLevelChange: (level: number) => void;
}

interface ItemSlotProps {
  name: string;
  className?: string;
  ringSlot?: 'left' | 'right';
  activeSelection: ItemSlotsProps['activeSelection'];
  bases: Base[];
  onSlotClick: (slotName: string, ringSlot?: 'left' | 'right') => void;
}

const ItemSlot: React.FC<ItemSlotProps> = ({
  name,
  className = '',
  ringSlot,
  activeSelection,
  bases,
  onSlotClick,
}) => {
  // Add helper function to get the appropriate image for a base
  const getBaseImage = (base: Base, slot: string, subtype?: string) => {
    const slotLower = slot.toLowerCase();

    // For armor pieces, use the subtype
    if (
      ['helmet', 'body armour', 'gloves', 'boots'].includes(slotLower) &&
      subtype
    ) {
      return {
        src: `${activeSelection?.baseType?.toLowerCase().replace(/\s/g, '_') ?? ''}.webp`,
        alt: `${slot} (${subtype})`,
        className:
          'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
      };
    }

    // For weapons, use the subtype if available
    if (slotLower === 'weapon' && subtype) {
      return {
        src: /*`${subtype.replace(/_/g, ' ').replace(/\b\w/g, (l) => l.toUpperCase())}.webp`,*/ `${activeSelection?.baseType?.toLowerCase().replace(/\s/g, '_') ?? ''}.webp`,
        alt: subtype,
        className:
          'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
      };
    }

    // For offhand items
    if (slotLower === 'offhand' && subtype) {
      if (subtype === 'shield' && activeSelection?.shieldType) {
        const encodedShieldType = activeSelection.shieldType.replace(
          /\//g,
          '%2F'
        );
        return {
          src: `Shield (${encodedShieldType.toUpperCase()}).webp`,
          alt: `${activeSelection.shieldType} Shield`,
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
            ringSlot === 'left' ? 'MirrorRing.webp' : 'MirrorRingFlipped.webp',
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
        className={`relative inline-flex cursor-pointer flex-col items-center justify-center rounded border border-zinc-600 text-xs transition-colors hover:bg-zinc-700 sm:text-sm`}
        onClick={() => onSlotClick(name, ringSlot)}
      >
        <div className='relative'>
          <img
            src={name + '.png'}
            alt={name}
            className='block'
            draggable={false}
          />
          {displayImage && (
            <img
              src={displayImage.src}
              alt={displayImage.alt}
              className={displayImage.className}
              draggable={false}
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
  const getBaseImage = (base: Base, slot: string, subtype?: string) => {
    const slotLower = slot.toLowerCase();

    // For armor pieces, use the subtype
    if (
      ['helmet', 'body armour', 'gloves', 'boots'].includes(slotLower) &&
      subtype
    ) {
      return {
        src: `${base.base_name.toLowerCase().replace(/\s/g, '_') ?? ''}.webp`,
        alt: `${slot} (${subtype})`,
        className: 'block h-full w-full object-contain',
      };
    }

    // For weapons, use the subtype if available
    if (slotLower === 'weapon' && subtype) {
      return {
        src: `${base.base_name.toLowerCase().replace(/\s/g, '_') ?? ''}.webp`,
        alt: subtype,
        className: 'block h-full w-full object-contain',
      };
    }

    // For offhand items
    if (slotLower === 'offhand' && subtype) {
      return {
        src: `${base.base_name.toLowerCase().replace(/\s/g, '_') ?? ''}.webp`,
        alt: subtype,
        className: 'block h-full w-full object-contain',
      };
    }

    // For accessories
    if (['ring', 'belt', 'amulet', 'jewel'].includes(slotLower)) {
      return {
        src: `${base.base_name.toLowerCase().replace(/\s/g, '_')}.webp`,
        alt: base.base_name.toLowerCase().replace(/\s/g, '_'),
        className: 'block h-full w-full object-contain',
      };
    }

    return null;
  };

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
              className={baseImage.className}
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
            <div className='text-zinc-300'>Attacks per Second: {base.aps}</div>
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

export const ItemSlots: React.FC<ItemSlotsProps> = ({
  activeSelection,
  bases,
  onSelectionComplete,
  itemLevel,
  onItemLevelChange,
}) => {
  const [selectedSlot, setSelectedSlot] = useState<string | null>(null);
  const [selectedRingSlot, setSelectedRingSlot] = useState<
    'left' | 'right' | null
  >(null);
  const [selectedSubtype, setSelectedSubtype] = useState<string | null>(null);
  const [selectedShieldType, setSelectedShieldType] = useState<string | null>(
    null
  );
  const [selectedBaseType, setSelectedBaseType] = useState<string | null>(null);
  const [expandedTiers, setExpandedTiers] = useState<{
    [key: string]: boolean;
  }>({
    expert: true,
    advanced: false,
    novice: false,
  });

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

      return true;
    });

    // Jewelry
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

  const handleSlotClick = (slotName: string, ringSlot?: 'left' | 'right') => {
    setSelectedSlot(slotName);
    setSelectedRingSlot(ringSlot || null);
    setSelectedSubtype(null);
    setSelectedShieldType(null);
    setSelectedBaseType(null);

    // Reset expanded tiers to show only expert
    setExpandedTiers({
      expert: true,
      advanced: false,
      novice: false,
    });
  };

  const handleSubtypeSelect = (subtype: string) => {
    setSelectedSubtype(subtype);
    setSelectedShieldType(null);

    if (subtype === 'buckler') {
      setSelectedShieldType('dex');
      return;
    }
  };

  const handleShieldTypeSelect = (shieldType: string) => {
    setSelectedShieldType(shieldType);
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
    const newSelection = {
      slot,
      subtype,
      shieldType,
      baseType,
      ringSlot: selectedRingSlot || undefined,
    };

    onSelectionComplete(newSelection);
    handleCloseMenu();
  };

  const handleCloseMenu = () => {
    setSelectedSlot(null);
    setSelectedRingSlot(null);
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

  return (
    <>
      <div className='w-full max-w-md rounded-lg bg-zinc-900 bg-opacity-80 shadow-2xl sm:max-w-lg md:max-w-2xl lg:max-w-4xl xl:max-w-5xl'>
        <div className='mx-auto mb-6 grid auto-rows-auto grid-cols-[repeat(5,max-content)] grid-rows-4 items-center justify-center gap-1'>
          <ItemSlot
            name='Jewel'
            className='col-start-3 row-start-1'
            activeSelection={activeSelection}
            bases={bases}
            onSlotClick={handleSlotClick}
          />
          <ItemSlot
            name='Weapon'
            className='col-span-2 col-start-1 row-span-4 row-start-1 mr-[92px] mt-8'
            activeSelection={activeSelection}
            bases={bases}
            onSlotClick={handleSlotClick}
          />
          <ItemSlot
            name='Offhand'
            className='col-start-5 row-span-4 row-start-1 -ml-16 mt-8'
            activeSelection={activeSelection}
            bases={bases}
            onSlotClick={handleSlotClick}
          />
          <ItemSlot
            name='Helmet'
            className='col-start-3 row-span-3 row-start-1'
            activeSelection={activeSelection}
            bases={bases}
            onSlotClick={handleSlotClick}
          />
          <ItemSlot
            name='Body Armour'
            className='col-start-3 row-span-12 row-start-2 mt-9'
            activeSelection={activeSelection}
            bases={bases}
            onSlotClick={handleSlotClick}
          />
          <ItemSlot
            name='Amulet'
            className='col-start-4 row-span-2 row-start-2 mr-16 mt-7'
            activeSelection={activeSelection}
            bases={bases}
            onSlotClick={handleSlotClick}
          />
          <ItemSlot
            name='Ring'
            className='col-start-2 row-span-2 row-start-3 mb-28 ml-16'
            ringSlot='left'
            activeSelection={activeSelection}
            bases={bases}
            onSlotClick={handleSlotClick}
          />
          <ItemSlot
            name='Ring'
            className='col-start-4 row-span-2 row-start-3 mb-28 mr-16'
            ringSlot='right'
            activeSelection={activeSelection}
            bases={bases}
            onSlotClick={handleSlotClick}
          />
          <ItemSlot
            name='Gloves'
            className='col-start-2 row-start-4'
            activeSelection={activeSelection}
            bases={bases}
            onSlotClick={handleSlotClick}
          />
          <ItemSlot
            name='Belt'
            className='col-start-3 row-span-12 row-start-4 mt-7'
            activeSelection={activeSelection}
            bases={bases}
            onSlotClick={handleSlotClick}
          />
          <ItemSlot
            name='Boots'
            className='col-start-4 row-start-4'
            activeSelection={activeSelection}
            bases={bases}
            onSlotClick={handleSlotClick}
          />
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
                          onClick={() => {
                            handleShieldTypeSelect(type);
                          }}
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
                                      ? 'text-gold'
                                      : tier === 'advanced'
                                        ? 'text-frac'
                                        : 'text-curr'
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
                            onItemLevelChange(parseInt(e.target.value) || 81)
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
                          onItemLevelChange(parseInt(e.target.value) || 81)
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
      </div>
    </>
  );
};
