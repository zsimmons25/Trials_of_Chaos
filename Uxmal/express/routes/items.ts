import { TypedRouter, ParseRoutes, TypedResponse, TypedRequest } from 'express-typed';
import { createItem, getItems } from '../handlers/items.js';

const itemsRouter = new TypedRouter({
    "/items": {
        get: getItems,
        post: createItem
    },
    });

export default itemsRouter;