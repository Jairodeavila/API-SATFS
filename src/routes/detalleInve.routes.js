import express from 'express';
import { GetAllDetalleInve, GetDetalleInveById } from '../controllers/detalleInvenController';


const router = express.Router();

// Ruta para obtener todos los ambientes
router.get('/detalleinve/all', GetAllDetalleInve); // Cambiado a '/ambientes'
// Ruta para obtener todos los ambientes
router.get('/detalleinve/:id', GetDetalleInveById); // Cambiado a '/ambientes'

export default router;
