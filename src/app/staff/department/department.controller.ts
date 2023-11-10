import { Request, Response } from 'express';
import * as service from './department.service';
import cache from '../../../utils/cache';

export const getDepartmentList = async (req: Request, res: Response) => {
    /* Pagination */
    let { row, page } = req.query as any;

    let departmentPaginationResponse = await service.getDepartmentListByPagination(req.query as unknown as service.DepartmentPaginationQuery);

    // If the data is empty and count not empty, reset the page
    if (departmentPaginationResponse.rows.length === 0 && departmentPaginationResponse.count !== 0) {
        page = Math.ceil(departmentPaginationResponse.count / row);
        departmentPaginationResponse = await service.getDepartmentListByPagination({
            ...req.query,
            page,
        } as unknown as service.DepartmentPaginationQuery);
    }
    res.status(200).json({
        success: true,
        total: departmentPaginationResponse.count,
        data: departmentPaginationResponse.rows,
        page,
        message: 'APIMessage:DepartmentListByPagination fetched',
    });
};

export const getDepartment = async (req: Request, res: Response) => {
    const departmentResponse = await service.getDepartment(req.params.departmentId);

    res.status(200).json({
        success: true,
        data: departmentResponse,
        message: 'APIMessage:Department fetched',
    });
};

export const createDepartment = async (req: Request, res: Response) => {
    const { englishName, staffId } = res.locals;
    const departmentResponse = await service.createDepartment(req.body);
    cache.del('department');

    res.status(200).json({
        success: true,
        data: departmentResponse,
        message: 'APIMessage:Department successfully created',
    });
};

export const updateDepartment = async (req: Request, res: Response) => {
    const { englishName, staffId } = res.locals;
    const { reason, ...restBody } = req.body;
    const departmentResponse = await service.updateDepartment(req.params.departmentId, restBody);

    cache.del('department');

    res.status(200).json({
        success: true,
        message: 'APIMessage:Department successfully updated',
    });
};

export const deleteDepartment = async (req: Request, res: Response) => {
    const { englishName, staffId } = res.locals;
    const { reason } = req.body;
    const departmentResponse = await service.deleteDepartment(req.params.departmentId);

    cache.del('department');

    res.status(200).json({
        success: true,
        message: 'APIMessage:Department successfully deleted',
    });
};

export const restoreDepartment = async (req: Request, res: Response) => {
    const { englishName, staffId } = res.locals;
    const { reason } = req.body;
    const departmentResponse = await service.restoreDepartment(req.body.departmentId);

    cache.del('department');

    res.status(200).json({
        success: true,
        message: 'APIMessage:Department successfully restored',
    });
};

export const duplicateDepartment = async (req: Request, res: Response) => {
    const { englishName, staffId } = res.locals;
    const departmentResponse = await service.duplicateDepartment(req.body, req.params.departmentId);

    cache.del('department');

    res.status(200).json({
        success: true,
        data: departmentResponse,
        message: 'APIMessage:Duplicate Department successfully created',
    });
};
