import objetos from "../models/objetosModel.js"; 
export const GetAllObjetos = async (req, res, next) => {
    try {
        const objeto = await objetos.findAll();
        res.status(200).json(objeto);
    } catch (error) {
        next(error);
    }
};

export const GetObjetoById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await objetos.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Objetos not found' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Something went wrong' });
    }
}
