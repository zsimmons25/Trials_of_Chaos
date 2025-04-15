import { Type, Static } from '@sinclair/typebox';

export const ModifierData = Type.Object({
  id: Type.Number(),
  name: Type.String(),
  stages: Type.Number(),
  stage1: Type.Union([Type.Boolean(), Type.Literal(0), Type.Literal(1)]),
  stage2: Type.Union([Type.Boolean(), Type.Literal(0), Type.Literal(1)]),
  stage3: Type.Union([Type.Boolean(), Type.Literal(0), Type.Literal(1)]),
  description1: Type.String(),
  description2: Type.Optional(Type.String()),
  description3: Type.Optional(Type.String()),
  active: Type.Union([Type.Boolean(), Type.Literal(0), Type.Literal(1)]),
  imgurl: Type.String(),
});
export type Modifier = Static<typeof ModifierData>;

export const ModifiersData = Type.Array(ModifierData);
export type Modifiers = Static<typeof ModifiersData>;
