import express from 'express';
import route from './routes';

const app = express();
app.use(express.json());

require('dotenv').config({ path: '/workspace/poongdeong/server/src/.env' });

const mariadb = require('mariadb');

const pool = mariadb.createConnection({
  host: process.env.HOST,
  user: process.env.USER,
  password: process.env.PASSWORD,
  port: 3306,
  database: process.env.DATABASE,
});
// console.log(host )
// async function asyncFunction() {
//   let conn;
//   try {
// 	conn = await pool.getConnection();
// 	const rows = await conn.query("SELECT 1 as val");
// 	console.log(rows); //[ {val: 1}, meta: ... ]
// 	const res = await conn.query("INSERT INTO myTable value (?, ?)", [1, "mariadb"]);
// 	console.log(res); // { affectedRows: 1, insertId: 1, warningStatus: 0 }

//   } catch (err) {
// 	throw err;
//   } finally {
// 	if (conn) return conn.end();
//   }
// }

app.get('/', (req, res) => {
  res.status(200).send({ message: 'Hello world!' });
});

app.use(route);

export default app;
