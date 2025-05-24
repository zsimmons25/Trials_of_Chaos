import { TypedRouter, ParseRoutes, TypedResponse, TypedRequest } from 'express-typed';
import { getAffixes } from '../handlers/affixes.js';

const affixesRouter = new TypedRouter({
    "/affixes": {
        get: getAffixes
    },
    });

export default affixesRouter;