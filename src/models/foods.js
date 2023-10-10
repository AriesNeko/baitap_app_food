import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class foods extends Model {
  static init(sequelize, DataTypes) {
  return super.init({
    food_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    food_name: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    food_image: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    food_price: {
      type: DataTypes.FLOAT,
      allowNull: false
    },
    food_desc: {
      type: DataTypes.STRING(250),
      allowNull: true
    },
    type_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'food_types',
        key: 'type_id'
      }
    }
  }, {
    sequelize,
    tableName: 'foods',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "food_id" },
        ]
      },
      {
        name: "type_id",
        using: "BTREE",
        fields: [
          { name: "type_id" },
        ]
      },
    ]
  });
  }
}
