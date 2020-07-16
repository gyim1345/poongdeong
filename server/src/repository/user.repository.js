import userInfoStorage from '../jsonStorage/user.json';
import pool from '../mariadb';
// import { dbconnection } from '../app';

const databaseName = 'userTest';
const tableName = 'users';

const userRepository = {
  async checkPassword(email, password) {
    const dbconnection = await pool.getConnection();
    await dbconnection.query(`USE ${databaseName}`);
    const result = await dbconnection.query(`SELECT * FROM ${tableName} WHERE email = '${email}' AND password = '${password}'`);
    return !!result[0];
  },

  async checkAvailability(email) {
    const dbconnection = await pool.getConnection();
    await dbconnection.query(`USE ${databaseName}`);
    const result = await dbconnection.query(`SELECT * FROM ${tableName} WHERE email = '${email}'`);
    return !!result[0];
  },

  checkNickNameAvailability(nickname) {
    return !userInfoStorage.find((user) => (user.nickname === nickname));
  },
};

module.exports = userRepository;
