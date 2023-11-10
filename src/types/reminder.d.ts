import { Job } from 'node-schedule';

interface ScheduledReminder {
    id: string;
    alarmId: string;
    reminderDate: Date;
    actualDate: Date;
    message: string;
    staffId: string[];
    clientId: string[];
    scheduleJob: Job;
}
