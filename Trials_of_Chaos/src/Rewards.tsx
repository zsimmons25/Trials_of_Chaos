import CorruptedRares from './CorruptedRares';

function Rewards() {
  const uhl = (
    <img
      src='https://www.poe2wiki.net/w/images/b/b7/Item_UI_header_double_unique_left.png'
      alt='header left unique'
      className='h-full'
    />
  );
  const uhm = (
    <div
      className='h-full flex-grow bg-repeat-x'
      style={{
        backgroundImage: `url('https://www.poe2wiki.net/w/images/e/e1/Item_UI_header_double_unique_middle.png')`,
        backgroundSize: 'auto 100%',
      }}
    />
  );
  const uhr = (
    <img
      src='https://www.poe2wiki.net/w/images/c/c2/Item_UI_header_double_unique_right.png'
      alt='header right unique'
      className='h-full'
    />
  );
  const usep = (
    <img
      className='mx-auto my-1'
      src='https://www.poe2wiki.net/w/images/8/8a/Item_UI_separator_unique.png'
      alt='unqiue seperator'
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
      alt='normal seperator'
    />
  );
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
      alt='normal seperator'
    />
  );
  const cores = [
    {
      id: 1,
      Name: 'Atmohua',
      'Martial Weapon Effect': 'Convert 20% of Requirements to Strength',
      'Armour Effect': 'Convert 20% of Requirements to Strength',
    },
    {
      id: 2,
      Name: 'Azcapa',
      'Martial Weapon Effect': '+15 to Spirit',
      'Armour Effect': '5% increased Quantity of Gold Dropped by Slain Enemies',
    },
    {
      id: 3,
      Name: 'Cholotl',
      'Martial Weapon Effect': 'Convert 20% of Requirements to Dexterity',
      'Armour Effect': 'Convert 20% of Requirements to Dexterity',
    },
    {
      id: 4,
      Name: 'Citaqualotl',
      'Martial Weapon Effect': '30% increased Elemental Damage with Attacks',
      'Armour Effect': '+5% to all Elemental Resistances',
    },
    {
      id: 5,
      Name: 'Jiquani',
      'Martial Weapon Effect': 'Recover 2% of maximum Life on Kill',
      'Armour Effect': '2% increased maximum Life',
    },
    {
      id: 6,
      Name: 'Opiloti',
      'Martial Weapon Effect': '15% chance to cause Bleeding on Hit',
      'Armour Effect': '10% increased Charm Charges gained',
    },
    {
      id: 7,
      Name: 'Puhuarte',
      'Martial Weapon Effect': '30% increased chance to Ignite',
      'Armour Effect': '+1% to Maximum Fire Resistance',
    },
    {
      id: 8,
      Name: 'Quipolatl',
      'Martial Weapon Effect': '5% increased Attack Speed',
      'Armour Effect': '10% reduced Slowing Potency of Debuffs on You',
    },
    {
      id: 9,
      Name: 'Tacati',
      'Martial Weapon Effect': '15% chance to Poison on Hit with this weapon',
      'Armour Effect': '+7% to Chaos Resistance',
    },
    {
      id: 10,
      Name: 'Ticaba',
      'Martial Weapon Effect': '+12% to Critical Damage Bonus',
      'Armour Effect':
        'Hits against you have 10% reduced Critical Damage Bonus',
    },
    {
      id: 11,
      Name: 'Topotante',
      'Martial Weapon Effect':
        'Attacks with this Weapon Penetrate 15% Elemental Resistances',
      'Armour Effect': '15% increased Elemental Ailment Threshold',
    },
    {
      id: 12,
      Name: 'Tzamoto',
      'Martial Weapon Effect': '20% increased Freeze Buildup',
      'Armour Effect': '+1% to Maximum Cold Resistance',
    },
    {
      id: 13,
      Name: 'Xopec',
      'Martial Weapon Effect': '30% increased chance to Shock',
      'Armour Effect': '+1% to Maximum Lightning Resistance',
    },
    {
      id: 14,
      Name: 'Zalatl',
      'Martial Weapon Effect': 'Recover 2% of maximum Mana on Kill',
      'Armour Effect': '2% increased maximum Mana',
    },
    {
      id: 15,
      Name: 'Zantipi',
      'Martial Weapon Effect': 'Convert 20% of Requirements to Intelligence',
      'Armour Effect': 'Convert 20% of Requirements to Intelligence',
    },
  ];
  const chl = (
    <img
      src='https://www.poe2wiki.net/w/images/5/51/Item_UI_header_currency_left.png'
      alt='header left currency'
      className='h-full'
    />
  );
  const chm = (
    <div
      className='h-full flex-grow bg-repeat-x'
      style={{
        backgroundImage: `url('https://www.poe2wiki.net/w/images/7/77/Item_UI_header_currency_middle.png')`,
        backgroundSize: 'auto 100%',
      }}
    />
  );
  const chr = (
    <img
      src='https://www.poe2wiki.net/w/images/e/e0/Item_UI_header_currency_right.png'
      alt='header right currency'
      className='h-full'
    />
  );
  const csep = (
    <img
      className='mx-auto my-1'
      src='https://www.poe2wiki.net/w/images/7/71/Item_UI_separator_currency.png'
      alt='currency seperator'
    />
  );
  const currency = [
    {
      id: 1,
      Name: 'Vaal Orb',
      Description: 'Modifies an item unpredictably and Corrupts it',
      StackSize: 10,
    },
    {
      id: 2,
      Name: 'Chaos Orb',
      Description:
        'Removes a random modifier and augments a Rare item with a new random modifier',
      StackSize: 10,
    },
    {
      id: 3,
      Name: 'Exalted Orb',
      Description: 'Augments a Rare item with a new random modifier',
      StackSize: 20,
    },
    {
      id: 4,
      Name: 'Divine Orb',
      Description: 'Randomises the numeric values of modifiers on an item',
      StackSize: 3,
    },
  ];
  return (
    <div className='min-h-screen w-screen bg-zinc-700 p-8 text-center text-neutral-300'>
      <div className='grid-flow-col grid-cols-1 gap-8 md:grid-cols-2 lg:grid-cols-4'>
        <div className='my-4 rounded-lg bg-zinc-800 p-6 shadow-md'>
          <h2 className='mb-4 text-2xl font-semibold'>Unique Rewards</h2>
          <p className='mb-3'>
            The <strong>Trialmaster</strong> offers a variety of unique rewards
            for defeating him. These unqiues can enable many builds.
          </p>
          <div className='flex flex-row justify-center gap-4'>
            <div className='group relative inline-block h-20 w-20'>
              <img
                className='h-20 w-20'
                src='https://www.poe2wiki.net/images/thumb/5/5b/The_Adorned_inventory_icon.png/78px-The_Adorned_inventory_icon.png'
                alt='The Adorned'
              />
              <div className='font-Insmallcaps pointer-events-none absolute left-1/2 top-full z-10 w-96 -translate-x-1/2 transform border border-amber-700 bg-black text-sm text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
                <div className='relative mb-1 flex h-16 w-full items-center justify-center'>
                  {uhl}
                  {uhm}
                  {uhr}
                  <span className='absolute inset-0 flex items-center justify-center text-lg font-semibold text-orange-400'>
                    The Adorned
                    <br />
                    Diamond
                  </span>
                </div>
                <p className='my-2 text-center text-gray-400'>
                  Jewel
                  <br />
                  Limited to: <span className='text-white'>1</span>
                </p>
                {usep}
                <p className='mx-px my-2 text-center text-indigo-400'>
                  (0-100)% increased Effect of Jewel Socket Passive Skills
                  containing Corrupted Magic Jewels
                </p>
                {usep}
                <p className='mb-3 text-red-600'> Corrupted</p>
                {usep}
                <p className='mx-1 my-2 text-center italic text-orange-400'>
                  At their height, the Vaal glittered under the sun. A decade, a
                  century, an aeon of prosperity... Now nothing more than a
                  passing wonder.
                </p>
                {usep}
                <p className='mx-px text-center text-xs italic text-neutral-400'>
                  Place into an allocated Jewel Socket on the Passive Skill
                  Tree. Right click to remove from the Socket.
                </p>
              </div>
            </div>
            <div className='group relative inline-block h-32 w-24'>
              <img
                className='h-32 w-24'
                src='https://www.poe2wiki.net/images/thumb/4/47/Mahuxotl%27s_Machination_inventory_icon.png/156px-Mahuxotl%27s_Machination_inventory_icon.png'
                alt='Mahuxotls Machination'
              />
              <div className='font-Insmallcaps pointer-events-none absolute left-1/2 top-full z-10 w-96 -translate-x-1/2 transform border border-amber-700 bg-black text-sm text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
                <div className='relative mb-1 flex h-16 w-full items-center justify-center'>
                  {uhl}
                  {uhm}
                  {uhr}
                  <span className='absolute inset-0 flex items-center justify-center text-lg font-semibold text-orange-400'>
                    Mahuxotls Machination
                    <br />
                    Omen Crest Shield
                  </span>
                </div>
                <p className='my-2 text-center text-gray-400'>
                  Shield
                  <br />
                  Chance to Block: <span className='text-white'>25%</span>
                  <br />
                  Armour: <span className='text-white'>50</span>
                  <br />
                  Energy Shield: <span className='text-white'>19</span>
                  <br />
                </p>
                {usep}
                <p className='my-2 text-center text-gray-400'>
                  Requires: Level <span className='text-white'>48</span>,{' '}
                  <span className='text-white'>37</span> STR,{' '}
                  <span className='text-white'>37</span> INT
                </p>
                {usep}
                <p className='my-2 flex items-center justify-center text-center text-indigo-400'>
                  Grants Skill:{' '}
                  <img
                    className='h-4 w-4'
                    src='Ultimatum.webp'
                    alt='Raise Shield'
                  />{' '}
                  Raise Shield
                </p>
                {usep}
                <p className='my-2 text-center text-indigo-400'>
                  (333-666)% increased Armour and Energy Shield
                  <br />
                  100% increased Effect of Socketed Soul Cores
                  <br />
                  Everlasting Sacrifice
                </p>
                {usep}
                <p className='my-2 text-center italic text-orange-400'>
                  The Banished Architect sought to employ the darkest secrets of
                  the Vaal.
                </p>
              </div>
            </div>
            <div className='group relative inline-block h-24 w-24'>
              <img
                className='h-24 w-24'
                src='https://www.poe2wiki.net/images/thumb/0/0a/Glimpse_of_Chaos_inventory_icon.png/156px-Glimpse_of_Chaos_inventory_icon.png'
                alt='Glimpse of Chaos'
              />
              <div className='font-Insmallcaps pointer-events-none absolute left-1/2 top-full z-10 w-96 -translate-x-1/2 transform border border-amber-700 bg-black text-sm text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
                <div className='relative mb-1 flex h-16 w-full items-center justify-center'>
                  {uhl}
                  {uhm}
                  {uhr}
                  <span className='absolute inset-0 flex items-center justify-center text-lg font-semibold text-orange-400'>
                    Glimpse of Chaos
                    <br />
                    Tribal Mask
                  </span>
                </div>
                <p className='my-2 text-center text-gray-400'>
                  Helmet
                  <br />
                  Evasion: <span className='text-white'>66</span>
                  <br />
                  Energy Shield: <span className='text-white'>28</span>
                </p>
                {usep}
                <p className='my-2 text-center text-gray-400'>
                  Requires: Level <span className='text-white'>52</span>,{' '}
                  <span className='text-white'>34</span> DEX,{' '}
                  <span className='text-white'>34</span> INT
                </p>
                {usep}
                <p className='mx-px my-2 text-center text-indigo-400'>
                  Can be modified while Corrupted
                  <br />
                  +(50-150) to maximum Life
                  <br />
                  +(50-150) to maximum Mana
                  <br />
                  (-30-30)% to Fire Resistance
                  <br />
                  (-30-30)% to Cold Resistance
                  <br />
                  (-30-30)% to Lightning Resistance
                  <br />
                  Chaos Resistance is Zero
                </p>
                {usep}
                <p className='mx-1 my-2 text-center italic text-orange-400'>
                  Man retains sanity and strives toward civilisation only under
                  the blessed veil of ignorance.
                </p>
              </div>
            </div>
            <div className='group relative inline-block h-24 w-24'>
              <img
                className='h-24 w-24'
                src='https://www.poe2wiki.net/images/thumb/e/e0/Hateforge_inventory_icon.png/156px-Hateforge_inventory_icon.png'
                alt='Hateforge'
              />
              <div className='font-Insmallcaps pointer-events-none absolute left-1/2 top-full z-10 w-96 -translate-x-1/2 transform border border-amber-700 bg-black text-sm text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
                <div className='relative mb-1 flex h-16 w-full items-center justify-center'>
                  {uhl}
                  {uhm}
                  {uhr}
                  <span className='absolute inset-0 flex items-center justify-center text-lg font-semibold text-orange-400'>
                    Hateforge
                    <br />
                    Moulded Mitts
                  </span>
                </div>
                <p className='my-2 text-center text-gray-400'>
                  Gloves
                  <br />
                  Armour: <span className='text-white'>68</span>
                </p>
                {usep}
                <p className='my-2 text-center text-gray-400'>
                  Requires: Level <span className='text-white'>60</span>,{' '}
                  <span className='text-white'>53</span> STR
                </p>
                {usep}
                <p className='mx-px my-2 text-center text-indigo-400'>
                  (50-80)% increased Armour
                  <br />
                  Gain (1-3) random Charge on reaching Maximum Rage
                  <br />
                  Lose all Rage on reaching Maximum Rage
                  <br />
                  (-10-10) to Maximum Rage
                </p>
                {usep}
                <p className='mx-1 my-2 text-center italic text-orange-400'>
                  The first Karui born on the fringes of the Vaal empire
                  developed a blood fever born of corruption.
                </p>
              </div>
            </div>
            <div className='group relative inline-block h-12 w-24'>
              <img
                className='h-12 w-24'
                src='https://www.poe2wiki.net/images/thumb/1/14/Zerphi%27s_Genesis_inventory_icon.png/154px-Zerphi%27s_Genesis_inventory_icon.png'
                alt='Zerphis Genesis'
              />
              <div className='font-Insmallcaps pointer-events-none absolute left-1/2 top-full z-10 w-96 -translate-x-1/2 transform border border-amber-700 bg-black text-sm text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
                <div className='relative mb-1 flex h-16 w-full items-center justify-center'>
                  {uhl}
                  {uhm}
                  {uhr}
                  <span className='absolute inset-0 flex items-center justify-center text-lg font-semibold text-orange-400'>
                    Zerphis Genesis
                    <br />
                    Heavy Belt
                  </span>
                </div>
                <p className='my-2 text-center text-gray-400'>
                  Belt
                  <br />
                  Requires: Level <span className='text-white'>56</span>
                </p>
                {usep}
                <p className='mx-px my-2 text-center text-indigo-400'>
                  (20-30)% increased Stun Threshold
                  <br />
                  Has (1-3) Charm Slots
                </p>
                {usep}
                <p className='mx-px my-2 text-center text-indigo-400'>
                  +(10–30) to Strength
                  <br />
                  Corrupted Blood cannot be inflicted on you
                  <br />
                  50% of charges used by Charms granted to your Life Flasks
                  <br />
                  (10–30)% increased Charm Charges used
                </p>
                {usep}
                <p className='mx-1 my-2 text-center italic text-orange-400'>
                  The most horrifying ideas often begin with a simple
                  innovation.
                </p>
              </div>
            </div>
          </div>
        </div>

        <div className='my-4 flex-col rounded-lg bg-zinc-800 p-6 shadow-md'>
          <h2 className='mb-4 text-2xl font-semibold'>Fates</h2>
          <p className='mb-3'>
            Upon deating the Boss in room 10, you will be rewarded with a Fate.
            These Fates can be used to unlock the fight with the{' '}
            <strong>Trialmaster</strong>.
          </p>
          <div className='flex flex-row justify-center gap-4'>
            <div className='group relative inline-block'>
              <img
                src='https://www.poe2wiki.net/images/thumb/e/e2/Deadly_Fate_inventory_icon.png/78px-Deadly_Fate_inventory_icon.png'
                alt='Deadly Fate'
              />
              <div className='font-Insmallcaps pointer-events-none absolute bottom-full left-1/2 z-10 h-36 w-72 -translate-x-1/2 transform border border-neutral-400 bg-black text-sm text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
                <div className='relative mb-1 flex h-10 w-full items-center justify-center'>
                  {nhl}
                  {nhm}
                  {nhr}
                  <span className='absolute inset-0 flex items-center justify-center text-lg font-bold text-white'>
                    Deadly Fate
                  </span>
                </div>
                <p className='my-2 text-center italic text-orange-400'>
                  Fight enough battles, and it <br /> becomes all but
                  inevitable.
                </p>
                {nsep}
                <p className='mx-px text-center text-xs italic text-neutral-400'>
                  Can be placed in the door at the end of the Trial of Chaos to
                  challenge the Trialmaster.
                </p>
              </div>
            </div>
            <div className='group relative inline-block'>
              <img
                src='https://www.poe2wiki.net/images/thumb/7/7e/Cowardly_Fate_inventory_icon.png/78px-Cowardly_Fate_inventory_icon.png'
                alt='Cowardly Fate'
              />
              <div className='font-Insmallcaps pointer-events-none absolute bottom-full left-1/2 z-10 h-36 w-72 -translate-x-1/2 transform border border-neutral-400 bg-black text-sm text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
                <div className='relative mb-1 flex h-10 w-full items-center justify-center'>
                  {nhl}
                  {nhm}
                  {nhr}
                  <span className='absolute inset-0 flex items-center justify-center text-lg font-bold text-white'>
                    Cowardly Fate
                  </span>
                </div>
                <p className='mb-4 mt-5 text-center italic text-orange-400'>
                  The ignoblest of choices.
                </p>
                {nsep}
                <p className='mx-px text-center text-xs italic text-neutral-400'>
                  Can be placed in the door at the end of the Trial of Chaos to
                  challenge the Trialmaster.
                </p>
              </div>
            </div>
            <div className='group relative inline-block'>
              <img
                src='https://www.poe2wiki.net/images/thumb/e/e6/Victorious_Fate_inventory_icon.png/78px-Victorious_Fate_inventory_icon.png'
                alt='Victorious Fate'
              />
              <div className='font-Insmallcaps pointer-events-none absolute bottom-full left-1/2 z-10 h-36 w-72 -translate-x-1/2 transform border border-neutral-400 bg-black text-sm text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
                <div className='relative mb-1 flex h-10 w-full items-center justify-center'>
                  {nhl}
                  {nhm}
                  {nhr}
                  <span className='absolute inset-0 flex items-center justify-center text-lg font-bold text-white'>
                    Victorious Fate
                  </span>
                </div>
                <p className='my-2 text-center text-orange-400'>
                  There is always a chance, however small, <br /> that you might
                  actually succeed.
                </p>
                {nsep}
                <p className='mx-px text-center text-xs italic text-neutral-400'>
                  Can be placed in the door at the end of the Trial of Chaos to
                  challenge the Trialmaster.
                </p>
              </div>
            </div>
          </div>
        </div>

        <div className='my-4 rounded-lg bg-zinc-800 p-6 shadow-md'>
          <h2 className='mb-4 text-2xl font-semibold'>Soul Cores</h2>
          <p className='mb-3'>
            Boss Rooms ( 4 | 7 | 10 ) will reward you with Soul Cores.
          </p>
          <div className='flex flex-row justify-center gap-4'>
            {cores.map((core) => (
              <div
                key={core.Name}
                className='group relative inline-block h-16 w-16'
              >
                <img
                  className='h-16 w-16'
                  src={`SC_${core.Name}.png`}
                  alt={core.Name}
                />
                <div className='font-Insmallcaps pointer-events-none absolute bottom-full left-1/2 z-10 w-96 -translate-x-1/2 transform border border-neutral-400 bg-black text-sm text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
                  <div className='relative mb-1 flex h-10 w-full items-center justify-center'>
                    {nhl}
                    {nhm}
                    {nhr}
                    <span className='absolute inset-0 flex items-center justify-center text-lg font-bold text-white'>
                      Soul Core of {core.Name}
                    </span>
                  </div>
                  <p className='my-2 text-center text-neutral-400'>
                    Stack Size: <span className='text-white'>10</span>
                  </p>
                  {nsep}
                  <p className='mx-1 my-2 text-center text-indigo-400'>
                    Martial Weapons: {core['Martial Weapon Effect']}
                  </p>
                  <p className='mx-1 my-2 text-center text-indigo-400'>
                    Armour: {core['Armour Effect']}
                  </p>
                  {nsep}
                  <p className='my-2 text-center italic text-neutral-400'>
                    Place into an empty Rune Socket in a Weapon or Armour to
                    apply its effect to that item. Once socketed it cannot be
                    removed.
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>
        <div className='my-4 rounded-lg bg-zinc-800 p-6 shadow-md'>
          <h2 className='mb-4 text-2xl font-semibold'>Currency</h2>
          <p className='mb-3'>
            As you venture further into the Trials, later rooms will reward you
            with Currency orbs.
          </p>
          <div className='flex flex-row justify-center gap-4'>
            {currency.map((orb) => (
              <div
                key={orb.Name}
                className='group relative inline-block h-16 w-16'
              >
                <img
                  className='h-16 w-16'
                  src={`${orb.Name}.png`}
                  alt={orb.Name}
                />
                <span className='absolute left-0 top-0 text-xs text-white'>
                  {orb.StackSize}
                </span>
                <div className='font-Insmallcaps pointer-events-none absolute bottom-full left-1/2 z-10 w-96 -translate-x-1/2 transform border border-yellow-200 bg-black text-sm text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
                  <div className='relative mb-1 flex h-10 w-full items-center justify-center'>
                    {chl}
                    {chm}
                    {chr}
                    <span className='absolute inset-0 flex items-center justify-center text-lg font-bold text-gold'>
                      {orb.Name}
                    </span>
                  </div>
                  <p className='my-2 text-center text-neutral-400'>
                    Stack Size:{' '}
                    <span className='text-white'>{orb.StackSize}</span>
                  </p>
                  {csep}
                  <p className='mx-px my-2 text-center text-indigo-400'>
                    {orb.Description}
                  </p>
                  {csep}
                </div>
              </div>
            ))}
          </div>
          <p className='mb-3'>
            Upon defeating the <strong>Trialmaster</strong> you may also be
            rewarded with Inscribed Ultimatums that allow you to wager your
            currency to double the amount.
          </p>
          <div className='group relative inline-block'>
            <img
              className='h-16 w-16'
              src='https://www.poe2wiki.net/images/2/2d/Inscribed_Ultimatum_inventory_icon.png'
              alt='Inscribed Ultimatum'
            />
            <div className='font-Insmallcaps pointer-events-none absolute left-1/2 top-full z-10 w-72 -translate-x-1/2 transform border border-neutral-400 bg-black text-sm text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
              <div className='relative mb-1 flex h-10 w-full items-center justify-center'>
                {mhl}
                {mhm}
                {mhr}
                <span className='absolute inset-0 flex items-center justify-center text-lg font-bold text-blue-500'>
                  Inscribed Ultimatum of
                </span>
              </div>
              <p className='my-2 text-center text-neutral-400'>
                Area Level: <span className='text-white'>80</span>
                <br />
                Number of Trials: <span className='text-white'>10</span>
                <br />
                Wager: <span className='text-white'>3</span> Divine Orbs
              </p>
              {msep}
              <p className='mx-px my-2 text-center text-blue-500'>
                Monsters gain 70% of damage as extra chaos damage.
              </p>
              {msep}
              <p className='my-2 text-center italic text-orange-400'>
                Mortals spend their lives wondering which fate shall be theirs.
                Chaos takes amusement in knowing the answer: all of them.
              </p>
              {msep}
              <p className='mx-px text-center text-xs italic text-neutral-400'>
                Take this item to The Temple of Chaos to participate in a Trial
                of Chaos.
              </p>
            </div>
          </div>
        </div>

        <div className='my-4 rounded-lg bg-zinc-800 p-6 shadow-md'>
          <h2 className='mb-4 text-2xl font-semibold'>Corrupted Unqiues</h2>
          <p className='mb-3'>
            On rare occasions, you may be rewarded with a Corrupted Unique item.
          </p>
          <div className='flex flex-row justify-center gap-4'>
            <div className='group relative inline-block h-20 w-20'>
              <img
                className='h-20 w-20'
                src='https://www.poe2wiki.net/images/2/24/Dream_Fragments_inventory_icon.png'
                alt='Dream Fragments'
              />
              <div className='font-Insmallcaps pointer-events-none absolute bottom-full left-1/2 z-10 w-96 -translate-x-1/2 transform border border-amber-700 bg-black text-sm text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
                <div className='relative mb-1 flex h-16 w-full items-center justify-center'>
                  {uhl}
                  {uhm}
                  {uhr}
                  <span className='absolute inset-0 flex items-center justify-center text-lg font-semibold text-orange-400'>
                    Dream Fragments
                    <br />
                    Sapphire Ring
                  </span>
                </div>
                <p className='my-2 text-center text-gray-400'>
                  Ring
                  <br />
                  Requires: Level <span className='text-white'>12</span>
                </p>
                {usep}
                <p className='mx-px my-2 text-center text-cyan-100'>
                  30% increased Mana Regeneration Rate
                </p>
                {usep}
                <p className='mx-px my-2 text-center text-indigo-400'>
                  20% increased maximum Mana
                  <br />
                  50% increased Mana Regeneration Rate
                  <br />
                  You cannot be Chilled or Frozen
                </p>
                {usep}
                <p className='mb-3 text-red-600'> Corrupted</p>
                {usep}
                <p className='mx-1 my-2 text-center italic text-orange-400'>
                  Doryani stumbled into a realm of madness And awoke its Master.
                </p>
              </div>
            </div>
            <div className='group relative inline-block h-32 w-24'>
              <img
                className='h-32 w-24'
                src='https://www.poe2wiki.net/images/e/e9/Cloak_of_Flame_inventory_icon.png'
                alt='Cloak of Flame'
              />
              <div className='font-Insmallcaps pointer-events-none absolute bottom-full left-1/2 z-10 w-96 -translate-x-1/2 transform border border-amber-700 bg-black text-sm text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
                <div className='relative mb-1 flex h-16 w-full items-center justify-center'>
                  {uhl}
                  {uhm}
                  {uhr}
                  <span className='absolute inset-0 flex items-center justify-center text-lg font-semibold text-orange-400'>
                    Cloak of Flame
                    <br />
                    Silk Robe
                  </span>
                </div>
                <p className='my-2 text-center text-gray-400'>
                  Body Armour
                  <br />
                  Energy Shield: <span className='text-white'>61</span>
                </p>
                {usep}
                <p className='my-2 text-center text-gray-400'>
                  Requires: Level <span className='text-white'>22</span>,{' '}
                  <span className='text-white'>47</span> INT
                </p>
                {usep}
                <p className='mx-px my-2 text-center text-cyan-100'>
                  40% increased Thorns Damage
                </p>
                {usep}
                <p className='mx-px my-2 text-center text-indigo-400'>
                  +40% of Fire Resistance
                  <br />
                  40% reduced Ignite Duration on You
                  <br />
                  40% of Physical Damage taken as Fire Damage
                  <br />
                  25 to 35 Fire Thorns damage
                </p>
                {usep}
                <p className='mb-3 text-red-600'> Corrupted</p>
                {usep}
                <p className='mx-1 my-2 text-center italic text-orange-400'>
                  He who sows an ember shall reap an inferno.
                </p>
              </div>
            </div>
            <div className='group relative inline-block h-32 w-24'>
              <img
                className='h-32 w-24'
                src='https://www.poe2wiki.net/images/8/8f/Sculpted_Suffering_inventory_icon.png'
                alt='Sculpted Suffering'
              />
              <div className='font-Insmallcaps pointer-events-none absolute bottom-full left-1/2 z-10 w-96 -translate-x-1/2 transform border border-amber-700 bg-black text-sm text-white opacity-0 transition-opacity group-hover:pointer-events-auto group-hover:opacity-100'>
                <div className='relative mb-1 flex h-16 w-full items-center justify-center'>
                  {uhl}
                  {uhm}
                  {uhr}
                  <span className='absolute inset-0 flex items-center justify-center text-lg font-semibold text-orange-400'>
                    Sculpted Suffering
                    <br />
                    Warpick
                  </span>
                </div>
                <p className='my-2 text-center text-gray-400'>
                  One Hand Mace
                  <br />
                  Physical Damage: <span className='text-white'>18-24</span>
                  <br />
                  Critical Strike Chance:{' '}
                  <span className='text-white'>7.00%</span>
                  <br />
                  Attacks per Second: <span className='text-white'>1.45</span>
                  <br />
                  Weapon Range: <span className='text-white'>1.1</span> metres
                </p>
                {usep}
                <p className='my-2 text-center text-gray-400'>
                  Requires: Level <span className='text-white'>22</span>,{' '}
                  <span className='text-white'>52</span> Str
                </p>
                {usep}
                <p className='mx-px my-2 text-center text-cyan-100'>
                  +15% to Critical Damage Bonus
                </p>
                {usep}
                <p className='mx-px my-2 text-center text-indigo-400'>
                  +15% to Critical Damage Bonus
                </p>
                {usep}
                <p className='mx-px my-2 text-center text-indigo-400'>
                  Adds 25 to 30 Physical Damage
                  <br />
                  15% increased Attack Speed
                  <br />
                  Breaks Armour equal to 40% of damage from Hits with this
                  weapon
                  <br />
                  Fully Armour Broken enemies you kill with Hits Shatter
                </p>
                {usep}
                <p className='mb-3 text-red-600'> Corrupted</p>
                {usep}
                <p className='mx-1 my-2 text-center italic text-orange-400'>
                  The Abyssals were created, not born, and every moment in the
                  light was agony.
                </p>
              </div>
            </div>
          </div>
        </div>

        <div className='my-4 flex flex-col items-center justify-center rounded-lg bg-zinc-800 p-6 shadow-md'>
          <h2 className='mb-4 text-2xl font-semibold'>Corrupted Rares</h2>
          <p className='mb-3'>
            Most rooms will reward you with a Corrupted Rare item.
          </p>
          <CorruptedRares />
        </div>
      </div>
    </div>
  );
}

export default Rewards;
