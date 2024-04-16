import usuxinven from "../models/UsuXinvenModel.js"; // Corrige la nomenclatura del modelo
import { response } from "../utils/response.js";

export const GetAllusuxinven = async (req, res) => {
    try {
        const data = await usuxinven.findAll();
        if (data) {
            response(res, 200, 200, data);
        } else {
            response(res, 404, 404);
        }
    } catch (err) {
        response(res, 500, 'something went wrong');
    }
};

export const GetusuxinvenById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await usuxinven.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Funxinven not found' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Something went wrong' });
    }
}


export const createUsuXinve = async (req, res) => {
    try {
        const { id_fun, id_inve } = req.body;

    
        const existingUsuXinve = await usuxinven.findOne({ where: { id_fun: id_fun } });

        if (existingUsuXinve) {
            response(res, 500, 107, "UsuXinve already exists");
        } else {
            // Crear nuevo registro de usuxinven
            const newUsuXinve = await usuxinven.create({
                id_fun: id_fun,
                id_inve:id_inve,
                
            });

            if (newUsuXinve) {
                response(res, 200);
            } else {
                response(res, 500, 500, "Error creating");
            }
        }
    } catch (err) {
        response(res, 500, 500, "Something went wrong");
        console.log(err);
    }
};

// Función para actualizar un registro de usuxinven cambiando su estado
export const updateUsuXinven = async (req, res) => {
    try {
        const { id_fun } = req.params;
        const { id_inve } = req.body;

        // Verificar si existe el usuxinven
        const data = await usuxinven.findByPk(id_fun);

        if (!data) {
            res.status(404).send("Usuxinven doesn't exist");
        } else {
            // Actualizar el estado del usuxinven
            const responses = await usuxinven.update(
                { id_inve:id_inve },
                { where: { id_fun: id_fun } }
            );

            if (responses) {
                response(res, 200);
            } else {
                res.status(500).send("Error updating");
            }
        }
    } catch (err) {
        console.error(err);
        response(res, 500, 500, "Something went wrong");
    }
};