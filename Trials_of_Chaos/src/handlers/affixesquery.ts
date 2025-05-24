import { AffixesData } from '../types/affixes';
import { Value } from '@sinclair/typebox/value';

export const affixqfn = async () => {
  const response = await fetch(import.meta.env.VITE_UXMAL + '/affixes');
  if (!response.ok) {
    throw new Error('Network response was not ok');
  }
  const res = await response.json();
  if (!Value.Check(AffixesData, res)) {
    console.error('Validation error:', Value.Errors(AffixesData, res));
    throw new Error('Validation error');
  }
  return res;
};
