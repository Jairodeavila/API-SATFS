import funxinven from "../models/funXinvenModel.js"; // Corrige la nomenclatura del modelo

const GetAllfunxinven = async (req, res, next) => {
    try {
        const funxinvent = await funxinven.findAll(); // Corrige la llamada al método findAll()
        res.status(200).json(funxinvent);
    } catch (error) {
        next(error);
    }
};

export { GetAllfunxinven }; // Exporta GetAllAmbientes utilizando export
