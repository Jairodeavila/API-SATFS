import { DataTypes } from 'sequelize';
import { connection } from '../database/db.js';

const ambientes = connection.define('ambientes', {
  amb_id:{
    type: DataTypes.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true,
  },
  nom_amb:{
    type: DataTypes.STRING,
    allowNull: false,
  },
  cen_fk: {
    type: DataTypes.INTEGER,
    allowNull: true,
  }
  
},{
  tableName: 'centros',
  timestamps: false,
});

export default ambientes;
