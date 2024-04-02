import { DataTypes } from "sequelize";
import { connection } from "../database/db";
import inventario from "./inventarioModel";
import objetos from "./objetosModel";


const InventariObj = connection.define('InventariObj',
{
    id_inve: 
    {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    id_obj:
     { 
        type: DataTypes.INTEGER, 
        allowNull: false
    }

},{
    tableName: 'InventariObj',
    timestamps: false,
});

inventario.belongsToMany(objetos, {through: InventariObj, foreignKey: 'id_obj'});
objetos.belongsToMany(inventario, {through: InventariObj, foreignKey:'id_inve'});

// Sincroniza los modelos con la base de datos
connection.sync()
  .then(() => {
    console.log('¡Sincronización exitosa!');
  })
  .catch(err => {
    console.error('Error al sincronizar los modelos con la base de datos:', err);
  });

export default InventariObj;