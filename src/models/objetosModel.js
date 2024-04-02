import { DataTypes } from 'sequelize';
import { connection } from '../database/db.js';

const objetos = connection.define('Objetos', {
    id_obj: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,

    },
    id_cate:{
        type: DataTypes.INTEGER,
        allowNull: true,
    },
    ser_obj:{
        type: DataTypes.STRING,
        allowNull: false,
    },
    id_amb:{
        type: DataTypes.INTEGER,
        allowNull: true,
    },
    fech_adqui:{
        type: DataTypes.DATE,
        allowNull: true,
    },
    est_obj:{
        type: DataTypes.STRING,
        allowNull: false,
    },
    obser_obj:{
        type: DataTypes.STRING,
        allowNull: false,
    },
    tip_obj:{
        type: DataTypes.STRING,
        allowNull: false,
    },
    marc_obj:{
        type: DataTypes.STRING,
        allowNull: false,
    },
    val_obj:{
        type: DataTypes.BIGINT,
        allowNull: false,
    }
},{
    tableName: 'objetos',
    timestamps: false,
});

export default objetos;