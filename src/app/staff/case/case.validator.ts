import { NextFunction, Request, Response } from 'express';
import Joi from 'joi';
export const createCaseSchema = async (req: Request, res: Response, next: NextFunction) => {
    const schema = Joi.object({
        name: Joi.string().required(),
        description: Joi.string().required(),
    });

    const { error } = schema.validate(req.body);

    if (error) {
        return res.status(400).json({
            success: false,
            message: error.details[0].message,
        });
    }
    next();
};
