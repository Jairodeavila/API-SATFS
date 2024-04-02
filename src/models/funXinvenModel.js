import { DataTypes } from 'sequelize';
import { connection } from '../database/db.js';
import funcionario from './funcionarioModel.js';
import inventario from './inventarioModel.js';

const funxinven = connection.define('funxinven', {

    id_fun: {
        type: DataTypes.INTEGER,
        references: {
            model: funcionario,
            key: 'num_doc',
        },
    },
    id_inve: {
        type: DataTypes.INTEGER,
        references: {
            model: inventario,
            key: 'id_inve',
        },
    }

}, {
    tableName: 'funxinve',
    timestamps: false,
});

funcionario.belongsToMany(inventario, { through: funxinven, foreignKey: 'id_fun' });
inventario.belongsToMany(funcionario, { through: funxinven, foreignKey: 'id_inve' });

// Sincroniza los modelos con la base de datos
connection.sync()
  .then(() => {
    console.log('¡Sincronización exitosa!');
  })
  .catch(err => {
    console.error('Error al sincronizar los modelos con la base de datos:', err);
  });

export default funxinven;