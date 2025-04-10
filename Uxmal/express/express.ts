import { config } from 'dotenv';
config({ path: 'express/.env' });
import express from 'express';
import { TypedRouter, ParseRoutes } from 'express-typed';
import cors from 'cors';

const app = express();

const PORT = `${process.env.port_}`

const typedRouter = new TypedRouter({
"/": {
    get: (req, res) => {
    return res.send("Hello World!").status(200);
    },
    post: (req, res) => {
    return res.send(req.body).status(200);
    },
},
});

app.use(cors());
app.use(typedRouter.router);

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });