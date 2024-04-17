import jsonwebtoken from "jsonwebtoken";
import usuarios from "../models/usuarioModel.js"; // Corregido el error de sintaxis en la importación del modelo
import { response } from "../utils/response.js";
import Token from "../models/tokens.js";
import  'dotenv/config.js';
import bcrypt from "bcrypt";

const jwt = jsonwebtoken;

export const GetAllUsuario = async (req, res, next) => {
    jwt.verify(req.token, process.env.SECREDWORD, async (err, data) => {
        try {
            const data = await usuarios.findAll({
                attributes: { exclude: ['password'] }
            });
            if (data) {
                response(res, 200, 200, data);
            } else {
                response(res, 404, 404);
            }
        } catch (err) {
            response(res, 500, 'something went wrong');
        }
    })
   
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
        
        const { num_doc, nom_fun, ape_fun, car_fun, correo_fun, rol_fun, password, tip_doc, fot_use, est_email_func, tel_fun, id_rol_fk } = req.body;
        const existingUsuario = await usuarios.findOne({ where: { num_doc: num_doc } });
        const passEncripted = await bcrypt.hash(password, 5); 
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
                password: passEncripted,
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

// Función para actualizar un registro de usuario cambiando su estado
export const updateUsuario = async (req, res) => {
    try {
        const { num_doc } = req.params;
        const { nom_fun, ape_fun, car_fun, correo_fun, rol_fun, tip_doc, fot_use, est_email_func, tel_fun, id_rol_fk } = req.body;

        // Verificar si existe el usuario
        const data = await usuarios.findByPk(num_doc);

        if (!data) {
            res.status(404).send("Usuario doesn't exist");
        } else {
            // Actualizar el estado del usuario
            const responses = await usuarios.update(
                { 
                    num_doc: num_doc,
                    nom_fun:nom_fun,
                    ape_fun: ape_fun,
                    car_fun: car_fun,
                    correo_fun: correo_fun,
                    rol_fun: rol_fun,
                    tip_doc: tip_doc,
                    fot_use: fot_use,
                    est_email_func: est_email_func,
                    tel_fun: tel_fun,
                    id_rol_fk: id_rol_fk },
                { where: { num_doc: num_doc } }
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




export const UserLoggingin = async (req, res) => {
    const { correo_fun, password } = req.body;

    try {
        let user = await usuarios.findOne({ where: { correo_fun: correo_fun } });

        if (user) {
            user = user.dataValues;
    
            // Verificar la contraseña
            const passEncripted = await bcrypt.compare(password, user.password); 

            if (passEncripted) {
                const token = await generateAuthToken(correo_fun, password); // Pasar correo_fun y password como parámetros
                console.log(token);
                
                 const decode =  jwt.decode(token,process.env.SECREDWORD)
                console.log(decode);
                await Token.create({
                    fec_caducidad:decode.exp,
                    user_id_fk:user.num_doc,
                    tipo_token:1,
                    token: token
                });

                // Devolver el token en la respuesta
                return res.status(200).json({ token: token });
            } else {
                // Manejar la contraseña incorrecta
                return res.status(401).json({ error: "Contraseña incorrecta" });
            }
        } else {
            // Manejar el usuario no encontrado
            return res.status(404).json({ error: "Usuario no encontrado" });
        }
    } catch (error) {
        // Manejar errores de la base de datos u otros errores
        console.error("Error al iniciar sesión:", error);
        return res.status(500).json({ error: "Error interno del servidor" });
    }
};

export const generateAuthToken = async (correo_fun) => { 
    const secretKey = process.env.SECREDWORD; 
    console.log(secretKey); 
    const payload = {
        correo_fun: correo_fun
        
    }; 

    const token = jwt.sign(payload, secretKey, { expiresIn: '24h' });
    return token;
};

