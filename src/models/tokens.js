import { DataTypes } from "sequelize";
import { connection } from "../database/db";

const token = connection.define('token',{
    id_token: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,

    },
    token: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    fec_caducidad:{
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    user_id_fk:{
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    tipo_token:{
        type: DataTypes.STRING,
        allowNull: false,
    },
    createdAt:{
        type: DataTypes.DATE,
        allowNull: false,
    },
    updatedAt:{
        type: DataTypes.DATE,
        allowNull: false,
    }                                                                                                                                                      
},
{
    tableName: 'token',
});

export default token;