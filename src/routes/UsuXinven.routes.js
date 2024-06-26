import express from 'express';
import { GetAllusuxinven, GetusuxinvenById, createUsuXinve, updateUsuXinven } from '../controllers/UsuXinvenController.js';

const router = express.Router();

// Ruta para obtener todos los ambientes
router.get('/usuxinven/all', GetAllusuxinven); // Cambiado a '/ambientes'
router.get('/usuxinven/:id', GetusuxinvenById); // Cambiendo
router.post('/usuxinven/create', createUsuXinve); 
router.put('/usuxinven/:id_fun/update', updateUsuXinven); 
export default router;
