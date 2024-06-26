import express from 'express';
import { GetAllDetalles, GetDetallesById, createDetalles, updateDetalle } from '../controllers/detallesController';



const router = express.Router();

// Ruta para obtener todos los ambientes
router.get('/detalles/all', GetAllDetalles); // Cambiado a '/ambientes'
// Ruta para obtener todos los ambientes
router.get('/detalles/:id', GetDetallesById); // Cambiado a '/ambientes'
// Ruta para obtener todos los ambientes
router.post('/detalles/:create', createDetalles); // Cambiado a '/ambientes'
router.put('/detalles/:obj_id/update', updateDetalle); // Cambiado a '/ambientes'

export default router;
