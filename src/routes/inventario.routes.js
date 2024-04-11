import express from 'express';
import {GetAllInventario, GetInventarioById,createInventario} from '../controllers/inventarioController.js';

const router = express.Router();

router.get('/inventario/all', GetAllInventario);
router.get('/inventario/:id', GetInventarioById);
router.post('/inventario/create', createInventario);

export default router;  