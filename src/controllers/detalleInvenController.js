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
        response(res, 500, 'something went wrong');
    }
}

export const GetDetalleInveById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await InventariObj.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'categoria  not found' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Something went wrong' });
    }
}

export const createDetalleInve = async (req, res) => {
    try{
        const{id_inv, id_obj}=req.body;

        const existingDetalleInve = await InventariObj.findOne({where:{id_inv:id_inv}});
        if (existingDetalleInve) {
            response(res, 500, 107, "DetalleInventario already exists");
        } else {
            // Crear nuevo registro de inventario
            const newDetalleInve = await InventariObj.create({
                id_inv: id_inv,
                id_obj: id_obj
            });
            if (newDetalleInve) {
                response(res, 200, 200);
            } else {
                response(res, 500, 500,"Error creating");
            }
        }
    } catch (err){
        response(res, 500, 500, "Something went wrong");
        console.log(err);
    }
};