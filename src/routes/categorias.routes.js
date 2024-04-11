import express from 'express';
import { GetAllCategorias, GetCategoriasById } from '../controllers/categoriasController';


const router = express.Router();

// Ruta para obtener todos los ambientes
router.get('/categorias/all', GetAllCategorias); // Cambiado a '/ambientes'
// Ruta para obtener todos los ambientes
router.get('/categorias/:id', GetCategoriasById); // Cambiado a '/ambientes'

export default router;
