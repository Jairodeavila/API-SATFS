import { DataTypes } from "sequelize";
import { connection } from "../database/db.js";

const usuario = connection.define('usuario',{
  num_doc:{
    type: DataTypes.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true,
  },

  nom_fun:{
    type: DataTypes.STRING,
    allowNull: false,
  },

  ape_fun:{
    type: DataTypes.STRING,
    allowNull: false,
  },
  car_fun:{
    type: DataTypes.STRING,
    allowNull: false,
  },
  correo_fun:{
    type: DataTypes.STRING,
    allowNull: false,
  },
  rol_fun:{
    type: DataTypes.STRING,
    allowNull: false,
  },
  contra:{
    type: DataTypes.STRING,
    allowNull: false,
  },
  tip_doc:{
    type: DataTypes.STRING,
    allowNull: false,
  },
  fot_use:{
    type: DataTypes.STRING,
    allowNull: false,
  },
  est_email_func:{
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  tel_fun:{
    type: DataTypes.STRING,
    allowNull: false,
  },
  id_rol_fk:{
    type: DataTypes.INTEGER,
    allowNull: false,
  },

},{
  tableName: 'usuario',
  timestamps: false,
});
connection.sync()
  .then(() => {
    console.log('¡Sincronización exitosa!');
  })
  .catch(err => {
    console.error('Error al sincronizar los modelos con la base de datos:', err);
  });

export default usuario;