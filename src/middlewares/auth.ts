import { Request, Response, NextFunction } from 'express';
import { permissions } from '../data/department';
import { COOKIE_DOMAIN, COOKIE_OPTIONS, USER_TOKEN } from '../const';
import jwt from 'jsonwebtoken';
import 'dotenv/config';
import prisma, { createSelect } from '../utils/prisma';
import dayjs from 'dayjs';

//staff auth
export const isStaffAuthenticate = async (req: Request, res: Response, next: NextFunction) => {
    const staffAuthToken = USER_TOKEN.staff;
    const token = req.cookies[staffAuthToken];
    let staffPayload: StaffJWTPayLoad;

    if (!token) {
        return res.status(401).json({
            success: false,
            message: 'APIMessage:unauthenticated',
        });
    }

    try {
        staffPayload = jwt.verify(token, process.env.TOKEN_SECRET as string) as StaffJWTPayLoad;
    } catch (err) {
        return res.clearCookie(staffAuthToken, { domain: COOKIE_DOMAIN }).status(401).json({
            success: false,
            message: 'APIMessage:invalidToken',
        });
    }

    const staff = await prisma.staff.findFirst({
        where: {
            id: (staffPayload as StaffJWTPayLoad).id,
            deletedAt: null,
        },
        select: createSelect(['id', 'staffId', 'englishName', 'chineseName', 'email', 'nickname', 'departmentId', 'active']),
    });

    if (!staff) {
        return res
            .clearCookie(staffAuthToken as string, { domain: COOKIE_DOMAIN })
            .status(404)
            .json({
                success: false,
                message: 'APIMessage:Staff not found',
            });
    }

    if (!staff.active) {
        return res
            .clearCookie(staffAuthToken as string, { domain: COOKIE_DOMAIN })
            .status(401)
            .json({
                success: false,
                message: 'APIMessage:Inactive',
            });
    }

    await prisma.staff.update({
        where: {
            id: (staffPayload as StaffJWTPayLoad).id,
        },
        data: {
            lastActive: new Date(),
        },
    });

    res.locals = {
        staffId: staff.id,
        email: staff.email,
        englishName: staff.englishName,
        chineseName: staff.chineseName,
        departmentId: staff.departmentId,
    };

    const newToken = jwt.sign(
        {
            id: staff.id,
            chineseName: staff.chineseName,
            englishName: staff.englishName,
            email: staff.email,
            nickname: staff.nickname,
        },
        process.env.TOKEN_SECRET as string
    );

    res.cookie(staffAuthToken, newToken, COOKIE_OPTIONS);
    next();
};

export const isAuthorize = (permission: (typeof permissions)[number], enforcePermission = true) => {
    return async (req: Request, res: Response, next: NextFunction) => {
        const { departmentId, staffId } = res.locals;
        if (!staffId) {
            return res.status(401).json({
                ok: false,
                message: 'APIMessage:unauthenticated',
            });
        }
        const department = await prisma.department.findFirst({
            where: {
                id: departmentId,
            },
            select: {
                [permission]: true,
            },
        });

        if (!department) {
            return res.status(403).json({
                ok: false,
                unauthorized: true,
                message: 'APIMessage:departmentNotFound',
            });
        }

        if (!department[permission] && enforcePermission) {
            return res.status(403).json({
                ok: false,
                unauthorized: true,
                message: 'APIMessage:unauthorized',
            });
        }

        res.locals[permission] = department[permission];

        next();
    };
};
