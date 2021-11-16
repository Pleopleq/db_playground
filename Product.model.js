const Sequelize = require("sequelize");
const db = require("./db");

const Product = db.define("product", {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  name: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  barCode: {
    type: Sequelize.INTEGER,
    allowNull: false,
  },
});

module.exports = Product