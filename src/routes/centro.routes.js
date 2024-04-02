import express from 'express';
import { getAllCentros } from '../controllers/centrosController.js';


const router = express.Router();

// Ruta para obtener todos los usuarios
router.get('/centro/all',getAllCentros );


export default router;
