import inventario from '../models/inventarioModel.js';
import { response } from "../utils/response.js";
export const GetAllInventario = async (req, res) => {
    try {
        const data = await inventario.findAll();
        if (data) {
            response(res, 200, 200, data);
        } else {
            response(res, 404, 404);
        }
    } catch (err) {
        response(res, 500, 'Algo salio mal');
    }
}

export const GetInventarioById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await inventario.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Inventario no encontrado' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Algo salio mal' });
    }
}


export const createInventario = async (req, res) => {
    try {
        const { id_inve, fech_inve, Obs_inve, Est_inve } = req.body;

    
        const existingInventario = await inventario.findOne({ where: { id_inve: id_inve } });

        if (existingInventario) {
            response(res, 500, 107, "Inventario ya existe");
        } else {
            // Crear nuevo registro de inventario
            const newInventario = await inventario.create({
                id_inve: id_inve,
                fech_inve:fech_inve,
                Obs_inve: Obs_inve,
                Est_inve: Est_inve,
            });

            if (newInventario) {
                response(res, 200);
            } else {
                response(res, 500, 500, "Error a el crear");
            }
        }
    } catch (err) {
        response(res, 500, 500, "Algo salio mal ");
        console.log(err);
    }
};


// Función para actualizar un registro de inventario cambiando su estado
export const updateInventario = async (req, res) => {
    try {
        const { id_inve } = req.params;
        const { fech_inve, Obs_inve, Est_inve } = req.body;

        // Verificar si existe el inventario
        const data = await inventario.findByPk(id_inve);

        if (!data) {
            res.status(404).send("Inventario no existe");
        } else {
            // Actualizar el estado del inventario
            const responses = await inventario.update(
                { fech_inve: fech_inve, Obs_inve: Obs_inve, Est_inve: Est_inve },
                { where: { id_inve: id_inve } }
            );

            if (responses) {
                response(res, 200);
            } else {
                res.status(500).send("Error a el actualizar");
            }
        }
    } catch (err) {
        console.error(err);
        response(res, 500, 500, "Algo salio mal");
    }
};


// Función para eliminar un registro de inventario cambiando su estado
export const deleteInventarioEstado = async (req, res) => {
    try {
        const { id } = req.params;

        // Verificar si existe el inventario
        const inventario = await Inventario.findByPk(id);

        if (!inventario) {
            response(res, 404, 404, "Inventario no existe");
        } else {
            // Cambiar el estado del inventario a un estado eliminado
            const response = await inventario.update({ Est_inve: 'Eliminado' });

            if (response) {
                response(res, 200);
            } else {
                response(res, 500, 500, "Error a el eliminar");
            }
        }
    } catch (err) {
        response(res, 500, 500, "Algo salio mal");
        console.log(err);
    }
};
