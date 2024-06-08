// backend/routes/home.route.js
const express = require('express');
const router = express.Router();
const { homeController } = require('../controller/home.controller');

router.get('/home', homeController);

module.exports = router;
