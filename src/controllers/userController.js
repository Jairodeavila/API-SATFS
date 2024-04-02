import User from '../models/userModel.js'; // Importa el modelo User

// Función para obtener todos los usuarios
export const getAllUsers = async (req, res, next) => {
  try {
    // Busca todos los usuarios en la base de datos
    const users = await User.findAll();
    res.status(200).json(users); // Devuelve los usuarios en formato JSON
  } catch (error) {
    next(error); // Pasa el error al siguiente middleware
  }
};

