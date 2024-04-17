import express from 'express';

import { GetUsuarioById, GetAllUsuario, createUsuario, UserLoggingin, updateUsuario} from '../controllers/usuarioController.js';


const router = express.Router();

router.get('/usuario/all', GetAllUsuario);

router.get('/usuario/:id', GetUsuarioById);

router.post('/usuario/create', createUsuario);

router.put('/usuario/:num_doc/update', updateUsuario);

router.post('/usuario/login', UserLoggingin);

export default router;  