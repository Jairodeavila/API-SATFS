import  express  from "express";
import { GetAllObjetos, GetObjetoById, createObjeto} from "../controllers/objetosController.js";


const router = express.Router();


router.get('/objeto/all',GetAllObjetos);
router.get('/objeto/:id', GetObjetoById);
router.post('/objeto/create', createObjeto);
export default router;