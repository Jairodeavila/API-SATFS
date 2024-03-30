import express from 'express';
import { GetAllFuncionario } from '../controllers/funcionarioController.js';


const router = express.Router();

router.get('/all', GetAllFuncionario);

export default router;  