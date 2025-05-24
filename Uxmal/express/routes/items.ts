import { TypedRouter, ParseRoutes, TypedResponse, TypedRequest } from 'express-typed';
import { getItems } from '../handlers/items.js';

const itemsRouter = new TypedRouter({
    "/items": {
        get: getItems
    },
    });

export default itemsRouter;