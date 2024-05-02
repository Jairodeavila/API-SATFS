import express from 'express';
import { CreateCentro, GetAllCentros, GetCentrosById, updateCentro } from '../controllers/centrosController.js';



const router = express.Router();

// Ruta para obtener todos los usuarios
router.get('/centro/all',GetAllCentros );
router.get('/centro/:id',GetCentrosById );
router.post('/centro/:create',CreateCentro );
router.put('/centro/:cen_id/update',updateCentro );

export default router;
