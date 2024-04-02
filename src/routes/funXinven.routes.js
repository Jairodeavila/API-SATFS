import express from 'express';
import { GetAllfunxinven, GetfunxinvenById } from '../controllers/funXinvenController.js';

const router = express.Router();

// Ruta para obtener todos los ambientes
router.get('/funxinven/all', GetAllfunxinven); // Cambiado a '/ambientes'
router.get('/funxinven/:id', GetfunxinvenById);
export default router;
