import { DataTypes } from 'sequelize';
import { connection } from '../database/db.js'; // Importa la instancia de Sequelize

const User = connection.define('User', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  username: {
    type: DataTypes.STRING,
    allowNull: false
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false
  },
  apellido: {
    type: DataTypes.STRING, 
    allowNull: true
  },
  telefono: {
    type: DataTypes.STRING,
    allowNull: true
  }
}, {
  tableName: 'users', // Nombre de la tabla en la base de datos
  timestamps: false // Desactiva los campos createdAt y updatedAt
});

export default User;
