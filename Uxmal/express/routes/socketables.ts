import { TypedRouter, ParseRoutes, TypedResponse, TypedRequest } from 'express-typed';
import { getSocketables } from '../handlers/socketables.js';

const socketablesRouter = new TypedRouter({
    "/socketables": {
        get: getSocketables
    },
    });

export default socketablesRouter;