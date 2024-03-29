import Centro from '../models/centrosModel.js'; // Importa el modelo de centros

// Función para obtener todos los centros
const getAllCentros = async (req, res, next) => {
  try {
    // Busca todos los centros en la base de datos
    const centros = await Centro.findAll();
    
    // Envía la respuesta con los centros encontrados
    res.status(200).json(centros);
  } catch (error) {
    // Manejo de errores
    next(error);
  }
};

export { getAllCentros };
