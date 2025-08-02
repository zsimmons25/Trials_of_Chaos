import { SocketablesData } from '../types/socketables';
import { Value } from '@sinclair/typebox/value';

export const socketablesqfn = async () => {
  const response = await fetch(import.meta.env.VITE_UXMAL + '/socketables');
  if (!response.ok) {
    throw new Error('Network response was not ok');
  }
  const res = await response.json();
  if (!Value.Check(SocketablesData, res)) {
    console.error('Validation error:', Value.Errors(SocketablesData, res));
    throw new Error('Validation error');
  }
  return res;
};
