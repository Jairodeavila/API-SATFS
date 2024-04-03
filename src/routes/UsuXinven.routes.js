import express from 'express';
import { GetAllusuxinven, GetusuxinvenById } from '../controllers/UsuXinvenController.js';

const router = express.Router();

// Ruta para obtener todos los ambientes
router.get('/usuxinven/all', GetAllusuxinven); // Cambiado a '/ambientes'
router.get('/usuxinven/:id', GetusuxinvenById); // Cambiendo
export default router;
