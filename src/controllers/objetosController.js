import objetos from "../models/objetosModel.js";
import { response } from "../utils/response.js"; 
export const GetAllObjetos = async (req, res, next) => {
    try {
        const objeto = await objetos.findAll();
        res.status(200).json(objeto);
    } catch (error) {
        next(error);
    }
};

export const GetObjetoById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await objetos.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Objetos not found' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Something went wrong' });
    }
}

export const createObjeto = async (req, res) => {
    try {
        const {id_obj, id_cate, ser_obj, id_amb, fech_adqui, est_obj, obser_obj, tip_obj, marc_obj, val_obj  } = req.body;

    
        const existingObjeto = await objetos.findOne({ where: { id_obj: id_obj } });

        if (existingObjeto) {
            response(res, 500, 107, "Objeto already exists");
        } else {
            // Crear nuevo registro de objeto
            const newObjeto = await objetos.create({
                id_obj: id_obj,
                id_cate:id_cate,
                ser_obj:ser_obj,
                id_amb:id_amb,
                fech_adqui:fech_adqui,
                est_obj:est_obj,
                obser_obj:obser_obj,
                tip_obj:tip_obj,
                marc_obj:marc_obj,
                val_obj:val_obj,
            });

            if (newObjeto) {
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