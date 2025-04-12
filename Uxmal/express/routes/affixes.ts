import { TypedRouter, ParseRoutes, TypedResponse, TypedRequest } from 'express-typed';
import { getModifiers } from '../handlers/modifiers.ts';

const affixesRouter = new TypedRouter({
    "/affixes": {
        get: (req: TypedRequest, res: TypedResponse) => {
        return getModifiers(req, res);
        },
        post: (req: TypedRequest, res: TypedResponse) => {
        return res.send(req.body).status(200);
        }
    },
    });

export default affixesRouter;