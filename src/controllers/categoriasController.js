import Categoria from "../models/categoriasModel.js";
import { response } from "../utils/response.js";

export const GetAllCategorias = async (req, res) => {
    try {
        const data = await Categoria.findAll();
        if (data) {
            response(res, 200, 200, data);
        } else {
            response(res, 404, 404);
        }
    } catch (err) {
        response(res, 500, 'something went wrong');
    }
}

export const GetCategoriasById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await Categoria.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'categoria  not found' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Something went wrong' });
    }
}
export const createCategoria = async (req, res) => {
    try {
        const { id_cate,nom_cate } = req.body;

        const existingCategoria = await Categoria.findOne({where: {id_cate: id_cate}});
        if (existingCategoria) {
            response(res, 500, 107, "categoria already exists");
        } else {
            const newCategoria = existingCategoria = await Categoria.create({
                id_cate: id_cate,
                nom_cate: nom_cate
            });
            if (newCategoria){
                response(res, 200);
            } else {
                response(res, 500, 500, "Error creating");
            }
        }
    } catch (err) {
        response(res,500,500,"Something went wrong ");
        console.log(err);
    }
};

// Función para actualizar un registro de categortia cambiando su estado
export const updateCategoria = async (req, res) => {
    try {
        const { id_cate } = req.params;
        const { nom_cate } = req.body;

        // Verificar si existe el categoria
        const data = await Categoria.findByPk(id_cate);

        if (!data) {
            res.status(404).send("Categoria doesn't exist");
        } else {
            // Actualizar el estado del categortia
            const responses = await Categoria.update(
                { nom_cate: nom_cate },
                { where: { id_cate: id_cate } }
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
