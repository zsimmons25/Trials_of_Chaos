import { useState, useEffect, DragEvent, useCallback, useRef } from 'react';
import { useSuspenseQuery } from '@tanstack/react-query';
import { Modifier } from './types/modifier';
import { modifierqfn } from './handlers/modifiersquery';
import imgLeft from '/modifier_header_left.png';
import imgMid from '/modifier_header.png';
import imgRight from '/modifier_header_right.png';

// Types
type Category = 'dangerous' | 'neutral' | 'easy';
const CATEGORIES: Category[] = ['dangerous', 'neutral', 'easy'];

type CategorizedModifiers = Record<Category, number[]>;
const INITIAL_CATEGORIES: CategorizedModifiers = {
  dangerous: [],
  neutral: [],
  easy: [],
};

type ModifierStages = Record<number, { stage: number; maxStage: number }>;

// Default severity ratings
const DEFAULT_SEVERITY_RATINGS: Record<number, number> = {
  1: 4, // Blood Globules
  2: 10, // Blood Mist
  3: 2, // Burning Turrets
  4: 6, // Chaotic Monsters
  5: 7, // Deadly Monsters
  6: 9, // Damaged Defences
  7: 5, // Drought
  8: 5, // Enraged Bosses
  9: 3, // Entangling Monsters
  10: 5, // Escalating Damage
  11: 4, // Heart Tethers
  12: 9, // Impending Doom
  13: 5, // Lessened Reach
  14: 1, // Lethal Rare Monsters
  15: 9, // Monster Speed
  16: 10, // Occasional Impotence
  17: 10, // Petrification Statues
  18: 10, // Random Projectiles
  19: 9, // Reduced Recovery
  20: 9, // Reduced Resistances
  21: 5, // Resistant Monsters
  22: 3, // Shielding Monsters
  23: 2, // Shocking Turrets
  24: 1, // Stalking Shade
  25: 4, // Stormcaller Runes
  26: 10, // Temple Traps
  27: 5, // Time Paradox
  28: 6, // Toxic Monsters
  29: 9, // Unstoppable Monsters
  30: 9, // Vaal Omnitect
  31: 10, // Volatile Fiends
};

function ModifierGame(): JSX.Element {
  const { data: modifiers = [] } = useSuspenseQuery<Modifier[]>({
    queryKey: ['modifiers'],
    queryFn: modifierqfn,
    refetchOnWindowFocus: false,
    refetchOnMount: false,
    refetchOnReconnect: false,
  });

  const [round, setRound] = useState(1);
  const [options, setOptions] = useState<Modifier[]>([]);
  const [score, setScore] = useState(0);
  const [gameOver, setGameOver] = useState(false);
  const [showSettings, setShowSettings] = useState(true);
  const [categorizedModifiers, setCategorizedModifiers] =
    useState<CategorizedModifiers>(INITIAL_CATEGORIES);
  const [modifierStages, setModifierStages] = useState<ModifierStages>({});
  const [maxedOutModifiers, setMaxedOutModifiers] = useState(new Set<number>());
  const [orderMatters, setOrderMatters] = useState(false);
  const gameStarted = useRef(false);
  const dropTargetId = useRef<number | null>(null);

  const activeModifiers = modifiers.filter(
    (mod) =>
      mod.active &&
      CATEGORIES.some((cat) => categorizedModifiers[cat].includes(mod.id)) &&
      !maxedOutModifiers.has(mod.id)
  );

  useEffect(() => {
    if (modifiers.length > 0) {
      setModifierStages(
        Object.fromEntries(
          modifiers.map((mod) => {
            const maxStage = mod.stage1
              ? mod.stage2
                ? mod.stage3
                  ? 2
                  : 1
                : 0
              : 0;
            return [mod.id, { stage: 0, maxStage }];
          })
        )
      );
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

          const rating = DEFAULT_SEVERITY_RATINGS[mod.id];

          if (rating !== undefined) {
            if (rating < 5) {
              initialCats.easy.push(mod.id);
            } else if (rating > 6) {
              initialCats.dangerous.push(mod.id);
            } else {
              initialCats.neutral.push(mod.id);
            }
            placed.add(mod.id);
          } else {
            console.warn(
              `Modifier ID ${mod.id} (${mod.name}) not found in DEFAULT_SEVERITY_RATINGS, placing in neutral.`
            );
            initialCats.neutral.push(mod.id);
            placed.add(mod.id);
          }
        });
      setCategorizedModifiers(initialCats);
    }
  }, [modifiers]);

  useEffect(() => {
    const shouldStart =
      activeModifiers.length >= 3 && !showSettings && !gameStarted.current;
    if (shouldStart) {
      generateNewOptions();
      gameStarted.current = true;
    }
    if (showSettings) gameStarted.current = false;
  }, [showSettings, activeModifiers.length]);

  const generateNewOptions = useCallback(
    (excludeId?: number): void => {
      const available = activeModifiers.filter((mod) => mod.id !== excludeId);
      setOptions([...available].sort(() => 0.5 - Math.random()).slice(0, 3));
    },
    [activeModifiers]
  );

  const getModifierDescription = (mod: Modifier): string => {
    const info = modifierStages[mod.id];
    if (!info) return mod.description1 || '';
    const { stage } = info;
    return stage === 0
      ? mod.description1
      : stage === 1
        ? mod.description2 || mod.description1
        : mod.description3 || mod.description2 || mod.description1;
  };

  const resetStages = useCallback(
    (): ModifierStages =>
      Object.fromEntries(
        Object.entries(modifierStages).map(([id, data]) => [
          parseInt(id, 10),
          { ...data, stage: 0 },
        ])
      ),
    [modifierStages]
  );

  const resetGame = (goToSettings: boolean): void => {
    setRound(1);
    setScore(0);
    setGameOver(false);
    setShowSettings(goToSettings);
    setMaxedOutModifiers(new Set());
    setModifierStages(resetStages());
    gameStarted.current = false;
    if (!goToSettings) {
      setTimeout(() => {
        gameStarted.current = true;
        generateNewOptions();
      }, 0);
    }
  };

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
    const modId = parseInt(e.dataTransfer.getData('modifierId'), 10);
    const fromCategory = e.dataTransfer.getData('fromCategory') as Category;
    const targetId = dropTargetId.current;
    dropTargetId.current = null;
    if (!modId || !fromCategory) return;
    setCategorizedModifiers((prev) => {
      const newCats = { ...prev };
      const sourceList = prev[fromCategory] || [];
      const targetList = prev[toCategory] || [];
      const dragItemIndex = sourceList.indexOf(modId);
      if (dragItemIndex === -1) return prev;
      const [draggedItem] = sourceList.splice(dragItemIndex, 1);
      if (fromCategory === toCategory) {
        let targetIndex = targetList.findIndex((id) => id === targetId);
        if (targetId !== null && targetIndex !== -1) {
          if (dragItemIndex < targetIndex) {
            targetIndex--;
          }
          targetList.splice(targetIndex, 0, draggedItem);
        } else {
          targetList.push(draggedItem);
        }
        newCats[toCategory] = targetList;
      } else {
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

  const getModifierLocation = (
    modId: number
  ): { category: Category | null; index: number } => {
    for (const category of CATEGORIES) {
      const index = categorizedModifiers[category].indexOf(modId);
      if (index !== -1) {
        return { category, index };
      }
    }
    return { category: null, index: -1 };
  };

  const getSeverityScore = (
    category: Category | null,
    index: number
  ): number => {
    const baseScores: Record<Category, number> = {
      easy: 100,
      neutral: 200,
      dangerous: 300,
    };
    if (!category) return 0;
    if (!orderMatters) {
      return baseScores[category];
    }
    return baseScores[category] + index;
  };

  const handleModifierClick = (mod: Modifier): void => {
    const stageInfo = modifierStages[mod.id] || { stage: 0, maxStage: 0 };
    const nextStage = stageInfo.stage + 1;
    const willMaxOut =
      nextStage > stageInfo.maxStage ||
      (nextStage === 1 && !mod.stage2) ||
      (nextStage === 2 && !mod.stage3);
    if (willMaxOut) setMaxedOutModifiers((prev) => new Set([...prev, mod.id]));
    setModifierStages((prev) =>
      (nextStage === 1 && mod.stage2) || (nextStage === 2 && mod.stage3)
        ? { ...prev, [mod.id]: { ...prev[mod.id], stage: nextStage } }
        : prev
    );
    if (options.length === 0) return;
    let minScore = Infinity;
    options.forEach((opt) => {
      const { category, index } = getModifierLocation(opt.id);
      const score = getSeverityScore(category, index);
      if (score < minScore) {
        minScore = score;
      }
    });
    const clickedModLocation = getModifierLocation(mod.id);
    const clickedModScore = getSeverityScore(
      clickedModLocation.category,
      clickedModLocation.index
    );
    const isCorrect = clickedModScore === minScore;
    setTimeout(
      () => {
        if (isCorrect) {
          setScore((s) => s + 1);
          if (round < 10) {
            setRound((r) => r + 1);
            generateNewOptions(willMaxOut ? mod.id : undefined);
          } else setGameOver(true);
        } else setGameOver(true);
      },
      isCorrect ? 50 : 500
    );
  };

  if (gameOver)
    return (
      <div className='flex h-screen w-screen flex-col items-center justify-center bg-neutral-900 text-neutral-300'>
        <div className='rounded-lg bg-black bg-opacity-75 p-8 text-center'>
          <h1 className='mb-6 text-4xl font-bold text-gold'>Game Over!</h1>
          <p className='mb-4 text-2xl'>Your final score: {score} out of 10</p>
          <p className='mb-8 text-xl'>
            {score === 10
              ? 'Perfect score!'
              : score >= 7
                ? 'Great job!'
                : score >= 4
                  ? 'Not bad!'
                  : 'Keep practicing!'}
          </p>
          <div className='flex justify-center gap-4'>
            <button
              className='hover:bg-gold/80 rounded-lg bg-gold px-6 py-3 text-xl text-black'
              onClick={() => resetGame(false)}
            >
              Play Again
            </button>
            <button
              className='rounded-lg bg-blue-600 px-6 py-3 text-xl text-white hover:bg-blue-500/80'
              onClick={() => resetGame(true)}
            >
              Return to Settings
            </button>
          </div>
        </div>
      </div>
    );

  if (showSettings)
    return (
      <div className='flex min-h-screen flex-col items-center bg-neutral-900 pb-10 text-neutral-300'>
        <div className='mb-4 pt-4 text-center'>
          <h1 className='mb-2 text-3xl font-bold text-gold'>
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
              onChange={() => setOrderMatters((prev) => !prev)}
              className='h-5 w-5 accent-gold'
            />
            <span className='text-sm text-neutral-400'>
              (Determines if position within a category affects priority)
            </span>
          </div>
          <div className='mb-4 flex justify-center gap-4'>
            <button
              className='rounded-lg bg-gray-600 px-4 py-2 text-white hover:bg-gray-500/80'
              onClick={() => {
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
                      const rating = DEFAULT_SEVERITY_RATINGS[mod.id];
                      if (rating !== undefined) {
                        if (rating < 5) initialCats.easy.push(mod.id);
                        else if (rating > 6) initialCats.dangerous.push(mod.id);
                        else initialCats.neutral.push(mod.id);
                      } else {
                        initialCats.neutral.push(mod.id);
                      }
                      placed.add(mod.id);
                    });
                  setCategorizedModifiers(initialCats);
                }
              }}
            >
              Reset Categories
            </button>
            <button
              className='rounded-lg bg-green-600 px-4 py-2 text-white hover:bg-green-500/80'
              onClick={() => resetGame(false)}
            >
              Start Game
            </button>
          </div>
        </div>
        <div className='w-full max-w-6xl px-4'>
          <div className='grid grid-cols-1 gap-4 md:grid-cols-3'>
            {CATEGORIES.map((category) => (
              <div key={category}>
                <h2 className='mb-2 text-center text-xl font-semibold capitalize text-gold'>
                  {category}
                </h2>
                <div
                  onDragOver={(e) => e.preventDefault()}
                  onDrop={(e) => handleDrop(e, category)}
                  className='flex min-h-48 flex-col gap-2 rounded-lg border border-neutral-700 bg-neutral-800 bg-opacity-50 p-3 transition-colors hover:border-neutral-500'
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
                          if (dropTargetId.current === mod.id) {
                            dropTargetId.current = null;
                          }
                        }}
                        onDragOver={(e) => e.preventDefault()}
                        className='relative flex cursor-move items-center rounded border border-neutral-600 bg-black p-1.5 hover:border-gold'
                      >
                        {orderMatters && (
                          <span className='absolute -right-1 -top-1 flex h-5 w-5 items-center justify-center rounded-full bg-gold text-xs font-bold text-black'>
                            {index}
                          </span>
                        )}
                        <img
                          src={mod.imgurl}
                          alt={mod.name}
                          className='mr-2 h-8 w-8 flex-shrink-0 object-cover'
                        />
                        <span className='truncate text-sm'>{mod.name}</span>
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
            ))}
          </div>
        </div>
      </div>
    );

  return (
    <div className='flex h-screen w-screen flex-col items-center justify-center bg-neutral-900 text-neutral-300'>
      <div className='mb-8 text-center'>
        <h1 className='mb-2 text-3xl font-bold text-gold'>
          The Trials of Chaos
        </h1>
        <div className='mt-4 flex items-center justify-center gap-8'>
          <div className='rounded-lg bg-black bg-opacity-75 px-4 py-2'>
            <span className='text-lg'>Round: {round}/10</span>
          </div>
        </div>
      </div>
      <div className='flex flex-wrap items-center justify-center gap-8'>
        {options.map((mod) => {
          const stageInfo = modifierStages[mod.id] || { stage: 0, maxStage: 0 };
          const { stage, maxStage } = stageInfo;
          const description = getModifierDescription(mod);
          const stageRoman = stage === 0 ? 'I' : stage === 1 ? 'II' : 'III';
          return (
            <div
              key={mod.id}
              className='cursor-pointer transition-transform hover:scale-105'
              onClick={() => handleModifierClick(mod)}
            >
              <div className='mx-2 my-4 flex h-auto w-60 flex-col items-center justify-center rounded-lg'>
                <div className='flex flex-col items-center justify-center'>
                  <img
                    src={mod.imgurl}
                    alt={mod.name}
                    className='h-48 w-full object-cover'
                  />
                </div>
                <div className='flex h-16 w-60 items-center justify-center border-x border-black bg-blood'>
                  <img className='ml-1' src={imgLeft} alt='' />
                  <img src={imgMid} alt='' />
                  <h3 className='absolute text-center text-gold'>
                    {mod.name} {maxStage > 0 && <span> {stageRoman}</span>}
                  </h3>
                  <img className='mr-1' src={imgRight} alt='' />
                </div>
                <div className='flex h-32 w-60 flex-col items-center justify-center bg-black bg-opacity-75'>
                  <p className='flex h-32 items-center px-3'>{description}</p>
                </div>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}

export default ModifierGame;
