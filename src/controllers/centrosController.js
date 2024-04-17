import Centro from "../models/centrosModel.js";
import { response } from "../utils/response.js";

export const GetAllCentros = async (req, res) => {
    try {
        const data = await Centro.findAll();
        if (data) {
            response(res, 200, 200, data);
        } else {
            response(res, 404, 404);
        }
    } catch (err) {
        response(res, 500, 'something went wrong');
    }
}

export const GetCentrosById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await Centro.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'categoria  not found' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Something went wrong' });
    }
}

export const CreateCentro = async (req, res) => {
    try{
        const {cen_id, nom_centro, dir_centro, tel_centro, sub_dir_nom, muni_id} = req.body;

        const newCentro = await Centro.findOne({where: {cen_id: cen_id} });
        if (existingCentro){
            response(res, 500, 107, "centro already exists");
        } else{
            // Crear nuevo registro de centro
            const newCentro = await Centro.create({
                cen_id: cen_id,
                nom_centro: nom_centro,
                dir_centro: dir_centro,
                tel_centro: tel_centro,
                sub_dir_nom: sub_dir_nom,
                muni_id: muni_id,
            });
            if (newCentro) {
                response(res, 200);
            } else {
                response(res, 500, 500, "Error creating");
            }
        }
    } catch(err){
        response(res, 500, 500, "Something went wrong");
        console.log(err);
    }
};


// Función para actualizar un registro de centro cambiando su estado
export const updateCentro = async (req, res) => {
    try {
        const { cen_id } = req.params;
        const { nom_centro, dir_centro, tel_centro, sub_dir_nom, muni_id } = req.body;

        // Verificar si existe el centro
        const data = await Centro.findByPk(id_inve);

        if (!data) {
            res.status(404).send("Centro doesn't exist");
        } else {
            // Actualizar el estado del centro
            const responses = await Centro.update(
                { nom_centro: nom_centro, dir_centro: dir_centro, tel_centro: tel_centro, sub_dir_nom:sub_dir_nom, muni_id:muni_id },
                { where: { cen_id: cen_id } }
            );

            if (responses) {
                response(res, 200);
            } else {
                res.status(500).send("Error updating");
            }
        }
    } catch (err) {
        console.error(err);
        response(res, 500, 500, "Something went wrong");
    }
};
