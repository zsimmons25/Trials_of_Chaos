import { useState } from 'react';
import { useSuspenseQuery } from '@tanstack/react-query';
import { enchantsqfn } from './handlers/enchantsquery';

function Corruption() {
  const [selectedSlot, setSelectedSlot] = useState<string | null>(null);
  const [selectedSubtype, setSelectedSubtype] = useState<string | null>(null);
  const [selectedShieldType, setSelectedShieldType] = useState<string | null>(
    null
  );

  const [activeSelection, setActiveSelection] = useState<{
    slot: string;
    subtype?: string;
    shieldType?: string;
  } | null>(null);

  const [lastEnchantSelection, setLastEnchantSelection] = useState<{
    slot: string;
    subtype?: string;
    shieldType?: string;
  } | null>(null);

  const { data: enchants = [], isError } = useSuspenseQuery<any[]>({
    queryKey: ['enchants'],
    queryFn: enchantsqfn,
    refetchOnWindowFocus: false,
    refetchOnMount: false,
    refetchOnReconnect: false,
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
    'stave',
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
          case 'dex':
            return ['shield', 'dex_armour'];
          default:
            return ['shield'];
        }
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

    return [];
  };

  const handleSlotClick = (slotName: string) => {
    if (activeSelection && activeSelection.slot === slotName) {
      setActiveSelection(null);
      return;
    }

    if (!needsSubtypeSelection(slotName)) {
      const newSelection = { slot: slotName };
      setActiveSelection(newSelection);
      setLastEnchantSelection(newSelection);
      return;
    }

    setSelectedSlot(slotName);
    setSelectedSubtype(null);
    setSelectedShieldType(null);
  };

  const handleSubtypeSelect = (subtype: string) => {
    setSelectedSubtype(subtype);
    setSelectedShieldType(null);

    if (subtype === 'buckler') {
      completeSelection(selectedSlot!, 'shield', 'dex');
      return;
    }

    if (subtype !== 'shield') {
      completeSelection(selectedSlot!, subtype);
    }
  };

  const handleShieldTypeSelect = (shieldType: string) => {
    setSelectedShieldType(shieldType);
    completeSelection(selectedSlot!, selectedSubtype!, shieldType);
  };

  const completeSelection = (
    slot: string,
    subtype: string,
    shieldType?: string
  ) => {
    const newSelection = { slot, subtype, shieldType };
    setActiveSelection(newSelection);
    setLastEnchantSelection(newSelection);
    handleCloseMenu();
  };

  const handleCloseMenu = () => {
    setSelectedSlot(null);
    setSelectedSubtype(null);
    setSelectedShieldType(null);
  };

  const getDisplayText = (slotName: string) => {
    if (!activeSelection || activeSelection.slot !== slotName) return slotName;

    if (activeSelection.subtype) {
      const subtypeText = activeSelection.subtype
        .replace(/_/g, ' ')
        .replace(/\b\w/g, (l) => l.toUpperCase());

      if (['Helmet', 'Body Armour', 'Gloves', 'Boots'].includes(slotName)) {
        return `${slotName} (${subtypeText})`;
      }

      if (activeSelection.shieldType) {
        return `${subtypeText} (${activeSelection.shieldType.toUpperCase()})`;
      }

      return subtypeText;
    }

    return slotName;
  };

  const isSlotSelected = (slotName: string) => {
    return activeSelection && activeSelection.slot === slotName;
  };

  const getFilteredEnchants = () => {
    if (!lastEnchantSelection) return [];

    const { slot, subtype, shieldType } = lastEnchantSelection;
    const slotType = slot.toLowerCase();
    const itemTags = getItemTags(slot, subtype, shieldType);

    const filteredEnchants = enchants.filter((enchant) => {
      // Only show active enchants
      if (!enchant.active) return false;

      // Check if enchant applies to this slot type
      const validSlots = enchant.item_slots
        .split(', ')
        .map((s: string) => s.trim());
      let slotMatches = false;

      if (slotType === 'weapon' && validSlots.includes('weapon'))
        slotMatches = true;
      if (slotType === 'offhand' && validSlots.includes('offhand'))
        slotMatches = true;
      if (
        ['helmet', 'body armour', 'gloves', 'boots'].includes(slotType) &&
        validSlots.includes('armour')
      )
        slotMatches = true;
      if (slotType === 'helmet' && validSlots.includes('helmet'))
        slotMatches = true;
      if (slotType === 'body armour' && validSlots.includes('body_armour'))
        slotMatches = true;
      if (slotType === 'gloves' && validSlots.includes('gloves'))
        slotMatches = true;
      if (slotType === 'boots' && validSlots.includes('boots'))
        slotMatches = true;
      if (slotType === 'amulet' && validSlots.includes('amulet'))
        slotMatches = true;
      if (slotType === 'ring' && validSlots.includes('ring'))
        slotMatches = true;
      if (slotType === 'belt' && validSlots.includes('belt'))
        slotMatches = true;
      if (slotType === 'jewel' && validSlots.includes('jewel'))
        slotMatches = true;

      if (!slotMatches) return false;

      const enchantTags = enchant.item_tags
        ? enchant.item_tags.split(', ').map((tag: string) => tag.trim())
        : [];

      if (enchantTags.length === 0) {
        return true;
      }

      if (itemTags.length === 0) {
        return false;
      }

      return itemTags.some((tag) => enchantTags.includes(tag));
    });

    // Sort with local enchants first
    return filteredEnchants.sort((a, b) => {
      if (a.scope === 'local' && b.scope === 'global') return -1;
      if (a.scope === 'global' && b.scope === 'local') return 1;

      const aEffect = a.effect.toLowerCase();
      const bEffect = b.effect.toLowerCase();

      const aHasReducedAttr = aEffect.includes(
        'reduced attribute requirements'
      );
      const bHasReducedAttr = bEffect.includes(
        'reduced attribute requirements'
      );

      if (aHasReducedAttr && !bHasReducedAttr) return -1;
      if (!aHasReducedAttr && bHasReducedAttr) return 1;

      const aHasLeech = aEffect.includes('leech');
      const bHasLeech = bEffect.includes('leech');
      const aHasChargeGain = aEffect.includes('charges per second');
      const bHasChargeGain = bEffect.includes('charges per second');

      if (aHasLeech && bHasChargeGain) return -1;
      if (aHasChargeGain && bHasLeech) return 1;

      // Type priority: Physical > Fire > Cold > Lightning > Chaos
      const getTypePriority = (effect: string) => {
        if (effect.includes('physical')) return 0;
        if (effect.includes('fire')) return 1;
        if (effect.includes('cold')) return 2;
        if (effect.includes('lightning')) return 3;
        if (effect.includes('chaos')) return 4;
        if (effect.includes('elemental')) return 5;
        return 6;
      };

      const aPriority = getTypePriority(aEffect);
      const bPriority = getTypePriority(bEffect);

      if (aPriority !== bPriority) {
        return aPriority - bPriority;
      }

      // Attribute priority: Strength > Dexterity > Intelligence
      const getAttributePriority = (effect: string) => {
        if (effect.includes('strength')) return 1;
        if (effect.includes('dexterity')) return 2;
        if (effect.includes('intelligence')) return 3;
        return 4;
      };

      const aAttrPriority = getAttributePriority(aEffect);
      const bAttrPriority = getAttributePriority(bEffect);

      if (aAttrPriority !== bAttrPriority) {
        return aAttrPriority - bAttrPriority;
      }

      // Within the same scope and priority, sort alphabetically by effect
      return a.effect.localeCompare(b.effect);
    });
  };

  const getItemImage = (name: string) => {
    if (!activeSelection) return null;

    switch (name) {
      case 'Jewel':
        if (activeSelection.slot === 'Jewel') {
          const jewelTypes = ['Emerald', 'Ruby', 'Sapphire'];
          const randomJewel =
            jewelTypes[Math.floor(Math.random() * jewelTypes.length)];
          return {
            src: `${randomJewel}.png`,
            alt: randomJewel,
            className:
              'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
          };
        }
        break;

      case 'Weapon':
        if (activeSelection.slot === 'Weapon') {
          return {
            src: getDisplayText(name) + '.webp',
            alt: getDisplayText(name),
            className:
              'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
          };
        }
        break;

      case 'Offhand':
        // Regular offhand selection
        if (activeSelection.slot === 'Offhand') {
          return {
            src: getDisplayText(name).replace(/\//g, '%2F') + '.webp',
            alt: getDisplayText(name),
            className:
              'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
          };
        }

        // Two-handed weapon in offhand slot
        if (
          activeSelection.slot === 'Weapon' &&
          activeSelection.subtype &&
          [
            'crossbow',
            'quarterstaff',
            'two_hand_axe',
            'two_hand_mace',
            'two_hand_sword',
            'stave',
          ].includes(activeSelection.subtype)
        ) {
          return {
            src:
              activeSelection.subtype
                .replace(/_/g, ' ')
                .replace(/\b\w/g, (l) => l.toUpperCase()) + '.webp',
            alt: activeSelection.subtype || name,
            className:
              'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain opacity-60',
          };
        }
        break;

      case 'Helmet':
        if (activeSelection.slot === 'Helmet') {
          return {
            src: getDisplayText(name).replace(/\//g, '%2F') + '.webp',
            alt: getDisplayText(name),
            className:
              'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
          };
        }
        break;

      case 'Body Armour':
        if (activeSelection.slot === 'Body Armour') {
          return {
            src: getDisplayText(name).replace(/\//g, '%2F') + '.webp',
            alt: getDisplayText(name),
            className:
              'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
          };
        }
        break;

      case 'Gloves':
        if (activeSelection.slot === 'Gloves') {
          return {
            src: getDisplayText(name).replace(/\//g, '%2F') + '.webp',
            alt: getDisplayText(name),
            className:
              'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
          };
        }
        break;

      case 'Boots':
        if (activeSelection.slot === 'Boots') {
          return {
            src: getDisplayText(name).replace(/\//g, '%2F') + '.webp',
            alt: getDisplayText(name),
            className:
              'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
          };
        }
        break;

      case 'Amulet':
      case 'Ring':
      case 'Belt':
        if (activeSelection.slot === name) {
          return {
            src: `${name}.webp`,
            alt: name,
            className:
              'absolute left-1/2 top-1/2 block h-[90%] w-[90%] -translate-x-1/2 -translate-y-1/2 object-contain',
          };
        }
        break;

      default:
        return null;
    }
    return null;
  };

  const ItemSlot = ({
    name,
    className = '',
  }: {
    name: string;
    className?: string;
  }) => {
    const itemImage = getItemImage(name);

    return (
      <div className={`flex items-center justify-center ${className}`}>
        <div
          className={`relative inline-flex cursor-pointer flex-col items-center justify-center rounded border text-xs transition-colors sm:text-sm ${
            isSlotSelected(name)
              ? 'border-yellow-500 bg-zinc-700 text-yellow-200'
              : 'border-zinc-600 bg-zinc-800 text-neutral-400 hover:bg-zinc-700'
          }`}
          onClick={() => handleSlotClick(name)}
        >
          <div className='relative'>
            <img src={name + '.png'} alt={name} className='block' />
            {itemImage && (
              <img
                src={itemImage.src}
                alt={itemImage.alt}
                className={itemImage.className}
              />
            )}
          </div>
          <span
            className={`h-5 max-w-36 whitespace-nowrap text-center ${
              name === 'Body Armour' &&
              activeSelection?.slot === 'Body Armour' &&
              activeSelection?.subtype &&
              activeSelection.subtype.includes('/')
                ? 'text-xs'
                : 'text-sm'
            }`}
          >
            {getDisplayText(name)}
          </span>
        </div>
      </div>
    );
  };

  return (
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
          />
          <ItemSlot
            name='Ring'
            className='col-start-4 row-span-2 row-start-3 mb-28 mr-16'
          />
          <ItemSlot name='Gloves' className='col-start-2 row-start-4' />
          <ItemSlot
            name='Belt'
            className='col-start-3 row-span-12 row-start-4 mt-7'
          />
          <ItemSlot name='Boots' className='col-start-4 row-start-4' />
        </div>

        {/* Enchants */}
        <div className='border-t border-zinc-600 pt-4'>
          <h2 className='mb-4 text-xl font-bold'>Available Enchants</h2>
          {isError ? (
            <div className='text-red-400'>Failed to load enchants data</div>
          ) : getFilteredEnchants().length > 0 ? (
            <div className='space-y-2'>
              {getFilteredEnchants().map((enchant) => (
                <div
                  key={enchant.id}
                  className='flex items-center justify-between rounded bg-zinc-800 p-3 text-left'
                >
                  <div className='flex-1'>
                    <div className='font-medium text-neutral-200'>
                      {enchant.effect}
                    </div>
                    <div className='text-xs text-neutral-400'>
                      Scope: {enchant.scope}
                    </div>
                  </div>
                  <div className='text-xs text-neutral-500'>
                    Weight: {enchant.weighting}
                  </div>
                </div>
              ))}
            </div>
          ) : (
            <div className='text-neutral-400'>
              {lastEnchantSelection
                ? `No enchants available for this ${lastEnchantSelection.slot} configuration`
                : 'Select an item slot above to see available enchants'}
            </div>
          )}
        </div>
      </div>

      {/* Modal for subtype selection */}
      {selectedSlot && (
        <div className='fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50'>
          <div className='mx-4 w-full max-w-md rounded-lg bg-zinc-800 p-6'>
            <div className='mb-4 flex items-center justify-between'>
              <h2 className='text-xl font-bold'>{selectedSlot}</h2>
              <button
                onClick={handleCloseMenu}
                className='text-neutral-400 hover:text-white'
              >
                ✕
              </button>
            </div>

            {needsSubtypeSelection(selectedSlot) ? (
              !selectedSubtype ? (
                <div>
                  <h3 className='mb-3 text-lg'>Select Type:</h3>
                  <div
                    className={`grid gap-2 ${
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
                        className='rounded bg-zinc-700 p-3 text-sm transition-colors hover:bg-zinc-600'
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
                  <div className='mb-4'>
                    <button
                      onClick={() => setSelectedSubtype(null)}
                      className='text-sm text-blue-400 hover:text-blue-300'
                    >
                      ← Back
                    </button>
                  </div>
                  <h3 className='mb-3 text-lg'>Select Shield Type:</h3>
                  <div className='grid grid-cols-3 gap-2'>
                    {shield_types.map((type) => (
                      <button
                        key={type}
                        onClick={() => handleShieldTypeSelect(type)}
                        className='rounded bg-zinc-700 p-3 text-sm transition-colors hover:bg-zinc-600'
                      >
                        {type
                          .replace(/_/g, ' ')
                          .replace(/\b\w/g, (l) => l.toUpperCase())}
                      </button>
                    ))}
                  </div>
                </div>
              ) : null
            ) : null}
          </div>
        </div>
      )}
    </div>
  );
}

export default Corruption;
