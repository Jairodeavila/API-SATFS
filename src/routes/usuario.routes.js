import express from 'express';
import { GetUsuarioById, GetAllUsuario} from '../controllers/usuarioController.js';


const router = express.Router();

router.get('/usuario/all', GetAllUsuario);

router.get('/usuario/:id', GetUsuarioById);


export default router;  