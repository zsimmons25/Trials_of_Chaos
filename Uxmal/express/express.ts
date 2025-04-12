import { config } from 'dotenv';
config({ path: 'express/.env' });
import express from 'express';
import cors from 'cors';
import modifiersRouter from './routes/modifiers.ts';
import affixesRouter from './routes/affixes.ts';

const app = express();

const PORT = `${process.env.port_}`;

const corsOptions = {
  origin: process.env.CORS_ORIGIN
};
app.use(cors(corsOptions));

app.use(modifiersRouter.router);
app.use(affixesRouter.router);

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});