const streamToBuffer = (readableStream: any) => {
    return new Promise((resolve, reject) => {
        const chunks: any[] = [];
        readableStream.on('data', (chunk: any) => {
            chunks.push(chunk);
        });
        readableStream.on('end', () => {
            const buffer = Buffer.concat(chunks);
            resolve(buffer);
        });
        readableStream.on('error', (error: any) => {
            reject(error);
        });
    });
};

export default streamToBuffer;
