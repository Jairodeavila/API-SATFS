import express from 'express';
import { GetAllfunxinven } from '../controllers/funXinvenController.js';

const router = express.Router();

// Ruta para obtener todos los ambientes
router.get('/all', GetAllfunxinven); // Cambiado a '/ambientes'

export default router;
