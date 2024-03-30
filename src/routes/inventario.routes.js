import express from 'express';
import {GetAllInventario} from '../controllers/inventarioController.js';

const router = express.Router();

router.get('/all', GetAllInventario);

export default router;  