import { Type, Static } from '@sinclair/typebox';

export type Skill = {
  id: string;
  name: string;
  description: string;
  stats: Record<string, any>;
};

export const SkillSchema = Type.Object({
  id: Type.String(),
  name: Type.String(),
  description: Type.String(),
  stats: Type.Record(Type.String(), Type.Unknown()),
});

export const MonsterDataSchema = Type.Object({
  level: Type.Integer(),
  display_name: Type.String(),
  category: Type.String(),
  base_life: Type.Integer(),
  base_armour: Type.Integer(),
  base_evasion: Type.Integer(),
  base_damage: Type.Integer(),
  base_spell_damage: Type.Integer(),
  base_accuracy: Type.Integer(),
  base_attack_time: Type.Number(),
  base_experience: Type.Integer(),

  life_percent: Type.String(),
  es_life_percent: Type.String(),
  armour_bonus: Type.String(),
  evasion_bonus: Type.String(),
  damage_percent: Type.String(),
  accuracy_percent: Type.String(),
  crit_chance: Type.String(),
  crit_damage_bonus: Type.String(),
  attack_distance: Type.String(),
  damage_spread: Type.String(),
  experience_percent: Type.String(),

  res_fire: Type.String(),
  res_cold: Type.String(),
  res_lightning: Type.String(),
  res_chaos: Type.String(),

  type: Type.String(),
  skills: Type.Optional(Type.Union([Type.String(), Type.Array(SkillSchema)])),
});

export type MonsterData = Static<typeof MonsterDataSchema>;
export const MonstersData = Type.Array(MonsterDataSchema);
export type Monsters = Static<typeof MonstersData>;
