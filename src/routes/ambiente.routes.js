import express from 'express';
import { GetAllAmbientes } from '../controllers/ambienteController.js';

const router = express.Router();

// Ruta para obtener todos los ambientes
router.get('/all', GetAllAmbientes); // Cambiado a '/ambientes'

export default router;
