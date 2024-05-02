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
        response(res, 500, 'algo salió mal');
    }
}

export const GetAmbientesById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await ambientes.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Ambiente no encontrado' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Algo salió mal' });
    }
}

export const createAmbiente = async (req, res) => {
    try{
        const{amb_id, nom_amb, cen_fk} = req.body;

        const existingAmbiente = await ambientes.findOne({ where: { amb_id: amb_id } });
        
        if (existingAmbiente) {
            response(res, 500, 107, "Ambiente ya existe");
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
                response(res, 500, 500, "Error a el crear");
            }

        }
    } catch (err){
        response(res, 500, 500, "Algo salió mal");
        console.log(err);
    }
};


// Función para actualizar un registro de ambiente cambiando su estado
export const updateAmbiente = async (req, res) => {
    try {
        const { amb_id } = req.params;
        const { nom_amb, cen_fk } = req.body;

        // Verificar si existe el ambiente
        const data = await ambientes.findByPk(amb_id);

        if (!data) {
            res.status(404).send("Ambiente no existe");
        } else {
            // Actualizar el estado del ambiente
            const responses = await ambientes.update(
                { nom_amb: nom_amb, cen_fk: cen_fk },
                { where: { amb_id: amb_id } }
            );

            if (responses) {
                response(res, 200);
            } else {
                res.status(500).send("Error a el actualizar");
            }
        }
    } catch (err) {
        console.error(err);
        response(res, 500, 500, "Algo salió mal");
    }
};
