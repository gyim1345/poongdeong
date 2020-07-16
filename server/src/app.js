import express from 'express';
import route from './routes';

import pool from './mariadb';

// require('dotenv').config();
// console.log(process.env.DBHOST, "asd");
// console.log(process.env.DATABASE);
// console.log(process.env.DBPASSWORD);
// console.log(process.env.DBUSER);

const app = express();
app.use(express.json());

export const dbconnection = pool.getConnection();
app.get('/', (req, res) => {
  res.status(200).send({ message: 'Hello world!' });
});

app.use(route);

export default app;
