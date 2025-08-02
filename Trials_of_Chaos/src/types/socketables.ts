import { Type, Static } from '@sinclair/typebox';

export const SocketableData = Type.Object({
  id: Type.Number(),
  socketable_name: Type.String(),
  item_slots: Type.String(),
  martial_effect: Type.String(),
  caster_effect: Type.String(),
  sceptre_effect: Type.String(),
  armour_effect: Type.String(),
  helmet_effect: Type.String(),
  body_effect: Type.String(),
  gloves_effect: Type.String(),
  boots_effect: Type.String(),
  socket_type: Type.String(),
});
export type Socketable = Static<typeof SocketableData>;

export const SocketablesData = Type.Array(SocketableData);
export type Socketables = Static<typeof SocketablesData>;
