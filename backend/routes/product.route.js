// backend/routes/product.route.js
const express = require('express');
const router = express.Router();
const { productList } = require('../controller/product.controller');

router.get('/list', productList);

module.exports = router;
