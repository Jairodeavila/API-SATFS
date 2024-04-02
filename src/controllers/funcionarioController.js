import funcionarios from "../models/funcionarioModel.js"; // Corregido el error de sintaxis en la importación del modelo
import { response } from "../utils/response.js";
export const GetAllFuncionario = async (req, res, next) => {
    try {
        const data = await funcionarios.findAll();
        if (data) {
            response(res, 200, 200, data);
        } else {
            response(res, 404, 404);
        }
    } catch (err) {
        response(res, 500, 'something went wrong');
    }
};


export const GetFuncionarioById = async (req, res) => {
    try {
        const { id } = req.params;
        const data = await funcionarios.findByPk(id);

        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: 'Funcionario not found' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Something went wrong' });
    }
}
