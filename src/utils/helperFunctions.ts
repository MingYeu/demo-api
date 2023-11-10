import { Prisma } from '@prisma/client';
import dayjs from 'dayjs';

export function pad(num: number | string, size: number) {
    let stringNum = num.toString();
    while (stringNum.length < size) stringNum = '0' + stringNum;
    return stringNum;
}

export function convertToBase36(number: number): string {
    const digits = '0123456789abcdefghijklmnopqrstuvwxyz';
    let base36 = '';

    if (number === 0) {
        return '0';
    }

    while (number > 0) {
        const remainder = number % 36;
        base36 = digits[remainder] + base36;
        number = Math.floor(number / 36);
    }

    return base36;
}

export function contractRefNo(clientId: number, date: string, refNo: number): string {
    const last4DigitOfClientId: string = pad(convertToBase36(clientId), 4);
    const padRefNo = pad(refNo, 4);
    const createdAt = dayjs(date).format('YYMM');

    const format = `${last4DigitOfClientId}/${createdAt}/${padRefNo}`;

    return format;
}