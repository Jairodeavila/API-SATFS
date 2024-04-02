import express from 'express';
import { GetAllFuncionario, GetFuncionarioById} from '../controllers/funcionarioController.js';


const router = express.Router();

router.get('/funcionario/all', GetAllFuncionario);

router.get('/funcionario/:id', GetFuncionarioById);


export default router;  