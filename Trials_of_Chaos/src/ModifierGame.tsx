import { useState, useEffect, useCallback, useRef, useMemo } from 'react';
import { useSuspenseQuery } from '@tanstack/react-query';
import { Modifier } from './types/modifier';
import { modifierqfn } from './handlers/modifiersquery';
import MGSettings, {
  Category,
  CATEGORIES_CONFIG,
  CategorizedModifiers,
  INITIAL_CATEGORIES,
  DEFAULT_SETTINGS,
} from './MGSettings';
import imgLeft from '/modifier_header_left.png';
import imgMid from '/modifier_header.png';
import imgRight from '/modifier_header_right.png';

type ModifierStages = Record<number, { stage: number; maxStage: number }>;

function ModifierGame(): JSX.Element {
  const { data: modifiers = [] } = useSuspenseQuery<Modifier[]>({
    queryKey: ['modifiers'],
    queryFn: modifierqfn,
    refetchOnWindowFocus: false,
    refetchOnMount: false,
    refetchOnReconnect: false,
  });

  const [showSettings, setShowSettings] = useState(true);
  const [orderMatters, setOrderMatters] = useState(false);
  const [isHardcore, setIsHardcore] = useState(false);
  const [categorizedModifiers, setCategorizedModifiers] =
    useState<CategorizedModifiers>(INITIAL_CATEGORIES);
  const [gameOver, setGameOver] = useState(false);
  const gameStarted = useRef(false);
  const [choices, setChoices] = useState<Modifier[]>([]);
  const [round, setRound] = useState(1);
  const [score, setScore] = useState(0);
  const [showFeedback, setShowFeedback] = useState(false);
  const [lastChoiceCorrect, setLastChoiceCorrect] = useState<boolean | null>(
    null
  );
  const [modifierStages, setModifierStages] = useState<ModifierStages>({});
  const [maxedOutModifiers, setMaxedOutModifiers] = useState(new Set<number>());

  const activeModifiers = useMemo(() => {
    return modifiers.filter(
      (mod) =>
        mod.active &&
        Object.keys(CATEGORIES_CONFIG).some((catKey) =>
          categorizedModifiers[catKey as Category].includes(mod.id)
        ) &&
        !maxedOutModifiers.has(mod.id)
    );
  }, [modifiers, categorizedModifiers, maxedOutModifiers]);

  useEffect(() => {
    if (modifiers.length > 0) {
      const placed = new Set<number>();
      const initialCats: CategorizedModifiers = {
        dangerous: [],
        neutral: [],
        easy: [],
      };
      setModifierStages(
        Object.fromEntries(
          modifiers.map((mod) => {
            let maxStage = 0;
            if (mod.stage1 && mod.stage2 && mod.stage3) {
              maxStage = 2;
            } else if (mod.stage1 && mod.stage2) {
              maxStage = 1;
            }
            return [mod.id, { stage: 0, maxStage }];
          })
        )
      );
      modifiers
        .filter((mod) => mod.active)
        .forEach((mod) => {
          if (placed.has(mod.id)) return;
          const rating = DEFAULT_SETTINGS[mod.id];
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
      generateNewChoices();
      gameStarted.current = true;
    }
    if (showSettings) gameStarted.current = false;
  }, [showSettings, activeModifiers.length]);

  const generateNewChoices = useCallback(
    (excludeId?: number): void => {
      const available = activeModifiers.filter((mod) => mod.id !== excludeId);
      setChoices([...available].sort(() => 0.5 - Math.random()).slice(0, 3));
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
        generateNewChoices();
      }, 0);
    }
  };

  const getModifierLocation = (
    modId: number
  ): { category: Category | null; index: number } => {
    for (const categoryKey of Object.keys(CATEGORIES_CONFIG)) {
      const category = categoryKey as Category;
      const index = categorizedModifiers[category].indexOf(modId);
      if (index !== -1) {
        return { category, index };
      }
    }
    return { category: null, index: -1 };
  };

  const getDangerLevel = (category: Category | null, index: number): number => {
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
    if (choices.length === 0) return;
    let minScore = Infinity;
    choices.forEach((choice) => {
      const { category, index } = getModifierLocation(choice.id);
      const score = getDangerLevel(category, index);
      if (score < minScore) {
        minScore = score;
      }
    });
    const clickedModLocation = getModifierLocation(mod.id);
    const clickedModScore = getDangerLevel(
      clickedModLocation.category,
      clickedModLocation.index
    );
    const isCorrect = clickedModScore === minScore;
    const timeoutDuration = isCorrect ? 750 : isHardcore ? 500 : 1250;
    if (!isHardcore) {
      setLastChoiceCorrect(isCorrect);
      setShowFeedback(true);
      setTimeout(() => {
        setShowFeedback(false);
      }, timeoutDuration);
    }
    setTimeout(() => {
      if (willMaxOut) {
        setMaxedOutModifiers((prev) => new Set([...prev, mod.id]));
      }
      if ((nextStage === 1 && mod.stage2) || (nextStage === 2 && mod.stage3)) {
        setModifierStages((prev) => ({
          ...prev,
          [mod.id]: { ...prev[mod.id], stage: nextStage },
        }));
      }
      if (isCorrect) {
        setScore((s) => s + 1);
        if (round < 10) {
          setRound((r) => r + 1);
          generateNewChoices(willMaxOut ? mod.id : undefined);
        } else setGameOver(true);
      } else {
        if (isHardcore) {
          setGameOver(true);
        } else {
          if (round < 10) {
            setRound((r) => r + 1);
            generateNewChoices(willMaxOut ? mod.id : undefined);
          } else {
            setGameOver(true);
          }
        }
      }
    }, timeoutDuration);
  };

  if (showSettings) {
    return (
      <MGSettings
        modifiers={modifiers}
        categorizedModifiers={categorizedModifiers}
        orderMatters={orderMatters}
        isHardcore={isHardcore}
        onCategorizedModifiersChange={setCategorizedModifiers}
        onOrderMattersChange={setOrderMatters}
        onIsHardcoreChange={setIsHardcore}
        onStartGame={() => setShowSettings(false)}
      />
    );
  }

  if (gameOver)
    return (
      <div className='flex h-screen w-screen flex-col items-center justify-center bg-neutral-900 text-neutral-300'>
        <div className='rounded-lg bg-black bg-opacity-75 p-8 text-center'>
          <h1 className='mb-6 text-4xl font-bold text-gold'>
            Your trial has ended!
          </h1>
          <p className='mb-4 text-2xl'>Your final score: {score} out of 10</p>
          <p className='mb-8 text-xl'>
            {score === 10
              ? 'You have proven yourself to Chaos.'
              : score >= 7
                ? 'Not many make it this far, mortal.'
                : score >= 4
                  ? 'Relying on luck can only get you so far...'
                  : 'Your potential remains unrealised!'}
          </p>
          <div className='flex justify-center gap-4'>
            <button
              className='hover:bg-gold/80 rounded-lg bg-gold px-6 py-3 text-xl text-black hover:bg-amber-300'
              onClick={() => resetGame(false)}
            >
              Begin New Trial
            </button>
            <button
              className='rounded-lg bg-red-800 px-6 py-3 text-xl text-black hover:bg-red-600/80'
              onClick={() => resetGame(true)}
            >
              Return to Settings
            </button>
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
          {!isHardcore && (
            <div className='rounded-lg bg-black bg-opacity-75 px-4 py-2'>
              <span className='text-lg'>Score: {score}/10</span>
            </div>
          )}
        </div>
      </div>
      <div className='flex flex-wrap items-center justify-center gap-8'>
        {choices.map((mod) => {
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
              <div className='mx-2 my-4 flex h-auto w-72 flex-col items-center justify-center rounded-lg'>
                <div className='flex flex-col items-center justify-center'>
                  <img
                    src={mod.imgurl}
                    alt={mod.name}
                    className='h-40 w-full object-cover'
                  />
                </div>
                <div className='flex h-16 w-72 items-center justify-center border-x border-black bg-blood'>
                  <img className='ml-1' src={imgLeft} alt='' />
                  <img className='h-16 w-full' src={imgMid} alt='' />
                  <h3 className='absolute text-center text-gold'>
                    {mod.name} {maxStage > 0 && <span> {stageRoman}</span>}
                  </h3>
                  <img className='mr-1' src={imgRight} alt='' />
                </div>
                <div className='flex h-40 w-72 flex-col items-center justify-center bg-black bg-opacity-75'>
                  <p className='flex h-40 items-center px-3'>{description}</p>
                </div>
              </div>
            </div>
          );
        })}
      </div>
      {!isHardcore && (
        <div
          className={`mt-4 h-8 text-center text-2xl font-bold ${
            showFeedback ? 'visible' : 'invisible'
          } ${lastChoiceCorrect === true ? 'text-gold' : 'text-red-600'}`}
        >
          {showFeedback
            ? lastChoiceCorrect
              ? 'You have chosen well, Challenger'
              : 'Your choice, your Consequences'
            : ''}
        </div>
      )}
    </div>
  );
}

export default ModifierGame;
