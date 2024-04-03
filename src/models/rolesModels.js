import { DataTypes } from 'sequelize';
import { connection } from '../database/db.js';

const roles = connection.define('roles', {
    id_Rol: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },
    nom_Rol: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    createdAt: {
        type: DataTypes.DATE,
        allowNull: false,
    },
    updatedAt: {
        type: DataTypes.DATE,
        allowNull: false,
    }
}, {
    tableName: 'roles',
    timestamps: false,
})


connection.sync()
  .then(() => {
    console.log('¡Sincronización exitosa!');
  })
  .catch(err => {
    console.error('Error al sincronizar los modelos con la base de datos:', err);
  });

export default roles;