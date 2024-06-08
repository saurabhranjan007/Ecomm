// backend/server.js
const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const logger = require('./utils/logger'); // Import the logger

// Load env variables
dotenv.config();  // Make sure to load environment variables early

const homeRoute = require('./routes/home.route');
const productRoutes = require('./routes/product.route');
const orderRoutes = require('./routes/order.route');

const port = process.env.PORT || 3001;

const app = express();
app.use(express.json());

// CORS config
app.use(
    cors({
        origin: '*',
        methods: ['GET', 'POST'],
    })
);

// Routes
app.use('/', homeRoute);
app.use('/product', productRoutes);
app.use('/order', orderRoutes);

// Example of logging an error in a route
app.use((err, req, res, next) => {
    logger.error(`Unhandled error: ${err.message}`);
    res.status(500).send('Internal Server Error');
});

app.listen(port, () => {
    logger.info(`Server is running on port: ${port}`);
});
