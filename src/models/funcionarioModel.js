import { DataTypes } from "sequelize";
import { connection } from "../database/db.js";

const funcionario = connection.define('Funcionario',{
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
  }

},{
  tableName: 'funcionario',
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

export default funcionario;