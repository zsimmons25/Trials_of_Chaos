import { MonstersData } from '../types/monster';
import { Value } from '@sinclair/typebox/value';

export const monsterqfn = async (monster: string) => {
  const url = `${import.meta.env.VITE_UXMAL}/monsters?monster=${encodeURIComponent(monster)}`;
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error('Network response was not ok');
  }
  const res = await response.json();
  if (!Value.Check(MonstersData, res)) {
    console.error('Validation error:', Value.Errors(MonstersData, res));
    throw new Error('Validation error');
  }
  return res;
};
