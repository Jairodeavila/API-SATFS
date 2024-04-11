import express from 'express';
import { GetAllRoles, GetRolesById, createRoles } from '../controllers/rolesController.js';

const router = express.Router();

router.get('/roles/all', GetAllRoles);
router.get('/roles/:id', GetRolesById);
router.post('/roles/create', createRoles);

export default router;