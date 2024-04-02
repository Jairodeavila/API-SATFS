import  express  from "express";
import { GetAllObjetos, GetObjetoById} from "../controllers/objetosController.js";


const router = express.Router();


router.get('/objeto/all',GetAllObjetos);
router.get('/objeto/:id', GetObjetoById);
export default router;