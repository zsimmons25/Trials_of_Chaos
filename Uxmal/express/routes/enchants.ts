import { TypedRouter, ParseRoutes, TypedResponse, TypedRequest } from 'express-typed';
import { getEnchants } from '../handlers/enchants.js';

const enchantsRouter = new TypedRouter({
    "/enchants": {
        get: getEnchants
    },
    });

export default enchantsRouter;