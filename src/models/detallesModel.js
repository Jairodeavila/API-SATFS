import { DataTypes } from "sequelize";
import { connection } from "../database/db";

const Detalles = connection.define('Detalles',{
    obj_id:{
        type: DataTypes.INTEGER,
        autoIncrement: false,
        allowNull: false,
    },
    atri_obj: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    val_ingredient: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    est_obj: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    est_plac: {
        type: DataTypes.STRING,
        allowNull: false,
    },
},{
    tableName: 'ambientes',
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

export default Detalles;
