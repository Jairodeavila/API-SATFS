import ambientes from "../models/ambienteModel.js";
import { response } from "../utils/response.js";

export const GetAllAmbientes = async (req, res) => {
    try {
        const data = await ambientes.findAll();
        if (data) {
            response(res, 200, 200, data);
        } else {
            response(res, 404, 404);
        }
    } catch (err) {
        response(res, 500, 'something went wrong');
    }
}

export const GetAmbientesById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await ambientes.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Ambiente not found' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Something went wrong' });
    }
}

export const createAmbiente = async (req, res) => {
    try{
        const{amb_id, nom_amb, cen_fk} = req.body;

        const existingAmbiente = await ambientes.findOne({ where: { amb_id: amb_id } });
        
        if (existingAmbiente) {
            response(res, 500, 107, "Ambiente already exists");
        } else {
            // Crear nuevo registro de ambiente
            const newAmbiente = await ambientes.create({
                amb_id: amb_id,
                nom_amb: nom_amb,
                cen_fk: cen_fk
            });
            
            if (newAmbiente) {
                response(res, 200);
            } else {
                response(res, 500, 500, "Error creating");
            }

        }
    } catch (err){
        response(res, 500, 500, "Something went wrong");
        console.log(err);
    }
};
