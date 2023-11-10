// import prisma from './prisma';
// import schedule from 'node-schedule';
// import EmailSender from './email';

// /* Main Function */
// const cronJobs = async () => {
//     console.log('running cronJobs');
//     await sendReminder();
//     console.log('end cronJobs');
// };

// const sendReminder = async () => {
//     console.log('running sendReminder');
//     const now = new Date(); // Current date and time
//     const startOfDay = new Date(now);
//     startOfDay.setHours(0, 0, 0, 0); // Set time to 00:00:00.000

//     const endOfDay = new Date(now);
//     endOfDay.setHours(23, 59, 59, 999); // Set time to 23:59:59.999

//     try {
//         /* Get all alarms for current day */
//         const alarmReminders = await prisma.alarm.findMany({
//             where: {
//                 date: {
//                     lte: endOfDay,
//                     gte: startOfDay,
//                 },
//             },
//             select: {
//                 name: true,
//                 alarmReminder: {
//                     select: {
//                         reminderDate: true,
//                     },
//                 },
//                 alarm_staff: {
//                     select: {
//                         staff: {
//                             select: {
//                                 email: true,
//                             },
//                         },
//                     },
//                 },
//             },
//         });

//         /* Set cron schedule and send email */
//         alarmReminders.forEach((alarm) => {
//             alarm.alarmReminder.forEach((reminder) => {
//                 const date = reminder.reminderDate;

//                 schedule.scheduleJob(date, async () => {
//                     //Send email
//                     console.log('sending email');
//                     const emailList = alarm.alarm_staff.map((item) => item.staff.email);
//                     const emailSender = new EmailSender(emailList);
//                     await emailSender.emailReminder({ userName: alarm.name, alarmName: alarm.name }).send();
//                 });
//             });
//         });
//         console.log('cron set');
//     } catch (error) {
//         console.log('Alarm Cronjob error : ', error);
//     }
// };

// export default cronJobs;
