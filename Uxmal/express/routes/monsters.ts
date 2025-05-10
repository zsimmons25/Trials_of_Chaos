import { TypedRouter } from 'express-typed';
import { getMonsters } from '../handlers/monsters.js';

const monstersRouter = new TypedRouter({
  '/monsters': {
    get: getMonsters
  }
});

export default monstersRouter;