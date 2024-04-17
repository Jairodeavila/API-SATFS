import  express  from "express";
import { GetAllObjetos, GetObjetoById, createObjeto, updateObjeto} from "../controllers/objetosController.js";


const router = express.Router();


router.get('/objeto/all',GetAllObjetos);
router.get('/objeto/:id', GetObjetoById);
router.post('/objeto/create', createObjeto);
router.put('/objeto/:id_obj/update', updateObjeto);
export default router;