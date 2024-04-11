import usuarios from "../models/usuarioModel.js"; // Corregido el error de sintaxis en la importación del modelo
import { response } from "../utils/response.js";

export const GetAllUsuario = async (req, res, next) => {
    try {
        const data = await usuarios.findAll();
        if (data) {
            response(res, 200, 200, data);
        } else {
            response(res, 404, 404);
        }
    } catch (err) {
        response(res, 500, 'something went wrong');
    }
};


export const GetUsuarioById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await usuarios.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Funcionario not found' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Something went wrong' });
    }
}

export const createUsuario = async (req, res) => {
    try {
        const { num_doc, nom_fun, ape_fun, car_fun, correo_fun, rol_fun, contra, tip_doc, fot_use, est_email_func, tel_fun, id_rol_fk } = req.body;
        const existingUsuario = await usuarios.findOne({ where: { num_doc: num_doc } });

        if (existingUsuario) {
            response(res, 500, 107, "Usuario already exists");
        } else {
            // Crear nuevo registro de usuario
            const newUsuario = await usuarios.create({
                num_doc: num_doc,
                nom_fun:nom_fun,
                ape_fun: ape_fun,
                car_fun: car_fun,
                correo_fun: correo_fun,
                rol_fun: rol_fun,
                contra: contra,
                tip_doc: tip_doc,
                fot_use: fot_use,
                est_email_func: est_email_func,
                tel_fun: tel_fun,
                id_rol_fk: id_rol_fk


            });

            if (newUsuario) {
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