import { DataTypes } from 'sequelize';
import { connection } from '../database/db.js';

const inventario = connection.define('inventario',{
    id_inve:{
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },

    fech_inve:{
        type: DataTypes.DATE,
        allowNull: false,
    },

    Obs_inve:{
        type: DataTypes.STRING,
        allowNull: false,
    },

    Est_inve:{
        type: DataTypes.STRING,
        allowNull: false,
    }
},{
    tableName: 'inventario',
    timestamps: false,
});

// Sincroniza los modelos con la base de datos
connection.sync()
  .then(() => {
    console.log('¡Sincronización exitosa!');
  })
  .catch(err => {
    console.error('Error al sincronizar los modelos con la base de datos:', err);
  });

export default inventario;