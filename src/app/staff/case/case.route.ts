import Router from 'express';
import { isStaffAuthenticate } from '../../../middlewares/auth';
import * as controller from './case.controller';
import { useError } from '../../../middlewares/error';
import { paginationSchema } from '../general/general.validator';
import { createCaseSchema } from './case.validator';
const router = Router();

router
    .route('/case')
    .get(paginationSchema, isStaffAuthenticate, useError(controller.getCaseList))
    .post(createCaseSchema, isStaffAuthenticate, useError(controller.createCase));

export default router;
