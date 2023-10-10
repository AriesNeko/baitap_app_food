import dotenv from "dotenv";

dotenv.config();

export default {
  DATABASE: process.env.DB_DATABASE,
  USER: process.env.DB_USER,
  HOST: process.env.DB_HOST,
  PASSWORD: process.env.DB_PASSWORD,
  PORT: process.env.DB_PORT,
  DIALECT: process.env.DB_DIALECT,
};
