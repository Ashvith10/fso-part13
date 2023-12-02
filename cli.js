import dotenv from 'dotenv';
import { Sequelize, QueryTypes } from 'sequelize';

dotenv.config();

const sequelize = new Sequelize(process.env.DATABASE_URL);

const main = async () => {
  try {
    const blogs = await sequelize.query(
        "SELECT * FROM blogs",
        { type: QueryTypes.SELECT }
    );
    blogs.forEach(({author, title, likes}) => {
      console.log(`${author}: '${title}', ${likes} likes`);
    });
    sequelize.close();
  } catch (error) {
    console.log('Unable to connect to the database:', error);
  }
};

main();
