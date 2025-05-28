import { config } from 'dotenv';
config({ path: 'express/.env' });
import express from 'express';
import cors from 'cors';
import modifiersRouter from './routes/modifiers.js';
import monstersRouter from './routes/monsters.js';
import affixesRouter from './routes/affixes.js';
import itemsRouter from './routes/items.js';

const app = express();

const PORT = `${process.env.port_}`;

const corsOptions = {
  origin: process.env.CORS_ORIGIN?.split(',') || []
};
app.use(cors(corsOptions));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(modifiersRouter.router);
app.use(monstersRouter.router);
app.use(affixesRouter.router);
app.use(itemsRouter.router);

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});