import Detalles from "../models/detallesModel.js";
import { response } from "../utils/response.js";

export const GetAllDetalles = async (req, res) => {
    try {
        const data = await Detalles.findAll();
        if (data) {
            response(res, 200, 200, data);
        } else {
            response(res, 404, 404);
        }
    } catch (err) {
        response(res, 500, 'Algo salio mal ');
    }
}

export const GetDetallesById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await Detalles.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Detalles no encontrado' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Algo salio mal' });
    }
}

// Función para actualizar un registro de detalles 
export const createDetalles = async (req, res) => {
    try {
        const {obj_id, atri_obj ,val_ingre, est_obj, est_plac} = req.body;

    
        const existingDetalles = await Detalles.findOne({ where: { obj_id:obj_id } });

        if (existingDetalles) {
            response(res, 500, 107, "Detalles ya existe");
        } else {
            // Crear nuevo registro de Detalles
            const newDetalles = await Detalles.create({
                
                obj_id:obj_id,
                atri_obj:atri_obj,
                val_ingre:val_ingre,
                est_obj:est_obj,
                est_plac:est_plac
            });

            if (newDetalles) {
                response(res, 200);
            } else {
                response(res, 500, 500, "Error a el crear");
            }
        }
    } catch (err) {
        response(res, 500, 500, "Algo salio mal");
        console.log(err);
    }
};


// Función para actualizar un registro de detalle cambiando su estado
export const updateDetalle = async (req, res) => {
    try {
        const { obj_id } = req.params;
        const { atri_obj, val_ingre, est_obj,est_plac } = req.body;

        // Verificar si existe el detalle
        const data = await Detalles.findByPk(id_inve);

        if (!data) {
            res.status(404).send("Detalle no existe");
        } else {
            // Actualizar el estado del detalle
            const responses = await Detalles.update(
                { atri_obj: atri_obj, val_ingre: val_ingre, est_obj: est_obj,est_plac:est_plac},
                { where: { obj_id: obj_id } }
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
