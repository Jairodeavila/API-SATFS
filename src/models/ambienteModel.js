import { DataTypes } from 'sequelize';
import { connection } from '../database/db.js';
import Centro from './centrosModel.js'

const ambientes = connection.define('Ambiente', {
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
  tableName: 'ambientes', // Corregido a 'ambientes'
  timestamps: false,
});

Centro.hasMany(ambientes, { foreignKey: 'cen_fk' });
ambientes.belongsTo(Centro, { foreignKey: 'cen_fk' });

export default ambientes;
