import { ItemsData, BasesData } from '../types/items';
import { Value } from '@sinclair/typebox/value';
import { Type, Static } from '@sinclair/typebox';

const ItemsResponse = Type.Object({
  items: ItemsData,
  bases: BasesData,
});
export type ItemsResponse = Static<typeof ItemsResponse>;

export const itemqfn = async () => {
  const res = await fetch(import.meta.env.VITE_UXMAL + '/items');
  if (!res.ok) throw new Error('Network response was not ok');
  const json = await res.json();
  if (!Value.Check(ItemsResponse, json)) {
    console.error('Validation error:', Value.Errors(ItemsResponse, json));
    throw new Error('Validation error');
  }
  return json as ItemsResponse;
};
