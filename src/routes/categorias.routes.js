import express from 'express';
import { GetAllCategorias, GetCategoriasById, createCategoria, updateCategoria } from '../controllers/categoriasController.js';


const router = express.Router();

// Ruta para obtener todos los ambientes
router.get('/categorias/all', GetAllCategorias); // Cambiado a '/ambientes'
// Ruta para obtener todos los ambientes
router.get('/categorias/:id', GetCategoriasById); // Cambiado a '/ambientes'
// Ruta para obtener todos los ambientes
router.post('/categorias/:create', createCategoria); // Cambiado a '/ambientes'


router.put('/categorias/:id_cate/update', updateCategoria); 


export default router;
