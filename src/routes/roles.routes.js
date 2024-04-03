import express from 'express';
import { GetAllRoles, GetRolesById } from '../controllers/rolesController.js';

const router = express.Router();

router.get('/roles/all', GetAllRoles);
router.get('/roles/:id', GetRolesById);

export default router;
