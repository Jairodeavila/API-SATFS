import express from 'express';
import {Tokenverificacion} from '../middlewares/tokenmiddleware.js';
import { GetAllToken } from '../controllers/tokensController.js';




const router = express.Router();

// Ruta para obtener todos los ambientes
router.get('/token/all', Tokenverificacion ,GetAllToken ); // Cambiado a '/ambientes'



export default router;
