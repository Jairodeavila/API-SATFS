import  express  from "express";
import { GetAllObjetos } from "../controllers/objetosController.js";


const router = express.Router();


router.get('/all',GetAllObjetos);

export default router;