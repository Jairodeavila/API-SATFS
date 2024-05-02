import { DataTypes } from "sequelize";
import { connection } from "../database/db.js";

const Categoria = connection.define('Categoria', {
    id_cate:{
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
    },
    nom_cate:{
        type: DataTypes.STRING,
        allowNull: false,
    },
},{
    tableName: 'categoria', // Cambiado a 'categoria' en minúsculas y en singular
    timestamps: false, // No se agregan automáticamente createdAt y updatedAt
});

// Sincroniza los modelos con la base de datos
connection.sync()
  .then(() => {
    console.log('¡Sincronización exitosa!');
  })
  .catch(err => {
    console.error('Error al sincronizar los modelos con la base de datos:', err);
  });

export default Categoria;

