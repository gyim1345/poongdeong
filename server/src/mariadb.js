import mariadb from 'mariadb';

require('dotenv').config({ path: '/workspace/poongdeong/server/src/.env' });

const pool = mariadb.createPool({
  host: process.env.DBHOST,
  user: process.env.DBUSER,
  password: process.env.DBPASSWORD,
});

module.exports = pool;
