import { DataTypes } from 'sequelize';
import { connection } from '../database/db.js'; // Importa la instancia de Sequelize

const Centro = connection.define('Centro', {
  cen_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  nom_centro: {
    type: DataTypes.STRING(100),
    allowNull: true
  },
  dir_centro: {
    type: DataTypes.STRING(50),
    allowNull: true
  },
  tel_centro: {
    type: DataTypes.STRING(15),
    allowNull: true
  },
  sub_dir_nom: {
    type: DataTypes.STRING(30),
    allowNull: true
  },
  muni_idFK: {
    type: DataTypes.STRING(20),
    allowNull: true
  }
},{
  tableName: 'centros',
  timestamps: false,
});


export default Centro;
