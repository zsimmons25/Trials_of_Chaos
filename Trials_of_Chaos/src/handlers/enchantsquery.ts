import { EnchantsData } from '../types/enchants';
import { Value } from '@sinclair/typebox/value';

export const enchantsqfn = async () => {
  const response = await fetch(import.meta.env.VITE_UXMAL + '/enchants');
  if (!response.ok) {
    throw new Error('Network response was not ok');
  }
  const res = await response.json();
  if (!Value.Check(EnchantsData, res)) {
    console.error('Validation error:', Value.Errors(EnchantsData, res));
    throw new Error('Validation error');
  }
  return res;
};
