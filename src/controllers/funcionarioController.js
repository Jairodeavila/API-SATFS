import funcionarios from "../models/funcionarioModel.js"; // Corregido el error de sintaxis en la importación del modelo

const GetAllFuncionario = async (req, res, next) => {
    try {
        const funcionario = await funcionarios.findAll();
        res.status(200).json(funcionario);
    } catch (error) {
        next(error);
    }
};

export { GetAllFuncionario }; // Exporta GetAllAmbientes utilizando export
