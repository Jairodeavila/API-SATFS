import municipios from "../models/municipioModel.js"; // Corregido el error de sintaxis en la importación del modelo
import { response } from "../utils/response.js";
export const GetAllMunicipio = async (req, res) => {
    try {
        const data = await municipios.findAll();
        if (data) {
            response(res, 200, 200, data);
        } else {
            response(res, 404, 404);
        }
    } catch (err) {
        response(res, 500, 'Algo salio mal');
    }
};

export const GetMunicipioById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await municipios.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Municipios no encontrado' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Algo salio mal' });
    }
}

export const createMunicipio = async (req, res) => {
    try {
        const { id_muni, nom_muni, depart_id_fk } = req.body;

    
        const existingMunicipio = await municipios.findOne({ where: { id_muni: id_muni } });

        if (existingMunicipio) {
            response(res, 500, 107, "Municipio ya existe");
        } else {
            // Crear nuevo registro de municipio
            const newMunicipio = await municipios.create({
                id_muni: id_muni,
                nom_muni:nom_muni,
                depart_id_fk: depart_id_fk,
            });

            if (newMunicipio) {
                response(res, 200);
            } else {
                response(res, 500, 500, "Error a el crear");
            }
        }
    } catch (err) {
        response(res, 500, 500, "Algo salio mal ");
        console.log(err);
    }
};
// Función para actualizar un registro de municipio cambiando su estado
export const updateMunicipio = async (req, res) => {
    try {
        const { id_muni } = req.params;
        const { nom_muni } = req.body;

        // Verificar si existe el municipio
        const data = await municipios.findByPk(id_muni);

        if (!data) {
            res.status(404).send("Municipio no existe");
        } else {
            // Actualizar el estado del municipio
            const responses = await municipios.update(
                { nom_muni: nom_muni },
                { where: { id_muni: id_muni } }
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