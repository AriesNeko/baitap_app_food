import { Sequelize } from "sequelize";
import config from "../config/config.js";

const sequelize = new Sequelize(config.DATABASE, config.USER, config.PASSWORD, {
  host: config.HOST,
  port: config.PORT,
  dialect: config.DIALECT,
});

export default sequelize;
