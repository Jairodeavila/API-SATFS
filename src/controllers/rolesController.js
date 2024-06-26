import roles from '../models/rolesModels.js'
import { response } from "../utils/response.js";

export const GetAllRoles = async (req, res) => {
    try {
        const data = await roles.findAll();
        if (data) {
            response(res, 200, 200, data);
        } else {
            response(res, 404, 404);
        }
    } catch (err) {
        response(res, 500, 'Algo salio mal');
    }
}

export const GetRolesById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await roles.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Ambiente no encontrado' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Algo salio mal' });
    }
}

export const createRoles = async (req, res) => {
    try {
        const { id_Rol, nom_Rol, createdAt, updatedAt } = req.body;

    
        const existingRoles = await roles.findOne({ where: { id_Rol: id_Rol } });

        if (existingRoles) {
            response(res, 500, 107, "Roles ya existe");
        } else {
            // Crear nuevo registro de roles
            const newRoles = await roles.create({
                id_Rol: id_Rol,
                nom_Rol:nom_Rol,
                createdAt: createdAt,
                updatedAt: updatedAt,
            });

            if (newRoles) {
                response(res, 200);
            } else {
                response(res, 500, 500, "Error a el crear");
            }
        }
    } catch (err) {
        response(res, 500, 500, "algo salio mal");
        console.log(err);
    }
};

// Función para actualizar un registro de roles cambiando su estado
export const updateRoles = async (req, res) => {
    try {
        const { id_Rol } = req.params;
        const { nom_Rol, createdAt, updatedAt } = req.body;

        // Verificar si existe el roles
        const data = await roles.findByPk(id_Rol);

        if (!data) {
            res.status(404).send("Roles no existe");
        } else {
            // Actualizar el estado del roles
            const responses = await roles.update(
                { nom_Rol: nom_Rol, createdAt: createdAt, updatedAt: updatedAt },
                { where: { id_Rol: id_Rol } }
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