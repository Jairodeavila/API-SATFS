import { DataTypes } from 'sequelize';
import { connection } from '../database/db.js';
import funcionario from './funcionarioModel.js';
import inventario from './inventarioModel.js';

const funxinven = connection.define('funxinven',{

    id_fun:{
        type: DataTypes.INTEGER,
        allowNull: true,
    },
    id_inve:{
        type: DataTypes.INTEGER,
        allowNull: true,
    }

},{
    tableName: 'funxinven',
    timestamps: false,
});

funcionario.belongsToMany(inventario, { through: 'funxinven', foreignKey: 'id_fun' });
inventario.belongsToMany(funcionario, { through: 'funxinven', foreignKey: 'id_inve' });

export default funxinven;