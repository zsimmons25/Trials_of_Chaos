import { useState, useEffect } from 'react';
import { useSuspenseQuery } from '@tanstack/react-query';
import { monsterqfn } from './handlers/monstersquery';
import { MonsterData, Skill } from './types/monster';
import ulti from '/Ultimatum.webp';

const parsePercent = (s: string | number | undefined | null): number => {
  if (typeof s === 'number') return s / 100;
  if (typeof s !== 'string') return 0;
  const num = parseFloat(s.replace('%', '').replace('+', ''));
  return isNaN(num) ? 0 : num / 100;
};

const calculateFinalStats = (b: MonsterData) => ({
  finalLife: Math.round(b.base_life * parsePercent(b.life_percent)),
  finalEnergyShield: Math.round(b.base_life * parsePercent(b.es_life_percent)),
  finalArmour: Math.round(b.base_armour * (1 + parsePercent(b.armour_bonus))),
  finalEvasion: Math.round(
    b.base_evasion * (1 + parsePercent(b.evasion_bonus))
  ),
  finalDamage: Math.round(b.base_damage * parsePercent(b.damage_percent)),
  finalAccuracy: Math.round(
    b.base_accuracy * (1 + parsePercent(b.accuracy_percent))
  ),
  finalExperience: Math.round(
    b.base_experience * parsePercent(b.experience_percent)
  ),
  critChance: b.crit_chance,
  critDamageBonus: b.crit_damage_bonus,
  attackTime: b.base_attack_time,
});

export type MonsterViewerProps = {
  monsterSlug: string;
};

export default function MonsterViewer({ monsterSlug }: MonsterViewerProps) {
  const [combinedRows, setCombinedRows] = useState<MonsterData[]>([]);
  const [level, setLevel] = useState<string | null>(null);

  const { data: singleData } = useSuspenseQuery<MonsterData[], Error>({
    queryKey: ['monsterData', monsterSlug],
    queryFn: () =>
      monsterSlug !== 'BloodriteGuard' && monsterSlug !== 'ChaosZealot'
        ? monsterqfn(monsterSlug)
        : Promise.resolve([]),
    refetchOnWindowFocus: false,
    refetchOnMount: false,
    refetchOnReconnect: false,
  });

  const { data: dwData } = useSuspenseQuery<MonsterData[], Error>({
    queryKey: ['monsterData', 'BloodriteGuardDW'],
    queryFn: () =>
      monsterSlug === 'BloodriteGuard'
        ? monsterqfn('BloodriteGuardDW')
        : Promise.resolve([]),
    refetchOnWindowFocus: false,
    refetchOnReconnect: false,
  });

  const { data: twoHandData } = useSuspenseQuery<MonsterData[], Error>({
    queryKey: ['monsterData', 'BloodriteGuard2H'],
    queryFn: () =>
      monsterSlug === 'BloodriteGuard'
        ? monsterqfn('BloodriteGuard2H')
        : Promise.resolve([]),
    refetchOnWindowFocus: false,
    refetchOnReconnect: false,
  });

  const { data: dagger } = useSuspenseQuery<MonsterData[], Error>({
    queryKey: ['monsterData', 'ChaosZealotDagger'],
    queryFn: () => {
      return monsterSlug === 'ChaosZealot'
        ? monsterqfn('ChaosZealotDagger')
        : Promise.resolve([]);
    },
    refetchOnWindowFocus: false,
    refetchOnReconnect: false,
  });

  const { data: spear } = useSuspenseQuery<MonsterData[], Error>({
    queryKey: ['monsterData', 'ChaosZealotSpear'],
    queryFn: () => {
      return monsterSlug === 'ChaosZealot'
        ? monsterqfn('ChaosZealotSpear')
        : Promise.resolve([]);
    },
    refetchOnWindowFocus: false,
    refetchOnReconnect: false,
  });

  useEffect(() => {
    setCombinedRows([]);
    setLevel(null);
  }, [monsterSlug]);

  useEffect(() => {
    // Handle BloodriteGuard
    if (monsterSlug === 'BloodriteGuard' && dwData && twoHandData) {
      const updatedDWData = dwData.map((row) => ({
        ...row,
        uniqueLevel: `DW-${row.level}`,
      }));
      const updatedTwoHandData = twoHandData.map((row) => ({
        ...row,
        uniqueLevel: `2H-${row.level}`,
      }));
      setCombinedRows([...updatedDWData, ...updatedTwoHandData]);
      return;
    }

    // Handle ChaosZealot
    if (monsterSlug === 'ChaosZealot' && dagger && spear) {
      const updatedDaggerData = dagger.map((row) => ({
        ...row,
        uniqueLevel: `Dagger-${row.level}`,
      }));
      const updatedSpearData = spear.map((row) => ({
        ...row,
        uniqueLevel: `Spear-${row.level}`,
      }));
      setCombinedRows([...updatedDaggerData, ...updatedSpearData]);
      return;
    }

    // Handle other monsters
    if (singleData) {
      setCombinedRows(
        singleData.map((row) => ({ ...row, uniqueLevel: `${row.level}` }))
      );
    }
  }, [monsterSlug, dwData, twoHandData, dagger, spear, singleData]);

  useEffect(() => {
    if (combinedRows.length > 0 && level === null) {
      const defaultLv = combinedRows[0]?.level ?? null;
      setLevel(String(defaultLv));
    } else if (combinedRows.length === 0) {
      setLevel(null);
    }
  }, [combinedRows, level]);

  if (combinedRows.length === 0)
    return <div className='p-4'>No data available for this monster.</div>;

  const row =
    combinedRows.find(
      (r) => `${r.level}-${r.display_name}` === String(level)
    ) ?? combinedRows[0];
  if (!row)
    return (
      <div className='p-4 text-red-500'>
        Error: Could not find data for the selected level.
      </div>
    );

  let parsedSkills: Skill[] = [];
  try {
    if (typeof row.skills === 'string') {
      parsedSkills = JSON.parse(row.skills);
      if (!Array.isArray(parsedSkills)) parsedSkills = [];
    } else if (Array.isArray(row.skills)) {
      parsedSkills = row.skills;
    }
  } catch (e) {
    console.error('Failed to parse skills JSON:', e);
  }

  const stats: MonsterData = {
    level: row.level,
    display_name: row.display_name,
    type: row.type,
    category: row.category,
    base_life: row.base_life ?? 0,
    life_percent: row.life_percent ?? '0%',
    es_life_percent: row.es_life_percent ?? '0%',
    base_armour: row.base_armour ?? 0,
    armour_bonus: row.armour_bonus ?? '0%',
    evasion_bonus: row.evasion_bonus ?? '0%',
    base_damage: row.base_damage ?? 0,
    damage_percent: row.damage_percent ?? '0%',
    base_spell_damage: row.base_spell_damage ?? 0,
    base_accuracy: row.base_accuracy ?? 0,
    base_evasion: row.base_evasion ?? 0,
    accuracy_percent: row.accuracy_percent ?? '0%',
    base_experience: row.base_experience ?? 0,
    experience_percent: row.experience_percent ?? '0%',
    crit_chance: row.crit_chance ?? '0%',
    crit_damage_bonus: row.crit_damage_bonus ?? '0%',
    base_attack_time: row.base_attack_time ?? 1,
    attack_distance: row.attack_distance ?? '0',
    damage_spread: row.damage_spread ?? '0%',
    res_fire: row.res_fire ?? '0%',
    res_cold: row.res_cold ?? '0%',
    res_lightning: row.res_lightning ?? '0%',
    res_chaos: row.res_chaos ?? '0%',
    skills: parsedSkills,
  };

  const finalStats = calculateFinalStats(stats);

  return (
    <div className='space-y-6 p-4 text-neutral-300'>
      <h2 className='mb-4 text-center text-2xl font-bold text-gold'>
        {stats.display_name}
      </h2>
      {/* Monster Image */}
      <div className='mx-auto h-32 w-32 overflow-hidden rounded border border-neutral-600 bg-zinc-700 md:h-40 md:w-40'>
        <img
          src={ulti}
          alt={stats.display_name}
          className='h-full w-full object-cover'
          onError={(e) =>
            (e.currentTarget.src = '/assets/monsters/default.png')
          }
        />
      </div>

      {/* Level Selector */}
      <div className='text-center'>
        <label className='mr-2'>Select Level:</label>
        <select
          className='rounded border border-neutral-600 bg-zinc-800 p-1'
          value={level ?? ''}
          onChange={(e) => setLevel(e.target.value)}
          disabled={!combinedRows || combinedRows.length <= 1}
        >
          {combinedRows
            .slice()
            .sort((a, b) => b.level - a.level)
            .map((r, index) => (
              <option
                key={`${r.level}-${r.display_name}-${index}`}
                value={`${r.level}-${r.display_name}`}
              >
                {r.display_name} (Level {r.level})
              </option>
            ))}
        </select>
      </div>
      <div className='grid grid-cols-1 gap-6 md:grid-cols-2 md:gap-8'>
        {/* Base Stats */}
        <div>
          <h3 className='mb-2 text-lg font-semibold text-gold'>
            Base Stats & Mods
          </h3>
          <div className='grid grid-cols-2 gap-x-4 gap-y-1 text-sm'>
            <span>Base Life:</span>
            <span className='text-right'>
              {stats.base_life.toLocaleString()} ({stats.life_percent})
            </span>
            <span>ES from Life:</span>
            <span className='text-right'>({stats.es_life_percent})</span>
            <span>Base Armour:</span>
            <span className='text-right'>
              {stats.base_armour.toLocaleString()} ({stats.armour_bonus})
            </span>
            <span>Base Evasion:</span>
            <span className='text-right'>
              {stats.base_evasion.toLocaleString()} ({stats.evasion_bonus})
            </span>
            <span>Base Accuracy:</span>
            <span className='text-right'>
              {stats.base_accuracy.toLocaleString()} ({stats.accuracy_percent})
            </span>
            <span>Base Damage:</span>
            <span className='text-right'>
              {stats.base_damage.toLocaleString()} ({stats.damage_percent})
            </span>
            <span>Base Exp:</span>
            <span className='text-right'>
              {stats.base_experience.toLocaleString()} (
              {stats.experience_percent})
            </span>
            <span>Crit Chance:</span>
            <span className='text-right'>{finalStats.critChance}</span>
            <span>Crit Damage:</span>
            <span className='text-right'>{finalStats.critDamageBonus}</span>
            <span>Attack Time:</span>
            <span className='text-right'>{finalStats.attackTime}s</span>
            <span>Attack Dist:</span>
            <span className='text-right'>{stats.attack_distance}</span>
            <span>Damage Spread:</span>
            <span className='text-right'>{stats.damage_spread}</span>
            <span className='col-span-2 mt-2 font-semibold'>Resistances:</span>
            <span>Fire:</span>
            <span className='text-right'>{stats.res_fire}</span>
            <span>Cold:</span>
            <span className='text-right'>{stats.res_cold}</span>
            <span>Lightning:</span>
            <span className='text-right'>{stats.res_lightning}</span>
            <span>Chaos:</span>
            <span className='text-right'>{stats.res_chaos}</span>
          </div>
        </div>

        {/* Final Stats */}
        <div>
          <h3 className='mb-2 text-lg font-semibold text-gold'>Final Stats</h3>
          <div className='grid grid-cols-2 gap-x-4 gap-y-1 text-sm'>
            <span>Life:</span>
            <span className='text-right'>
              {finalStats.finalLife.toLocaleString()}
            </span>
            <span>Energy Shield:</span>
            <span className='text-right'>
              {finalStats.finalEnergyShield.toLocaleString()}
            </span>
            <span>Armour:</span>
            <span className='text-right'>
              {finalStats.finalArmour.toLocaleString()}
            </span>
            <span>Evasion:</span>
            <span className='text-right'>
              {finalStats.finalEvasion.toLocaleString()}
            </span>
            <span>Accuracy:</span>
            <span className='text-right'>
              {finalStats.finalAccuracy.toLocaleString()}
            </span>
            <span>Damage:</span>
            <span className='text-right'>
              {finalStats.finalDamage.toLocaleString()}
            </span>
            <span>Experience:</span>
            <span className='text-right'>
              {finalStats.finalExperience.toLocaleString()}
            </span>
          </div>
        </div>
      </div>

      {/* Skills */}
      {Array.isArray(stats.skills) && stats.skills.length > 0 && (
        <div>
          <h3 className='mb-2 text-lg font-semibold text-gold'>Abilities</h3>
          <ul className='grid grid-cols-1 gap-4 md:grid-cols-2'>
            {stats.skills.map((skill: Skill) => (
              <li
                key={skill.id || skill.name}
                className='flex flex-col rounded border border-neutral-700 bg-zinc-900 p-3 transition-colors hover:border-amber-400'
              >
                <div className='mb-1 flex items-center'>
                  <img
                    src={ulti}
                    alt=''
                    className='mr-2 h-6 w-6 flex-shrink-0'
                    onError={(e) =>
                      (e.currentTarget.src = '/assets/skills/default.png')
                    }
                    loading='lazy'
                  />
                  <span className='font-semibold text-gold'>{skill.name}</span>
                </div>
                <p className='mb-2 flex-grow text-sm'>{skill.description}</p>
                {skill.stats &&
                  typeof skill.stats === 'object' &&
                  Object.keys(skill.stats).length > 0 && (
                    <div className='mt-auto grid grid-cols-2 gap-x-2 gap-y-1 pt-2 text-xs text-neutral-400'>
                      {Object.entries(skill.stats).map(([key, val]) => (
                        <span
                          key={key}
                          className='overflow-hidden text-ellipsis whitespace-nowrap capitalize'
                        >
                          {key
                            .replace(/_/g, ' ')
                            .replace(/([A-Z])/g, ' $1')
                            .trim()}
                          :
                          <span className='float-right ml-1'>
                            {String(val)}
                          </span>
                        </span>
                      ))}
                    </div>
                  )}
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
}
