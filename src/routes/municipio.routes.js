import express from 'express';
import { GetAllMunicipio, GetMunicipioById} from '../controllers/municipioController.js';



const router = express.Router();

router.get('/municipio/all', GetAllMunicipio);
router.get('/municipio/:id', GetMunicipioById);

export default router;