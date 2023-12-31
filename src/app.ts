import express from 'express';
import 'dotenv/config';
import cookieParser from 'cookie-parser';
import cors from 'cors';
import morgan from 'morgan';
import colors from 'colors';
import helmet from 'helmet';
import requestIp from 'request-ip';
import morganFormat from './utils/morganFormat';
import mainRoute from './app/index';
import { globalErrorMiddleware, winstonErrorMiddleware } from './middlewares/error';

const app = express();
const port = process.env.NODE_ENV === 'production' ? process.env.PORT || 4000 : 4000;
app.set('trust proxy', true);
colors.enable();

app.use([
    morgan(morganFormat),
    requestIp.mw(),
    cookieParser(),
    helmet(),
    express.urlencoded({ extended: true, limit: '100mb' }),
    express.json({ limit: '100mb' }),
    cors({
        origin: ['http://localhost:3000', 'http://localhost:3001', 'https://google.com'],
        credentials: true,
    }),
]);

app.get('/api', (req, res) => {
    res.send('Nothing here :/');
});
app.use('/api', mainRoute);

// Error Handling Middleware
if (process.env.NODE_ENV === 'production') {
    app.use(winstonErrorMiddleware);
}
app.use(globalErrorMiddleware);

app.listen(port, () => {
    console.log('Server running on port ' + port);
});

process.on('SIGTERM', () => process.exit());
