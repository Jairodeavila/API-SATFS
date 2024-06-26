import InventariObj from "../models/detalleInvenModel.js";
import { response } from "../utils/response.js";

export const GetAllDetalleInve = async (req, res) => {
    try {
        const data = await InventariObj.findAll();
        if (data) {
            response(res, 200, 200, data);
        } else {
            response(res, 404, 404);
        }
    } catch (err) {
        response(res, 500, 'Algo salio mal');
    }
}

export const GetDetalleInveById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await InventariObj.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Detalleinventario no encontrado' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Algo salio mal ' });
    }
}

export const createDetalleInve = async (req, res) => {
    try{
        const{id_inv, id_obj}=req.body;

        const existingDetalleInve = await InventariObj.findOne({where:{id_inv:id_inv}});
        if (existingDetalleInve) {
            response(res, 500, 107, "DetalleInventario ya existe");
        } else {
            // Crear nuevo registro de inventario
            const newDetalleInve = await InventariObj.create({
                id_inv: id_inv,
                id_obj: id_obj
            });
            if (newDetalleInve) {
                response(res, 200, 200);
            } else {
                response(res, 500, 500,"Error a el crear");
            }
        }
    } catch (err){
        response(res, 500, 500, "Algo salio mal");
        console.log(err);
    }
};

// Función para actualizar un registro de detalleinven cambiando su estado
export const updateDetalleInven = async (req, res) => {
    try {
        const { id_inv } = req.params;
        const { id_obj } = req.body;

        // Verificar si existe el detalleinven
        const data = await InventariObj.findByPk(id_inv);

        if (!data) {
            res.status(404).send("Detalleinventario no existe");
        } else {
            // Actualizar el estado del detalleinven
            const responses = await InventariObj.update(
                { id_obj: id_obj },
                { where: { id_inv: id_inv } }
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
