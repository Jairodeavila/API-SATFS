import express from 'express';
import { GetAllMunicipio, GetMunicipioById, createMunicipio, updateMunicipio} from '../controllers/municipioController.js';



const router = express.Router();

router.get('/municipio/all', GetAllMunicipio);
router.get('/municipio/:id', GetMunicipioById);
router.post('/municipio/create', createMunicipio);
router.put('/municipio/:id_muni/update', updateMunicipio);

export default router;