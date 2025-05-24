import { Type, Static } from '@sinclair/typebox';

export const BaseData = Type.Object({
  id: Type.Number(),
  base_name: Type.String(),
  lvl_req: Type.Optional(Type.Number()),
  str_req: Type.Optional(Type.Number()),
  int_req: Type.Optional(Type.Number()),
  dex_req: Type.Optional(Type.Number()),
  armour: Type.Optional(Type.Number()),
  evasion: Type.Optional(Type.Number()),
  energy_shield: Type.Optional(Type.Number()),
  block_chance: Type.Optional(Type.Number()),
  physical_dmg: Type.Optional(Type.String()),
  crit_chance: Type.Optional(Type.String()),
  aps: Type.Optional(Type.String()),
  weapon_range: Type.Optional(Type.String()),
});
export type Base = Static<typeof BaseData>;

export const BasesData = Type.Array(BaseData);
export type Bases = Static<typeof BasesData>;

export const ItemData = Type.Object({
  id: Type.Number(),
  item_name: Type.String(),
  item_class: Type.String(),
  base_type: Type.String(),
  ilvl: Type.Number(),
  enchant: Type.Optional(Type.Union([Type.String(), Type.Null()])),
  sockets: Type.Optional(Type.Number()),
  implicit: Type.Optional(Type.String()),
  prefix1: Type.Optional(Type.String()),
  p1v1: Type.Optional(Type.Number()),
  p1v2: Type.Optional(Type.Number()),
  prefix2: Type.Optional(Type.String()),
  p2v1: Type.Optional(Type.Number()),
  p2v2: Type.Optional(Type.Number()),
  prefix3: Type.Optional(Type.String()),
  p3v1: Type.Optional(Type.Number()),
  p3v2: Type.Optional(Type.Number()),
  suffix1: Type.Optional(Type.String()),
  s1v: Type.Optional(Type.Number()),
  suffix2: Type.Optional(Type.String()),
  s2v: Type.Optional(Type.Number()),
  suffix3: Type.Optional(Type.String()),
  s3v: Type.Optional(Type.Number()),
  corrupted: Type.Optional(Type.Union([Type.Literal(0), Type.Literal(1)])),
  mirrored: Type.Optional(Type.Union([Type.Literal(0), Type.Literal(1)])),
});
export type Item = Static<typeof ItemData>;

export const ItemsData = Type.Array(ItemData);
export type Items = Static<typeof ItemsData>;
