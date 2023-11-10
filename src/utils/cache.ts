import nodeCache from 'node-cache';

const cache = new nodeCache({ stdTTL: 600 });

export default cache;
