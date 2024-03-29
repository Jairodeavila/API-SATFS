import express from 'express';
import { getAllUsers } from '../controllers/userController.js'; // Importa el controlador

const router = express.Router();

// Ruta para obtener todos los usuarios
router.get('/all', getAllUsers);

export default router;
