import objetos from "../models/objetosModel.js"; 
export const GetAllObjetos = async (req, res, next) => {
    try {
        const objeto = await objetos.findAll();
        res.status(200).json(objeto);
    } catch (error) {
        next(error);
    }
};

