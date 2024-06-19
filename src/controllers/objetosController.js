import objetos from "../models/objetosModel.js";
import { response } from "../utils/response.js"; 
import qrcode from 'qrcode';

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
            res.status(404).json({ message: 'Objeto no encontrado' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Algo salió mal' });
    }
};

export const createObjeto = async (req, res) => {
    try {
        const { id_cate, ser_obj, id_amb, fech_adqui, est_obj, obser_obj, tip_obj, marc_obj, val_obj } = req.body;

        const newObjeto = await objetos.create({
            id_cate, ser_obj, id_amb, fech_adqui, est_obj, obser_obj, tip_obj, marc_obj, val_obj,
        });

        if (newObjeto) {
            const qrData = JSON.stringify({ id_obj: newObjeto.id_obj });
            const qrImageBuffer = await qrcode.toBuffer(qrData, { errorCorrectionLevel: 'H' });

            newObjeto.qrimagen = qrImageBuffer;
            await newObjeto.save();

            response(res, 200);
        } else {
            response(res, 500, 500, "Error al crear el objeto");
        }
    } catch (err) {
        console.log(err);
        response(res, 500, 500, "Algo salió mal");
    }
};

export const updateObjeto = async (req, res) => {
    try {
        const { id_obj } = req.params;
        const { id_cate, ser_obj, id_amb, fech_adqui, est_obj, obser_obj, tip_obj, marc_obj, val_obj } = req.body;

        const data = await objetos.findByPk(id_obj);

        if (!data) {
            res.status(404).send("Objeto no existe");
        } else {
            const responses = await objetos.update(
                { id_cate, ser_obj, id_amb, fech_adqui, est_obj, obser_obj, tip_obj, marc_obj, val_obj },
                { where: { id_obj } }
            );

            if (responses) {
                response(res, 200);
            } else {
                res.status(500).send("Error al actualizar");
            }
        }
    } catch (err) {
        console.error(err);
        response(res, 500, 500, "Algo salió mal");
    }
};
