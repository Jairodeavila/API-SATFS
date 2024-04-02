import { DataTypes } from 'sequelize';
import { connection } from '../database/db.js';
import Centro from './centrosModel.js'

const Ambiente = connection.define('Ambiente', {
  amb_id:{
    type: DataTypes.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true,
  },
  nom_amb:{
    type: DataTypes.STRING,
    allowNull: false,
  },
  cen_fk: {
    type: DataTypes.INTEGER,
    allowNull: true,
  }
  
},{
  tableName: 'ambientes',
  timestamps: false,
});

Centro.hasMany(Ambiente, { foreignKey: 'cen_fk' });
Ambiente.belongsTo(Centro, { foreignKey: 'cen_fk' });

connection.sync()
  .then(() => {
    console.log('¡Sincronización exitosa!');
  })
  .catch(err => {
    console.error('Error al sincronizar los modelos con la base de datos:', err);
  });

export default Ambiente;
