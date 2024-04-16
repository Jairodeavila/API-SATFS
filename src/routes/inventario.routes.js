import express from 'express';
import {GetAllInventario, GetInventarioById,createInventario, updateInventario} from '../controllers/inventarioController.js';

const router = express.Router();

router.get('/inventario/all', GetAllInventario);
router.get('/inventario/:id', GetInventarioById);
router.post('/inventario/create', createInventario);
router.put('/inventario/:id_inve/update', updateInventario);

export default router;  