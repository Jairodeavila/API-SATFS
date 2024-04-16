import { DataTypes } from "sequelize";
import { connection } from "../database/db.js";
import usuarios from "./usuarioModel.js";

const Token = connection.define('token',{
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

usuarios.hasMany(Token, { foreignKey: 'user_id_fk' });
Token.belongsTo(usuarios, { foreignKey: 'user_id_fk' });

export default Token;