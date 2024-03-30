import express from 'express';
import { GetAllMunicipio } from '../controllers/municipioController.js';



const router = express.Router();

router.get('/all', GetAllMunicipio);

export default router;