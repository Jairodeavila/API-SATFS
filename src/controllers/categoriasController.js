import Categoria from "../models/categoriasModel.js";
import { response } from "../utils/response.js";

export const GetAllAmbientes = async (req, res) => {
    try {
        const data = await Categoria.findAll();
        if (data) {
            response(res, 200, 200, data);
        } else {
            response(res, 404, 404);
        }
    } catch (err) {
        response(res, 500, 'something went wrong');
    }
}

export const GetAmbientesById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await Categoria.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'categoria  not found' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Something went wrong' });
    }
}
