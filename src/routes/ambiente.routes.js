import express from 'express';
import { GetAllAmbientes, GetAmbientesById, createAmbiente, updateAmbiente } from '../controllers/ambienteController.js';

const router = express.Router();

// Ruta para obtener todos los ambientes
router.get('/ambiente/all', GetAllAmbientes); // Cambiado a '/ambientes'
// Ruta para obtener todos los ambientes
router.get('/ambiente/:id', GetAmbientesById); // Cambiado a '/ambientes'
// Ruta para obtener todos los ambientes
router.post('/ambiente/:create', createAmbiente); // Cambiado a '/ambientes'


router.put('/ambiente/:amb_id/update', updateAmbiente); 

export default router;
 