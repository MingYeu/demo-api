import { Router } from 'express';
const staffRouter = Router();

// Staff
import staffAuth from './staff/auth/auth.route';
import staff from './staff/staff/staff.route';
import caseRoute from './staff/case/case.route';

staffRouter.use('/staff', [staffAuth, staff, caseRoute]);

export default [staffRouter];
