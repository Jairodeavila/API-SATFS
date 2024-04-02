import { DataTypes } from 'sequelize';
import { connection } from '../database/db.js';

const municipio = connection.define('Municipo', {
    id_muni: {
        type: DataTypes.STRING,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },
    nom_muni: {
        type: DataTypes.STRING,
        allowNull: false,
    }

}, {
    tableName: 'municipio',
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

export default municipio;