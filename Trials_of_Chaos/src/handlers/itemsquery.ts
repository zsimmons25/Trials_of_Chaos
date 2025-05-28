import { ItemsData, BasesData } from '../types/items';
import { Value } from '@sinclair/typebox/value';
import { Type, Static } from '@sinclair/typebox';
import { ItemFormData } from '../Entry';

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

export const createItem = async (itemData: ItemFormData) => {
  const adminPassword = import.meta.env.VITE_ADMIN_PASSWORD;

  console.log('Sending item data:', itemData);

  const response = await fetch(import.meta.env.VITE_UXMAL + '/items', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-Admin-Password': adminPassword,
    },
    body: JSON.stringify(itemData),
  });

  if (!response.ok) {
    const errorText = await response.text();
    let errorMessage = `HTTP ${response.status}: ${response.statusText}`;
    try {
      const errorJson = JSON.parse(errorText);
      errorMessage = errorJson.error || errorMessage;
    } catch {
      errorMessage = errorText || errorMessage;
    }
    console.error('Server response:', errorText);
    throw new Error(errorMessage);
  }

  return response.json();
};
