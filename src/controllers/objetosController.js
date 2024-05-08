import objetos from "../models/objetosModel.js";
import { response } from "../utils/response.js"; 
export const GetAllObjetos = async (req, res, next) => {
    try {
        const objeto = await objetos.findAll();
        res.status(200).json(objeto);
    } catch (error) {
        next(error );
    }
};

export const GetObjetoById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await objetos.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Objetos no encontrado' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Algo salio mal' });
    }
}

export const createObjeto = async (req, res) => {
    try {
        const {id_cate, ser_obj, id_amb, fech_adqui, est_obj, obser_obj, tip_obj, marc_obj, val_obj  } = req.body;
            // Crear nuevo registro de objeto
            const newObjeto = await objetos.create({
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
                response(res, 500, 500, "Error a el crear");
            }
        
    } catch (err) {
        response(res, 500, 500, "Algo salio mal");
        console.log(err);
    }
};

// Función para actualizar un registro de objeto cambiando su estado
export const updateObjeto = async (req, res) => {
    try {
        const { id_obj } = req.params;
        const { id_cate, ser_obj, id_amb, fech_adqui, est_obj, obser_obj, tip_obj, marc_obj, val_obj } = req.body;

        // Verificar si existe el objeto
        const data = await objetos.findByPk(id_obj);

        if (!data) {
            res.status(404).send("Objeto no existe");
        } else {
            // Actualizar el estado del objetos
            const responses = await objetos.update(
                { id_cate: id_cate, ser_obj: ser_obj, id_amb: id_amb, fech_adqui:fech_adqui, est_obj:est_obj, obser_obj:obser_obj, tip_obj:tip_obj, marc_obj:marc_obj, val_obj:val_obj},
                { where: { id_obj: id_obj } }
            );

            if (responses) {
                response(res, 200);
            } else {
                res.status(500).send("Error a el actualizar");
            }
        }
    } catch (err) {
        console.error(err);
        response(res, 500, 500, "algo salio mal ");
    }
};