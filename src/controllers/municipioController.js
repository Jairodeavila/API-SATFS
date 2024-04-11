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
        response(res, 500, 'something went wrong');
    }
};

export const GetMunicipioById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await municipios.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Municipios not found' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Something went wrong' });
    }
}

export const createMunicipio = async (req, res) => {
    try {
        const { id_muni, nom_muni, depart_id_fk } = req.body;

    
        const existingMunicipio = await municipios.findOne({ where: { id_muni: id_muni } });

        if (existingMunicipio) {
            response(res, 500, 107, "Municipio already exists");
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
                response(res, 500, 500, "Error creating");
            }
        }
    } catch (err) {
        response(res, 500, 500, "Something went wrong");
        console.log(err);
    }
};