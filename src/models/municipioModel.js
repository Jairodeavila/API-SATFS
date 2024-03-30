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
    timestamps: false,

});

export default municipio;