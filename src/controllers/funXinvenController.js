import funxinven from "../models/funXinvenModel.js"; // Corrige la nomenclatura del modelo
import { response } from "../utils/response.js";

// Función para obtener todos los centros
export const GetAllFunxInven = async (req, res) => {
  try {
      const data = await funxinven.findAll();
      if (data) {
          response(res, 200, 200, data);
      } else {
          response(res, 404, 404);
      }
  } catch (err) {
      response(res, 500, 'something went wrong');
  }
}


export const GetFunxInvenById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await funxinven.findByPk(id);
  
        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Ambiente not found' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Something went wrong' });
    }
  }