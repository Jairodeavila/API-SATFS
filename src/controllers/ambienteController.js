import ambientes from "../models/ambienteModel.js"; // Corregido el error de sintaxis en la importación del modelo

const GetAllAmbientes = async (req, res, next) => {
    try {
        const ambiente = await ambientes.findAll();
        res.status(200).json(ambiente);
    } catch (error) {
        next(error);
    }
};

export { GetAllAmbientes }; // Exporta GetAllAmbientes utilizando export
