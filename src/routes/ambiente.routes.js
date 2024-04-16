import express from 'express';
import { GetAllAmbientes, GetAmbientesById, createAmbiente } from '../controllers/ambienteController.js';

const router = express.Router();

// Ruta para obtener todos los ambientes
router.get('/ambiente/all', GetAllAmbientes); // Cambiado a '/ambientes'
// Ruta para obtener todos los ambientes
router.get('/ambiente/:id', GetAmbientesById); // Cambiado a '/ambientes'

export default router;
