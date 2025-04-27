import { ModifiersData } from '../types/modifier';
import { Value } from '@sinclair/typebox/value';

export const modifierqfn = async () => {
  const response = await fetch(import.meta.env.VITE_UXMAL + '/modifiers');
  if (!response.ok) {
    throw new Error('Network response was not ok');
  }
  const res = await response.json();
  if (!Value.Check(ModifiersData, res)) {
    console.error('Validation error:', Value.Errors(ModifiersData, res));
    throw new Error('Validation error');
  }
  return res;
};
