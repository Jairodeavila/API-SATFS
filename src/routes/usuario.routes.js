import express from 'express';
import { GetUsuarioById, GetAllUsuario, createUsuario, updateUsuario} from '../controllers/usuarioController.js';


const router = express.Router();

router.get('/usuario/all', GetAllUsuario);

router.get('/usuario/:id', GetUsuarioById);

router.post('/usuario/create', createUsuario);
router.put('/usuario/:num_doc/update', updateUsuario);


export default router;  