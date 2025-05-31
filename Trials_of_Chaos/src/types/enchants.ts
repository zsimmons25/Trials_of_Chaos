import { Type, Static } from '@sinclair/typebox';

export const EnchantData = Type.Object({
  id: Type.String(),
  effect: Type.String(),
  item_slots: Type.String(),
  item_tags: Type.Optional(Type.String()),
  scope: Type.Optional(Type.String()),
  active: Type.Union([Type.Boolean(), Type.Literal(0), Type.Literal(1)]),
  weighting: Type.Optional(Type.Number()),
});
export type Enchant = Static<typeof EnchantData>;

export const EnchantsData = Type.Array(EnchantData);
export type Enchants = Static<typeof EnchantsData>;
