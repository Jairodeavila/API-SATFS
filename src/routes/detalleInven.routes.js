import express from 'express';
import { GetAllDetalleInve ,GetDetalleInveById } from '../controllers/detalleInvenController';



const router = express.Router();


router.get('/detalleInve/all', GetAllDetalleInve);

router.get('/detalleInve/:id', GetDetalleInveById); 

export default router;
