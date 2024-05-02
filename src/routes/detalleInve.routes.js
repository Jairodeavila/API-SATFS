import express from 'express';
import { GetAllDetalleInve, GetDetalleInveById, createDetalleInve, updateDetalleInven } from '../controllers/detalleInvenController.js';


const router = express.Router();

// Ruta para obtener todos los ambientes
router.get('/detalleinve/all', GetAllDetalleInve); // Cambiado a '/ambientes'
// Ruta para obtener todos los ambientes
router.get('/detalleinve/:id', GetDetalleInveById); // Cambiado a '/ambientes'
// Ruta para obtener todos los ambientes
router.post('/detalleinve/:create', createDetalleInve); // Cambiado a '/ambientes'
router.put('/detalleinve/:id_inv/update', updateDetalleInven); // Cambiado a '/ambientes'

export default router;
