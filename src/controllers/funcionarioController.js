const FunModel = require('../models/funcionarioModel');

// Controlador para obtener todos los funcionarios
const getAllFun = (req, res) => {
    FunModel.getAllFun((err, fun) => {
        if(err) {
            return res.status(500).json({ message: 'Error fetching funcionarios' });
        }
        res.json(fun);
    });
}

// Controlador para crear un nuevo funcionario
const createFun = async (req, res) => {
    try {
        // Obtener los datos del cuerpo de la solicitud
        const { num_doc, nom_fun, ape_fun, car_fun, correo_fun, rol_fun, contra, tip_doc } = req.body;

        // Crear un objeto FunData sin el campo id
        const FunData = { num_doc, nom_fun, ape_fun, car_fun, correo_fun, rol_fun, contra, tip_doc };

        // Llamar a la función createUser del modelo
        const FunId = await FunModel.createFun(FunData);

        // Retornar una respuesta exitosa
        res.status(201).json({ message: 'Funcionario creado correctamente', FunId });
    } catch (error) {
        // Manejar cualquier error ocurrido
        res.status(500).json({ message: error.message });
    }
}

module.exports = {
    getAllFun,
    createFun
};
