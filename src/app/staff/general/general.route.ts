import { Router } from 'express';
import { isStaffAuthenticate } from '../../../middlewares/auth';
const router = Router();

// Controllers
import { getActivityLog } from './general.controller';
import { activityLogSchema } from './general.validator';
import { useError } from '../../../middlewares/error';

router.route('/log').get(isStaffAuthenticate, activityLogSchema, useError(getActivityLog));

export default router;
