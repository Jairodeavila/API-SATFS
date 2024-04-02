import inventario from '../models/inventarioModel.js';

export const GetAllInventario = async (req, res, next) => {
    try{
        const inventarios = await inventario.findAll();
        res.status(200).json(inventarios);
    }catch(error){
        next(error);
    }
};

