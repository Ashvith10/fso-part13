import { Sequelize } from 'sequelize';
import { DATABASE_URL } from './config.js';

const sequelize = new Sequelize(DATABASE_URL);

const connectToDatabase = async () => {
  try {
    await sequelize.authenticate();
    console.log('Connected to the database');
  } catch (err) {
    console.log('Failed to connect to the database');
    process.exit(1);
  }
};

export { connectToDatabase, sequelize };
