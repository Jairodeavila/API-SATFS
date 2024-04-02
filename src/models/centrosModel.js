import { DataTypes } from 'sequelize';
import { connection } from '../database/db.js'; // Importa la instancia de Sequelize
import ambientes from './ambienteModel.js';

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
  timestamps: true,
});

// Sincroniza los modelos con la base de datos
connection.sync()
  .then(() => {
    console.log('¡Sincronización exitosa!');
  })
  .catch(err => {
    console.error('Error al sincronizar los modelos con la base de datos:', err);
  });

export default Centro;
