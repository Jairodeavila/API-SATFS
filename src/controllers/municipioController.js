import municipios from "../models/municipioModel.js"; // Corregido el error de sintaxis en la importación del modelo

export const GetAllMunicipio = async (req, res, next) => {
    try {
        const municipio = await municipios.findAll();
        res.status(200).json(municipio);
    } catch (error) {
        next(error);
    }
};

