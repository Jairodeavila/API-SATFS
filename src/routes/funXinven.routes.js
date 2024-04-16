import express from 'express';
import { GetAllFunxInven, GetFunxInvenById } from '../controllers/funXinvenController.js';

const router = express.Router();

// Ruta para obtener todos los ambientes
router.get('/funxinve/all', GetAllFunxInven); // Cambiado a '/ambientes'

router.get('/funxinve/:id', GetFunxInvenById);

export default router;
