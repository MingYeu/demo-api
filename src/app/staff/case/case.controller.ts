import { Request, Response } from 'express';
import * as service from './case.service';

export const getCaseList = async (req: Request, res: Response) => {
    let { row, page } = req.query as any;

    const myCase = req.query.myCase !== 'true' ? undefined : res.locals.staffId;

    let casePaginationResponse = await service.getCaseList(req.query as unknown as service.CasePaginationQuery, myCase);

    // If the data is empty and count not empty, reset the page
    if (casePaginationResponse.rows.length === 0 && casePaginationResponse.count !== 0) {
        page = Math.ceil(casePaginationResponse.count / row);
        casePaginationResponse = await service.getCaseList(
            {
                ...req.query,
                page,
            } as unknown as service.CasePaginationQuery,
            myCase
        );
    }

    res.status(200).json({
        success: true,
        total: casePaginationResponse.count,
        data: casePaginationResponse.rows,
        page,
        message: 'APIMessage:caseListFetched',
    });
};

export const createCase = async (req: Request, res: Response) => {
    const { staffId } = res.locals;
    const createdCase = await service.createCase(req.body);

    res.status(200).json({
        success: true,
        message: 'APIMessage:caseCreated',
        data: createdCase,
    });
};
