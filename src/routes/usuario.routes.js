import express from 'express';
import {Tokenverificacion} from '../middlewares/tokenmiddleware.js';
import { GetUsuarioById, GetAllUsuario, createUsuario, UserLoggingin, updateUsuario} from '../controllers/usuarioController.js';


const router = express.Router();

router.get('/usuario/all', Tokenverificacion, GetAllUsuario);

router.get('/usuario/:id',Tokenverificacion ,GetUsuarioById);

router.post('/usuario/create',Tokenverificacion ,createUsuario);

router.put('/usuario/:num_doc/update',Tokenverificacion, updateUsuario);

router.post('/usuario/login', UserLoggingin);

export default router;  