import { NextFunction, Request, Response } from 'express';
import Joi from 'joi';

export const paginationSchemaObject = Joi.object().keys({
    page: Joi.number().required(),
    row: Joi.number().required(),
    sortField: Joi.string().allow(null).empty(null),
    sortOrder: Joi.string().valid('asc', 'desc').allow(null).empty(null),
});

export const activityLogSchema = async (req: Request, res: Response, next: NextFunction) => {
    const schema = Joi.object({
        targetId: Joi.string().required(),
        page: Joi.number().required(),
        cursor: Joi.string().isoDate().empty(null),
    });

    const { error } = schema.validate(req.query);

    if (error) {
        return res.status(400).json({
            success: false,
            message: error.details[0].message,
        });
    }

    next();
};

export const paginationSchema = async (req: Request, res: Response, next: NextFunction) => {
    const { error } = paginationSchemaObject.unknown(true).validate(req.query);
    if (error) {
        return res.status(400).json({
            success: false,
            message: error.details[0].message,
        });
    }

    req.query.page = parseInt(req.query.page as string, 10) || (1 as any);
    req.query.row = parseInt(req.query.row as string, 10) || (1 as any);

    next();
};
