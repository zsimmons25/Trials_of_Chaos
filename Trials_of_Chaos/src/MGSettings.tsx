import { useRef, DragEvent } from 'react';
import { Modifier } from './types/modifier';
import imgLeft from '/modifier_header_left.png';
import imgMid from '/modifier_header.png';
import imgRight from '/modifier_header_right.png';

export type Category = 'dangerous' | 'neutral' | 'easy';
interface CategoryConfig {
  displayName: string;
  color: string;
}

export const CATEGORIES_CONFIG: Record<Category, CategoryConfig> = {
  dangerous: { displayName: 'Dangerous', color: 'text-red-700' },
  neutral: { displayName: 'Neutral', color: 'text-gold' },
  easy: { displayName: 'Easy', color: 'text-green-600' },
};

export type CategorizedModifiers = Record<Category, number[]>;

export const INITIAL_CATEGORIES: CategorizedModifiers = {
  dangerous: [],
  neutral: [],
  easy: [],
};

export const DEFAULT_SETTINGS: Record<number, number> = {
  1: 4, // Blood Globules
  2: 10, // Blood Mist
  3: 2, // Burning Turrets
  4: 6, // Chaotic Monsters
  5: 7, // Deadly Monsters
  6: 9, // Damaged Defences
  7: 5, // Drought
  8: 5, // Enraged Bosses
  9: 3, // Entangling Monsters
  10: 7, // Escalating Damage
  11: 4, // Heart Tethers
  12: 9, // Impending Doom
  13: 5, // Lessened Reach
  14: 1, // Lethal Rare Monsters
  15: 9, // Monster Speed
  16: 10, // Occasional Impotence
  17: 10, // Petrification Statues
  18: 8, // Pyramid Beams
  19: 10, // Random Projectiles
  20: 6, // Reduced Recovery
  21: 9, // Reduced Resistances
  22: 5, // Resistant Monsters
  23: 3, // Shielding Monsters
  24: 2, // Shocking Turrets
  25: 1, // Stalking Shade
  26: 4, // Stormcaller Runes
  27: 10, // Temple Traps
  28: 5, // Time Paradox
  29: 6, // Toxic Monsters
  30: 6, // Unstoppable Monsters
  31: 9, // Vaal Omnitect
  32: 10, // Volatile Fiends
};

interface SettingsProps {
  modifiers: Modifier[];
  categorizedModifiers: CategorizedModifiers;
  orderMatters: boolean;
  isHardcore: boolean;
  onCategorizedModifiersChange: (
    newCategorization:
      | CategorizedModifiers
      | ((prev: CategorizedModifiers) => CategorizedModifiers)
  ) => void;
  onOrderMattersChange: (value: boolean | ((prev: boolean) => boolean)) => void;
  onIsHardcoreChange: (value: boolean | ((prev: boolean) => boolean)) => void;
  onStartGame: () => void;
}

function MGSettings({
  modifiers,
  categorizedModifiers,
  orderMatters,
  isHardcore,
  onCategorizedModifiersChange,
  onOrderMattersChange,
  onIsHardcoreChange,
  onStartGame,
}: SettingsProps): JSX.Element {
  const dropTargetId = useRef<number | null>(null);
  const handleDragStart = (
    e: DragEvent<HTMLDivElement>,
    modId: number,
    fromCategory: Category
  ): void => {
    e.dataTransfer.setData('modifierId', modId.toString());
    e.dataTransfer.setData('fromCategory', fromCategory);
  };

  const handleDrop = (
    e: DragEvent<HTMLDivElement>,
    toCategory: Category
  ): void => {
    e.preventDefault();
    const modIdStr = e.dataTransfer.getData('modifierId');
    const fromCategory = e.dataTransfer.getData('fromCategory') as Category;
    const targetId = dropTargetId.current;
    dropTargetId.current = null;

    if (!modIdStr || !fromCategory) return;
    const modId = parseInt(modIdStr, 10);
    if (isNaN(modId)) return;
    onCategorizedModifiersChange((prev) => {
      const newCats = { ...prev };
      if (fromCategory === toCategory) {
        const currentList = [...(prev[fromCategory] || [])];
        const dragItemIndex = currentList.indexOf(modId);
        if (dragItemIndex === -1) return prev;
        const [draggedItem] = currentList.splice(dragItemIndex, 1);
        let targetIndex = currentList.findIndex((id) => id === targetId);
        if (targetId !== null && targetIndex !== -1) {
          currentList.splice(targetIndex, 0, draggedItem);
        } else {
          currentList.push(draggedItem);
        }
        newCats[toCategory] = currentList;
      } else {
        const sourceList = [...(prev[fromCategory] || [])];
        const targetList = [...(prev[toCategory] || [])];
        const dragItemIndex = sourceList.indexOf(modId);
        if (dragItemIndex === -1) return prev;
        const [draggedItem] = sourceList.splice(dragItemIndex, 1);
        newCats[fromCategory] = sourceList;
        let targetIndex = targetList.findIndex((id) => id === targetId);
        if (targetId !== null && targetIndex !== -1) {
          targetList.splice(targetIndex, 0, draggedItem);
        } else {
          targetList.push(draggedItem);
        }
        newCats[toCategory] = targetList;
      }
      return newCats;
    });
  };

  const handleResetCategories = () => {
    if (modifiers.length > 0) {
      const initialCats: CategorizedModifiers = {
        dangerous: [],
        neutral: [],
        easy: [],
      };
      const placed = new Set<number>();
      modifiers
        .filter((mod) => mod.active)
        .forEach((mod) => {
          if (placed.has(mod.id)) return;
          const rating = DEFAULT_SETTINGS[mod.id];
          if (rating !== undefined) {
            if (rating < 5) initialCats.easy.push(mod.id);
            else if (rating > 6) initialCats.dangerous.push(mod.id);
            else initialCats.neutral.push(mod.id);
          } else {
            initialCats.neutral.push(mod.id);
          }
          placed.add(mod.id);
        });
      onCategorizedModifiersChange(initialCats);
    }
  };

  return (
    <div className='flex min-h-screen flex-col items-center bg-zinc-800 pb-10 text-neutral-300'>
      <div className='mb-4 pt-4 text-center'>
        <h1 className='mb-2 text-3xl font-bold text-red-700'>
          Select your vulnerabilities
        </h1>
        <p className='mb-2 text-xl'>
          Drag modifiers into Dangerous, Neutral, or Easy categories.
        </p>
        <div className='my-3 flex items-center justify-center gap-2'>
          <label htmlFor='orderToggle' className='text-lg'>
            Order Matters:
          </label>
          <input
            type='checkbox'
            id='orderToggle'
            checked={orderMatters}
            onChange={(e) => onOrderMattersChange(e.target.checked)}
            className='h-5 w-5 accent-gold'
          />
          <span className='text-sm text-neutral-400'>
            (Determines if position within a category affects priority)
          </span>
        </div>
        <div className='my-3 flex items-center justify-center gap-2'>
          <label htmlFor='hcToggle' className='text-lg'>
            Hardcore:
          </label>
          <input
            type='checkbox'
            id='hcToggle'
            checked={isHardcore}
            onChange={(e) => onIsHardcoreChange(e.target.checked)}
            className='h-5 w-5 accent-red-700'
          />
          <span className='text-sm text-neutral-400'>
            (Your Trial will end upon round failure)
          </span>
        </div>
        <div className='mb-4 flex justify-center gap-4'>
          <button
            className='rounded-lg bg-gold px-4 py-2 text-black hover:bg-amber-300'
            onClick={handleResetCategories}
          >
            Reset Categories
          </button>
          <button
            className='rounded-lg bg-red-700 px-4 py-2 text-black hover:bg-red-500/80'
            onClick={onStartGame}
          >
            Begin Trial
          </button>
        </div>
      </div>
      <div className='w-full max-w-6xl px-4'>
        <div className='grid grid-cols-1 gap-4 md:grid-cols-3'>
          {Object.keys(CATEGORIES_CONFIG).map((categoryKey) => {
            const category = categoryKey as Category;
            const config = CATEGORIES_CONFIG[category];
            return (
              <div key={category}>
                <h2
                  className={`mb-2 text-center text-xl font-semibold capitalize ${config.color}`}
                >
                  {category}
                </h2>
                <div
                  onDragOver={(e) => e.preventDefault()}
                  onDrop={(e) => handleDrop(e, category)}
                  className={`flex min-h-96 flex-col items-center rounded-lg border border-neutral-700 bg-zinc-800 bg-opacity-50 p-3 transition-colors hover:border-neutral-500 ${
                    orderMatters ? 'gap-6' : 'gap-2'
                  }`}
                >
                  {categorizedModifiers[category].map((modId, index) => {
                    const mod = modifiers.find((m) => m.id === modId);
                    if (!mod) return null;
                    return (
                      <div
                        key={mod.id}
                        draggable
                        onDragStart={(e) =>
                          handleDragStart(e, mod.id, category)
                        }
                        onDragEnter={(e) => {
                          e.preventDefault();
                          dropTargetId.current = mod.id;
                        }}
                        onDragLeave={(e) => {
                          e.preventDefault();
                        }}
                        onDragOver={(e) => e.preventDefault()}
                        className='relative w-10/12 cursor-move flex-col items-center border border-zinc-800 bg-black hover:border-gold'
                      >
                        {orderMatters && (
                          <span className='absolute -right-1 -top-1 z-10 flex h-5 w-5 items-center justify-center rounded-full bg-gold text-xs font-bold text-black'>
                            {index + 1}
                          </span>
                        )}
                        <div className='flex h-8 w-full items-center justify-center border-b border-neutral-700 bg-blood'>
                          <img className='h-full' src={imgLeft} alt='' />
                          <img
                            className='h-full flex-grow'
                            src={imgMid}
                            alt=''
                          />
                          <h3 className='absolute text-center text-base text-gold'>
                            {mod.name}
                          </h3>
                          <img className='h-full' src={imgRight} alt='' />
                        </div>
                        <div className='flex justify-center p-1'>
                          <img
                            src={mod.imgurl}
                            alt={mod.name}
                            className='h-10 w-10 flex-shrink-0 object-cover'
                          />
                        </div>
                      </div>
                    );
                  })}
                  {categorizedModifiers[category].length === 0 && (
                    <div className='flex h-full items-center justify-center text-sm text-neutral-500'>
                      Drop here
                    </div>
                  )}
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
}

export default MGSettings;
