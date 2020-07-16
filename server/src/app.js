import express from 'express';
import route from './routes';

import pool from './mariadb';

const app = express();
app.use(express.json());

pool.getConnection();

app.get('/', (req, res) => {
  res.status(200).send({ message: 'Hello world!' });
});

app.use(route);

export default app;
