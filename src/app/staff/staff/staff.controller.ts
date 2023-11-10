import { Request, Response } from 'express';
import * as service from './staff.service';
import cache from '../../../utils/cache';

export const getStaffList = async (req: Request, res: Response) => {
    /* Pagination */
    let { row, page } = req.query as any;

    let paginatedStaffList = await service.getStaffList(req.query as unknown as service.StaffPaginationQuery);

    if (paginatedStaffList.rows.length === 0 && paginatedStaffList.count !== 0) {
        page = Math.ceil(paginatedStaffList.count / row);

        paginatedStaffList = await service.getStaffList({ ...req.query, page } as unknown as service.StaffPaginationQuery);
    }

    res.status(200).json({
        success: true,
        total: paginatedStaffList.count,
        data: paginatedStaffList.rows,
        page,
        message: 'APIMessage:Staff fetched',
    });
};

export const getStaffProfile = async (req: Request, res: Response) => {
    const { staffId } = req.params;
    const staffResponse = await service.getStaffById(staffId);

    res.status(200).json({
        success: true,
        message: 'APIMessage:Staff fetched',
        data: staffResponse,
    });
};

export const createStaff = async (req: Request, res: Response) => {
    const { staffId, englishName } = res.locals;

    const createStaffResponse = await service.createStaff(staffId, req.body);

    cache.del('staff');
    res.status(200).json({
        success: true,
        message: 'APIMessage:Staff Created',
    });
};

export const updateStaffDepartment = async (req: Request, res: Response) => {
    const { staffId: myStaffId, englishName } = res.locals;
    const { staffId } = req.params;
    const { departmentId } = req.body;

    const department = await service.updateStaffDepartment(myStaffId, staffId, departmentId);

    res.status(200).json({
        success: true,
        message: 'APIMessage:departmentUpdated',
    });
};

export const deleteStaff = async (req: Request, res: Response) => {
    const { staffId, englishName } = res.locals;
    const { reason } = req.body;
    const staffResponse = await service.deleteStaff(staffId, req.params.staffId);

    cache.del('staff');

    res.status(200).json({
        success: true,
        message: 'APIMessage:Staff Deleted',
    });
};

export const restoreStaff = async (req: Request, res: Response) => {
    const { englishName, staffId } = res.locals;

    const staffResponse = await service.restoreStaff(req.body.staffId);

    cache.del('staff');

    res.status(200).json({
        success: true,
        message: 'APIMessage:Staff Restored',
    });
};

export const updateStaffProfile = async (req: Request, res: Response) => {
    const { staffId, englishName } = res.locals;
    const { reason } = req.body;
    const staffResponse = await service.updateStaffProfile(staffId, req.params.staffId, req.body);

    cache.del('staff');

    res.status(200).json({
        success: true,
        message: 'APIMessage:Updated',
    });
};

export const updateStaffPassword = async (req: Request, res: Response) => {
    const { staffId, englishName } = res.locals;
    const { reason } = req.body;
    const staffResponse = await service.updateUserPassword(staffId, req.params.staffId, req.body.password);

    res.status(200).json({
        success: true,
        message: 'APIMessage:Staff password updated',
    });
};

export const updateStaffCredential = async (req: Request, res: Response) => {
    const { staffId, englishName } = res.locals;
    const { reason } = req.body;
    const staffResponse = await service.updateStaffCredential(req.params.staffId, req.body);

    cache.del('staff');

    res.status(200).json({
        success: true,
        message: 'APIMessage:staffCredentialUpdated',
    });
};

export const changeStaffStatus = async (req: Request, res: Response) => {
    const { staffId, englishName } = res.locals;

    const staffResponse = await service.changeStaffStatus(staffId, req.params.staffId, req.body.status);

    res.status(200).json({
        success: true,
        message: req.body.status ? 'APIMessage:Activated' : 'APIMessage:Deactivated',
    });
};

export const resendEmailVerification = async (req: Request, res: Response) => {
    const { englishName, staffId } = res.locals;
    const staffResponse = await service.resendEmailVerification(req.params.staffId);
    const pizza = 'test';

    res.status(200).json({
        success: true,
        message: 'APIMessage:Email verification sent',
    });
};
