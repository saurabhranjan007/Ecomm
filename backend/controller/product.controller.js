// backend/controller/product.controller.js
const pool = require('../utils/db.config');
const logger = require('../utils/logger');

const productList = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM products');
        if (rows.length === 0) {
            logger.info('No products found');
            return res.status(404).json({
                message: "No products found"
            });
        }
        logger.info('Product list retrieved successfully');
        return res.status(200).json({
            message: "Product List",
            data: rows
        });
    } catch (err) {
        logger.error(`Error retrieving products: ${err}`);
        return res.status(500).json({
            message: "Internal Server Error"
        });
    }
};

exports.productList = productList;
