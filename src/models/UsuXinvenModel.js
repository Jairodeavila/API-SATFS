import { DataTypes } from 'sequelize';
import { connection } from '../database/db.js';
import usuario from './usuarioModel.js';
import inventario from './inventarioModel.js';

const usuxinven = connection.define('usuxinven', {

    id_fun: {
        type: DataTypes.INTEGER,
        references: {
            model: usuario,
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
    tableName: 'usuxinve',
    timestamps: false,
});

usuario.belongsToMany(inventario, { through: usuxinven, foreignKey: 'id_fun' });
inventario.belongsToMany(usuario, { through: usuxinven, foreignKey: 'id_inve' });

// Sincroniza los modelos con la base de datos
connection.sync()
  .then(() => {
    console.log('¡Sincronización exitosa!');
  })
  .catch(err => {
    console.error('Error al sincronizar los modelos con la base de datos:', err);
  });

export default usuxinven;