import { Socketable } from './types/socketables';

interface SocketablesInvProps {
  socketables: Socketable[];
  activeSelection: {
    slot: string;
    subtype: string;
    shieldType?: string;
    baseType?: string;
    ringSlot?: 'left' | 'right';
  } | null;
  tooltips?: boolean;
  onSocketableSelect?: (socketable: Socketable) => void;
}

export const SocketablesInv = ({
  socketables,
  activeSelection,
  tooltips,
  onSocketableSelect,
}: SocketablesInvProps) => {
  const chl = (
    <img
      src='header_currency_left.png'
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
      src='header_currency_right.png'
      alt='header right currency'
      className='h-full'
    />
  );
  const csep = (
    <img
      className='mx-auto my-1'
      src='separator_currency.png'
      alt='currency seperator'
    />
  );

  const getSocketableDescription = (
    socketable: Socketable,
    activeSelection: SocketablesInvProps['activeSelection']
  ) => {
    if (!activeSelection?.slot) return 'Socketable item';

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

      if (martialWeapons.includes(currentSubtype)) {
        return socketable.martial_effect;
      }

      // Caster weapons
      if (['staff', 'wand'].includes(currentSubtype)) {
        return socketable.caster_effect;
      }

      // Sceptre
      if (currentSubtype === 'sceptre') {
        return socketable.sceptre_effect;
      }
    }
    switch (currentSlot) {
      case 'helmet':
        return socketable.helmet_effect || socketable.armour_effect;

      case 'body armour':
        return socketable.body_effect || socketable.armour_effect;

      case 'gloves':
        return socketable.gloves_effect || socketable.armour_effect;

      case 'boots':
        return socketable.boots_effect || socketable.armour_effect;

      default:
        return socketable.armour_effect;
    }
  };

  // Fixed positioning grid for 13x7 socketables inventory
  const socketablePositions = [
    // Row 1 (top: 2px)
    { left: '2px', top: '2px' },
    { left: '67px', top: '2px' },
    { left: '132px', top: '2px' },
    { left: '197px', top: '2px' },
    { left: '262px', top: '2px' },
    { left: '327px', top: '2px' },
    { left: '392px', top: '2px' },
    { left: '457px', top: '2px' },
    { left: '522px', top: '2px' },
    { left: '587px', top: '2px' },
    { left: '652px', top: '2px' },
    { left: '717px', top: '2px' },
    { left: '782px', top: '2px' },

    // Row 2 (top: 68px)
    { left: '27px', top: '68px' },
    { left: '100px', top: '68px' },
    { left: '173px', top: '68px' },
    { left: '246px', top: '68px' },
    { left: '319px', top: '68px' },
    { left: '392px', top: '68px' },
    { left: '465px', top: '68px' },
    { left: '538px', top: '68px' },
    { left: '611px', top: '68px' },
    { left: '684px', top: '68px' },
    { left: '757px', top: '68px' },

    // Row 3 (top: 141px)
    { left: '64px', top: '141px' },
    { left: '137px', top: '141px' },
    { left: '210px', top: '141px' },
    { left: '283px', top: '141px' },
    { left: '356px', top: '141px' },
    { left: '429px', top: '141px' },
    { left: '502px', top: '141px' },
    { left: '575px', top: '141px' },
    { left: '648px', top: '141px' },
    { left: '721px', top: '141px' },

    // Row 4 (top: 206px)
    { left: '27px', top: '206px' },
    { left: '100px', top: '206px' },
    { left: '173px', top: '206px' },
    { left: '246px', top: '206px' },
    { left: '319px', top: '206px' },
    { left: '392px', top: '206px' },
    { left: '465px', top: '206px' },
    { left: '538px', top: '206px' },
    { left: '611px', top: '206px' },
    { left: '684px', top: '206px' },
    { left: '757px', top: '206px' },

    // Row 5 (top: 279px) - Middle gap, so fewer items
    { left: '27px', top: '279px' },
    { left: '100px', top: '279px' },
    { left: '173px', top: '279px' },
    { left: '246px', top: '279px' },
    //    { left: '319px', top: '279px' },
    //    { left: '392px', top: '279px' },
    //    { left: '465px', top: '279px' },
    { left: '538px', top: '279px' },
    { left: '611px', top: '279px' },
    { left: '684px', top: '279px' },
    { left: '757px', top: '279px' },

    // Row 6 (top: 352px)
    { left: '27px', top: '352px' },
    { left: '100px', top: '352px' },
    { left: '173px', top: '352px' },
    { left: '246px', top: '352px' },
    { left: '319px', top: '352px' },
    { left: '392px', top: '352px' },
    { left: '465px', top: '352px' },
    { left: '538px', top: '352px' },
    { left: '611px', top: '352px' },
    { left: '684px', top: '352px' },
    { left: '757px', top: '352px' },

    // Row 7 (top: 418px)
    { left: '27px', top: '418px' },
    { left: '100px', top: '418px' },
    { left: '173px', top: '418px' },
    { left: '246px', top: '418px' },
    { left: '319px', top: '418px' },
    { left: '392px', top: '418px' },
    { left: '465px', top: '418px' },
    { left: '538px', top: '418px' },
    { left: '611px', top: '418px' },
    { left: '684px', top: '418px' },
    { left: '757px', top: '418px' },

    // Row 8 (top: 492px)
    { left: '27px', top: '492px' },
    { left: '100px', top: '492px' },
    { left: '173px', top: '492px' },
    { left: '246px', top: '492px' },
    { left: '319px', top: '492px' },
    { left: '392px', top: '492px' },
    { left: '465px', top: '492px' },
    { left: '538px', top: '492px' },
    { left: '611px', top: '492px' },
    { left: '684px', top: '492px' },
    { left: '757px', top: '492px' },
  ];

  const isSocketableEnabled = (
    socketable: Socketable,
    activeSelection: SocketablesInvProps['activeSelection']
  ) => {
    if (!activeSelection?.slot) return false;
    const socketableSlots = socketable.item_slots
      .toLowerCase()
      .split(',')
      .map((s) => s.trim());
    const currentSlot = activeSelection.slot.toLowerCase();
    const currentSubtype = activeSelection.subtype?.toLowerCase();

    console.log(socketable.socketable_name, socketableSlots);

    // Handle weapons - check all weapon types if slot is weapon
    if (currentSlot === 'weapon') {
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
      const casterWeapons = ['staff', 'wand'];

      // Check if this weapon type matches any of the socketable's weapon categories
      if (
        socketableSlots.includes('martial') &&
        martialWeapons.includes(currentSubtype)
      ) {
        return true;
      }
      if (
        socketableSlots.includes('caster') &&
        casterWeapons.includes(currentSubtype)
      ) {
        return true;
      }
      if (socketableSlots.includes('sceptre') && currentSubtype === 'sceptre') {
        return true;
      }
      if (socketableSlots.includes('bow') && currentSubtype === 'bow') {
        return true;
      }
    }

    // Handle specific armour slots
    if (
      socketableSlots.includes('body_armour') &&
      currentSlot === 'body armour'
    ) {
      return true;
    }

    if (socketableSlots.includes('armour')) {
      return ['helmet', 'body armour', 'gloves', 'boots', 'offhand'].includes(
        currentSlot
      );
    }

    // Handle direct slot matches
    return socketableSlots.includes(currentSlot);
  };

  const socketableButtons = socketables
    .slice(0, socketablePositions.length)
    .map((socketable, index) => {
      const enabled = isSocketableEnabled(socketable, activeSelection);
      const socketType = socketable.socket_type.includes('Talisman')
        ? socketable.socket_type.split('_')[0]
        : socketable.socket_type;
      return {
        key: socketable.socketable_name,
        img:
          socketable.id > 13 && (socketable.id < 65 || socketable.id > 75)
            ? `${socketType}_${socketable.socketable_name.match(/(\w+)$/)![0]}.webp`
            : `${socketType}_${socketable.socketable_name.match(/(\w+)/)![0]}.webp`,
        alt: socketable.socketable_name,
        left: socketablePositions[index].left,
        top: socketablePositions[index].top,
        description: getSocketableDescription(socketable, activeSelection),
        socketable: socketable,
        enabled,
      };
    });

  return (
    <div className='relative flex items-center justify-center bg-zinc-900'>
      {socketableButtons.map((button) => (
        <div
          key={button.key}
          className='group absolute'
          style={{
            left: button.left,
            top: button.top,
            width: '60px',
            height: '60px',
            opacity: button.enabled ? 1 : 0,
            pointerEvents: button.enabled ? 'auto' : 'none',
          }}
        >
          <img
            src={button.img}
            alt={button.alt}
            className='z-10 h-full w-full cursor-pointer hover:opacity-85'
            onClick={(e) => {
              e.stopPropagation();
              console.log(
                'Selected socketable:',
                button.socketable.socketable_name
              );
              onSocketableSelect?.(button.socketable);
            }}
            draggable={false}
          />
          {/* Tooltip */}
          {tooltips && button.enabled && (
            <div className='pointer-events-none absolute bottom-full left-1/2 z-10 w-96 -translate-x-1/2 transform bg-black font-Insmallcaps text-sm text-white opacity-0 transition-opacity group-hover:opacity-100'>
              <div className='relative mb-1 flex h-10 w-full items-center justify-center'>
                {chl}
                {chm}
                {chr}
                <span className='absolute inset-0 flex items-center justify-center text-lg font-bold text-curr'>
                  {button.alt}
                </span>
              </div>
              <p className='mx-px my-2 text-center text-indigo-400'>
                {button.description}
              </p>
              {csep}
              <p className='my-2 text-center text-neutral-400'>
                Click this Item then click a Socket to apply it.
              </p>
            </div>
          )}
        </div>
      ))}
      <img
        src='Socketables.png'
        alt='Socketables'
        className='max-h-full max-w-full object-contain'
        width={845}
        height={457}
        draggable={false}
      />
    </div>
  );
};

export default SocketablesInv;
