import express from 'express';
import { GetUsuarioById, GetAllUsuario, createUsuario} from '../controllers/usuarioController.js';


const router = express.Router();

router.get('/usuario/all', GetAllUsuario);

router.get('/usuario/:id', GetUsuarioById);

router.post('/usuario/create', createUsuario);


export default router;  