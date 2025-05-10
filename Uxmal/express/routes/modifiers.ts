import { TypedRouter } from 'express-typed';
import { getModifiers } from '../handlers/modifiers.js';

const modifiersRouter = new TypedRouter({
  '/modifiers': {
    get: getModifiers,
  }
});

export default modifiersRouter;