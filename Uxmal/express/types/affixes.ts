import { Type, Static } from '@sinclair/typebox';

export const AffixData = Type.Object({
    id: Type.String(),
    affix_name: Type.String(),
    ilvl: Type.Number(),
    clvl: Type.Number(),
    effect: Type.String(),
    item_tags: Type.String(),
    craft_tags: Type.Union([Type.String(), Type.Null()]),
    weighting: Type.Number(),
    family: Type.String(),
    affix_type: Type.String()
  });
export type Affix = Static<typeof AffixData>;

export const AffixesData = Type.Array(AffixData);
export type Affixes = Static<typeof AffixesData>;