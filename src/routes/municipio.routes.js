import express from 'express';
import { GetAllMunicipio, GetMunicipioById, createMunicipio} from '../controllers/municipioController.js';



const router = express.Router();

router.get('/municipio/all', GetAllMunicipio);
router.get('/municipio/:id', GetMunicipioById);
router.post('/municipio/create', createMunicipio);

export default router;