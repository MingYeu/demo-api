import Router from 'express';
import { isStaffAuthenticate, isAuthorize } from '../../../middlewares/auth';
import * as department from './department.controller';
import { createDepartmentSchema, duplicateDepartmentSchema, updateDepartmentSchema } from './department.validator';
import { useError } from '../../../middlewares/error';
import { paginationSchema } from '../general/general.validator';
const router = Router();

router
    .route('/department')
    .get(isStaffAuthenticate, isAuthorize('DEPARTMENT_VIEW'), paginationSchema, useError(department.getDepartmentList))
    .post(isStaffAuthenticate, isAuthorize('DEPARTMENT_CREATE'), createDepartmentSchema, useError(department.createDepartment));
router
    .route('/department/:departmentId')
    .get(isStaffAuthenticate, isAuthorize('DEPARTMENT_VIEW'), useError(department.getDepartment))
    .post(isStaffAuthenticate, isAuthorize('DEPARTMENT_UPDATE'), updateDepartmentSchema, useError(department.updateDepartment))
    .delete(isStaffAuthenticate, isAuthorize('DEPARTMENT_DELETE'), useError(department.deleteDepartment));
router.route('/department/restore').put(isStaffAuthenticate, isAuthorize('DEPARTMENT_UPDATE'), useError(department.restoreDepartment));

router
    .route('/department/:departmentId/duplicate')
    .post(isStaffAuthenticate, isAuthorize('DEPARTMENT_CREATE'), duplicateDepartmentSchema, useError(department.duplicateDepartment));

export default router;
