import { Type, Static } from '@sinclair/typebox';

export const BaseData = Type.Object({
  base_name: Type.String(),
  item_class: Type.String(),
  lvl_req: Type.Union([Type.Number(), Type.Null()]),
  str_req: Type.Union([Type.Number(), Type.Null()]),
  int_req: Type.Union([Type.Number(), Type.Null()]),
  dex_req: Type.Union([Type.Number(), Type.Null()]),
  armour: Type.Union([Type.Number(), Type.Null()]),
  evasion: Type.Union([Type.Number(), Type.Null()]),
  energy_shield: Type.Union([Type.Number(), Type.Null()]),
  block_chance: Type.Union([Type.Number(), Type.Null()]),
  physical_dmg: Type.Union([Type.String(), Type.Null()]),
  crit_chance: Type.Union([Type.String(), Type.Null()]),
  aps: Type.Union([Type.String(), Type.Null()]),
  weapon_range: Type.Union([Type.String(), Type.Null()]),
  implicit: Type.Union([Type.String(), Type.Null()]),
  item_tags: Type.String(),
  active: Type.Optional(Type.Union([Type.Literal(0), Type.Literal(1)])),
});
export type Base = Static<typeof BaseData>;

export const BasesData = Type.Array(BaseData);
export type Bases = Static<typeof BasesData>;

export const ItemData = Type.Object({
  id: Type.Number(),
  item_name: Type.String(),
  base_type: Type.String(),
  quality: Type.Number(),
  ilvl: Type.Number(),
  enchant: Type.Union([Type.String(), Type.Null()]),
  sockets: Type.Union([Type.Number(), Type.Null()]),
  implicit: Type.Number(),
  prefix1: Type.Union([Type.String(), Type.Null()]),
  p1v1: Type.Union([Type.Number(), Type.Null()]),
  p1v2: Type.Union([Type.Number(), Type.Null()]),
  p1v3: Type.Union([Type.Number(), Type.Null()]),
  prefix2: Type.Union([Type.String(), Type.Null()]),
  p2v1: Type.Union([Type.Number(), Type.Null()]),
  p2v2: Type.Union([Type.Number(), Type.Null()]),
  p2v3: Type.Union([Type.Number(), Type.Null()]),
  prefix3: Type.Union([Type.String(), Type.Null()]),
  p3v1: Type.Union([Type.Number(), Type.Null()]),
  p3v2: Type.Union([Type.Number(), Type.Null()]),
  p3v3: Type.Union([Type.Number(), Type.Null()]),
  suffix1: Type.Union([Type.String(), Type.Null()]),
  s1v: Type.Union([Type.Number(), Type.Null()]),
  suffix2: Type.Union([Type.String(), Type.Null()]),
  s2v: Type.Union([Type.Number(), Type.Null()]),
  suffix3: Type.Union([Type.String(), Type.Null()]),
  s3v: Type.Union([Type.Number(), Type.Null()]),
  corrupted: Type.Optional(Type.Union([Type.Literal(0), Type.Literal(1)])),
  mirrored: Type.Optional(Type.Union([Type.Literal(0), Type.Literal(1)])),
  rarity: Type.String(),
});
export type Item = Static<typeof ItemData>;

export const ItemsData = Type.Array(ItemData);
export type Items = Static<typeof ItemsData>;
