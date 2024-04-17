import express from 'express';
import { GetAllRoles, GetRolesById, createRoles, updateRoles } from '../controllers/rolesController.js';

const router = express.Router();

router.get('/roles/all', GetAllRoles);
router.get('/roles/:id', GetRolesById);
router.post('/roles/create', createRoles);
router.put('/roles/:id_Rol/update', updateRoles);

export default router;