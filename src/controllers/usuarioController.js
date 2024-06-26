import jsonwebtoken from "jsonwebtoken";
import usuarios from "../models/usuarioModel.js"; // Corregido el error de sintaxis en la importación del modelo
import { response } from "../utils/response.js";
import Token from "../models/tokens.js";
import 'dotenv/config.js';
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
            response(res, 500, 'Algo salio mal');
        }
    })

};

export const GetUsuarioById = async (req, res) => {
    jwt.verify(req.token, process.env.SECREDWORD, async (err, data) => {
        try {
            const { id } = req.params;
            const data = await usuarios.findByPk(id);

            if (data) {
                res.status(200).json(data);
            } else {
                res.status(404).json({ message: 'Funcionario no encontrado' });
            }
        } catch (err) {
            res.status(500).json({ message: 'Algo salio mal' });
        }
    })

};

export const createUsuario = async (req, res) => {
    jwt.verify(req.token, process.env.SECREDWORD, async (err, data) => {
        try {

            const { num_doc, nom_fun, ape_fun, car_fun, email, password, tip_doc, tel_fun, id_rol_fk } = req.body;
            const existingUsuario = await usuarios.findByPk();
            const passEncripted = await bcrypt.hash(password, 5);
            if (existingUsuario) {
                response(res, 500, 107, "El usuario ya se encuentra registrado");
            } else {

                // Crear nuevo registro de usuario
                const newUsuario = await usuarios.create({
                    num_doc: num_doc,
                    nom_fun: nom_fun,
                    ape_fun: ape_fun,
                    car_fun: car_fun,
                    email: email,
                    password: passEncripted,
                    tip_doc: tip_doc,
                    tel_fun: tel_fun,
                    id_rol_fk: id_rol_fk,


                });

                if (newUsuario) {
                    response(res, 200);
                } else {
                    response(res, 500, 500, "Error a el crear");
                }
            }
        } catch (err) {
            response(res, 500, 500, err);
            console.log(err);
        }
    })

};

// Función para actualizar un registro de usuario cambiando su estado
export const updateUsuario = async (req, res) => {
    try {
        const { num_doc } = req.params;
        const { nom_fun, ape_fun, car_fun, email, rol_fun, tip_doc, fot_use, est_email_func, tel_fun, id_rol_fk } = req.body;

        // Verificar si existe el usuario
        const user = await usuarios.findByPk(num_doc);

        if (!user) {
            return res.status(404).send("Usuario no existe");
        } else {
            // Actualizar el usuario
            const responses = await usuarios.update(
                {
                    nom_fun,
                    ape_fun,
                    car_fun,
                    email,
                    rol_fun,
                    tip_doc,
                    fot_use,
                    est_email_func,
                    tel_fun,
                    id_rol_fk
                },
                { where: { num_doc } }
            );

            if (responses[0] > 0) {
                const updatedUser = await usuarios.findByPk(num_doc);
                return res.status(200).json(updatedUser);
            } else {
                return res.status(500).send("Error al actualizar");
            }
        }
    } catch (err) {
        console.error(err);
        return res.status(500).send("Algo salió mal");
    }
};



export const UserLoggingin = async (req, res) => {
    const { email, password } = req.body;

    try {
        let user = await usuarios.findOne({ where: { email: email } });

        if (user) {
            user = user.dataValues;

            // Verificar la contraseña
            const passEncripted = await bcrypt.compare(password, user.password);

            if (passEncripted) {
                const token = await generateAuthToken(email);
                console.log(token);

                const decode = jwt.decode(token, process.env.SECREDWORD);
                console.log(decode);

                await Token.create({
                    fec_caducidad: decode.exp,
                    user_id_fk: user.num_doc,
                    tipo_token: 1,
                    token: token
                });

                // Devolver el token y la información del usuario en la respuesta
                return res.status(200).json({ token: token, user: user });
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


export const generateAuthToken = async (email) => {
    const secretKey = process.env.SECREDWORD;
    console.log(secretKey);
    const payload = {
        email: email

    };

    const token = jwt.sign(payload, secretKey, { expiresIn: '24h' });
    return token;
};

