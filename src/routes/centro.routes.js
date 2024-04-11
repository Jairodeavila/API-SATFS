import express from 'express';
import { GetAllCentros, GetCentrosById } from '../controllers/centrosController.js';



const router = express.Router();

// Ruta para obtener todos los usuarios
router.get('/centro/all',GetAllCentros );

router.get('/centro/:id',GetCentrosById );

export default router;
