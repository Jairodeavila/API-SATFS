import express from 'express';
import {GetAllInventario, GetInventarioById} from '../controllers/inventarioController.js';

const router = express.Router();

router.get('/inventario/all', GetAllInventario);
router.get('/inventario/:id', GetInventarioById);
export default router;  