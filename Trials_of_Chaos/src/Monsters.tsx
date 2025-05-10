import { useState } from 'react';
import { queryClient } from './main';
import { monsterqfn } from './handlers/monstersquery';
import MonsterViewer, { type MonsterViewerProps } from './Monster';

const loader = async ({ monsterSlug }: MonsterViewerProps) => {
  await queryClient.ensureQueryData({
    queryKey: ['monsterData', monsterSlug],
    queryFn: () => monsterqfn(monsterSlug),
  });
};

interface MonsterGridItem {
  displayName: string;
  slug: string;
}

const monsterList: MonsterGridItem[] = [
  { displayName: 'Stoneclad Gorilla', slug: 'StonecladGorilla' },
  { displayName: 'Crested Behemoth', slug: 'CrestedBehemoth' },
  { displayName: 'Cerebral Bat', slug: 'CerebralBat' },
  { displayName: 'Petulant Stonemaw', slug: 'PetulantStonemaw' },
  { displayName: 'Scute Lizard', slug: 'ScuteLizard' },
  { displayName: 'Saurian Servant', slug: 'SaurianServant' },
  { displayName: 'Bloodrite Guard', slug: 'BloodriteGuard' },
  { displayName: 'Chaos Zealot', slug: 'ChaosZealot' },
  { displayName: 'Bloodrite Priest', slug: 'BloodritePriest' },
];

const bossList: MonsterGridItem[] = [
  { displayName: 'Bahlak, the Sky Seer', slug: 'BahlakTheSkySeer' },
  {
    displayName: 'Chetza, the Feathered Plague',
    slug: 'ChetzaTheFeatheredPlague',
  },
  { displayName: 'Uxmal, the Beastlord', slug: 'UxmalTheBeastlord' },
];

const pinnacleBoss: MonsterGridItem = {
  displayName: 'The Trialmaster',
  slug: 'TheTrialmaster',
};

function Monsters() {
  const [selectedMonsterSlug, setSelectedMonsterSlug] = useState<string | null>(
    null
  );

  const openModal = (monster: MonsterGridItem) => {
    setSelectedMonsterSlug(monster.slug);
  };

  const closeModal = () => {
    setSelectedMonsterSlug(null);
  };

  return (
    <div className='flex min-h-screen w-screen flex-col items-center gap-8 bg-neutral-900 p-8 text-gold'>
      {/* Monsters */}
      <div className='grid w-full max-w-2xl grid-cols-3 gap-8'>
        {monsterList.map((monster) => (
          <div
            key={monster.slug}
            className='max-w-1xl flex h-40 cursor-pointer items-center justify-center rounded border border-gold bg-blood p-8 text-center text-gold transition-colors hover:border-gold hover:bg-gold hover:text-blood'
            onClick={() => openModal(monster)}
            onMouseEnter={() => {
              if (
                monster.slug !== 'BloodriteGuard' &&
                monster.slug !== 'ChaosZealot'
              ) {
                loader({ monsterSlug: monster.slug });
              }
            }}
          >
            {monster.displayName}
          </div>
        ))}
      </div>

      {/* Bosses */}
      <div className='flex w-full max-w-3xl gap-8'>
        {bossList.map((boss) => (
          <div
            key={boss.slug}
            className='flex h-48 flex-1 cursor-pointer items-center justify-center rounded border border-gold bg-blood p-8 text-center text-gold transition-colors hover:border-gold hover:bg-gold hover:text-blood'
            onClick={() => openModal(boss)}
            onMouseEnter={() => loader({ monsterSlug: boss.slug })}
          >
            {boss.displayName}
          </div>
        ))}
      </div>

      {/* Trialmaster */}
      <div
        className='flex h-40 w-full max-w-4xl cursor-pointer items-center justify-center rounded border border-gold bg-blood p-6 text-center text-gold transition-colors hover:border-gold hover:bg-gold hover:text-blood'
        onClick={() => openModal(pinnacleBoss)}
        onMouseEnter={() => loader({ monsterSlug: pinnacleBoss.slug })}
      >
        {pinnacleBoss.displayName}
      </div>

      {/* Modal */}
      {selectedMonsterSlug && (
        <div
          className='fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-80'
          onClick={closeModal}
        >
          <div
            className='relative mt-4 max-h-[90vh] max-w-6xl overflow-y-auto rounded-lg bg-zinc-800 p-6 text-white shadow-xl md:w-8/12'
            onClick={(e) => e.stopPropagation()}
          >
            <MonsterViewer monsterSlug={selectedMonsterSlug} />
          </div>
        </div>
      )}
    </div>
  );
}

export default Monsters;
